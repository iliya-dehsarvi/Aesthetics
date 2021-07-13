//
//  WorkoutsProcessor.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/12/21.
//

import Foundation

public class WorkoutsProcessor {
	var workouts: Workouts? = nil
	var muscles: [String: [Workout]?]? = nil
	
	init() {
		if let localData = self.readLocalFile(forName: "Workouts") {
			self.workouts = self.parse(jsonData: localData)!
			self.muscles = [
				"Abdominals": workouts?.male.abdominals,
				"Biceps": workouts?.male.biceps,
				"Calves": workouts?.male.calves,
				"Chest": workouts?.male.chest,
				"Forearms": workouts?.male.forearms,
				"Glutes": workouts?.male.glutes,
				"Hamstrings": workouts?.male.hamstrings,
				"Lats": workouts?.male.lats,
				"Lowerback": workouts?.male.lowerback,
				"Quads": workouts?.male.quads,
				"Shoulders": workouts?.male.shoulders,
				"Traps": workouts?.male.traps,
				"Traps (middle)": workouts?.male.traps_middle,
				"Triceps": workouts?.male.triceps
			]
		}
	}
	
	func readLocalFile(forName name: String) -> Data? {
		do {
			if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
			   let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
				return jsonData
			}
		} catch {
			print(error)
		}
		return nil
	}
	
	func parse(jsonData: Data) -> Workouts? {
		do {
			return try JSONDecoder().decode(Workouts.self, from: jsonData)
		} catch {
			print(error)
			return nil
		}
	}
}
