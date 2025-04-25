//
//  ViewController.swift
//  assignment
//
//  Created by 조휘원 on 4/16/25.
//

import UIKit

protocol WelcomViewControllerDelegate: AnyObject {
    func didLoginWithEmail(email: String)
}

class WelcomViewController: UIViewController {
    
    weak var delegate: WelcomViewControllerDelegate?
    var welcomeLabel: String?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24)
        label.textColor = .tv_red
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let email = welcomeLabel {
            titleLabel.text = "Welcome, \(email)!"
        } else {
            titleLabel.text = "Welcome!"
        }

        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
