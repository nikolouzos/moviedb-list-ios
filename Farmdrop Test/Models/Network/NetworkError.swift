//
//  NetworkError.swift
//  Farmdrop Test
//
//  Created by Nikolaos Rafail Nikolouzos on 29/10/19.
//  Copyright © 2019 Nikolaos Rafail Nikolouzos. All rights reserved.
//

import Foundation

struct NetworkError: Codable {
	var statusCode: Int
	var statusMessage: String
}
