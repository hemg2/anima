//
//  AnimeModel.swift
//  anime
//
//  Created by 1 on 2022/05/19.
//

import Foundation

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
struct Animalinks: Codable {
    let next: String
}
// 제목및 단원 옆에 나오는 String 이면 추가 object 면 struct로 새로 만들고  변수let 추가
struct AnimeData: Codable {
    let id: String
    let type: String
    let attributes: Animeattributes
}
// 큰단원 그에 맞는 제목 들어가는 라인
struct AnimeModle: Codable {
    var data: [AnimeData]
    var links: Animalinks
}
