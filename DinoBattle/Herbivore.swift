//
//  Herbivore.swift
//  DinoBattle
//
//  Created by Minni K Ang on 2016-01-25.
//  Copyright © 2016 CreativeIce. All rights reserved.
//

import Foundation
import UIKit

class Herbivore: Dino {
	
	var name = "PlantEater"
	
	convenience init(name: String, defense: Int) {
		self.init()
		self.name = name
		self.defense = defense
		self.hp = 250
		self.attack = 22
	}
}
