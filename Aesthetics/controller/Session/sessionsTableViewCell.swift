//
//  sessionsTableViewCell.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/18/21.
//

import UIKit

class sessionsTableViewCell: UITableViewCell {
	
	@IBOutlet weak var leftView: UIView!
	@IBOutlet weak var rightView: UIView!
	
	
	@IBOutlet weak var leftTitle: UILabel!
	@IBOutlet weak var rightTitle: UILabel!
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.leftView.layer.cornerRadius = 5
		self.leftView.layer.masksToBounds = true
		self.rightView.layer.cornerRadius = 5
		self.rightView.layer.masksToBounds = true
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	
}
