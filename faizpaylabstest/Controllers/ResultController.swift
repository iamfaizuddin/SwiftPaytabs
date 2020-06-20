//
//  ResultController.swift
//  faizpaylabstest
//
//  Created by Faiz on 20/06/20.
//  Copyright © 2020 Faiz. All rights reserved.
//

import UIKit

class ResultController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblResponse: UILabel!
    var responseCode : Int = 0
    var result : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if responseCode == 100{
            lblResponse.text = "Successfull"
        }else{
            lblResponse.text = "Failed"
        }
        
        lblResult.text = result
        
    }
}
