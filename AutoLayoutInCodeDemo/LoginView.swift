//  Created by dasdom on 23.08.20.
//  Copyright © 2020 dasdom. All rights reserved.
//

import UIKit

class LoginView: UIView {

  private let usernameTextField: UITextField
  private let passwordTextField: UITextField
  let loginButton: UIButton
  
  override init(frame: CGRect) {
    
    usernameTextField = UITextField()
    usernameTextField.placeholder = NSLocalizedString("Username", comment: "")
    usernameTextField.borderStyle = .bezel
    
    passwordTextField = UITextField(frame: .zero)
    passwordTextField.isSecureTextEntry = true
    passwordTextField.placeholder = NSLocalizedString("Password", comment: "")
    passwordTextField.borderStyle = .bezel
    
    loginButton = UIButton(type: .system)
    loginButton.setTitle(NSLocalizedString("Login", comment: ""), for: .normal)
    loginButton.backgroundColor = .gray
    loginButton.tintColor = .white
    loginButton.layer.cornerRadius = 5
    
    let textFieldStackView = UIStackView(arrangedSubviews: [usernameTextField, passwordTextField])
    textFieldStackView.axis = .vertical
    textFieldStackView.spacing = 10
    textFieldStackView.distribution = .fillEqually
    
    let stackView = UIStackView(arrangedSubviews: [textFieldStackView, loginButton])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.spacing = 20
    
    super.init(frame: .zero)
    
    backgroundColor = .white
    
    addSubview(stackView)
    
    let layoutConstraints = [
      stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      
      usernameTextField.heightAnchor.constraint(equalToConstant: 30),
      
      loginButton.heightAnchor.constraint(equalToConstant: 40),
    ]
    NSLayoutConstraint.activate(layoutConstraints)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LoginView {
  func username() -> String {
    return usernameTextField.text ?? "<empty>"
  }
  
  func password() -> String {
    return passwordTextField.text ?? "<empty>"
  }
}
