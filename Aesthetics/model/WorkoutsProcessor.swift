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
				"Abdominals": workouts?.female.abdominals,
				"Biceps": workouts?.female.biceps,
				"Calves": workouts?.female.calves,
				"Chest": workouts?.female.chest,
				"Forearms": workouts?.female.forearms,
				"Glutes": workouts?.female.glutes,
				"Hamstrings": workouts?.female.hamstrings,
				"Lats": workouts?.female.lats,
				"Lowerback": workouts?.female.lowerback,
				"Quads": workouts?.female.quads,
				"Shoulders": workouts?.female.shoulders,
				"Traps": workouts?.female.traps,
				"Traps (middle)": workouts?.female.traps_middle,
				"Triceps": workouts?.female.triceps
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
