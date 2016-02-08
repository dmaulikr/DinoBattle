//
//  Player.swift
//  DinoBattle
//
//  Created by Minni K Ang on 2016-01-25.
//  Copyright © 2016 CreativeIce. All rights reserved.
//

import Foundation
import UIKit

class Player: Dino {
	
	var order = 1
	
	convenience init(order: Int) {
		self.init()
		self.order = order
	}
	
}