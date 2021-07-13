//
//  WorkoutsTableViewCell.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/12/21.
//

import UIKit

class WorkoutsTableViewCell: UITableViewCell {
	
	let muscles = [
		"Abdominals", "Biceps", "Calves", "Chest",
		"Forearms", "Glutes", "Hamstrings", "Lats", "Lowerback",
		"Quads", "Shoulders", "Traps", "Traps (middle)", "Triceps"
	]
	
	let workoutsProcessor = WorkoutsProcessor()

	
	private let spacing: CGFloat = 17.0

	
	@IBOutlet weak var workoutTile: UILabel!
	@IBOutlet weak var workoutsCollectionView: UICollectionView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		//		workoutsCollectionView.register(WorkoutsCollectionViewCell.self, forCellWithReuseIdentifier: "WorkoutsCollectionViewCellID")
		self.workoutsCollectionView.register(UINib(nibName:"WorkoutCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"WorkoutCollectionViewCellID")
		
		
		//		workoutsCollectionView.register(WorkoutsCollectionViewCell.self, forCellWithReuseIdentifier: "WorkoutsCollectionViewCellID")
		//		workoutsCollectionView.register(UINib(nibName: "WorkoutsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WorkoutsCollectionViewCellID")
		self.workoutsCollectionView.delegate = self
		self.workoutsCollectionView.dataSource = self
		//		workoutsCollectionView.tag = row
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: 210, height: 230)
		//		layout.minimumInteritemSpacing = 0
		//		layout.minimumLineSpacing = 0
		
		layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
		layout.minimumLineSpacing = spacing
		layout.minimumInteritemSpacing = spacing
		self.workoutsCollectionView.collectionViewLayout = layout
		self.workoutsCollectionView.reloadData()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
	@IBAction func seeAllButton(_ sender: UIButton) {
		
	}
	
	//	func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDataSource & UICollectionViewDelegate, forRow row: Int) {
	//		workoutsCollectionView.register(WorkoutsCollectionViewCell.self, forCellWithReuseIdentifier: "WorkoutsCollectionViewCellID")
	//
	//		workoutsCollectionView.delegate = dataSourceDelegate
	//		workoutsCollectionView.dataSource = dataSourceDelegate
	//		workoutsCollectionView.tag = row
	//		workoutsCollectionView.reloadData()
	//	}
}

extension WorkoutsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCollectionViewCellID",
											 for: indexPath as IndexPath) as! WorkoutCollectionViewCell
		//		cell.workoutName.text! = (workoutsProcessor.muscles?[muscles[collectionView.tag]]!)![indexPath.item].name
		//		cell.workoutTags.text! = String("#\((workoutsProcessor.muscles?[muscles[collectionView.tag]]!)![indexPath.item].difficulty) #\((workoutsProcessor.muscles?[muscles[collectionView.tag]]!)![indexPath.item].equipment)")
		//		let image_url = URL(string: (workoutsProcessor.muscles?[muscles[collectionView.tag]]!)![indexPath.item].image_url[0])
		//		cell.workoutImage.load(url: image_url!)
		cell.setWorkoutName((workoutsProcessor.muscles?[muscles[collectionView.tag]]!)![indexPath.item].name)
		cell.setWorkoutTags(forLevel: (workoutsProcessor.muscles?[muscles[collectionView.tag]]!)![indexPath.item].difficulty, forType: (workoutsProcessor.muscles?[muscles[collectionView.tag]]!)![indexPath.item].equipment)
		cell.setWorkoutImage((workoutsProcessor.muscles?[muscles[collectionView.tag]]!)![indexPath.item].image_url[0])
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView,
					numberOfItemsInSection section: Int) -> Int {
		//		return (workoutsProcessor.muscles?[muscles[collectionView.tag]]!)!.count
		return 5
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let numberOfItemsPerRow: CGFloat = 5
		let spacingBetweenCells: CGFloat = 17
		
		let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
		
		if let collection = self.workoutsCollectionView {
			let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
			return CGSize(width: width, height: width)
		} else {
			return CGSize(width: 0, height: 0)
		}
	}
	
}

