//
//  AddHabitViewController.swift
//  DontBreakTheChain
//
//  Created by Yiğithan Sönmez on 23.12.2023.
//

import UIKit

protocol AddHabitProtocol {
    func didCreateNewHabit(newHabit: Habit)
}

class AddHabitViewController: UIViewController {
    
    var tableViewIndex = 0
    
    var selectedColor: UIColor?
    var habitNameField: UITextField?
    var habitDescriptionField: UITextField?
    
    let totalNumberOfElements = 4
    
    let sectionRows = [2,1,1]
    
    var addHabitDelegate: AddHabitProtocol?
    
    @IBAction func createHabbitButton(_ sender: UIButton) {
        createHabbit()
    }
    
    @IBOutlet var addHabitTableView: UITableView! {
        didSet{
            addHabitTableView.register(TextFieldTableViewCell.nib(), forCellReuseIdentifier: TextFieldTableViewCell.identifier)
            
            addHabitTableView.register(ColorTableViewCell.nib(), forCellReuseIdentifier: ColorTableViewCell.identifier)
            
            addHabitTableView.register(ReminderTableViewCell.nib(), forCellReuseIdentifier: ReminderTableViewCell.identifier)
            
            addHabitTableView.delegate = self
            addHabitTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Habit"
    }
    
    func createHabbit() {
        guard let habitName = habitNameField?.text else {return}
        
        guard let habitDescription = habitDescriptionField?.text else {return}
        
        if habitName.isEmpty {
            let alertController = UIAlertController(title: "Hey You", message: "Please Fill the Habit Name Field", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default))
            present(alertController, animated: true, completion: nil)
            return
        }
        
        let color = selectedColor ?? .lightGray
        
        let habit = Habit(
            habitName: habitName,
            habitDescription: habitDescription,
            habitColor: color
        )
        
        addHabitDelegate?.didCreateNewHabit(newHabit: habit)
        
        dismiss(animated: true, completion: nil)
    }
}

extension AddHabitViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionRows.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Habit Details"
        }
        else if(section == 1){
            return "Color Picker"
        }
        else {
            return "Reminder"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionRows[section]
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let absoluteIndex = tableView.absoluteIndex(for: indexPath, sectionRows)
        
        if(absoluteIndex == 2){
            return 80
        }
        else if(absoluteIndex == 3){
            return 80
        }
        else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let absoluteIndex = tableView.absoluteIndex(for: indexPath, sectionRows)
        
        if(absoluteIndex == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            cell.textField.placeholder = "Habit Name"
            habitNameField = cell.textField
            return cell
        }
        else if(absoluteIndex == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identifier, for: indexPath) as! TextFieldTableViewCell
            cell.textField.placeholder = "Description"
            habitDescriptionField = cell.textField
            return cell
        }
        else if(absoluteIndex == 2){
            let cell = tableView.dequeueReusableCell(withIdentifier: ColorTableViewCell.identifier, for: indexPath) as! ColorTableViewCell
            cell.onColorSelected = { [weak self] color in
                self?.selectedColor = color
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: ReminderTableViewCell.identifier, for: indexPath) as! ReminderTableViewCell
            return cell
        }
    }
}
