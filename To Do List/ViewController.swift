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

    //link to previous view controller
    
    @IBOutlet var tab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tab.delegate = self
        tab.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //sets the cell
        let cel = UITableViewCell()
        let task = tasks[indexPath.row]
        //sets the cell text
        if task.important
        {
            cel.textLabel?.text = "‼️\(task.name!)"
            
        }else{
            cel.textLabel?.text = task.name!
        }
        
        return cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task =  tasks[indexPath.row]
        performSegue(withIdentifier: "selectTask", sender: task)
    }
    //when the view is about to display
    override func viewWillAppear(_ animated: Bool) {
        getTasksFromCoreData()
        tab.reloadData()
    }
    
    func getTasksFromCoreData(){
        //access to core data
        let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //fetch the data from core data -- needs error handling
        do{
            tasks = try ctx.fetch(Task.fetchRequest()) as! [Task]
        }catch{
            print("error getting data")
        }
        
    }
    
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: nil)
    }
    //passes info to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //for the add screen pass this vc to acees the array
        if segue.identifier == "selectTask" {
            let nextVC = segue.destination as! CompleteViewController
            nextVC.task = sender as? Task

            
        }
        
        
    }
    
}

