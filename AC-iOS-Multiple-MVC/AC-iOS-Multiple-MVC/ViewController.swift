//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalTableView: UITableView!
    
    var  animals = [ZooAnimal]() {
        didSet { // using didSet{...} property observer to reload the tablr view
            animalTableView.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animals = ZooAnimal.zooAnimals
        animalTableView.dataSource = self
        animalTableView.delegate = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? AnimalDescriptionController, let indexPath = animalTableView.indexPathForSelectedRow else {fatalError("segue issue") }
        
        detailVC.animal = animals[indexPath.row]
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else { fatalError("could not dequeue a animalCell") }
        
        let animal = animals[indexPath.row]
        
        cell.configureCell(for: animal)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

