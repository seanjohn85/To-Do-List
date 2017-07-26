//
//  ViewController.swift
//  To Do List
//
//  Created by JOHN KENNY on 24/07/2017.
//  Copyright © 2017 JOHN KENNY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    var tasks = [Task]()
    var selected = 0
    //link to previous view controller
    
    @IBOutlet var tab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //create dummy tasks
        tasks = makeTasks()
        tab.delegate = self
        tab.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //sets selected row (needed for deleet
        selected = indexPath.row
        //sets the cell
        let cel = UITableViewCell()
        let task = tasks[indexPath.row]
        //sets the cell text
        if task.important
        {
            cel.textLabel?.text = "‼️\(task.name)"
            
        }else{
            cel.textLabel?.text = task.name
        }
        
        return cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task =  tasks[indexPath.row]
        performSegue(withIdentifier: "selectTask", sender: task)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func makeTasks() -> [Task]{
        let t1 = Task()
        t1.name = "test"
        let t2 = Task()
        t2.name = "test2"
        return [t1, t2]
    }
    
    
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: nil)
    }
    //passes info to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //for the add screen pass this vc to acees the array
        if segue.identifier == "add"{
            let nextVC = segue.destination as! TaskViewController
            nextVC.previousViewCon = self
            //the complete pass the task and this vc
        }else{
            let nextVC = segue.destination as! CompleteViewController
            nextVC.task = sender as! Task
            nextVC.previousViewCon = self
            
        }
        
        
    }
    
}

