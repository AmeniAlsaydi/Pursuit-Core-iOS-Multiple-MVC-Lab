//
//  AnimalDescriptionController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Amy Alsaydi on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalDescriptionController: UIViewController {
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    
    @IBOutlet weak var descriptionLabel: UITextView!
    
    var animal: ZooAnimal? // should this be an optional instead??

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    

    func updateUI() {
        
        guard let theAnimal = animal else { return }
        
        animalImage.image = UIImage(named: (theAnimal.imageNumber).description)
        descriptionLabel.text = theAnimal.info
        animalName.text = theAnimal.name.capitalized
    }
}
