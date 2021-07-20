//
//  SessionsViewController.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/18/21.
//

import UIKit

class SessionsViewController: UIViewController {
	
	@IBOutlet weak var sessionsTableView: UITableView!
	
	let muscles = [
		"Abdominals", "Biceps", "Calves", "Chest",
		"Forearms", "Glutes", "Hamstrings", "Lats", "Lowerback",
		"Quads", "Shoulders", "Traps", "Traps (middle)", "Triceps", "Test"
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.sessionsTableView.delegate = self
		self.sessionsTableView.dataSource = self
		self.sessionsTableView.register(UINib(nibName: "sessionsTableViewCell", bundle: nil), forCellReuseIdentifier: "sessionsTableViewCellID")
		self.sessionsTableView.rowHeight = 115
	}
	
}

extension SessionsViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Int(muscles.count/2)
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "sessionsTableViewCellID", for: indexPath) as! sessionsTableViewCell
		print(indexPath.row)
//		print(muscles[indexPath.row])
//		cell.setRowData(row: (workoutsProcessor.muscles?[muscles[indexPath.row]]!)!)
//		cell.workoutTile.text = muscles[indexPath.row]
		
		cell.leftTitle.text = muscles[2*indexPath.row]
		cell.rightTitle.text = muscles[2*indexPath.row+1]

//		print(2*indexPath.row, 2*indexPath.row+1)
//
//		print(muscles[2*indexPath.row], muscles[2*indexPath.row+1])
//		
		if indexPath.row == Int(muscles.count/2)-1 && muscles.count%2 != 0 {
//			print(muscles[2*indexPath.row+2])
			cell.leftTitle.text = muscles[2*indexPath.row+2]
			cell.rightView.isHidden = true
			
		}
		return cell
	}
}


