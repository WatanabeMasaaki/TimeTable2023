//
//  LinkData.swift
//  Timetable2023
//
//  Created by 渡邉雅晃 on 2023/04/20.
//

import Foundation

struct SubjectData: Codable {
    var id: Int
    var subject: String
    var lmsUrl: URL
    var syllabusUrl: URL
}

struct TableData: Codable {
    var day: String
    var dayJP: String
    var dayl: String
    var dayJPl: String
    var sub: [Int]
}

extension Bundle {
    func getData<T:Decodable>(_ filename: String) -> T {
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("ファイルが見つかりませんでした")
        }

        guard let data = try? Data(contentsOf: file) else {
            fatalError("ファイル読み込みエラー")
        }
     
        let decoder = JSONDecoder()
        guard let linkDatas = try? decoder.decode(T.self, from: data) else {
            fatalError("JSON読み込みエラー")
        }
        
        return linkDatas
        
    }
}
