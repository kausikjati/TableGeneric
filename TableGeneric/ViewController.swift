//
//  ViewController.swift
//  TableGeneric
//
//  Created by Kausik Jati on 15/07/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewModel: ControllerModel!
    lazy var tutorialTable : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CellClass: UITableViewCell.self)
        table.dataSource = self
        table.delegate = self
        table.tableFooterView = UIView()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModel.getDat()
        viewModel.callBack = {
            self.tutorialTable.reloadData()
        }
        view.addSubview(tutorialTable)
        tutorialTable.fill(view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfrow(section)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: UITableViewCell.self, for: indexPath)
        let tutorial = viewModel.getItem(indexPath)
        cell.textLabel?.text = tutorial.name
        cell.detailTextLabel?.text = tutorial.link
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tutorial = viewModel.getItem(indexPath)
        tutorial.name = "You Selected"
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
}

extension UIView {
    
    func fill(_ view : UIView) {
        leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

