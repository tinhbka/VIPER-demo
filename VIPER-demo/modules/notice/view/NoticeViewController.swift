//
//  NoticeViewController.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    var presenter: ViewToPresenterProtocol?

    private var notices: [Notice] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        getData()
    }

    private func getData() {
        presenter?.startFetchingNotice()
        view.showProgressIndicator()
    }

    private func configureViews() {
        self.title = "Notice-Module"
        self.tableView.tableFooterView = UIView()
    }

}

extension NoticeViewController: PresenterToViewProtocol{

    func showNotice(notices: [Notice]) {
        self.notices = notices
        self.tableView.reloadData()
        self.view.hideProgressIndicator()
    }

    func showError() {

        self.view.hideProgressIndicator()
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }

}

extension NoticeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notices.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoticeTableViewCell

        cell.configure(notices[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.showMovieController(navigationController: navigationController!)

    }


}
