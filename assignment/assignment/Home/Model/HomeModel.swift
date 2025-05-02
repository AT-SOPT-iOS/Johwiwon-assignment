//
//  HomeModel.swift
//  assignment
//
//  Created by 조휘원 on 5/1/25.
//

import UIKit

struct TodayTving {
    let image: UIImage
    let number: Int
}

extension TodayTving {
    static func dummy() -> [TodayTving] {
        return [
            TodayTving(
                image: UIImage(named: "movie1") ?? UIImage(),
                number: 1
            ),
            TodayTving(
                image: UIImage(named: "movie4") ?? UIImage(),
                number: 2
            ),
            TodayTving(image: UIImage(named: "movie1") ?? UIImage(), number: 3),
            TodayTving(image: UIImage(named: "movie2") ?? UIImage(), number: 4),
            TodayTving(image: UIImage(named: "movie3") ?? UIImage(), number: 5),
            TodayTving(image: UIImage(named: "movie4") ?? UIImage(), number: 6),
            TodayTving(image: UIImage(named: "movie5") ?? UIImage(), number: 7),
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
                image: UIImage(named: "image 11") ?? UIImage(),
                number: 1,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
            LivePopularLive(
                image: UIImage(named: "image 12") ?? UIImage(),
                number: 2,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
            LivePopularLive(
                image: UIImage(named: "image 58") ?? UIImage(),
                number: 3,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
            LivePopularLive(
                image: UIImage(named: "image 116") ?? UIImage(),
                number: 4,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
            LivePopularLive(
                image: UIImage(named: "image 117") ?? UIImage(),
                number: 5,
                title: "JTBC",
                episode: "이혼숙려캠프 34화",
                viewRate: "27.2%"
            ),
            LivePopularLive(
                image: UIImage(named: "image 122") ?? UIImage(),
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
            LivePopularMovie(image: UIImage(named: "movie5") ?? UIImage()),
            LivePopularMovie(image: UIImage(named: "movie4") ?? UIImage()),
            LivePopularMovie(image: UIImage(named: "movie1") ?? UIImage()),
            LivePopularMovie(image: UIImage(named: "movie2") ?? UIImage()),
            LivePopularMovie(image: UIImage(named: "movie3") ?? UIImage()),
            LivePopularMovie(image: UIImage(named: "movie4") ?? UIImage()),
            LivePopularMovie(image: UIImage(named: "movie5") ?? UIImage()),
        ]
    }
}
