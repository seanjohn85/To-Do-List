//
//  TaskViewController.swift
//  To Do List
//
//  Created by JOHN KENNY on 26/07/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    
    //ui elemends
    @IBOutlet var name: UITextField!
    @IBOutlet var important: UISwitch!
    //add button funtion to add a task to the tasks array in the previous vc
    @IBAction func add(_ sender: Any) {
        //access to core data
        let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //create a new task
        let task = Task(context: ctx)
        task.name = name.text!
        task.important = important.isOn
        //save task
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
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
    

}
