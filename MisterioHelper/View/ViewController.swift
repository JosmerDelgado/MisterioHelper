//
//  ViewController.swift
//  MisterioHelper
//
//  Created by Josmer Delgado on 29/12/2018.
//  Copyright © 2018 Josmer Delgado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var accusedTableView: UITableView!

	var accusedMonsters: [AccusedModel] = [
		AccusedModel(imageName: "manwolf", accusedName: "Hombre Lobo", isSelected: false),
		AccusedModel(imageName: "mummy", accusedName: "Momia", isSelected: false),
		AccusedModel(imageName: "dracula", accusedName: "Dracula", isSelected: false),
		AccusedModel(imageName: "phantom", accusedName: "Fantasma", isSelected: false),
		AccusedModel(imageName: "jekyllMrHyde", accusedName: "Jekyll & Mr Hyde", isSelected: false),
		AccusedModel(imageName: "frankenstein", accusedName: "Frankenstein", isSelected: false)]

	var accusedVictims: [AccusedModel] = [
		AccusedModel(imageName: "conde", accusedName: "Conde", isSelected: false),
		AccusedModel(imageName: "condesa", accusedName: "Condesa", isSelected: false),
		AccusedModel(imageName: "amaDeLlaves", accusedName: "Ama de llaves", isSelected: false),
		AccusedModel(imageName: "mayordomo", accusedName: "Mayordomo", isSelected: false),
		AccusedModel(imageName: "doncella", accusedName: "Doncella", isSelected: false),
		AccusedModel(imageName: "jardinero", accusedName: "Jardinero", isSelected: false),
	]

	var accusedPlaces: [AccusedModel] = [
		AccusedModel(imageName: "lobby", accusedName: "Vestibulo", isSelected: false),
		AccusedModel(imageName: "bedroom", accusedName: "Alcoba", isSelected: false),
		AccusedModel(imageName: "library", accusedName: "Biblioteca", isSelected: false),
		AccusedModel(imageName: "lounge", accusedName: "Salon", isSelected: false),
		AccusedModel(imageName: "laboratory", accusedName: "Laboratorio", isSelected: false),
		AccusedModel(imageName: "cellar", accusedName: "Bodega", isSelected: false),
		AccusedModel(imageName: "mausoleum", accusedName: "Panteon", isSelected: false),
		AccusedModel(imageName: "garage", accusedName: "Cocheras", isSelected: false),

		]

	lazy var accusedList = [accusedMonsters, accusedVictims, accusedPlaces]

	override func viewDidLoad() {
		super.viewDidLoad()
		accusedTableView.delegate = self
		accusedTableView.dataSource = self
	}
}

extension ViewController: UITableViewDelegate {

}

extension ViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return accusedList.count
	}
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return "Monstruos"
		case 1:
			return "Victimas"
		default:
			return "Otros"
		}
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let accused = accusedList[section]
		return accused.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AccousedTableViewCell
		let accused = accusedList[indexPath.section][indexPath.row]
		cell.descriptiveImage.image = UIImage(named:accused.imageName)
		cell.accusedNameLabel.text = accused.accusedName
		cell.selectedIcon.isHidden = !accused.isSelected
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("row selected \(indexPath)")
		accusedList[indexPath.section][indexPath.row].isSelected = !accusedList[indexPath.section][indexPath.row].isSelected
		tableView.reloadData()
	}

	
}

