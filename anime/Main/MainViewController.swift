//
//  MainViewController.swift
//  anime
//
//  Created by 1 on 2022/05/13.
// 오타좀 봐라 박현중
// 오타 봐라

import UIKit
import Nuke
import Alamofire

struct AnimePosterImage: Codable {
    let tiny: String
    let small: String
    let medium: String
    let large: String
    let original: String
}

struct Animeattributes: Codable {
    let createdAt: String
    let updatedAt: String
    let slug: String
    let synopsis: String
    let canonicalTitle: String
    let posterImage: AnimePosterImage
}

struct AnimeData: Codable {
    let id: String
    let type: String
    let attributes: Animeattributes
}

struct AnimeModle: Codable {
    let data: [AnimeData]
}

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var modle: AnimeModle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AF.request("https://kitsu.io/api/edge/anime").response { response in
            guard let data = response.data else { return }
            let modle = try! JSONDecoder().decode(AnimeModle.self, from: data)
            self.modle = modle
            self.tableView.reloadData()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modle?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeTrendingTableViewCell", for: indexPath) as? AnimeTrendingTableViewCell,
              let data = modle?.data[indexPath.row],
              let url = URL(string:data.attributes.posterImage.medium) else { return UITableViewCell() }
        //dequeueReusableCell(withIdentifier: "AnimeTrendingTableViewCell"  테이블뷰 에 이름넣었으니깐 그기에 맞게 넣는다
        //아이덴티파이어는 식별자
        
        
        Nuke.loadImage(with: url, into: cell.animePosterImage)
        
        cell.animeTitleLabel.text = data.attributes.canonicalTitle
        //row 의 의미?? 순서?
        cell.animeSynopsisLable.text = data.attributes.synopsis
        return cell
    }
}
