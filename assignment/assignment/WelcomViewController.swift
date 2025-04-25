//
//  ViewController.swift
//  assignment
//
//  Created by 조휘원 on 4/16/25.
//

import SnapKit
import UIKit

protocol WelcomViewControllerDelegate: AnyObject {
    func didLoginWithEmail(email: String)
}

class WelcomViewController: UIViewController {

    // MARK: - Properties

    weak var delegate: WelcomViewControllerDelegate?
    var email: String?

    private let welcomeMessageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .tv_white
        label.numberOfLines = 0
        return label
    }()

    private let welcomImage: UIImageView = {
        let welcomImage = UIImageView(image: UIImage(named: "img_tving"))
        return welcomImage
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tv_black
        setUpViews()
        setUpConstraints()
        configureWelcomeMessage()
    }

    // MARK: - Setup

    private func setUpViews() {
        [welcomImage, welcomeMessageLabel].forEach {
            self.view.addSubview($0)
        }
    }

    private func setUpConstraints() {

        welcomImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(58)
            $0.height.equalTo(210)
            $0.width.equalTo(375)
        }
        welcomeMessageLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    // MARK: - Helpers

    private func configureWelcomeMessage() {
        let message =
            email != nil
            ? "\(email!) 님\n반가워요!"
            : "델리게이트 실패 ㅋ"
        welcomeMessageLabel.text = message
    }
}
