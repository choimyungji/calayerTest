//
//  ViewController.swift
//  circularTest
//
//  Created by Myungji Choi on 2021/03/18.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //        let arcLayer = CAShapeLayer()
        //
        //        let path = UIBezierPath(arcCenter: CGPoint(x: view.bounds.midX, y: view.bounds.midY),
        //                                radius: view.bounds.size.width / 2 - 80,
        //                                  startAngle: angleToDegree(angle: 0),
        //                                  endAngle: angleToDegree(angle: 270),
        //                                  clockwise: true)
        //        path.move(to: CGPoint(x: view.bounds.midX, y: view.bounds.midY))
        //          path.close()
        //
        //        arcLayer.path = path.cgPath
        //        arcLayer.lineWidth = 3
        //        arcLayer.strokeColor = UIColor.red.cgColor
        //        arcLayer.fillColor = UIColor.white.cgColor
        //        arcLayer.strokeEnd = 1
        //
        //        view.layer.addSublayer(arcLayer)
        
        let myView = UIView(frame: .init(x: 0, y: 0, width: 200, height: 250))
        view.addSubview(myView)
        myView.center = view.center
        
        // Start and finish point
        let startPoint = CGPoint(x: myView.bounds.minX, y: myView.bounds.midY)
        let finishPoint = CGPoint(x: myView.bounds.maxX, y: myView.bounds.midY)
        
        // Path
        let path = UIBezierPath(arcCenter: CGPoint(x: 80, y: 80),
                                radius: 40,
                                startAngle: angleToDegree(angle: 0),
                                endAngle: angleToDegree(angle: 360),
                                clockwise: true)
        path.move(to: CGPoint(x: view.bounds.midX, y: view.bounds.midY))
        //            path.move(to: startPoint)
        //            path.addLine(to: finishPoint)
        path.close()
        
        // Gradient Mask
        let gradientMask = CAShapeLayer()
        let lineHeight = myView.frame.height
        gradientMask.fillColor = UIColor.clear.cgColor
        gradientMask.strokeColor = UIColor.black.cgColor
        gradientMask.lineWidth = 3
        gradientMask.frame = myView.bounds
        gradientMask.path = path.cgPath
        
        // Gradient Layer
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // make sure to use .cgColor
        gradientLayer.colors = [UIColor.cyan.cgColor,
                                UIColor.magenta.cgColor,
                                UIColor.red.cgColor,
                                UIColor.magenta.cgColor]
        
        gradientLayer.frame = myView.bounds
        gradientLayer.mask = gradientMask
        
        myView.layer.addSublayer(gradientLayer)
        
        // Corner radius
        myView.layer.cornerRadius = 10
        myView.clipsToBounds = true
        
    }
    
    private func angleToDegree(angle: CGFloat) -> CGFloat {
        let rad = CGFloat.pi * 2
        let degree = ((angle / 360) - 0.25) * rad
        return degree
    }
}

