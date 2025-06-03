//
//  TvingModel.swift
//  week7
//
//  Created by 조휘원 on 6/3/25.
//

import UIKit

struct TodayTving {
    let image: UIImage
    let number: Int
}

extension TodayTving {
    static func dummy() -> [TodayTving] {
        return [
            TodayTving(image: UIImage(resource: .image124), number: 1),
            TodayTving(image: UIImage(resource: .image13), number: 2),
            TodayTving(image: UIImage(resource: .movie1), number: 3),
            TodayTving(image: UIImage(resource: .movie2), number: 4),
            TodayTving(image: UIImage(resource: .movie3), number: 5),
            TodayTving(image: UIImage(resource: .movie4), number: 6),
            TodayTving(image: UIImage(resource: .movie5), number: 7),
        ]
    }
}

struct LivePopularLive {
    let image: UIImage
    let number: Int
    let title: String
    let episode: String
    let viewRate: String
}

extension LivePopularLive {
    static func dummy() -> [LivePopularLive] {
        return [
            LivePopularLive(
                image: UIImage(resource: .image11),
                number: 1,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
            LivePopularLive(
                image: UIImage(resource: .image12),
                number: 2,
                title: "뿅뿅지구오락실",
                episode: "14화",
                viewRate: "24.1%"
            ),
            LivePopularLive(
                image: UIImage(resource: .image58),
                number: 3,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
            LivePopularLive(
                image: UIImage(resource: .image116),
                number: 4,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
            LivePopularLive(
                image: UIImage(resource: .image117),
                number: 5,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
            LivePopularLive(
                image: UIImage(resource: .image122),
                number: 6,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
        ]
    }
}

struct LivePopularMovie {
    let image: UIImage
}

extension LivePopularMovie {
    static func dummy() -> [LivePopularMovie] {
        return [
            LivePopularMovie(image: UIImage(resource: .image115)),
            LivePopularMovie(image: UIImage(resource: .image124)),
            LivePopularMovie(image: UIImage(resource: .image13)),
            LivePopularMovie(image: UIImage(resource: .movie1)),
            LivePopularMovie(image: UIImage(resource: .movie2)),
            LivePopularMovie(image: UIImage(resource: .movie3)),
            LivePopularMovie(image: UIImage(resource: .movie4)),
        ]
    }
}

struct BaseBall {
    let image: UIImage
}

extension BaseBall {
    static func dummy() -> [BaseBall] {
        return [
            BaseBall(image: UIImage(resource: .image144)),
            BaseBall(image: UIImage(resource: .image145)),
            BaseBall(image: UIImage(resource: .image146)),
            BaseBall(image: UIImage(resource: .image147)),
            BaseBall(image: UIImage(resource: .image148)),
            BaseBall(image: UIImage(resource: .image149)),
            BaseBall(image: UIImage(resource: .image150)),
        ]
    }
}

struct Advertisement {
    let image: UIImage
}

extension Advertisement {
    static func dummy() -> [Advertisement] {
        return [
            Advertisement(image: UIImage(resource: .image87)),
            Advertisement(image: UIImage(resource: .image88)),
            Advertisement(image: UIImage(resource: .image90)),
            Advertisement(image: UIImage(resource: .image92)),
            Advertisement(image: UIImage(resource: .image94)),
        ]
    }
}

struct KKHLife {
    let image: UIImage
}

extension KKHLife {
    static func dummy() -> [KKHLife] {
        return [
            KKHLife(image: UIImage(resource: .image116)),
            KKHLife(image: UIImage(resource: .image117)),
            KKHLife(image: UIImage(resource: .image12)),
            KKHLife(image: UIImage(resource: .image122)),
            KKHLife(image: UIImage(resource: .image58)),
        ]
    }
}
