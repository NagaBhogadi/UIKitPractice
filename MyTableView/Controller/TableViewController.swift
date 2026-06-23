//
//  TableViewController.swift
//  MyTableView
//
//  Created by Naga Rajitha Bhogadi on 5/26/26.
//
import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.dataSource = self
        TableView.delegate = self
    }
}

// MARK: - TableView DataSource

extension TableViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)

        cell.textLabel?.text = "Row: \(indexPath.row) Section: \(indexPath.section)"

        return cell
    }
}

// MARK: - TableView Delegate

extension TableViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let alert = UIAlertController(
            title: "Enter Data",
            message: "Type data for Row \(indexPath.row), Section \(indexPath.section)",
            preferredStyle: .alert
        )

        alert.addTextField { textField in
            textField.placeholder = "Enter your data"
        }

        let sendAction = UIAlertAction(title: "Send", style: .default) { _ in

            let typedText = alert.textFields?.first?.text ?? ""

            if typedText.isEmpty {
                print("No data entered")
                return
            }

            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            let detailVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

            detailVC.selectedData = typedText

            self.navigationController?.pushViewController(detailVC, animated: true)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alert.addAction(sendAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView()
        headerView.backgroundColor = .black

        let sectionTitleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 300, height: 40))
        sectionTitleLabel.text = "Your section name is \(section)"
        sectionTitleLabel.textColor = .white
        sectionTitleLabel.backgroundColor = .green

        headerView.addSubview(sectionTitleLabel)

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
