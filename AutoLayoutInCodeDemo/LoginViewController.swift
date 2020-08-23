//  Created by dasdom on 23.08.20.
//  Copyright © 2020 dasdom. All rights reserved.
//

import UIKit
import os

class LoginViewController: UIViewController {

  private var contentView: LoginView {
    return view as! LoginView
  }
  
  override func loadView() {
    let contentView = LoginView()
    contentView.loginButton.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
    view = contentView
  }
}

extension LoginViewController {
  @objc func login(_ sender: UIButton) {
    os_log(.info,
           log: .default,
           "username: %{public}@, password: %{private}@",
           contentView.username(), contentView.password())
  }
}
