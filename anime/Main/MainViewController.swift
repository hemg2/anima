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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        viewController.animeModle = modle?.data[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
        print("😃\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeTrendingTableViewCell", for: indexPath) as? AnimeTrendingTableViewCell,
              let data = modle?.data[indexPath.row],
              let url = URL(string:data.attributes.posterImage.medium) else { return UITableViewCell() }
        //dequeueReusableCell(withIdentifier: "AnimeTrendingTableViewCell"  테이블뷰 에 이름넣었으니깐 그기에 맞게 넣는다
        //아이덴티파이어는 식별자
        
        
        Nuke.loadImage(with: url, into: cell.animePosterImage)
        
        cell.animeTitleLabel.text = data.attributes.canonicalTitle
        cell.animeSynopsisLable.text = data.attributes.synopsis
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let url = modle?.links.next,
            indexPath.row == (modle?.data.count ?? 0) - 1 else { return }
        
        AF.request(url).response { response in
            guard let data = response.data else { return }
            let newmodel = try! JSONDecoder().decode(AnimeModle.self, from: data)
            self.modle?.data.append(contentsOf:newmodel.data)
            self.modle?.links = newmodel.links
            // 기존모델에 새로운 url을 불러온다 링크로 인해서  modle newmodel 추가해서 넣는다
            self.tableView.reloadData()
        
        }
        
    }
}

