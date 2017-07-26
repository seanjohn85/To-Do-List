//
//  TaskViewController.swift
//  To Do List
//
//  Created by JOHN KENNY on 26/07/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    
    //link to previous view controller
    var previousViewCon = ViewController()
    
    //ui elemends
    @IBOutlet var name: UITextField!
    @IBOutlet var important: UISwitch!
    //add button funtion to add a task to the tasks array in the previous vc
    @IBAction func add(_ sender: Any) {
        //create a new task
        let task = Task()
        task.name = name.text!
        task.important = important.isOn
        //send to previous view
        previousViewCon.tasks.append(task)
        //reload tasks on previous vc
        previousViewCon.tab.reloadData()
        //reload previous vc
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
