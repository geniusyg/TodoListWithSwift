//
//  Todo.swift
//  ToDoListSwift
//
//  Created by Yun-gi Chae on 3/12/15.
//  Copyright (c) 2015 qualson. All rights reserved.
//

import UIKit

struct Todos {
	static var todos = Array<Todo>()
}

class Todo: NSObject {
	var index: Int = 0
	var title: String = ""
	var detail: String = ""
	var dueDate: String = ""
	
}























