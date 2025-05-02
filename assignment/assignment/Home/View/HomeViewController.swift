//
//  HomeViewController.swift
//  assignment
//
//  Created by 조휘원 on 5/1/25.
//

import SnapKit
import UIKit

class HomeViewController: UIViewController {

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    private let sections: [String] = ["오늘의 티빙 Top 20", "TV 프로그램", "영화"]

    private let todayTvingItems: [TodayTving] = TodayTving.dummy()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            TodayTvingSectionCell.self,
            forCellWithReuseIdentifier: "TodayTvingSectionCell"
        )

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout,
    UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1  // ✅ 오직 오늘의 티빙 섹션만 표시
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "TodayTvingSectionCell",
                for: indexPath
            ) as? TodayTvingSectionCell
        else {
            assertionFailure("❌ TodayTvingSectionCell dequeue 실패")
            return UICollectionViewCell()
        }
        cell.configure(with: todayTvingItems)
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: view.frame.width, height: 220)
    }
}
