//
//  MainListViewController.swift
//  ToDoListSwift
//
//  Created by Yun-gi Chae on 3/12/15.
//  Copyright (c) 2015 qualson. All rights reserved.
//

import UIKit

class MainListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var tableView: UITableView!
	
	@IBOutlet weak var editBtn: UIButton!
	
	override func loadView() {
		NSBundle.mainBundle().loadNibNamed("MainListViewController", owner: self, options: nil)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		tableView.reloadData()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	//MARK: - IBActions
    
	@IBAction func addList(sender: AnyObject) {
		self.performSegueWithIdentifier("PushWriteTODOViewController", sender: self)
	}

	@IBAction func editList(sender: AnyObject) {
		if tableView.editing {
			editBtn.setTitle("Edit", forState: UIControlState.Normal)
		} else {
			editBtn.setTitle("Done", forState: UIControlState.Normal)
		}
		
		tableView.editing = !tableView.editing
	}
	
	// MARK: - UITableViewDataSource
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Todos.todos.count
	}
	
	func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		return true
	}
	
	func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
		var todo:Todo = Todos.todos[sourceIndexPath.row]
		Todos.todos.removeAtIndex(sourceIndexPath.row)
		Todos.todos.insert(todo, atIndex: destinationIndexPath.row)
	}
	
	func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == UITableViewCellEditingStyle.Delete {
			Todos.todos.removeAtIndex(indexPath.row)
			tableView.reloadData()
		}
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		var cellIdentifier = "TODOCELL"
		var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
		
		if cell == nil {
			cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
		}
		
		var todo = Todos.todos[indexPath.row]
		
		cell?.textLabel?.text = todo.title
		cell?.detailTextLabel?.text = todo.detail
		
		var label = UILabel(frame: CGRectMake(0, 0, 200, 15))
		label.textColor = UIColor.redColor()
		label.font = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
		label.textAlignment = NSTextAlignment.Right
		label.text = todo.dueDate
		
		cell?.selectionStyle = UITableViewCellSelectionStyle.None
		
		cell?.accessoryView = label;
		
		
		
		return cell!
	}
	
	// MARK: - UITableViewDelegate
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
	}
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		
		if segue.identifier == "PushWriteTODOViewController" {
			var writeTODOViewController: WriteTODOViewController = segue.destinationViewController as WriteTODOViewController
//			writeTODOViewController.todo = lists[0]
		}
    }

}

































