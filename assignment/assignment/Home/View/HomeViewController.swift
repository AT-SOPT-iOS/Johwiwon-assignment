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

        registerCells()

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func registerCells() {
        [
            TodayTvingSectionCell.self, LivePopularLiveSectionCell.self,
            LivePopularLiveSectionCell.self, MainBannerSectionCell.self,
        ].forEach {
            collectionView.register(
                $0,
                forCellWithReuseIdentifier: $0.identifier
            )
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
            return CGSize(width: view.frame.width, height: 200)
        default:
            return CGSize(width: view.frame.width, height: 220)
        }
    }
}
