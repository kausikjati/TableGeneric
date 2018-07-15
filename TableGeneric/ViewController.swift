//
//  ViewController.swift
//  TableGeneric
//
//  Created by Kausik Jati on 15/07/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView : UITableView = {
        let tav = UITableView()
        tav.translatesAutoresizingMaskIntoConstraints = false
        tav.register(CellClass: UITableViewCell.self)
        //tav.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tav.delegate = self
        tav.dataSource = self
        tav.tableFooterView = UIView()
        return tav
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5000
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(type: UITableViewCell.self, for: indexPath)
        //let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Generic"
        return cell
    }
    
}

