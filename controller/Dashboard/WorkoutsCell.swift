//
//  WorkoutsCell.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/12/21.
//

import UIKit

class WorkoutsCell: UITableViewCell {
	let workoutsProcessor = WorkoutsProcessor()
	
	@IBOutlet weak var workOutTile: UILabel!
	@IBOutlet weak var seeAllButton: UIButton!
	@IBOutlet weak var workoutsCollectionView: UICollectionView!
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
}

//extension WorkoutsCell: UICollectionViewDelegate, UICollectionViewDataSource {
//	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		<#code#>
//	}
//
//	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//		<#code#>
//	}
//}
