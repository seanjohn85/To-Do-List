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
    var task : Task? = nil


    @IBOutlet var taskName: UILabel!
    //complete button deletes task and returns to main screen
    @IBAction func completeBtn(_ sender: Any) {

        //access to core data
        let ctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //deltes task
        ctx.delete(task!)
        //save delete
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        //reload previous vc
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets the lable
        if task!.important
        {
            taskName.text = "‼️\(task!.name!)"
            
        }else{
            taskName.text = task!.name!
        }

        
    }


}
