//
//  ViewController.swift
//  Oracle
//
//  Created by Lee, Christopher on 11/20/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appTitle: UILabel!
    
    @IBOutlet weak var OracleButton: UIButton!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let boredHelper = BoredHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var info: Bored?{
        didSet{
            update()
        }
    }
    
    func update(){
        OperationQueue.main.addOperation() {
            self.activityIndicator.startAnimating()
            self.infoLabel.text = self.info?.profile?.activity
        }
    }
    
    @IBAction func touchesBegan(_ sender: Any) {
        loadRequest()
    }
    
    func loadRequest() {
        
        boredHelper.fetchAction(for: boredHelper.fmpURL){ result in
            
            switch result {
            case let .Success(bo):
                self.info = bo
                self.update()
            case let .Failure(error):
                self.info = Bored()
               
            }
        }
        
    }
    
    
}

