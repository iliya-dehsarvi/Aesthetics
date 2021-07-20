//
//  WorkoutsTableViewCell.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/12/21.
//

import UIKit

class WorkoutsTableViewCell: UITableViewCell {
	var dataRow: [Workout] = []
	
	@IBOutlet weak var workoutTile: UILabel!
	@IBOutlet weak var workoutsCollectionView: UICollectionView!
	
	func setRowData(row: [Workout]) {
		self.dataRow = row
		self.workoutsCollectionView.reloadData()
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.workoutsCollectionView.register(UINib(nibName:"WorkoutCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"WorkoutCollectionViewCellID")
		self.workoutsCollectionView.delegate = self
		self.workoutsCollectionView.dataSource = self
		self.workoutsCollectionView.showsHorizontalScrollIndicator = false
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: 190, height: 330)
		self.workoutsCollectionView.collectionViewLayout = layout
		self.workoutsCollectionView.reloadData()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
	@IBAction func seeAllButton(_ sender: UIButton) {
	
	}
}

extension WorkoutsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCollectionViewCellID",
											 for: indexPath as IndexPath) as! WorkoutCollectionViewCell
		cell.setWorkoutName(dataRow[indexPath.row].name)
		cell.setWorkoutTags(forLevel: dataRow[indexPath.row].difficulty, forType: dataRow[indexPath.row].equipment)
		cell.setWorkoutImage(dataRow[indexPath.row].image_url[1])
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataRow.count
//		return 5
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

//	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//	    let noOfCellsInRow = dataRow.count
//
//	    let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//
//	    let totalSpace = flowLayout.sectionInset.left
//		   + flowLayout.sectionInset.right
//		   + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
//
//	    let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
//
//	    return CGSize(width: size, height: size)
//	}
	
}

