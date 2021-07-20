//
//  SessionViewController.swift
//  Aesthetics
//
//  Created by Iliya dehsarvi on 7/11/21.
//

import UIKit

class SessionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

	    let image = UIImage.gif(url: "musclewiki.com/media/uploads/Male-Barbell-BicepCurl-Front.gif")
	    self.navigationItem.titleView = UIImageView(image: image)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
