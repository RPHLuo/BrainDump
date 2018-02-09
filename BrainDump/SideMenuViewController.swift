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
  let statistics = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isTranslucent = false
    navigationController?.navigationBar.barTintColor = UIColor(red: 0.2, green: 0.25, blue: 0.7, alpha: 1)
    
    home.setTitle("Home", for: .normal)
    home.setTitleColor(UIColor(red: 0.15, green: 0.2, blue: 0.4, alpha: 1), for: .normal)
    tasks.setTitle("Tasks", for: .normal)
    tasks.setTitleColor(UIColor(red: 0.15, green: 0.2, blue: 0.4, alpha: 1), for: .normal)
    statistics.setTitle("Statistics", for: .normal)
    statistics.setTitleColor(UIColor(red: 0.15, green: 0.2, blue: 0.4, alpha: 1), for: .normal)
    
    home.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
    tasks.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
    statistics.backgroundColor = UIColor(red: 0.5, green: 0.6, blue: 1, alpha: 1)
    
    view.addSubview(home)
    view.addSubview(tasks)
    view.addSubview(statistics)
    
    home.translatesAutoresizingMaskIntoConstraints = false
    tasks.translatesAutoresizingMaskIntoConstraints = false
    statistics.translatesAutoresizingMaskIntoConstraints = false
    
    home.addTarget(self, action: #selector(changeView(_:)), for: .touchUpInside)
    tasks.addTarget(self, action: #selector(changeView(_:)), for: .touchUpInside)
    statistics.addTarget(self, action: #selector(changeView(_:)), for: .touchUpInside)
    
    NSLayoutConstraint.activate([
      home.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 24),
      home.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      home.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1),
      home.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
      tasks.topAnchor.constraint(equalTo: home.bottomAnchor, constant: 12),
      tasks.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      tasks.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1),
      tasks.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8),
      statistics.topAnchor.constraint(equalTo: tasks.bottomAnchor, constant: 12),
      statistics.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
      statistics.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.1),
      statistics.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.8)
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
    case "Statistics":
      dismiss(animated: true, completion: {() in
        if self.self.viewControllers[2] != self.currentViewController {
          self.currentViewController.navigationController?.setViewControllers([self.viewControllers[2]], animated: false)
          self.currentViewController = self.viewControllers[2]
        }
      })
      break
    default: break
    }
    
  }
  
}
