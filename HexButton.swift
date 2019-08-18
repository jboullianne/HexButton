//
//  HexButton.swift
//  PrototypeViews
//
//  Created by Jean-Marc Boullianne on 8/18/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import UIKit

@IBDesignable class HexButton: UIButton {

    
    @IBInspectable var borderColor:UIColor = UIColor.red
    @IBInspectable var borderWidth:CGFloat = 3
    @IBInspectable var cornerRadius:CGFloat = 3
    
    @IBInspectable var text:String = "Button"
    @IBInspectable var textColor:UIColor = UIColor.lightText

    
    private var border = CAShapeLayer()
    private var hexMask = CAShapeLayer()
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let center = CGPoint(x: rect.width/2.0, y: rect.height/2.0)
        let size = rect.width/2.0
        
        let path = UIBezierPath()
        //path.move(to: pointy_hex_corner(center: center, size: size, i: 0))
        path.addArc(withCenter: pointy_hex_corner(center: center, size: size, i: 1), radius: cornerRadius, startAngle: 0, endAngle: 1, clockwise: true)
        //path.addLine(to: pointy_hex_corner(center: center, size: size, i: 1))
        path.addArc(withCenter: pointy_hex_corner(center: center, size: size, i: 2), radius: cornerRadius, startAngle: 1, endAngle: 2, clockwise: true)
        //path.addLine(to: pointy_hex_corner(center: center, size: size, i: 2))
        path.addArc(withCenter: pointy_hex_corner(center: center, size: size, i: 3), radius: cornerRadius, startAngle: 2, endAngle: 3, clockwise: true)
        path.addArc(withCenter: pointy_hex_corner(center: center, size: size, i: 4), radius: cornerRadius, startAngle: 3, endAngle: 4, clockwise: true)
        path.addArc(withCenter: pointy_hex_corner(center: center, size: size, i: 5), radius: cornerRadius, startAngle: 4, endAngle: 5, clockwise: true)
        path.addArc(withCenter: pointy_hex_corner(center: center, size: size, i: 0), radius: cornerRadius, startAngle: 5, endAngle: 0, clockwise: true)
        //path.addLine(to: pointy_hex_corner(center: center, size: size, i: 3))
        //path.addLine(to: pointy_hex_corner(center: center, size: size, i: 4))
        //path.addLine(to: pointy_hex_corner(center: center, size: size, i: 5))
        path.close()
        border.path = path.cgPath
        
        
        border.lineWidth = borderWidth
        border.frame = self.bounds
        border.fillColor = nil
        border.lineDashPattern = nil
        border.strokeColor = borderColor.cgColor
        
        hexMask.fillColor = UIColor.white.cgColor
        hexMask.path = path.cgPath
        hexMask.frame = self.bounds
        
        self.layer.addSublayer(border)
        self.layer.mask = hexMask
        
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        
    }
    
    func pointy_hex_corner(center: CGPoint, size:CGFloat, i:Int) -> CGPoint {
        let angle_deg:CGFloat = 60.0 * CGFloat(i) - 30.0
        let angle_rad:CGFloat = CGFloat.pi / 180.0 * angle_deg
        
        return CGPoint(x: center.x + size * cos(angle_rad), y: center.y + size * sin(angle_rad))
    }
    
    func createHexMask() {
        
    }
    

}
