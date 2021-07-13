//
//  Workouts.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/12/21.
//

import Foundation

// MARK: - Workouts
struct Workouts: Codable {
	let female: Muscles
	let male: Muscles
	
	enum CodingKeys: String, CodingKey {
		case female = "Female"
		case male = "Male"
	}
}

// MARK: - Muscles
struct Muscles: Codable {
	let hamstrings: [Workout]
	let forearms: [Workout]
	let glutes: [Workout]
	let lats: [Workout]
	let abdominals: [Workout]
	let shoulders: [Workout]
	let biceps: [Workout]
	let quads: [Workout]
	let calves: [Workout]
	let triceps: [Workout]
	let lowerback: [Workout]
	let chest: [Workout]
	let traps_middle: [Workout]
	let traps: [Workout]
	
	enum CodingKeys: String, CodingKey {
		case hamstrings = "Hamstrings"
		case forearms = "Forearms"
		case glutes = "Glutes"
		case lats = "Lats"
		case abdominals = "Abdominals"
		case shoulders = "Shoulders"
		case biceps = "Biceps"
		case quads = "Quads"
		case calves = "Calves"
		case triceps = "Triceps"
		case lowerback = "Lowerback"
		case chest = "Chest"
		case traps_middle = "Traps_middle"
		case traps = "Traps"
	}
}

// MARK: - Workout
struct Workout: Codable {
	let name: String
	let image_url: [String]
	let description: [String]
	let difficulty: String
	let equipment: String
}
