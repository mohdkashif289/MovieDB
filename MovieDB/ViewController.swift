//
//  ViewController.swift
//  MovieDB
//
//  Created by Mohit Jethwa on 08/03/22.
//

import UIKit

class ViewController: UIViewController {

    let movieListViewModel = MovieListViewModel()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        movieListViewModel.delegate = self
        movieListViewModel.getMovies()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.register(MovieListCell.self, forCellReuseIdentifier: "cell")
        
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movieListViewModel.responseModel?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MovieListCell
        if let title = movieListViewModel.responseModel?.results?[indexPath.row].title,
           let des = movieListViewModel.responseModel?.results?[indexPath.row].overview,
           let banner = movieListViewModel.responseModel?.results?[indexPath.row].poster_path {
            
            cell?.setupWithData(title: title, des: des, banner: banner)
        }
        return cell ?? UITableViewCell()
        
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: MovieListViewModelDeletgate {
    func updateSuccess() {
        tableView.reloadData()
    }
    
    func updateFailure() {

    }
}

