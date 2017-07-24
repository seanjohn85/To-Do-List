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
    @IBOutlet var tab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTasks()
        tab.delegate = self
        tab.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important
        {
            cel.textLabel?.text = "‼️\(task.name)"
            
        }else{
            cel.textLabel?.text = task.name
        }
        
        return cel
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
    
}

