//
//  SecondViewController.swift
//  Babydoc
//
//  Created by Luchi Parejo alcazar on 05/04/2019.
//  Copyright © 2019 Luchi Parejo alcazar. All rights reserved.
//

import UIKit
import ChameleonFramework
import ScrollableDatepicker

// MARK: - Home View Controller

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var sleep: ActionView!
  
    @IBOutlet weak var feed: ActionView!
    
    @IBOutlet weak var diaper: ActionView!

    @IBOutlet weak var medication: ActionView!
   
    @IBOutlet weak var grid: GridView!
    
    @IBOutlet weak var upcomingTasks: UILabel!
    

    
    @IBOutlet weak var datePicker: ScrollableDatepicker!{
        didSet {
            var dates = [Date]()
            for day in -15...15 {
                dates.append(Date(timeIntervalSinceNow: Double(day * 86400)))
            }
            
            datePicker.dates = dates
            datePicker.selectedDate = Date()
            datePicker.delegate = self as ScrollableDatepickerDelegate
            
            var configuration = Configuration()
            
            //configuration.defaultDayStyle.dateTextColor = UIColor.init(hexString: "555555")!
            
            // weekend customization

            configuration.weekendDayStyle.dateTextColor = UIColor.black
            configuration.weekendDayStyle.weekDayTextColor = UIColor.black
            configuration.weekendDayStyle.weekDayTextFont = UIFont.boldSystemFont(ofSize: 8)
            

            configuration.selectedDayStyle.selectorColor = UIColor.flatMint
                configuration.selectedDayStyle.dateTextColor = UIColor.flatMint
            configuration.selectedDayStyle.dateTextFont = UIFont.boldSystemFont(ofSize: 20)
            
            // selected date customization
            configuration.selectedDayStyle.backgroundColor = UIColor(white: 0.9, alpha: 0.25)
            //configuration.selectedDayStyle.backgroundColor = UIColor.init(hexString: "37D4C0")?.withAlphaComponent(0.2)
            configuration.daySizeCalculation = .numberOfVisibleItems(5)
            
            datePicker.configuration = configuration
        }
    }
    
    
    
    @IBOutlet weak var taskTableView: UITableView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialAppearance()
        //related to calendar
        
        DispatchQueue.main.async {
            self.showSelectedDate()
            self.datePicker.scrollToSelectedDate(animated: false)
        }
        
        //add button
        
        let button = UIButton(type: .contactAdd)
        button.frame = CGRect(origin: CGPoint(x: self.view.frame.width-40, y: self.view.frame.size.height - 90), size: CGSize(width: 30, height: 30))
        
        self.tabBarController?.view.addSubview(button)
        
        //DATABASE RELATED
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskTableView.separatorStyle = .none
        //registering customcell here:
       taskTableView.register(UINib(nibName: "CustomCellHome", bundle: nil), forCellReuseIdentifier: "customCellHome")


     
    }
    func initialAppearance (){
        self.view.backgroundColor = UIColor.init(hexString: "F8F9F9")?.withAlphaComponent(CGFloat(0.995)) //EFEFF4
        grid.backgroundColor = UIColor.init(hexString: "F8F9F9")?.withAlphaComponent(CGFloat(0.8))
        taskTableView.backgroundColor = UIColor.init(hexString: "F8F9F9")?.withAlphaComponent(CGFloat(0.8))
        
        upcomingTasks.textColor = UIColor.init(hexString: "7F8484")!
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
    }
    
    //MARK - RELATED WITH THE DATABASE METHODS
 
 
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCellHome") as! CustomCellHome
    
        cell.backgroundColor = UIColor.init(hexString: "F8F9F9")?.withAlphaComponent(CGFloat(0.995))
        
        cell.inforDisplay.layer.borderColor = UIColor.lightGray.cgColor
        cell.inforDisplay.layer.borderWidth = 0.3
        cell.inforDisplay.layer.cornerRadius = 6
       // cell.inforDisplay.layer.shadowRadius = 10
        cell.inforDisplay.layer.masksToBounds = true
        cell.inforDisplay.layer.backgroundColor = UIColor.white.cgColor
            
            //medication.medicationcolor.withAlphaComponent(CGFloat(0.05)).cgColor
        cell.actionName.text = "Medication"
        cell.actionName.textColor = medication.medicationcolor
        
        cell.nameTitle.text = "Name :"
        cell.nameTitle.textColor = UIColor.lightGray
        
        
        cell.nameField.text = "Apiretal"
        cell.nameField.textColor = UIColor.black
        
        
        cell.dateTitle.text = "Date :"
        cell.dateTitle.textColor = UIColor.lightGray
        
        cell.dateField.text = "24/12/2012 12:00"
        cell.dateField.textColor = UIColor.black
        
        cell.quantityTitle.text = "Quantity :"
        cell.quantityTitle.textColor = UIColor.lightGray
        
        cell.quantityField.text = "30 mg"
        cell.quantityField.textColor = UIColor.black
        
        
        
        //        if  cell.quantityTitle.text!.isEqual("Quantity"){
        //            cell.stackViewTitles.removeArrangedSubview(cell.quantityTitle)
        //            cell.quantityTitle.removeFromSuperview()
        //            cell.stackViewFields.removeArrangedSubview(cell.quantityField)
        //            cell.quantityField.removeFromSuperview()
        //
        //        }
        
        
        cell.noteTitle.text = "Note :"
        cell.noteTitle.textColor = UIColor.lightGray
        
        cell.noteField.text = "Remember to give her that drug twice"
        
        cell.noteField.textColor = UIColor.black
        cell.actionImage.image = UIImage(named: "icons8-pill-filled-48")
       // cell.actionImage.backgroundColor = UIColor.white
        //cell.actionImage.layer.cornerRadius = 6
        //cell.actionImage.layer.borderColor = UIColor.flatGray.cgColor
        //cell.actionImage.layer.borderWidth = 0.3
     
        
        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        taskTableView.rowHeight = UITableView.automaticDimension
        taskTableView.estimatedRowHeight = 180.0
        
    }
    fileprivate func showSelectedDate() {
        guard datePicker.selectedDate != nil else {
            return
        }
        
    }


}
extension HomeViewController: ScrollableDatepickerDelegate {
    
    func datepicker(_ datepicker: ScrollableDatepicker, didSelectDate date: Date) {
        showSelectedDate()
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


