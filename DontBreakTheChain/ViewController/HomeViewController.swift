//
//  ViewController.swift
//  DontBreakTheChain
//
//  Created by Yiğithan Sönmez on 19.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var habits: [Habit] = []
    
    @IBOutlet var tableView: UITableView! {
        didSet{
            let nib = UINib(nibName: HabitTableViewCell.identifier, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: HabitTableViewCell.identifier)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorStyle = .none
            tableView.showsVerticalScrollIndicator = false
        }
    }
    
    @IBAction func habitAddButton(_ sender: UIButton) {
        let addHabitVC = storyboard?.instantiateViewController(withIdentifier: "AddHabitViewController") as! AddHabitViewController
        addHabitVC.addHabitDelegate = self
        present(addHabitVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Habits"

        let habit1 = Habit(habitName: "Play Guitar", habitDescription: "Play guitar 30 min every day", habitColor: .blue)
        
        let habit2 = Habit(habitName: "Drink Water", habitDescription: "Drink 2 liters of water every day", habitColor: .red)
        
        habits.append(habit1)
        habits.append(habit2)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HabitTableViewCell.identifier, for: indexPath) as! HabitTableViewCell
        
        cell.configure(with: habits[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell: \(indexPath.row)")
        
        let habitPreviewVC = storyboard?.instantiateViewController(withIdentifier: "HabitPreviewViewController") as! HabitPreviewViewController
        
        navigationController?.pushViewController(habitPreviewVC, animated: true)
    }
}

extension HomeViewController: AddHabitProtocol {
    func didCreateNewHabit(newHabit: Habit) {
        habits.append(newHabit)
        tableView.reloadData()
    }
}

