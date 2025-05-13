//
//  PeopleListReponse.swift
//  assignment
//
//  Created by 조휘원 on 5/13/25.
//

struct PeopleListResponse: Codable {
    let peopleListResult: PeopleListResult
}

struct PeopleListResult: Codable {
    let totCnt: Int
    let peopleList: [Person]
    let source: String
}

struct Person: Codable {
    let peopleCd: String
    let peopleNm: String
    let peopleNmEn: String
    let repRoleNm: String
    let filmoNames: String
}
