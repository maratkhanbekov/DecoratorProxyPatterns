//
//  NewsServiceProxy.swift
//  homeWork_1
//
//  Created by Marat Khanbekov on 11.01.2021.
//  Copyright © 2021 Марат Нургалиев. All rights reserved.
//

import Foundation

protocol NewsServiceInterface {
    func getFeed(startFrom: String, then completion: @escaping ([VkFeed]) -> Void)
}

class NewsServiceProxy: NewsServiceInterface {
    let newsService: NewsAdapter
    
    init(newsService: NewsAdapter) {
        self.newsService = newsService
    }
    
    func getFeed(startFrom: String, then completion: @escaping ([VkFeed]) -> Void) {
        self.newsService.getFeed(startFrom: startFrom, then: completion)
        print("News Service called")
    }
}



