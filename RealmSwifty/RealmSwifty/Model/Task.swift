//
//  Task.swift
//  RealmSwifty
//
//  Created by MOBILE MAC1 on 8/30/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import RealmSwift

class Task: Object {
  
  @objc dynamic var text = ""
  @objc dynamic var isCompleted =  false
}

