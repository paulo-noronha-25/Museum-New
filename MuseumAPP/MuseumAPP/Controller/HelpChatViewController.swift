//
//  HelpChatViewController.swift
//  MuseumAPP
//
//  Created by Paulo Rodrigo Noronha Orozco on 1/06/23.
//

import UIKit

class HelpChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextField!

    var messages: [Message] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    @IBAction func sendButtonTapped(_ sender: UIButton) {
        guard let messageText = inputTextField.text, !messageText.isEmpty else {
            return
        }

        let userMessage = Message(text: messageText, isUserMessage: true)
        messages.append(userMessage)
        inputTextField.text = ""

        let botResponse = generateBotResponse(for: messageText)
        let botMessage = Message(text: botResponse, isUserMessage: false)
        messages.append(botMessage)

        tableView.reloadData()
        scrollToLastMessage()
    }

    func generateBotResponse(for message: String) -> String {
        let lowercaseMessage = message.lowercased()

        if lowercaseMessage.contains("hello") || lowercaseMessage.contains("hi") {
            return "Hello! How can I assist you today?"
        } else if lowercaseMessage.contains("help") {
            return "Sure, I'm here to help. What do you need assistance with?"
        } else if lowercaseMessage.contains("bye") || lowercaseMessage.contains("goodbye") {
            return "Goodbye! Have a great day!"
        } else {
            return "I'm sorry, but I didn't understand your message. Can you please rephrase or provide more information?"
        }
    }

    func scrollToLastMessage() {
        let lastRowIndex = IndexPath(row: messages.count - 1, section: 0)
        tableView.scrollToRow(at: lastRowIndex, at: .bottom, animated: true)
    }
}

extension HelpChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell", for: indexPath) as! MessageCell
        let message = messages[indexPath.row]
        cell.messageLabel.text = message.text

        if message.isUserMessage {
            cell.messageLabel.textAlignment = .right
            cell.messageLabel.textColor = .blue
        } else {
            cell.messageLabel.textAlignment = .left
            cell.messageLabel.textColor = .black
        }

        return cell
    }
}

struct Message {
    let text: String
    let isUserMessage: Bool
}

class MessageCell: UITableViewCell {
    @IBOutlet weak var messageLabel: UILabel!
}
