//
//  Carnivore.swift
//  DinoBattle
//
//  Created by Minni K Ang on 2016-01-25.
//  Copyright © 2016 CreativeIce. All rights reserved.
//

import Foundation
import UIKit

class Carnivore: Dino {
	
	var name = "MeatEater"
	
	convenience init(name: String, attack: Int) {
		self.init()
		self.name = name
		self.attack = attack
		self.hp = 200
		self.defense = 15
	}
}