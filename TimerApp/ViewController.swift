//
//  ViewController.swift
//  TimerApp
//
//  Created by Elite- 77 on 02/04/18.
//  Copyright © 2018 Elite- 77. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITabBarDelegate {

    @IBOutlet weak var plus10: UITabBarItem!
    @IBOutlet weak var refresh: UITabBarItem!
    @IBOutlet weak var minus10: UITabBarItem!
    @IBOutlet weak var stopWatch: UILabel!
    
    var seconds = 120
    var timer = Timer()
    var isTimerRunning = false
    
    @IBAction func startItem(_ sender: Any) {
        
        startTimer()
    }
    @IBAction func stopItem(_ sender: Any) {
        timer.invalidate()
       
    }
    
   @objc func startTimer()
   {
    if !isTimerRunning {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,   selector: #selector(callTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    }
    
  @objc func callTimer()
  {
   
        if seconds <= 10 || seconds == 0
        {
            stopWatch.textColor = UIColor.red
        }
        else
        {
            stopWatch.textColor = UIColor.brown
        
        }
        if seconds <= 0
        {
            timer.invalidate()
            stopWatch.text = "TIME's UP"
        }
        else
        {
            seconds -= 1
            stopWatch.text = "\(seconds)"
            stopWatch.textColor = UIColor.black
            
        }
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0
        {
            seconds += 10
        }
        else if item.tag == 1
        {
            seconds = 120
            stopWatch.text = "\(seconds)"
        }
        else{
                var tempSeconds = seconds
                tempSeconds -= 10
            if tempSeconds <= -1 {
                seconds = 0
            } else {
                seconds -= 10
            }
            }
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

