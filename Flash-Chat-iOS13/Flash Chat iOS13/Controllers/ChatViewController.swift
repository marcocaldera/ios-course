//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        title = "MarkChat"
        navigationItem.hidesBackButton = true
        
        loadMessages()
        
    }
    
    func loadMessages() {
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener() { querySnapshot, error in
                if let e = error {
                    print("Error: ", e)
                } else {
                    //                querySnapshot?.documents[0].data()[K.FStore.senderField]
                    
                    if let snapshotDocuments = querySnapshot?.documents {
                        
                        self.messages = []
                        
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            
                            if let sender = data[K.FStore.senderField] as? String, let body = data[K.FStore.bodyField] as? String {
                                
                                self.messages.append(
                                    Message(sender: sender,
                                            body: body)
                                )
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                                }
                                
                                
                            }
                            
                            
                        }
                        
                    }
                    
                }
            }
        
        //        messages = []
        //        db.collection(K.FStore.collectionName).getDocuments { querySnapshot, error in
        //            if let e = error {
        //                print("Error: ", e)
        //            } else {
        //                //                querySnapshot?.documents[0].data()[K.FStore.senderField]
        //
        //                if let snapshotDocuments = querySnapshot?.documents {
        //
        //                    for doc in snapshotDocuments {
        //                        let data = doc.data()
        //
        //                        if let sender = data[K.FStore.senderField] as? String, let body = data[K.FStore.bodyField] as? String {
        //
        //                            self.messages.append(
        //                                Message(sender: sender,
        //                                        body: body)
        //                            )
        //
        //                            DispatchQueue.main.async {
        //                                self.tableView.reloadData()
        //                            }
        //
        //
        //                        }
        //
        //
        //                    }
        //
        //                }
        //
        //            }
        //        }
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextfield.text, let sender = Auth.auth().currentUser?.email {
            
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: sender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date()
            ]) { error in
                
                if let e = error {
                    print("Error: ", e)
                } else {
                    
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                    
                    
                    
                    print("Saving succesfully")
                }
                
            }
            
        }
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error: ", signOutError)
        }
        
    }
    
}


extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        
        cell.label.text = messages[indexPath.row].body
        
        return cell
    }
    
}

extension ChatViewController: UITableViewDelegate {
    
    // Currently "selection disabled" from storyboard
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
