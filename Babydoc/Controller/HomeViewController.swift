//
//  SecondViewController.swift
//  Babydoc
//
//  Created by Luchi Parejo alcazar on 05/04/2019.
//  Copyright © 2019 Luchi Parejo alcazar. All rights reserved.
//

import UIKit
import Charts

class HomeViewController: UIViewController {
 
    var sleepData = PieChartDataEntry(value: 0)
    var rest = PieChartDataEntry(value: 0)
    var numberofDownloads = [PieChartDataEntry]()

    @IBOutlet weak var piechart: PieChartView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //piechart.chartDescription?.text = "Sleep"
        sleepData.label = "sleep"
        rest.label = "rest"
        sleepData.value = 1/24
        rest.value = 23/24
        piechart.drawEntryLabelsEnabled = false
        piechart.drawMarkers = false
        piechart.usePercentValuesEnabled = false
        piechart.drawCenterTextEnabled = false
        numberofDownloads = [sleepData, rest]
        updatechartData()
       
       

    }

    func updatechartData(){
        let chartdataset = PieChartDataSet(values: numberofDownloads, label: nil)
        let chartdata = PieChartData(dataSet: chartdataset)
        //give some colors
        let colors = [UIColor.blue,UIColor.lightGray]
        chartdataset.colors = colors
        piechart.data = chartdata


    }

  
    @IBAction func didSwipetoDoctor(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == UISwipeGestureRecognizer.Direction.left && sender.state == .ended
        
        {
            performSegue(withIdentifier: "goToDoctor", sender: nil)
        }
        
    }}


