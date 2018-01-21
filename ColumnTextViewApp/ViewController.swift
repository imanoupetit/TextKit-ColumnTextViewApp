//
//  ViewController.swift
//  ColumnTextViewApp
//
//  Created by Imanou on 21/01/2018.
//  Copyright © 2018 Imanou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customView = ColumnTextView()
        view.addSubview(customView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor).isActive = true
        customView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor).isActive = true
    }
    
}
