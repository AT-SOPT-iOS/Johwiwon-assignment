//
//  HomeViewController.swift
//  assignment
//
//  Created by 조휘원 on 5/1/25.
//

// MARK: - HomeViewController

import SnapKit
import UIKit

class HomeViewController: UIViewController {

    private let headerView = HomeHeaderView()

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    private let todayTvingItems: [TodayTving] = TodayTving.dummy()
    private let livePopularLiveItems: [LivePopularLive] =
        LivePopularLive.dummy()
    private let livePopularMovieItems: [LivePopularMovie] =
        LivePopularMovie.dummy()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
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
            forCellWithReuseIdentifier: TodayTvingSectionCell.identifier
        )

        collectionView.register(
            LivePopularLiveSectionCell.self,
            forCellWithReuseIdentifier: LivePopularLiveSectionCell.identifier
        )

        collectionView.register(
            LivePopularMovieSectionCell.self,
            forCellWithReuseIdentifier: LivePopularMovieSectionCell.identifier
        )

        collectionView.register(
            MainBannerSectionCell.self,
            forCellWithReuseIdentifier: MainBannerSectionCell.identifier
        )

        [headerView, collectionView].forEach {
            view.addSubview($0)
        }
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(142)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

}

extension HomeViewController: UICollectionViewDelegateFlowLayout,
    UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSection.allCases.count
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
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        switch section {
        case .banner:
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: MainBannerSectionCell.identifier,
                    for: indexPath
                ) as? MainBannerSectionCell
            else {
                return UICollectionViewCell()
            }
            return cell
        case .todayTving:
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: TodayTvingSectionCell.identifier,
                    for: indexPath
                ) as? TodayTvingSectionCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: todayTvingItems)
            return cell

        case .livePopularLive:
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: LivePopularLiveSectionCell.identifier,
                    for: indexPath
                ) as? LivePopularLiveSectionCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: livePopularLiveItems)
            return cell
        case .livePopularMovie:
            guard
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: LivePopularMovieSectionCell.identifier,
                    for: indexPath
                ) as? LivePopularMovieSectionCell
            else {
                return UICollectionViewCell()
            }
            cell.configure(with: livePopularMovieItems)
            return cell
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return .zero
        }

        switch section {
        case .banner:
            return CGSize(width: view.frame.width, height: 400)
        case .todayTving:
            return CGSize(width: view.frame.width, height: 220)
        case .livePopularLive:
            return CGSize(width: view.frame.width, height: 220)
        case .livePopularMovie:
            return CGSize(width: view.frame.width, height: 220)

        }
    }
}
