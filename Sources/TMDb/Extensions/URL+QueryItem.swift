//
//  URL+QueryItem.swift
//  TMDb
//
//  Created by Adam Young on 21/01/2020.
//

import Foundation

extension URL {

  func appendingQueryItem(name: String, value: CustomStringConvertible) -> Self {
    var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false)!
    var queryItems = urlComponents.queryItems ?? []
    queryItems.append(URLQueryItem(name: name, value: value.description))
    urlComponents.queryItems = queryItems
    return urlComponents.url!
  }

}

extension URL {

  func appendingAPIKey(_ apiKey: String) -> Self {
    appendingQueryItem(name: "api_key", value: apiKey)
  }

  func appendingPage(_ page: Int?) -> Self {
    guard let page = page else {
      return self
    }

    return appendingQueryItem(name: "page", value: page <= 1000 ? page : 1000)
  }

  func appendingFirstAirDateYear(_ year: Int?) -> Self {
    guard let year = year else {
      return self
    }

    return appendingQueryItem(name: "first_air_date_year", value: year)
  }

  func appendingYear(_ year: Int?) -> Self {
    guard let year = year else {
      return self
    }

    return appendingQueryItem(name: "year", value: year)
  }

}
