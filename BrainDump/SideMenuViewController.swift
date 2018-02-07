//
//  SideMenuViewController.swift
//  BrainDump
//
//  Created by Robin on 2018-02-05.
//  Copyright © 2018 Robin. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {
  
  var viewControllers = [UIViewController]()
  var currentViewController:UIViewController!
  let home = UIButton()
  let tasks = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    home.setTitle("Home", for: .normal)
    home.setTitleColor(.blue, for: .normal)
    tasks.setTitle("Tasks", for: .normal)
    tasks.setTitleColor(.blue, for: .normal)
    
    home.backgroundColor = .gray
    tasks.backgroundColor = .yellow
    
    view.addSubview(home)
    view.addSubview(tasks)
    
    home.translatesAutoresizingMaskIntoConstraints = false
    tasks.translatesAutoresizingMaskIntoConstraints = false
    
    home.addTarget(self, action: #selector(changeView(_:)), for: .touchUpInside)
    tasks.addTarget(self, action: #selector(changeView(_:)), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      home.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 24),
      home.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      home.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1),
      home.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
      tasks.topAnchor.constraint(equalTo: home.bottomAnchor, constant: 12),
      tasks.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      tasks.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1),
      tasks.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8)
      ])
  }
  
  @objc func changeView(_ sender: UIButton)  {
    guard let text = sender.titleLabel?.text else {
      return
    }
    
    switch text {
      case "Home":
        dismiss(animated: true, completion: {() in
          if self.viewControllers[0] != self.currentViewController {
            self.currentViewController.navigationController?.setViewControllers([self.viewControllers[0]], animated: false)
            self.currentViewController = self.viewControllers[0]
          }
        })
        break
      case "Tasks":
        dismiss(animated: true, completion: {() in
          if self.self.viewControllers[1] != self.currentViewController {
            self.currentViewController.navigationController?.setViewControllers([self.viewControllers[1]], animated: false)
            self.currentViewController = self.viewControllers[1]
          }
        })
        break
      default: break
    }
    
  }
  
}
