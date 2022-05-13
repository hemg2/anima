//
//  MainViewController.swift
//  anime
//
//  Created by 1 on 2022/05/13.
// 오타좀 봐라 박현중
// 오타 봐라

import UIKit
import Nuke

class MainViewController: UIViewController {
    let animeTitles: [String] = ["전생슬", "그랑죠", "원피스", "소아온", "귀칼", "나루토", "나의 히어로 아카데미"]
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimeTrendingTableViewCell", for: indexPath) as? AnimeTrendingTableViewCell, let url = URL(string: "https://picsum.photos/200/30\(indexPath.row)") else { return UITableViewCell() }
        
        Nuke.loadImage(with: url, into: cell.animePosterImage)
                      
        
        cell.animeTitleLabel.text = animeTitles[indexPath.row]
        //row 의 의미?? 순서?
        cell.animeSynopsisLable.text = "설명입니다."
        return cell
    }
}
