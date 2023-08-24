//
//  CalView.swift
//  Nimbee
//
//  Created by iMac on 03/08/23.
//

import Foundation
import UIKit

class TimeDataSource: NSObject, UITableViewDataSource {
    let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows you want to display in the table view
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TVTime
        
        // Get the current time and format it as a string
        let currentTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short // You can change the style as per your requirement
        let formattedTime = dateFormatter.string(from: currentTime)
        
        // Update the cell's label with the formatted time
        cell.textLabel?.text = formattedTime
        
        return cell
    }
}
