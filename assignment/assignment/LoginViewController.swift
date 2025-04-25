//
//  ViewController.swift
//  assignment
//
//  Created by 조휘원 on 4/16/25.
//

import SnapKit
import UIKit

class LoginViewController: UIViewController {

    private let titleLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    private let togglePasswordButton = UIButton()
    private let clearButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .tv_black
        setUpViews()
        setUpConstraints()
        setUpActions()
        configurePasswordRightView()
    }

    private func setUpViews() {
        titleLabel.text = "TVING ID 로그인"
        titleLabel.textColor = .tv_white
        titleLabel.font = .systemFont(ofSize: 23)

        emailTextField.applyTvingStyle(placeholder: "아이디")

        passwordTextField.applyTvingStyle(placeholder: "비밀번호")
        passwordTextField.isSecureTextEntry = true

        loginButton.setTitle("로그인", for: .normal)
        // 타이틀 컬러 주기
        loginButton.backgroundColor = .tv_black
        passwordTextField.layer.cornerRadius = 3
        passwordTextField.clipsToBounds = true
        // border 색상 주기
        loginButton.isEnabled = false

        [titleLabel, emailTextField, passwordTextField, loginButton].forEach {
            view.addSubview($0)
        }
    }

    private func setUpConstraints() {
        titleLabel.snp.makeConstraints {
            // offset으로 값을 넘겨주는 것 뿐? -> 가운데 정렬 같은 거 없음?
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }

    }

    private func setUpActions() {
        emailTextField.addTarget(
            self,
            action: #selector(textFieldChanged),
            for: .editingChanged
        )
        passwordTextField.addTarget(
            self,
            action: #selector(textFieldChanged),
            for: .editingChanged
        )
    }

    private func configurePasswordRightView() {

    }

    @objc private func textFieldChanged() {
        let isEmailValid = emailTextField.text?.isValidEmail ?? false
        let isPasswordValid = passwordTextField.text?.isValidPassword ?? false
        loginButton.isEnabled = isEmailValid && isPasswordValid
        loginButton.backgroundColor =
            loginButton.isEnabled ? .tv_red : .tv_black
    }

}
