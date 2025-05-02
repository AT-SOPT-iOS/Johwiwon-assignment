//
//  HomeSection.swift
//  assignment
//
//  Created by 조휘원 on 5/2/25.
//

enum HomeSection: Int, CaseIterable {
    case banner
    case todayTving
    case livePopularLive
    case livePopularMovie

    var title: String {
        switch self {
        case .banner: return ""
        case .todayTving: return "오늘의 티빙 Top 20"
        case .livePopularLive: return "실시간 인기 LIVE"
        case .livePopularMovie: return "실시간 인기 영화"
        }
    }
}
