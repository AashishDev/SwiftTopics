//
//  Users.swift
//  NSCodingSwift
//
//  Created by MOBILE MAC1 on 8/16/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import UIKit

struct UserInfo: Codable {
  
  let user: [User]
}
struct User: Codable  {
  let id : Int
  let name: String
  let email: String
  let address: Address
}

struct Address: Codable {
  let street: String
  let suite: String
  let city: String
  let zipcode: String
  let geo: Geo
}

struct Geo:Codable {
  let lat: String
  let lng: String
}

