//
//  SettingNaviViewController.swift
//  IELTShelper
//  Copyright © 2019 com.zoe.SpeakTestHelper. All rights reserved.
//

import Foundation
import UIKit

class SettingNaviViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var image:UIImage = UIImage(named: "controls")!
        var selectedimage:UIImage = UIImage(named: "controlsorange")!;
        image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        selectedimage = selectedimage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        self.tabBarItem.image = image
        self.tabBarItem.selectedImage = selectedimage
    }
}
