//
//  MovieListViewController.swift
//  MyTableView
//
//  Created by Naga Rajitha Bhogadi on 5/27/26.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var movieTable: UITableView!

    var movieList: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        movieList = getMovieList()
        movieTable.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as? MovieCell
        movieTable.rowHeight = 225
        movieTable.estimatedRowHeight = 225
        

        let movie = movieList[indexPath.row]
    
        cell?.MovieLable.text = movie.name
        cell?.descriptionLabel.text = movie.description
        cell?.yearLabel.text = movie.year
        cell?.ratingLabel.text = movie.rating
        cell?.genre1Label.text = movie.genre1
        cell?.genre2Label.text = movie.genre2
        cell?.movieImage.image = UIImage(systemName: movie.movieImage)
         
        
        
        // different colors based on genre
        if movie.genre1 == "Sci-Fi" {
            cell?.genre1Label.backgroundColor = .darkGray
        } else if movie.genre1 == "Drama" {
            cell?.genre1Label.backgroundColor = .lightGray
        } else if movie.genre1 == "Action" {
            cell?.genre1Label.backgroundColor = .lightGray
        } else {
            cell?.genre1Label.backgroundColor = .gray    }
        if movie.genre2 == "Thriller" {
            cell?.genre2Label.backgroundColor = .lightGray
        } else if movie.genre2 == "Drama" {
            cell?.genre2Label.backgroundColor = .lightGray
        } else if movie.genre2 == "Music" {
            cell?.genre2Label.backgroundColor = .gray
        } else {
            cell?.genre2Label.backgroundColor = .darkGray
        }
        
        /*if movie.name == "RRR" {
            cell?.movieImage.backgroundColor = UIColor(red: 0.50, green: 0.50, blue: 0.50, alpha: 0.50)
            cell?.movieImage.backgroundColor = .lightGray
        } else if movie.name == "Baahubali" {
            cell?.movieImage.backgroundColor = UIColor(red: 0.90, green: 0.88, blue: 1.00, alpha: 1.00)
            cell?.movieImage.backgroundColor = .brown
        } else if movie.name == "Pushpa" {
            cell?.movieImage.backgroundColor = UIColor(red: 1.00, green: 0.88, blue: 0.98, alpha: 0.97)
            cell?.movieImage.backgroundColor = .systemGray
        } else if movie.name == "Kalki" {
            cell?.movieImage.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.00)
            cell?.movieImage.backgroundColor = .cyan
           
        }*/
        
        
        return cell ?? UITableViewCell()
    }
}


extension MovieListViewController {

    func getMovieList() -> [Movie] {

        var movieList: [Movie] = []

        let movie1 = Movie(name: "RRR", id: 1, description: "Action drama movie",year: "2022",rating: "5",genre1: "Sci-Fi",genre2: "Thriller",movieImage:"film")
        let movie2 = Movie(name: "Baahubali", id: 2, description: "Historical action movie",year: "2021",rating: "4",genre1: "Adventure",genre2: "Drama", movieImage:"film")
        let movie3 = Movie(name: "Pushpa", id: 3, description: "Action thriller movie",year: "2020",rating: "4", genre1: "Action",genre2: "Drama", movieImage:"film")
        let movie4 = Movie(name: "Kalki", id: 4, description: "Science fiction movie",year: "2024",rating: "3",genre1: "Adventure",genre2: "Drama",movieImage:"film")
        

        movieList.append(movie1)
        movieList.append(movie2)
        movieList.append(movie3)
        movieList.append(movie4)
        movieList.append(movie1)
        movieList.append(movie2)
        movieList.append(movie3)
        movieList.append(movie4)

        return movieList
    }
}
