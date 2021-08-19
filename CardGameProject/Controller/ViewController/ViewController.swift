//
//  ViewController.swift
//  CardGameProject
//
//  Created by Kyle Franklin on 8/18/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var card1ImageView: UIImageView!
    
    @IBOutlet weak var card2ImageView: UIImageView!
    
    @IBOutlet weak var playerScoreTextLabel: UILabel!
    
    @IBOutlet weak var cpuScoreTextLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func dealButtonTapped(_ sender: Any) {
        
        presentCardAlertController()
    
        CardController.fetchCard { [weak self] (result) in
            
            DispatchQueue.main.async {
                switch result {
                
                case .success(let card):
                    self?.fetchImageAndUpdateViews(for: card)
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
        func presentCardAlertController() {
            let alertController = UIAlertController(title: "Just Keeper Go'n!", message: "You didn't win,but you didn't lose! 😈", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Let's go again!", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    

    func fetchImageAndUpdateViews(for card: Card) {
        
        CardController.fetchImage(for: card) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                
                case .success(let image):
                    self?.card2ImageView.image = image
                    self?.card1ImageView.image = image
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}
