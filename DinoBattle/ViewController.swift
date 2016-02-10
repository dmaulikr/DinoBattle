//
//  ViewController.swift
//  DinoBattle
//
//  Created by Minni K Ang on 2016-01-24.
//  Copyright © 2016 CreativeIce. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {

	@IBOutlet weak var choiceButton: UIButton!
	@IBOutlet weak var choiceStepper: UIStepper!

	@IBOutlet weak var choiceOne: UIButton!
	@IBOutlet weak var choiceTwo: UIButton!
	@IBOutlet weak var choiceThree: UIButton!
	@IBOutlet weak var choiceFour: UIButton!
	@IBOutlet weak var choiceFive: UIButton!
	@IBOutlet weak var choiceSix: UIButton!
	
    @IBOutlet weak var playerOne: UIImageView!
	@IBOutlet weak var playerTwo: UIImageView!
	@IBOutlet weak var playerOneHpLabel: UILabel!
	@IBOutlet weak var playerTwoHpLabel: UILabel!
	
	@IBOutlet weak var playerOneFightButton: UIButton!
	@IBOutlet weak var playerTwoFightButton: UIButton!

	@IBOutlet weak var welcomeLabel: UILabel!
	@IBOutlet weak var infoLabel: UILabel!
	@IBOutlet weak var nextButton: UIButton!
	@IBOutlet weak var yesButton: UIButton!
	@IBOutlet weak var noButton: UIButton!
	@IBOutlet weak var gameOverButton: UIButton!
	
	var tRex = Carnivore(name: "T-Rex", attack: 28)
	var spinosaurus = Carnivore(name: "Spinosaurus", attack: 25)
	var velociraptor = Carnivore(name: "Velociraptor", attack: 22)
	
	var stegosaurus = Herbivore(name: "Stegosaurus", defense: 20)
	var triceratops = Herbivore(name: "Triceratops", defense: 15)
	var diplodocus = Herbivore(name: "Diplodocus", defense: 10)
	
	var currentChoice = 0
	var player1Choice = 0
	var name: String!
	var hp: Int!
	var attack: Int!
	var defense: Int!

	var dino = Dino()
	var player = Player()
	var player1 = Dino()
	var player2 = Dino()
	var deadName: String!
	
	var player1Roar = AVAudioPlayer()
	var player2Roar = AVAudioPlayer()
	var roar1Name: String!
	var roar2Name: String!
	
	var bgMusic = AVAudioPlayer()
	var introMusic = AVAudioPlayer()
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
		playerOneHpLabel.hidden = true
		playerTwoHpLabel.hidden = true
		playerOneFightButton.hidden = true
		playerTwoFightButton.hidden = true
		infoLabel.hidden = true
		yesButton.hidden = true
		noButton.hidden = true
		nextButton.hidden = true
		gameOverButton.hidden = true
        
		let bounds = self.choiceButton.bounds

		UIView.animateWithDuration(2.5, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: [.Repeat, .AllowUserInteraction],  animations: {self.choiceButton.bounds = CGRect(x:bounds.origin.x - 5, y: bounds.origin.y, width: bounds.size.width + 20, height: bounds.size.height)}, completion: nil )

		UIView.animateWithDuration(2, delay: 0, options: .CurveEaseOut,  animations: {self.welcomeLabel.transform = CGAffineTransformMakeScale(1.1, 1.1)}, completion: {finish in UIView.animateWithDuration(2) {self.welcomeLabel.transform = CGAffineTransformIdentity}} )

        UIView.animateWithDuration(3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [.Repeat, .AllowUserInteraction, .CurveEaseOut],  animations: {self.nextButton.transform = CGAffineTransformMakeScale(1.2, 1.2)}, completion: {finish in UIView.animateWithDuration(3) {self.nextButton.transform = CGAffineTransformIdentity}} )
        
        UIView.animateWithDuration(3, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [.Repeat, .AllowUserInteraction, .CurveEaseInOut],  animations: {
            self.gameOverButton.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4/6))
            self.gameOverButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4/6))
            self.gameOverButton.transform = CGAffineTransformMakeRotation(0.0)
            }, completion: {finish in UIView.animateWithDuration(3) {self.gameOverButton.transform = CGAffineTransformIdentity}} )
        
		UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [.Repeat, .AllowUserInteraction, .CurveEaseOut],  animations: {self.yesButton.transform = CGAffineTransformMakeScale(1.2, 1.2)}, completion: {finish in UIView.animateWithDuration(2) {self.yesButton.transform = CGAffineTransformIdentity}} )

		UIView.animateWithDuration(2, delay: 1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [.Repeat, .AllowUserInteraction, .CurveEaseInOut],  animations: {
			self.noButton.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_4/6))
			self.noButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4/6))
			self.noButton.transform = CGAffineTransformMakeRotation(0.0)
			}, completion: {finish in UIView.animateWithDuration(2) {self.noButton.transform = CGAffineTransformIdentity}} )

		do {
			try introMusic = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("introMusic", ofType: "mp3")!))
			
			introMusic.prepareToPlay()
			introMusic.numberOfLoops = -1
			introMusic.play()

		} catch let error as NSError {
			print(error.debugDescription)
		}
		
	}
    
	@IBAction func chooseDino(sender: AnyObject) {
		welcomeLabel.hidden = true
		choiceButton.hidden = true
		choiceOne.hidden = false
		choiceStepper.value = 0
		choiceStepper.hidden = false
		}
	
	@IBAction func viewChoices(sender: AnyObject) {

		let choice = Int(choiceStepper.value)
			
			switch choice {
		
			case 1:
				hideChoices()
				choiceTwo.hidden = false
			case 2:
				hideChoices()
				choiceThree.hidden = false
				
			case 3:
				hideChoices()
				choiceFour.hidden = false
				
			case 4:
				hideChoices()
				choiceFive.hidden = false
				
			case 5:
				hideChoices()
				choiceSix.hidden = false

			default:
				hideChoices()
				choiceOne.hidden = false
		}
	}
	
	func hideChoices() {
		choiceOne.hidden = true
		choiceTwo.hidden = true
		choiceThree.hidden = true
		choiceFour.hidden = true
		choiceFive.hidden = true
		choiceSix.hidden = true
	}
	
	@IBAction func choiceOne(sender: AnyObject) {
		currentChoice = choiceOne.tag
		processChoice(currentChoice)
	}
	
	@IBAction func choiceTwo(sender: AnyObject) {
		currentChoice = choiceTwo.tag
		processChoice(currentChoice)
	}
	
	@IBAction func choiceThree(sender: AnyObject) {
		currentChoice = choiceThree.tag
		processChoice(currentChoice)
	}
	
	@IBAction func choiceFour(sender: AnyObject) {
		currentChoice = choiceFour.tag
		processChoice(currentChoice)
	}
	
	@IBAction func choiceFive(sender: AnyObject) {
		currentChoice = choiceFive.tag
		processChoice(currentChoice)
	}

	@IBAction func choiceSix(sender: AnyObject) {
		currentChoice = choiceSix.tag
		processChoice(currentChoice)
	}

	@IBAction func playerOneAttack(sender: AnyObject) {
		playPlayer1Roar()

		UIView.animateWithDuration(0.05, delay: 0, options: .CurveLinear,  animations: {self.playerOne.transform = CGAffineTransformMakeTranslation(30, 0)}, completion: {finish in UIView.animateWithDuration(0.05) {self.playerOne.transform = CGAffineTransformIdentity}} )

		UIView.animateWithDuration(0.1, delay: 0, usingSpringWithDamping: 0.05, initialSpringVelocity: 10, options: .CurveLinear,  animations: {self.playerTwo.transform = CGAffineTransformMakeScale(1.03, 1.03)}, completion: {finish in UIView.animateWithDuration(0.1) {self.playerTwo.transform = CGAffineTransformIdentity}})
		
		player1.attemptAttack(player1.attack, defense: player2.defense, hp: &player2.hp)
		infoLabel.text = "\(roar2Name) Hit!!"
		playerTwoHpLabel.text = "\(player2.hp) HP"
		
		if !player2.isAlive {
			infoLabel.text = "\(roar1Name) Wins!"
			playerTwoHpLabel.text = "Fainted!"

			playerTwo.image = UIImage(named: name + "2")?.imageFlippedForRightToLeftLayoutDirection()
			
			gameOver()
		}
	}

	@IBAction func playerTwoAttack(sender: AnyObject) {
		playPlayer2Roar()

		UIView.animateWithDuration(0.05, delay: 0, options: .CurveLinear,  animations: {self.playerTwo.transform = CGAffineTransformMakeTranslation(-30, 0)}, completion: {finish in UIView.animateWithDuration(0.05) {self.playerTwo.transform = CGAffineTransformIdentity}})

		UIView.animateWithDuration(0.1, delay: 0, usingSpringWithDamping: 0.05, initialSpringVelocity: 10, options: .CurveLinear,  animations: {self.playerOne.transform = CGAffineTransformMakeScale(1.03, 1.03)}, completion: {finish in UIView.animateWithDuration(0.1) {self.playerOne.transform = CGAffineTransformIdentity}})

		player2.attemptAttack(player2.attack, defense: player1.defense, hp: &player1.hp)
		infoLabel.text = "\(roar1Name) Hit!!"
		playerOneHpLabel.text = "\(player1.hp) HP"
		
		if !player1.isAlive {

			infoLabel.text = "\(roar2Name) Wins!"
			playerOneHpLabel.text = "Fainted!"
			playerOne.image = UIImage(named: deadName)
			
			gameOver()
		}
	}
	
	func requestChoice() {
		hideChoices()
		infoLabel.hidden = true
		choiceButton.hidden = false
	}
	
	func processChoice(currentChoice: Int) {
		
		choiceStepper.hidden = true
		
		if currentChoice == 1 {
			dino = triceratops
			name = triceratops.name

		} else if currentChoice == 2 {
			dino = stegosaurus
			name = stegosaurus.name
			
		} else if currentChoice == 3 {
			dino = diplodocus
			name = diplodocus.name
			
		} else if currentChoice == 4 {
			dino = tRex
			name = tRex.name

		} else if currentChoice == 5 {
			dino = spinosaurus
			name = spinosaurus.name

		} else if currentChoice == 6 {
			dino = velociraptor
			name = velociraptor.name
		}

		infoLabel.hidden = false
		
		if player.order == 1 {
			player1 = dino
			player1Choice = currentChoice
            
            let image1 = UIImage(named: name + "1")
			playerOne.image = image1
            playerOne.contentMode = .ScaleAspectFit
            playerOne.hidden = false
            
 			roar1Name = name
			deadName = name + "2"
            
			hideChoices()
			infoLabel.text = "Player 2, choose your dinosaur"
			nextButton.hidden = false
			player.order = 2
			
		} else {
			
			let image2 = UIImage(named: name + "1")?.imageFlippedForRightToLeftLayoutDirection()
            playerTwo.image = image2
            playerTwo.contentMode = .ScaleAspectFit
            playerTwo.hidden = false
            
 			roar2Name = name

			if currentChoice != player1Choice {
				player2 = dino
				
			} else {
				dino.duplicate = true
				let duplicateDino = Dino()
				duplicateDino.hp = dino.hp
				duplicateDino.attack = dino.attack
				duplicateDino.defense = dino.defense
				player2 = duplicateDino
			}
 
			startBattle()
		}
	}
    
	
	@IBAction func getPlayerTwoChoice(sender: AnyObject) {

		nextButton.hidden = true
		welcomeLabel.hidden = true
		requestChoice()
	}
	
	func startBattle() {
        infoLabel.text = "\(roar1Name) vs \(roar2Name)"
		introMusic.stop()
		playBgMusic()
		hideChoices()
        playerOneFightButton.enabled = true
        playerTwoFightButton.enabled = true
		playerOneFightButton.hidden = false
		playerTwoFightButton.hidden = false
		playerOneHpLabel.text = "\(player1.hp) HP"
		playerTwoHpLabel.text = "\(player2.hp) HP"
		playerOneHpLabel.hidden = false
		playerTwoHpLabel.hidden = false
	}
	
	@IBAction func gameOver(sender: AnyObject) {
		playerOneHpLabel.hidden = true
		playerTwoHpLabel.hidden = true
		playerOne.hidden = true
		playerTwo.hidden = true
        playerOneFightButton.hidden = true
        playerTwoFightButton.hidden = true
		gameOverButton.hidden = true
		welcomeLabel.text = "Play Again?"
		welcomeLabel.hidden = false
		yesButton.hidden = false
		noButton.hidden = false
	}
	
	func gameOver() {
		gameOverButton.hidden = false
		playerOneFightButton.enabled = false
		playerTwoFightButton.enabled = false
	}
	
	@IBAction func playAgain(sender: AnyObject) {
		newGame()
	}
	
	@IBAction func endGame(sender: AnyObject) {
		welcomeLabel.text = "Come again soon!"
		yesButton.hidden = true
		noButton.hidden = true
		playerOne.hidden = true
		playerTwo.hidden = true
		playerOneHpLabel.hidden = true
		playerTwoHpLabel.hidden = true
		infoLabel.hidden = true
		bgMusic.volume = 0.05
		bgMusic.volume = 0.025
		bgMusic.volume = 0.0125
		bgMusic.stop()
	}
	
	func newGame() {
		welcomeLabel.hidden = true
		yesButton.hidden = true
		noButton.hidden = true
        
		currentChoice = 0
		player1Choice = 0

		tRex = Carnivore(name: "T-Rex", attack: 28)
		spinosaurus = Carnivore(name: "Spinosaurus", attack: 25)
		velociraptor = Carnivore(name: "Velociraptor", attack: 22)
		stegosaurus = Herbivore(name: "Stegosaurus", defense: 20)
		triceratops = Herbivore(name: "Triceratops", defense: 15)
		diplodocus = Herbivore(name: "Diplodocus", defense: 10)

		dino = Dino()
		player = Player()
		player1 = Dino()
		player2 = Dino()
		playerOne.hidden = true
		playerTwo.hidden = true
		playerOneHpLabel.hidden = true
		playerTwoHpLabel.hidden = true
		infoLabel.text = "Rematch!"
		choiceButton.hidden = false
	}
	
	func playPlayer1Roar() {
		let soundURL = NSBundle.mainBundle().URLForResource(roar1Name, withExtension: "mp3")!
		
		do {
			try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
			try AVAudioSession.sharedInstance().setActive(true)
			
			player1Roar = try AVAudioPlayer(contentsOfURL: soundURL)
			player1Roar.prepareToPlay()
			player1Roar.play()
		}
			
		catch _ {
			print("Sound file not found")
		}
	}
	
	
	func playPlayer2Roar() {
		let soundURL = NSBundle.mainBundle().URLForResource(roar2Name, withExtension: "mp3")!
		
		do {
			try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
			try AVAudioSession.sharedInstance().setActive(true)
			
			player2Roar = try AVAudioPlayer(contentsOfURL: soundURL)
			player2Roar.prepareToPlay()
			player2Roar.play()
		}
			
		catch _ {
			print("Sound file not found")
		}
		
	}
	
	func playBgMusic() {
		let soundURL = NSBundle.mainBundle().URLForResource("battleMusic", withExtension: "mp3")!
		
		do {
			try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
			try AVAudioSession.sharedInstance().setActive(true)
			
			bgMusic = try AVAudioPlayer(contentsOfURL: soundURL)
			bgMusic.prepareToPlay()
			bgMusic.volume = 0.15
			bgMusic.numberOfLoops = -1
			bgMusic.play()
		}
			
		catch _ {
			print("Sound file not found")
		}
		
		
	}
}

