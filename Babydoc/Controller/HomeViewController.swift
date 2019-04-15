//
//  SecondViewController.swift
//  Babydoc
//
//  Created by Luchi Parejo alcazar on 05/04/2019.
//  Copyright © 2019 Luchi Parejo alcazar. All rights reserved.
//

import UIKit
import ChameleonFramework


// MARK: - Home View Controller


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    
    @IBOutlet weak var sleep: ActionView!
    @IBOutlet weak var sleepLabel: UILabel!
    
    @IBOutlet weak var feed: ActionView!
    @IBOutlet weak var feedLabel: UILabel!
    
    
    @IBOutlet weak var diaper: ActionView!
    @IBOutlet weak var diaperLabel: UILabel!
    
    @IBOutlet weak var medication: ActionView!
    @IBOutlet weak var medicationLabel: UILabel!
    
    
    @IBOutlet weak var grid: GridView!
    
    @IBOutlet weak var taskTableView: UITableView!
    
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
        diaper.layer.cornerRadius = 6
        diaper.layer.masksToBounds = true
        medication.layer.cornerRadius = 6
        medication.layer.masksToBounds = true
        
        sleep.backgroundColor = sleep.sleepcolor.withAlphaComponent(CGFloat(0.2))
        feed.backgroundColor = feed.feedcolor.withAlphaComponent(CGFloat(0.2))
        diaper.backgroundColor = diaper.diapercolor.withAlphaComponent(CGFloat(0.2))
        medication.backgroundColor = medication.medicationcolor.withAlphaComponent(CGFloat(0.2))
        
        sleepLabel.textColor = sleep.sleepcolor
        feedLabel.textColor = feed.feedcolor
        diaperLabel.textColor = diaper.diapercolor
        medicationLabel.textColor = medication.medicationcolor
        
        //grid.backgroundColor = UIColor.init(hexString: "EBEBEB", withAlpha: 0.01)!
        
        //DATABASE RELATED
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
 
}


// MARK: - Action View


class ActionView: UIView
    
{
    
    var sleepcolor :UIColor = UIColor.init(hexString: "2772db")! //2772db
    var feedcolor :UIColor = UIColor.init(hexString: "85ef47")! //12cc94
    var diapercolor :UIColor = UIColor.init(hexString: "37D4C0")! //85ef47, 29cdb5, 
    var medicationcolor :UIColor = UIColor.init(hexString: "F81B9A")!
 
    
    override func draw(_ rect: CGRect)
    {
        let width = self.bounds.width
        let day : CGFloat = 24
            //SLEEP
        if self.tag == 0{
            
            //imagine sleep times of : 0-12  and 12:30 to 13:30 and 15-17
            fillColor(start : (0*width)/day ,with: sleepcolor, width: (2*width)/day)
            fillColor(start : ((12+0.5)*width)/day ,with: sleepcolor , width: (1*width)/day)
            fillColor(start : (15*width)/day ,with: sleepcolor , width: (2*width)/day)
            
        }
            //FEED
        else if self.tag == 1{
          
            
            self.fillColor(start : (12*width)/day, with: feedcolor, width: 4*width/day)
            self.fillColor(start : (22*width)/day, with: feedcolor, width: 2*width/day)
        }
            //DIAPER
        else if self.tag == 2{
            
            self.fillColor(start : (10*width)/day, with: diapercolor , width: 0.2*width/day)
            self.fillColor(start : (20*width)/day, with: diapercolor, width: 0.3*width/day)
        }
            //MEDICATION
        else if self.tag == 3{
            
    
            self.fillColor(start : (8*width)/day, with: medicationcolor, width: 0.2*width/day)
            self.fillColor(start : (16*width)/day, with: medicationcolor, width: 0.2*width/day)
        }
        
        
        
        
    }
    
    func fillColor(start : CGFloat,with color:UIColor,width:CGFloat)
    {
        let topRect = CGRect(x : start, y:0, width : width, height: self.bounds.height)
        color.setFill()
        UIRectFill(topRect)
    }

    


}

// MARK: - Grid View

class GridView: UIView
{
    private var path = UIBezierPath()
    //private var pathline = UIBezierPath()
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
        path.lineWidth = 0.15
        
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


