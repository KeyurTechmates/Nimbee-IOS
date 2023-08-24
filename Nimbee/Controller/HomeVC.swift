//
//  HomeVC.swift
//  Nimbee
//
//  Created by iMac on 28/07/23.
//

import UIKit

class HomeVC: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var lblUserName: UILabel!
    
    @IBOutlet weak var vwCheapestCharge: UIView! {
        didSet {
            vwCheapestCharge.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var vwNewCharge: UIView! {
        didSet {
            vwNewCharge.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var vwEmergency: UIView! {
        didSet {
            vwEmergency.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var btnNewCharge: UIButton!
    @IBOutlet weak var mergency: UIButton!
    
    //MARK: - Variable
    
    //MARK: - ViewLifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
    // MARK: - IB Action
    
    @IBAction func btnLoctionClick(_ sender: UIButton) {
    }
    
    @IBAction func btnNewChargeClick(_ sender: UIButton) {
        let nextvc: CalanderVC = storyboard?.instantiateViewController(identifier: "CalanderVC") as! CalanderVC
        self.navigationController?.pushViewController(nextvc, animated: true)
        
    }
    
    @IBAction func vwEmergency(_ sender: UIButton) {
    }
    
}
