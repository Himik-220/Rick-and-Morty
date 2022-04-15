//
//  DetailViewController.swift
//  RickAndMorty
//
//  Created by Leonid Shchipkov on 15.04.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var idHero = 0
    var hero: Heroes?
    
    @IBOutlet weak var detailAvatarImage: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailSpeciesLabel: UILabel!
    @IBOutlet weak var detailGenderLabel: UILabel!
    @IBOutlet weak var detailStatusLabel: UILabel!
    @IBOutlet weak var detailCountEpisodLabel: UILabel!
    @IBOutlet weak var detailLastLocationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailAvatarImage.layer.cornerRadius = 70
        NetworkDataFetcher.shared.fetchHeroes(urlString: "https://rickandmortyapi.com/api/character/\(idHero)") {[weak self] (hero: Heroes?) in
            guard let hero = hero else {
                return
            }
            self?.hero = hero
            self?.detailAvatarImage.sd_setImage(with: URL(string: self?.hero?.image ?? ""))
            self?.detailNameLabel.text = self?.hero!.name
            self?.detailSpeciesLabel.text = self?.hero!.species
            self?.detailGenderLabel.text = self?.hero!.gender
            self?.detailStatusLabel.text = self?.hero!.status
            self?.detailCountEpisodLabel.text = "\(self?.hero!.episode.count ?? 0)"
            self?.detailLastLocationLabel.text = self?.hero!.location.lastLocation
        }
    }
    

}
