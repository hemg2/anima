//
//  DetailViewController.swift
//  anime
//
//  Created by 1 on 2022/05/23.
//
import Nuke
import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imegaView: UIImageView!
    @IBOutlet weak var taitel: UILabel!
    @IBOutlet weak var stoye: UILabel!
    
    var animeModle : AnimeData?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taitel.text = animeModle?.attributes.canonicalTitle
        stoye.text = animeModle?.attributes.synopsis
        // 이미지 를 할때는 가드렛 아닌 이프렛 url이 옵셔널이라서 스트링으로 변경한다 변수 선언해서  URL-스트링url
        if let url = animeModle?.attributes.coverImage?.large,
           let imageurl = URL(string: url) {
    
        Nuke.loadImage(with:imageurl, into: imegaView)
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

}
