////
////  WokoutsCollectionViewCell.swift
////  Aesthetics
////
////  Created by Iliya dehsarvi on 7/12/21.
////
//
//import UIKit
//
//class WorkoutsCollectionViewCell: UICollectionViewCell {
//
//	@IBOutlet weak var workoutImage: UIImageView!
//	@IBOutlet weak var workoutName: UILabel!
//	@IBOutlet weak var workoutTags: UILabel!
//
//	func setWorkoutImage(_ stringURL: String) {
//		let imageURL = URL(string: stringURL)
////		self.workoutImage.load(url: imageURL!)
//		if let workoutImage = self.workoutImage  {
//			workoutImage.load(url: imageURL!)
//		}
//	}
//
//	func setWorkoutName(_ name: String) {
//		if let workoutName = self.workoutName  {
//			workoutName.text = name
//		}
//	}
//
//	func setWorkoutTags(forLevel level: String, forType type: String) {
//		if let workoutTags = self.workoutTags  {
//			workoutTags.text = "#\(level) #\(type)"
//		}
//	}
//
//	override func awakeFromNib() {
//		super.awakeFromNib()
//		workoutName.text = "Bench Press"
//		workoutTags.text = "#Beginner #Barbell"
//	}
//}
//
//extension UIImageView {
//    func load(url: URL) {
//	   DispatchQueue.global().async { [weak self] in
//		  if let data = try? Data(contentsOf: url) {
//			 if let image = UIImage(data: data) {
//				DispatchQueue.main.async {
//				    self?.image = image
//				}
//			 }
//		  }
//	   }
//    }
//}
