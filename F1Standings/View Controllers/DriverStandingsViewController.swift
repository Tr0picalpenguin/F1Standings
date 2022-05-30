//
//  DriverStandingsViewController.swift
//  F1Standings
//
//  Created by Scott Cox on 5/30/22.
//

import UIKit

class DriverStandingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var driverStandings: DriverStandings? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        F1NetworkService().fetchDriversStandings { driverStandings in
            guard let driverStandings = driverStandings else {
                return
            }
            self.driverStandings = driverStandings
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

} // End of class

extension DriverStandingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return driverStandings?.drivers.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DriverTableViewCell") as? DriverTableViewCell,
            let driver = driverStandings?.drivers[indexPath.row] else {
            return UITableViewCell()
        }
        cell.setViews(with: driver)
        return cell
    }
    
}
