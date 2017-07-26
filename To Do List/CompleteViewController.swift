//
//  CompleteViewController.swift
//  To Do List
//
//  Created by JOHN KENNY on 26/07/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    //vars
    var task = Task()
    var previousViewCon = ViewController()

    @IBOutlet var taskName: UILabel!
    //complete button deletes task and returns to main screen
    @IBAction func completeBtn(_ sender: Any) {
        //deletes task
        previousViewCon.tasks.remove(at: previousViewCon.selected)
        //reload tasks on previous vc
        previousViewCon.tab.reloadData()
        //reload previous vc
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets the lable
        if task.important
        {
            taskName.text = "‼️\(task.name)"
            
        }else{
            taskName.text = task.name
        }

        
    }


}
