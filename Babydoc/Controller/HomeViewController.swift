//
//  SecondViewController.swift
//  Babydoc
//
//  Created by Luchi Parejo alcazar on 05/04/2019.
//  Copyright © 2019 Luchi Parejo alcazar. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController{

    
    @IBOutlet weak var sleep: ActionView!
    
    @IBOutlet weak var feed: ActionView!
    
    @IBOutlet weak var symptom: ActionView!
    
    
    @IBOutlet weak var medication: ActionView!
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(sleep.bounds.height) //30
        // print(sleep.bounds.width)  //240
        sleep.layer.cornerRadius = 6
        sleep.layer.masksToBounds = true
        feed.layer.cornerRadius = 6
        feed.layer.masksToBounds = true
        symptom.layer.cornerRadius = 6
        symptom.layer.masksToBounds = true
        medication.layer.cornerRadius = 6
        medication.layer.masksToBounds = true

        
    }

   
//  
//    @IBAction func didSwipetoDoctor(_ sender: UISwipeGestureRecognizer) {
//        if sender.direction == UISwipeGestureRecognizer.Direction.left && sender.state == .ended
//        
//        {
//            performSegue(withIdentifier: "goToDoctor", sender: nil)
//        }
//        
//    }
//    
}
class ActionView: UIView
    
{
    
    
    
    override func draw(_ rect: CGRect)
    {
        let width = self.bounds.width
        let day : CGFloat = 24
            //SLEEP
        if self.tag == 0{
            
            //imagine sleep times of : 0-12  and 12:30 to 13:30 and 15-17
            fillColor(start : (0*width)/day ,with: .blue, width: (2*width)/day)
            fillColor(start : ((12+0.5)*width)/day ,with: .blue, width: (1*width)/day)
            fillColor(start : (15*width)/day ,with: .blue, width: (2*width)/day)
            
        }
            //FEED
        else if self.tag == 1{
            
            
            self.fillColor(start : (12*width)/day, with: .magenta, width: 4*width/day)
            self.fillColor(start : (22*width)/day, with: .magenta, width: 2*width/day)
        }
            //SYMPTOM
        else if self.tag == 2{
            
            self.fillColor(start : (10*width)/day, with: .cyan, width: 0.2*width/day)
            self.fillColor(start : (20*width)/day, with: .cyan, width: 0.3*width/day)
        }
            //MEDICATION
        else if self.tag == 3{
            
        
            self.fillColor(start : (8*width)/day, with: .purple, width: 0.2*width/day)
            self.fillColor(start : (16*width)/day, with: .purple, width: 0.2*width/day)
        }
        
        
        
        
    }
    
    func fillColor(start : CGFloat,with color:UIColor,width:CGFloat)
    {
        let topRect = CGRect(x : start, y:0, width : width, height: self.bounds.height)
        color.setFill()
        UIRectFill(topRect)
    }

    


}
class GridView: UIView
{
    private var path = UIBezierPath()
    fileprivate var gridWidthMultiple: CGFloat
    {
        return 4
    }
    fileprivate var gridHeightMultiple : CGFloat
    {
        return 20
    }
    
    fileprivate var gridWidth: CGFloat
    {
        return bounds.width/CGFloat(gridWidthMultiple)
    }
    
    fileprivate var gridHeight: CGFloat
    {
        return bounds.height/CGFloat(gridHeightMultiple)
    }
    
    fileprivate var gridCenter: CGPoint {
        return CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    fileprivate func drawGrid()
    {
        path = UIBezierPath()
        path.lineWidth = 0.1
        
        for index in 0...Int(gridWidthMultiple) 
        {
            let start = CGPoint(x: CGFloat(index) * gridWidth, y: 0)
            let end = CGPoint(x: CGFloat(index) * gridWidth, y:bounds.height)
            path.move(to: start)
            path.addLine(to: end)
        }
        //Close the path.
        path.close()
        
    }
    
    override func draw(_ rect: CGRect)
    {
        drawGrid()
        
        // Specify a border (stroke) color.
        UIColor.black.setStroke()
        path.stroke()
    }
}


