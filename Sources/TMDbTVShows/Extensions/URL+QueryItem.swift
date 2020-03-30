//
//  URL+QueryItem.swift
//  TMDbTVShows
//
//  Created by Adam Young on 16/03/2020.
//

import Foundation

extension URL {

  func appendingQueryItem(name: String, value: String) -> Self {
    var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)!
    var queryItems = urlComponents.queryItems ?? []
    queryItems.append(URLQueryItem(name: name, value: value))
    urlComponents.queryItems = queryItems
    return urlComponents.url!
  }

  func appendingQueryItem(name: String, value: Int) -> Self {
    appendingQueryItem(name: name, value: "\(value)")
  }

}

extension URL {

  func appendingPageQueryItem(_ page: Int?) -> Self {
    guard let page = page else {
      return self
    }

    return appendingQueryItem(name: "page", value: page <= 1000 ? page : 1000)
  }

  func appendingFirstAirDateYearQueryItem(_ year: Int?) -> Self {
    guard let year = year else {
      return self
    }

    return appendingQueryItem(name: "first_air_date_year", value: year)
  }

}