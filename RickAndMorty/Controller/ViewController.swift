//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Leonid Shchipkov on 14.04.2022.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var identifier = "mainCell"
    var results: [Results] = []
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...42 {
            NetworkDataFetcher.shared.fetchHeroes(urlString: "https://rickandmortyapi.com/api/character/?page=\(i)") {[weak self] (result:Results?) in
                guard let result = result else {
                    return
                }
                self?.results.append(result)
                self?.mainTableView.reloadData()
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0...40:
            return 20
        case 41:
            return 6
        default:
            break
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as?  CustomTableViewCell {
            if indexPath.section != 42 {
                let hero = results[indexPath.section].heroes[indexPath.row]
                cell.nameLabel.text = hero.name
                cell.genderLabel.text = hero.gender
                cell.speciesLabel.text = hero.species
                cell.avatarImageView.layer.cornerRadius = 15
                cell.avatarImageView.sd_setImage(with: URL(string: hero.image))
                return cell
            } 
        }
        return UITableViewCell()
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(identifier: "detailVC") as? DetailViewController {
            detailVC.idHero = results[indexPath.section].heroes[indexPath.row].id
            showDetailViewController(detailVC, sender: nil)
        }
    }
    
}
