//
//  ViewController.swift
//  Smarty
//
//  Created by MohamedNouri on 29/07/2020.
//  Copyright © 2020 MohamedNouri. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    
    // MARK: Views
    
    let logoImage: UIImageView = {
        let imageL = UIImageView()
        imageL.image = #imageLiteral(resourceName: "homeImage")
        imageL.contentMode = .scaleAspectFit
        imageL.translatesAutoresizingMaskIntoConstraints = false
        imageL.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        imageL.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        imageL.alpha = 0
        
        return imageL
    }()
    
    
    let Smartytext: UILabel = {
        let labeltitlte = UILabel()
        labeltitlte.text = "Smarty"
        labeltitlte.textAlignment = .center
        labeltitlte.font = UIFont.boldSystemFont(ofSize: 35.0)
        labeltitlte.numberOfLines = 1
        labeltitlte.adjustsFontSizeToFitWidth = true
        labeltitlte.adjustsFontForContentSizeCategory = true
        labeltitlte.textColor = .SmartyBlackColor
           labeltitlte.setContentCompressionResistancePriority(.required, for: .vertical)
        return labeltitlte
    }()
    
    let Welcometext: UILabel = {
        let labelwelcome = UILabel()
        labelwelcome.text = NSLocalizedString("welcome", tableName: nil, bundle: .main, value:  "Welcome Home", comment:  "Welcome Text")
        labelwelcome.textAlignment = .center
        labelwelcome.font = UIFont.systemFont(ofSize: 23)
        labelwelcome.textColor = .SmartyGrayColor
        labelwelcome.numberOfLines = 1
       labelwelcome.setContentCompressionResistancePriority(.required, for: .vertical)
        return labelwelcome
    }()
    
    let labelsStackView : UIStackView = {
        let sb = UIStackView()
        sb.spacing = 20
        sb.axis = .vertical
        sb.distribution = .fillEqually
        
        return sb
    }()
    
    let rootStackView : UIStackView = {
        let sb = UIStackView()
        sb.spacing = 13
        sb.axis = .vertical
        sb.setContentCompressionResistancePriority(.required, for: .vertical)

        sb.distribution = .fillProportionally
        return sb
    }()
    
    
    let usernametextView:UITextField = {
        let username = UITextField()
        username.placeholder = NSLocalizedString("namePlaceholder", tableName: nil, bundle: .main, value:  "Your Name", comment:  "name PlaceHolder")
        username.keyboardType = .default
        username.borderStyle = .roundedRect
        username.textContentType = .username
        username.returnKeyType = .done
        
        username.tag = 0
        return username
    }()
    
    
    
    let GoToHomebutton:UIButton = {
        let loginB = UIButton()
        loginB.setTitle(NSLocalizedString("continue", tableName: nil, bundle: .main, value:  "Continue", comment:  "Continue to the app") , for: .normal)
        loginB.backgroundColor = .SmartyBlueColor
        loginB.setTitleColor( .white, for: .normal)
        loginB.layer.cornerRadius = 6
        loginB.translatesAutoresizingMaskIntoConstraints = false
        
        return loginB
    }()
    
    
    
   lazy var LoaderAnimation : UIActivityIndicatorView = {
        let sb = UIActivityIndicatorView()
        sb.hidesWhenStopped = true
        sb.style = UIActivityIndicatorView.Style.medium
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.color = .white
        return sb
    }()
    
    
    
    
    var bottomConstarin:NSLayoutConstraint?
    
    
    
    
    
    
    

      //TODO: Should be displayed as first screen.
      //TODO: Have an input field in which you can enter your name.
      //TODO:  A button that takes to the home screen.
    
   
    fileprivate func SetLayout() {
        
        
        // background Color
        
        
        view.backgroundColor = .SmartyWhiteColor
        // adding the StackView
        view.addSubview(rootStackView)
        
        NotificationCenter.default.addObserver(self, selector: #selector( keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector( keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        rootStackView.addArrangedSubview(logoImage)
        rootStackView.addArrangedSubview(Smartytext)
        rootStackView.addArrangedSubview(Welcometext)
      
        labelsStackView.addArrangedSubview(usernametextView)
        usernametextView.delegate = self
        labelsStackView.addArrangedSubview(GoToHomebutton)
        
        rootStackView.addArrangedSubview(labelsStackView)
        
        // Simple Loader
        GoToHomebutton.addSubview(LoaderAnimation)
        
        rootStackView.anchor(top: nil, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: .zero)
        bottomConstarin = rootStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        bottomConstarin?.isActive = true
        NSLayoutConstraint.activate([
            
            GoToHomebutton.heightAnchor.constraint(equalToConstant: 45),
            usernametextView.heightAnchor.constraint(equalToConstant: 45),
            rootStackView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            LoaderAnimation.centerYAnchor.constraint(equalTo: GoToHomebutton.centerYAnchor),
            LoaderAnimation.centerXAnchor.constraint(equalTo: GoToHomebutton.centerXAnchor),
        ])
        GoToHomebutton.addTarget(self, action: #selector(GoToHome), for: .touchUpInside)
        
        
        
    }
    
    
    
    // MARK: View Life Cycle
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        SetLayout()
        
        // sign in with google
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // add fade in effact
        UIView.animate(withDuration: 0.8) {
            self.logoImage.alpha = 1.0
            
        }
    }
    
    
    
    
    // Go To Home After Saving User Name And Some Fake Loding
    
    @objc func GoToHome(){
        
        
        // Test is username is empty
        
        
        let userName = usernametextView.text ?? ""
        guard userName.trimmingCharacters(in: .whitespacesAndNewlines).count > 1  else {
            // show Alert With ERROR
            ShowErrorAlert()
            
            return
        }
        
        // Save User Name To User Default
        
        UserDefaults.standard.setUserName(name:userName)
        
        
        // Show Loading
        ShowLoading()
        
        // Fake Background Loding
     
        let time = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: time) {
            // Go To Home
            let homeVC  = UINavigationController(rootViewController : HomeViewController())
            homeVC.modalPresentationStyle = .fullScreen
            
            self.present(homeVC, animated: true, completion: nil)
            
        }
        
    
    }
    
    
    private func ShowLoading(){
        
              LoaderAnimation.startAnimating()
             GoToHomebutton.setTitle("", for: .normal)
             GoToHomebutton.isEnabled = false
             usernametextView.isEnabled = false
        
    }
    
    
    
    
    
    private func ShowErrorAlert(){
        
        let alert = UIAlertController(title: "oops ", message: "Please provide Your Name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    
    
        // MARK:  keyboard management
    
    
    deinit {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        
        if bottomConstarin?.constant == -20{
            bottomConstarin?.constant = -(keyboardFrame.height)
            view.layoutIfNeeded()
        }
    }
    
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        
        
        if bottomConstarin?.constant != -20{
            
            bottomConstarin?.constant =   -20
            view.layoutIfNeeded()
        }
        
    }
    
    
 override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
     super.willTransition(to: newCollection, with: coordinator)

   
        self.view.endEditing(true)
   
 }

 
}



