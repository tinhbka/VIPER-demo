//
//  MovieViewController.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var presenter: ViewToPresenterMovieProtocol?

    private var movies: [Movie] = [] {
        didSet {
            tableView.reloadData()
            view.hideProgressIndicator()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        getData()


    }

    private func getData() {
        presenter?.startFetchingMovie()
        view.showProgressIndicator()
    }

    private func configureViews() {
        self.title = "Movie-Module"
        self.tableView.tableFooterView = UIView()
    }

}

extension MovieViewController:PresenterToViewMovieProtocol{

    func onMovieResponseSuccess(movies: [Movie]) {
        self.movies = movies
    }

    func onMovieResponseFailed(error: String) {

        view.hideProgressIndicator()
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
}

extension MovieViewController:UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell
        cell.configure(movies[indexPath.row])

        return cell
    }

}
