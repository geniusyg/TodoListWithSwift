//
//  WriteTODOViewController.swift
//  ToDoListSwift
//
//  Created by Yun-gi Chae on 3/12/15.
//  Copyright (c) 2015 qualson. All rights reserved.
//

import UIKit

class WriteTODOViewController: UIViewController, UITextFieldDelegate {
	
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var pickerView: UIDatePicker!
	
	var todo: Todo!
	
	override func loadView() {
		NSBundle.mainBundle().loadNibNamed("WriteTODOViewController", owner: self, options: nil)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		if todo == nil {
			todo = Todo()
			
			textField.becomeFirstResponder()
		} else {
			textField.text = todo.title
			textView.text = todo.detail
			
			var dateFormatter = NSDateFormatter()
			dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
			dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
			
			pickerView.date = dateFormatter.dateFromString(todo.dueDate)!
		}
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		self.view.endEditing(true)
	}
	
	// MARK: - UITextFieldDelegate
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		
		return true
	}
	
	// MARK: - IBActions
	
	@IBAction func complete(sender: AnyObject) {
		
		if countElements(textField.text) > 0 && countElements(textView.text) > 0 {
			todo.title = textField.text
			todo.detail = textView.text
			
			var dateFormatter = NSDateFormatter()
			dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
			dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
			
			todo.dueDate = dateFormatter.stringFromDate(pickerView.date)

			Todos.todos.append(todo)
			
			self.navigationController?.popViewControllerAnimated(true)
		}
	}
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}








































