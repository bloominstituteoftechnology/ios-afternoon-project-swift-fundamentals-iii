//
//  CurrencyTableViewController.swift
//  CurrencySwap
//
//  Created by Shawn Gee on 2/12/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class CurrencyTableViewController: UITableViewController {
    var currencyCodes = [String]()
    var selectionHandler: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyCodes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = currencyCodes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectionHandler = selectionHandler {
            selectionHandler(currencyCodes[indexPath.row])
        }
        dismiss(animated: true, completion: nil)
    }


}
