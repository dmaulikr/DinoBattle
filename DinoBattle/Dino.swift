//
//  Dino.swift
//  DinoBattle
//
//  Created by Minni K Ang on 2016-01-25.
//  Copyright © 2016 CreativeIce. All rights reserved.
//

import Foundation
import UIKit

class Dino {
	
	var hp = 0
	var attack = 0
	var defense = 0
	var duplicate = false
	
	var isAlive: Bool {
		get {
			if hp <= 0 {
				return false
			} else {
				return true
			}
		}
	}
	
	init(hp: Int, attack: Int, defense: Int) {
		self.hp = hp
		self.attack = attack
		self.defense = defense
	}
	
	init() {
	}
	
	func attemptAttack(attack: Int, defense: Int, inout hp: Int) -> (Bool, Int) {
		let attackStrength = attack - defense
		print(attackStrength)
		hp -= attackStrength
		print(hp)

		return (true, hp)
	}
}