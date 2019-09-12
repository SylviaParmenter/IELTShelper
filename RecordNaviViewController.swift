//
//  RecordNaviViewController.swift
//  Copyright © 2019 com.zoe.SpeakTestHelper. All rights reserved.
//

import Foundation
import UIKit

class RecordNaviViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var image:UIImage = UIImage(named: "youtube")!
        var selectedimage:UIImage = UIImage(named: "youtubeorange")!;
        image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        selectedimage = selectedimage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        self.tabBarItem.image = image
        self.tabBarItem.selectedImage = selectedimage
    }
}
