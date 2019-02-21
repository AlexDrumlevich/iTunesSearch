//
//  InfoController.swift
//  iTunesSearch
//
//  Created by Друмлевич on 17.02.2019.
//  Copyright © 2019 Alexey Drumlevich. All rights reserved.
//

import UIKit

class InfoController {
    
    static let shared = InfoController()
    
    private init() {}
    
    func fetchInfo(url: URL?, completion: @escaping (Info?) -> Void) {
        guard let url = url else {
            print("Error in \(#function) on \(#line): url = nil")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error in \(#function) on \(#line): can`t read the data")
                completion(nil)
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            guard let info = try? jsonDecoder.decode(Info.self, from: data) else {
                print("Error in \(#function) on \(#line): can't decode the data \(String(data: data, encoding: .utf8) ?? "")")
                completion(nil)
                return
            }
            
            completion(info)
            
            }.resume()
    }
   
    

//    func fetchInfo(url: URL?, completion: @escaping ([TheInfo]) -> Void) {
//        guard let url = url else {
//            print("Error in \(#function) on \(#line): url = nil")
//        //    completion(nil)
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                print("Error in \(#function) on \(#line): can`t read the data")
//            //    completion(nil)
//                return
//            }
//
//            let jsonDecoder = JSONDecoder()
//
//            guard let infos = try? jsonDecoder.decode([TheInfo].self, from: data) else {
//                print("Error in \(#function) on \(#line): can't decode the data \(String(data: data, encoding: .utf8) ?? "")")
//          //      completion(nil)
//                return
//            }
//
//            completion(infos)
//
//            }.resume()
//    }
//
//
func fetchImage(url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url = url else {
            print("Error in \(#function) on \(#line): URL is nil")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("Error in \(#function) on \(#line): can't read the data")
                completion(nil)
                return
            }

            guard let image = UIImage(data: data) else {
                print("Error in \(#function) on \(#line): can't decode the image")
                completion(nil)
                return
            }

            completion(image)

            }.resume()

}
}
