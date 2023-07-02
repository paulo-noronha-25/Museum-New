//
//  ReservationRequestViewController.swift
//  MuseumAPP
//
//  Created by Paulo Rodrigo Noronha Orozco on 1/06/23.
//

import UIKit
import MessageUI

class ReservationRequestViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
              let email = emailTextField.text,
              let message = messageTextView.text else {
            return
        }
        simulateCallToPhoneNumber(name)
       
        if MFMailComposeViewController.canSendMail() {
            let mailComposer = MFMailComposeViewController()
            mailComposer.mailComposeDelegate = self
            mailComposer.setToRecipients(["noronha_paulo@hotmail.com"])
            mailComposer.setSubject("Reservation Request")
            
            let body = "Name: \(name)\nEmail: \(email)\n\n\(message)"
            mailComposer.setMessageBody(body, isHTML: false)
            
            present(mailComposer, animated: true, completion: nil)
        } else {
            // Show error message or handle when the device cannot send emails
            print("Device cannot send emails")
        }
    }
    
    func simulateCallToPhoneNumber(_ phoneNumber: String) {
        let alert = UIAlertController(title: "Correo enviado", message: "Tu correo fue enviado,\(phoneNumber)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - MFMailComposeViewControllerDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
        // Handle the result of the email sending process if needed
        switch result {
        case .cancelled:
            print("Email composition cancelled")
        case .saved:
            print("Email saved as draft")
        case .sent:
            print("Email sent successfully")
        case .failed:
            print("Email sending failed")
        @unknown default:
            print("Unknown result")
        }
    }
}

