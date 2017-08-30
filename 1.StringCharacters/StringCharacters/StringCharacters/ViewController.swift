//
//  ViewController.swift
//  StringCharacters
//
//  Created by MOBILE MAC1 on 8/30/17.
//  Copyright © 2017 MOBILE MAC1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        stringFunctions()
    }
    
    
    // MARK: String Operations
    func stringFunctions() {
        
        //1] String declarations 
        let str = "Hello world"
        print(str)
       
        //2] Concatenation of Strings
        let name = "John"
        let surname = "Appleseed"
        let fullName = name + " " + surname  // fullName is "John Appleseed"
        print(fullName)
        print(fullName.characters)
       
        //3] Check whether a string is empty
        if str.isEmpty {
            // do something if the string is empty
        }
        
        //4] Reverse String & back in original string
        let aString = "This is a test string."
        let reversedCharacters = aString.characters.reversed()
        // then convert back to a String with the String() initializer
        let reversedString = String(reversedCharacters)
        print(reversedString)
        
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

