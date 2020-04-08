//
//  MovieListVC.swift
//  SeanTableView
//
//  Created by Filip Glavica on 07/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit

class MovieListVC: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(named: "background")
        return tableView
    }()
    
    let indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    private var dataSource = [MovieListView]()
    
    private let networkManager: NetworkManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
    }
    
    init(networkManager: NetworkManager){
        self.networkManager = networkManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

private extension MovieListVC{
    func setupUI(){
        view.addSubview(tableView)
        view.addSubview(indicator)
        setupConstraints()
        setupTableView()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 190
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
    }
    
    func getData(){
//        let movieResponse = MockManager.getMovieListResponse()
        indicator.startAnimating()
        networkManager.getData(from: "https://api.themoviedb.org/3/movie/now_playing") { [unowned self](movieList) in
            self.indicator.stopAnimating()
            if let safeMovieLista = movieList{
                self.dataSource = self.createScreenData(from: safeMovieLista)
                self.tableView.reloadData()
            }else{
                
            }
        }
    }
    
    private func createScreenData(from data: [MovieList]) -> [MovieListView]{
        return data.map { (data) -> MovieListView in
            let year = DateUtils.getYearFromDate(stringDate: data.releaseDate)
            let watched = DatabaseManager.isMovieWatched(with: data.id)
            let favourite = DatabaseManager.isMovieFovurited(with: data.id)
            return MovieListView(id: data.id,
                                 title: data.originalTitle,
                                 description: data.overview,
                                 imageURL: data.posterPath,
                                 year: year,
                                 watched: watched,
                                 favourite: favourite)
        }
    }
}

extension MovieListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = dataSource[indexPath.row]
        guard let cell: MovieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            fatalError("Can't dequeue cell with this identifier")
        }
        cell.configureCell(with: movie)
        cell.delegate = self
        return cell
    }
    
    
}
/*
extension MovieListVC: UserInteraction{
    func watchedMoviePressed(with id: Int) {
        guard let movie = dataSource.enumerated().first(where: { (movie) -> Bool in
            return movie.element.id == id
        }) else {return}
        !movie.element.watched ? DatabaseManager.watchedMovie(with: movie.element.id) : DatabaseManager.removeMovieFromWatched(with: movie.element.id)
        dataSource[movie.offset].watched = !movie.element.watched
        tableView.reloadRows(at: [IndexPath(row: movie.offset, section: 0)], with: .none)
    }
    
    func favouriteMoviePressed(with id: Int) {
        guard let movie = dataSource.enumerated().first(where: { (movie) -> Bool in
            return movie.element.id == id
        }) else {return}
        !movie.element.favourite ? DatabaseManager.favouritedMovie(with: movie.element.id) : DatabaseManager.removeMovieFromFavourite(with: movie.element.id)
        dataSource[movie.offset].favourite = !movie.element.favourite
        tableView.reloadRows(at: [IndexPath(row: movie.offset, section: 0)], with: .none)
    }
}

    
    */

















}
