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
    
    @IBOutlet weak var sleep: ActionView!
  
    @IBOutlet weak var feed: ActionView!
  
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var diaper: ActionView!

    @IBOutlet weak var medication: ActionView!
   
    @IBOutlet weak var grid: GridView!
    
    @IBOutlet weak var last24hours: UILabel!
    @IBOutlet weak var upcomingTasks: UILabel!
    

    @IBOutlet weak var taskTableView: UITableView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTableView.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(tableViewSwiped)))
        scrollView.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(scrollViewSwiped)))

        last24hours.textColor = UIColor.flatGray
        upcomingTasks.textColor = UIColor.flatGray
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
        
        
        //grid.backgroundColor = UIColor.init(hexString: "EBEBEB", withAlpha: 0.01)!
        
        //DATABASE RELATED
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskTableView.separatorStyle = .none
        //registering customcell here:
        taskTableView.register(UINib(nibName: "CustomCellHome", bundle: nil), forCellReuseIdentifier: "customMessageCell")
       configureTableView()
    }
    @objc func tableViewSwiped(){
        scrollView.isScrollEnabled = false
        taskTableView.isScrollEnabled = true
    }
    
    @objc func scrollViewSwiped(){
        scrollView.isScrollEnabled = true
        taskTableView.isScrollEnabled = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //FOR EACH ROW, WHAT WE WANT THE CELLS TO LOOK LIKE
        //WE HAVE TO SPECIFY ALSO THE CLASS OF CELL TO BE ABLE TO USE THE PROPERTIES OF THAT CLASS
         // let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomCellHome
          let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell") as! CustomCellHome
        
            cell.inforDisplay.layer.borderColor = UIColor.flatGray.cgColor
            cell.inforDisplay.layer.borderWidth = 0.8
            //cell.inforDisplay.layer.backgroundColor = medication.medicationcolor.withAlphaComponent(CGFloat(0.05)).cgColor
          cell.actionName.text = "Medication"
          cell.actionName.textColor = medication.medicationcolor
        
        cell.nameTitle.text = "Name :"
          cell.nameTitle.textColor = UIColor.lightGray
        
        
          cell.nameField.text = "Apiretal"
          cell.nameField.textColor = UIColor.flatGray
        
        
        cell.dateTitle.text = "Date :"
          cell.dateTitle.textColor = UIColor.lightGray
        
        cell.dateField.text = "24/12/2012 12:00"
          cell.dateField.textColor = UIColor.flatGray
        
        cell.quantityTitle.text = "Quantity :"
          cell.quantityTitle.textColor = UIColor.lightGray
        
          cell.quantityField.text = "30 mg"
          cell.quantityField.textColor = UIColor.flatGray
        
        

//        if  cell.quantityTitle.text!.isEqual("Quantity"){
//            cell.stackViewTitles.removeArrangedSubview(cell.quantityTitle)
//            cell.quantityTitle.removeFromSuperview()
//            cell.stackViewFields.removeArrangedSubview(cell.quantityField)
//            cell.quantityField.removeFromSuperview()
//
//        }
        
//        let notefieldheight = cell.noteField.optimalHeight
//        cell.noteField.frame = CGRect(x: cell.noteField.frame.origin.x, y: cell.noteField.frame.origin.y, width: cell.noteField.frame.width, height: notefieldheight)
        cell.noteTitle.text = "Note :"
        cell.noteTitle.textColor = UIColor.lightGray
        
        cell.noteField.text = "Remember to give her that drug twice "
        
        cell.noteField.textColor = UIColor.flatGray
         
         
        
     
        
          cell.actionImage.image = UIImage(named: "icons8-pill-filled-48")
        
        return cell
    }
    func configureTableView(){
      taskTableView.rowHeight = UITableView.automaticDimension
      taskTableView.estimatedRowHeight = 200.0 //what will always be seen
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


