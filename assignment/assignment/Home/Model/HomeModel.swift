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
                image: UIImage(named: "image13") ?? UIImage(),
                number: 1
            ),
            TodayTving(
                image: UIImage(named: "image115") ?? UIImage(),
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
