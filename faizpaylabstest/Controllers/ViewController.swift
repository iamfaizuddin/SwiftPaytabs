//
//  ViewController.swift
//  faizpaylabstest
//
//  Created by Faiz on 20/06/20.
//  Copyright © 2020 Faiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var initialSetupViewController: PTFWInitialSetupViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Function to handle Click event for checkout button //
    @IBAction func btnCheckoutClicked(_ sender: Any) {
        let bundle = Bundle(url: Bundle.main.url(forResource: "Resources", withExtension: "bundle")!)
        self.initialSetupViewController = PTFWInitialSetupViewController.init(
            bundle: bundle,
            andWithViewFrame: self.view.frame,
            andWithAmount: 5.0,
            andWithCustomerTitle: "PayTabs Sample App",
            andWithCurrencyCode: "USD",
            andWithTaxAmount: 0.0,
            andWithSDKLanguage: "en",
            andWithShippingAddress: "Manama",
            andWithShippingCity: "Manama",
            andWithShippingCountry: "BHR",
            andWithShippingState: "Manama",
            andWithShippingZIPCode: "123456",
            andWithBillingAddress: "Manama",
            andWithBillingCity: "Manama",
            andWithBillingCountry: "BHR",
            andWithBillingState: "Manama",
            andWithBillingZIPCode: "12345",
            andWithOrderID: "12345",
            andWithPhoneNumber: "0097333109781",
            andWithCustomerEmail: "rhegazy@paytabs.com",
            andIsTokenization:false,
            andIsPreAuth: false,
            andWithMerchantEmail: "iamfaizuddin@gmail.com",
            andWithMerchantSecretKey: "tfMdqLELHiRylagnmHP22ri7SjrBJSid75qxQ5jxob6Jmn6I4WK7o3ehnGT7zbkGgLe7QxFeJLY595Nd2ylqBAIZgB6PNrw4cKb3",
            andWithAssigneeCode: "SDK",
            andWithThemeColor:UIColor.red,
            andIsThemeColorLight: false)


        self.initialSetupViewController.didReceiveBackButtonCallback = {

        }

        self.initialSetupViewController.didStartPreparePaymentPage = {
            // Start Prepare Payment Page
            // Show loading indicator
        }
        self.initialSetupViewController.didFinishPreparePaymentPage = {
            // Finish Prepare Payment Page
            // Stop loading indicator
        }

        self.initialSetupViewController.didReceiveFinishTransactionCallback = {(responseCode, result, transactionID, tokenizedCustomerEmail, tokenizedCustomerPassword, token, transactionState) in
            print("Response Code: \(responseCode)")
            print("Response Result: \(result)")

            // In Case you are using tokenization
            print("Tokenization Cutomer Email: \(tokenizedCustomerEmail)");
            print("Tokenization Customer Password: \(tokenizedCustomerPassword)");
            print("TOkenization Token: \(token)");

            // Navigating to Result Controller
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            if let resultController = storyBoard.instantiateViewController(withIdentifier: "ResultController") as? ResultController{
                resultController.responseCode = Int(responseCode)
                resultController.result = result
                self.present(resultController, animated:true, completion:nil)
            }
        }

        self.view.addSubview(initialSetupViewController.view)
        self.addChild(initialSetupViewController)

        initialSetupViewController.didMove(toParent: self)
    }
}

