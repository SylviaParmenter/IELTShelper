//
//  NoteNaviViewController.swift
//  Copyright © 2019 com.zoe.SpeakTestHelper. All rights reserved.
//

import Foundation
import UIKit

class NoteNaviViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var image:UIImage = UIImage(named: "beiwanglu")!
        var selectedimage:UIImage = UIImage(named: "beiwangluorange")!;
        image = image.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        selectedimage = selectedimage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal);
        self.tabBarItem.image = image
        self.tabBarItem.selectedImage = selectedimage
    }
}
