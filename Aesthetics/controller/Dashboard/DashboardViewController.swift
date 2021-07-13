//
//  ViewController.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/11/21.
//

import UIKit

public class DashboardViewController: UIViewController {
	@IBOutlet weak var dashboardTableView: UITableView!
	public let workoutsProcessor = WorkoutsProcessor()
	let muscles = [
		"Abdominals", "Biceps", "Calves", "Chest",
		"Forearms", "Glutes", "Hamstrings", "Lats", "Lowerback",
		"Quads", "Shoulders", "Traps", "Traps (middle)", "Triceps"
	]
	
	public override func viewDidLoad() {
		super.viewDidLoad()
		self.dashboardTableView.register(UINib(nibName: "WorkoutsTableViewCell", bundle: nil), forCellReuseIdentifier: "WorkoutsTableViewCellID")
//		workoutsCollectionView.register(UINib(nibName:"WorkoutsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"WorkoutsCollectionViewCellID")

		self.dashboardTableView.delegate = self
		self.dashboardTableView.dataSource = self
		self.dashboardTableView.rowHeight = 280

//		dashboardTableView.register(WorkoutsTableViewCell.self, forCellReuseIdentifier: "WorkoutsTableViewCellID")

	}
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return workoutsProcessor.muscles!.count
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutsTableViewCellID", for: indexPath) as! WorkoutsTableViewCell
		print(indexPath.row)
		print(muscles[indexPath.row])
		cell.workoutTile.text = muscles[indexPath.row]
		cell.row = indexPath.row
		return cell
	}
	
//	func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//		guard let tableViewCell = cell as? WorkoutsTableViewCell else { return }
//		tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
//	}

}

