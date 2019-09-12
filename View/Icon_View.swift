//
//  Icon_View.swift
//  SeeCampus
//
//  Created by Yong Yang on 7/8/19.
//  Copyright © 2019 Edison Yang. All rights reserved.
//

import UIKit

class Icon_View: UIView {
    var screen_frame:CGRect?
    var backgound_color = UIColor(red: 155/255, green: 31/255, blue: 55/255, alpha: 1)
    
    init(frame: CGRect, screen_frame: CGRect){
        super.init(frame: frame)
        self.screen_frame = screen_frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // round corner
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: rect.size.width/20)
        roundedRect.addClip()
        backgound_color.setFill()
        roundedRect.fill()
    }
    
    func change_icon_backgroundcolor(color:UIColor){
        backgound_color = color
        setNeedsLayout()
        setNeedsDisplay()
    }
}
