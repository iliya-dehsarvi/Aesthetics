//
//  ViewController.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/11/21.
//

import UIKit

class LibraryViewController: UIViewController {
	@IBOutlet weak var libraryTableView: UITableView!
	let workoutsProcessor = WorkoutsProcessor()
	let muscles = [
		"Abdominals", "Biceps", "Calves", "Chest",
		"Forearms", "Glutes", "Hamstrings", "Lats", "Lowerback",
		"Quads", "Shoulders", "Traps", "Traps (middle)", "Triceps"
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.libraryTableView.register(UINib(nibName: "WorkoutsTableViewCell", bundle: nil), forCellReuseIdentifier: "WorkoutsTableViewCellID")
		self.libraryTableView.delegate = self
		self.libraryTableView.dataSource = self
		self.libraryTableView.rowHeight = 310
	}
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return workoutsProcessor.muscles!.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutsTableViewCellID", for: indexPath) as! WorkoutsTableViewCell
		print(indexPath.row)
		print(muscles[indexPath.row])
		cell.setRowData(row: (workoutsProcessor.muscles?[muscles[indexPath.row]]!)!)
		cell.workoutTile.text = muscles[indexPath.row]
		return cell
	}
}

