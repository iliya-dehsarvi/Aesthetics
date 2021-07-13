#!/usr/bin/python3

import requests, re, json
from bs4 import BeautifulSoup
import pandas as pd
import threading as th

class Workouts():
	def __init__(self):
		self.genders = ('Female', 'Male')
		self.root_url = 'https://musclewiki.com/Exercises/'
		self.body_parts = self.load_body_parts()
		self.URLs = {gender+body_part: self.root_url+gender+body_part+'/'
			for body_part in self.body_parts for gender in self.genders}
		self.workouts_as_json = self.load_workouts_as_json()
		
		with open('/Users/iliyadehsarvi/Documents/KAPTURE/DEV/Aesthetics/Aesthetics/model/Workouts.json', 'w') as json_file:
			json_file.write(json.dumps(self.workouts_as_json, indent=5))
			
	
	def load_body_parts(self):
		try:
			body_parts = set()
			r = requests.get('https://musclewiki.com/static/js/muscle.js')
			for line in r.text.replace(';', '\n').split('\n'):
				if 'case' in line:
					body_part = ''
					i = -2
					while line[i] != '"':
						body_part += line[i]
						i -= 1
					if body_part[::-1] not in self.genders: body_parts.add(body_part[::-1])
			return body_parts
		except Exception as error:
			raise 'Cannot load body parts due to error: '+error

	def load_workouts_as_json(self):
		self.load_info()
		
		
		return {gender: {body_part[1:]: self.load_workouts(self.URLs[gender+body_part])
			for body_part in self.body_parts} for gender in self.genders}
	
	def load_workouts(self, url):
		workouts = {}
		response = requests.get(url)
		page = BeautifulSoup(response.content, "html.parser")
		next_page = page.find('button', class_='btn btn-primary full-width')
		workout_names = self.load_workout_names(page)
		images_URLs = self.load_images(page)
		descriptions = self.load_description(page)
		page_counter = 2
		while next_page and 'More Featured Exercises' in next_page:
			response = requests.get(url+str(page_counter))
			page = BeautifulSoup(response.content, "html.parser")
			next_page = page.find('button', class_='btn btn-primary full-width')
			workout_names += self.load_workout_names(page)
			images_URLs += self.load_images(page)
			descriptions += self.load_description(page)
			page_counter+=1
		workouts = []
		for index, workout in enumerate(workout_names):
			if workout in list(self.workout_equipments.keys()):
				workouts.append({
					'name': workout,
					'image_url': images_URLs[index],
					'description': descriptions[index],
					'difficulty': self.workout_difficulties[workout.rstrip()],
					'equipment': self.workout_equipments[workout.rstrip()]
				})
			else:
				workouts.append({
					'name': workout,
					'image_url': images_URLs[index],
					'description': descriptions[index],
					'difficulty': None,
					'equipment': None
				})
		return workouts

	def load_info(self):
		workouts = []
		equipments = []
		difficulties = []
		response = requests.get('https://musclewiki.com/Directory')
		for table in pd.read_html(response.text):
			workouts += list(table.iloc[:, 0][1:])
			equipments += list(table.iloc[:, 2][1:])
			difficulties += list(table.iloc[:, 3][1:])
		self.workout_equipments = dict(zip(workouts, equipments))
		self.workout_difficulties = dict(zip(workouts, difficulties))
		
	def load_workout_names(self, page):
		return [headline.text.rstrip().replace('\n', '').encode().decode() for headline in page.find_all('h3')]
		
	def load_images(self, page):
		images = ['https://musclewiki.com'+re.search('src="(.+) ', str(p)).group().replace('"', '').replace('src=', '')[:-1] for p in page.find_all('img', id='workout-img')]
		image_groups = []
		i = 0
		while i < len(images)-1:
			if 'SIDE' in images[i].upper() or 'FRONT' in images[i].upper():
				image_groups.append((images[i], images[i+1]))
				i += 2
			else:
				image_groups.append((images[i], ))
				i += 1
		return image_groups

	def load_description(self, page):
		return [p.text.encode().decode().rstrip().split('\n')[1:] for p in page.find_all('ol')]


from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class Quotes(Resource):
	def get(self):
		return workouts.workouts_as_json

api.add_resource(Quotes, '/')

#if __name__ == '__main__':
#	workouts = Workouts()
#	app.run(debug=True)


if __name__ == '__main__':
	workouts = Workouts()
	
