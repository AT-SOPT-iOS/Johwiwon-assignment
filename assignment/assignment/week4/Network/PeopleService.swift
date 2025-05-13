//
//  PeopleService.swift
//  assignment
//
//  Created by 조휘원 on 5/13/25.
//

import Foundation

final class PeopleService {
    static let shared = PeopleService()
    private init() {}

    func fetchPeopleList(apiKey: String, name: String?) async throws -> [Person]
    {
        var queryItems = [URLQueryItem(name: "key", value: apiKey)]
        if let name, !name.isEmpty {
            queryItems.append(URLQueryItem(name: "peopleNm", value: name))
        }

        guard
            let request = RequestBuilder.makeRequest(
                path: "/people/searchPeopleList.json",
                method: .GET,
                queryItems: queryItems
            )
        else {
            throw NetworkError.requestEncodingError
        }

        let response: PeopleListResponse = try await NetworkManager.shared
            .request(
                request,
                decodeType: PeopleListResponse.self
            )

        return response.peopleListResult.peopleList
    }
}
