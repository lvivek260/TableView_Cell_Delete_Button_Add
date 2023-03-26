//
//  ViewController.swift
//  TableView_Cell_Delete_Button_Add
//
//  Created by Admin on 26/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    var students = ["Vivek","Pavan","Ravi","Samadhan","Kumar","Shubham"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.studentTableView.delegate = self
        self.studentTableView.dataSource = self
    }
}


extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = studentTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            tableView.beginUpdates()
            students.remove(at: indexPath.row)
            studentTableView.deleteRows(at: [indexPath], with: .automatic)
            print("Delete Button Click")
            tableView.endUpdates()
        }
    }
}


