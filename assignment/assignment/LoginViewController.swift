//
//  ViewController.swift
//  assignment
//
//  Created by 조휘원 on 4/16/25.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {

    // MARK: - UI Components

    private let titleLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = UIButton()
    private let togglePasswordButton = UIButton()
    private let clearButton = UIButton()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureActions()
        configurePasswordFieldRightView()
    }
}

// MARK: - Setup Methods

private extension LoginViewController {

    func configureUI() {
        view.backgroundColor = .tv_black

        titleLabel.text = "TVING ID 로그인"
        titleLabel.textColor = .tv_white
        titleLabel.font = .systemFont(ofSize: 23)

        emailTextField.applyTvingStyle(placeholder: "아이디")
        passwordTextField.applyTvingStyle(placeholder: "비밀번호")
        passwordTextField.isSecureTextEntry = true

        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.tv_gray3?.cgColor
        loginButton.isEnabled = false

        [titleLabel, emailTextField, passwordTextField, loginButton].forEach {
            view.addSubview($0)
        }

        setConstraints()
    }

    func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(90)
        }

        emailTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalTo(emailTextField)
            $0.height.equalTo(52)
        }

        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalTo(emailTextField)
            $0.height.equalTo(52)
        }
    }

    func configureActions() {
        [emailTextField, passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldTapped), for: .editingDidBegin)
            $0.addTarget(self, action: #selector(textFieldTappedEnd(_:)), for: .editingDidEnd)
            $0.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        }

        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }

    func configurePasswordFieldRightView() {
        clearButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        clearButton.tintColor = .tv_white
        clearButton.isHidden = true
        clearButton.addTarget(self, action: #selector(clearPassword), for: .touchUpInside)

        togglePasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        togglePasswordButton.tintColor = .tv_white
        togglePasswordButton.addTarget(self, action: #selector(toggleSecureTextEntry), for: .touchUpInside)

        passwordTextField.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)

        let container = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 20))
        container.addSubview(clearButton)
        container.addSubview(togglePasswordButton)

        clearButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(togglePasswordButton.snp.leading).offset(-16)
            $0.size.equalTo(20)
        }

        togglePasswordButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.size.equalTo(20)
        }

        passwordTextField.rightView = container
        passwordTextField.rightViewMode = .whileEditing
    }
}

// MARK: - Action Methods

private extension LoginViewController {

    @objc func textFieldTapped(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.tv_gray2?.cgColor
    }

    @objc func textFieldTappedEnd(_ textField: UITextField) {
        textField.layer.borderWidth = 0
    }

    @objc func textFieldChanged() {
        let isEmailValid = emailTextField.text?.isValidEmail ?? false
        let isPasswordValid = passwordTextField.text?.isValidPassword ?? false

        loginButton.isEnabled = isEmailValid && isPasswordValid
        loginButton.backgroundColor = loginButton.isEnabled ? .tv_red : .tv_black
        loginButton.setTitleColor(loginButton.isEnabled ? .tv_white : .tv_gray3, for: .normal)
        loginButton.layer.borderWidth = loginButton.isEnabled ? 0 : 1
    }

    @objc func passwordTextChanged() {
        clearButton.isHidden = (passwordTextField.text ?? "").isEmpty
    }

    @objc func clearPassword() {
        passwordTextField.text = ""
        clearButton.isHidden = true
        textFieldChanged()
    }

    @objc func toggleSecureTextEntry() {
        passwordTextField.isSecureTextEntry.toggle()
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.fill"
        togglePasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }

    @objc func loginTapped() {
        let welcomeVC = WelcomViewController()
        welcomeVC.delegate = self
        welcomeVC.email = emailTextField.text ?? ""
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

// MARK: - Delegate

extension LoginViewController: WelcomViewControllerDelegate {
    func didLoginWithEmail(email: String) {
        emailTextField.text = email
    }
}
