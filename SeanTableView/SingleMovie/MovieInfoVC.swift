//
//  MovieInfoUI.swift
//  SeanTableView
//
//  Created by Filip Glavica on 07/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

/*

import UIKit

class MovieInfoVC: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
    
        view.addSubview(tableView)
        view.addSubview(backButton)
        
        
       // configureTableView()
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        }
    
    var tableView = UITableView()
    var backButton = UIButton()

   /* func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureTableView(){
        setTableViewDelegates()
    }
    */
    
    
    func configureBackButton(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(Images.backButton, for: .normal)
        
    }
    
    @objc func backButtonTapped() {
         navigationController?.popViewController(animated: true)
    }

}


/*
extension MovieInfoVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "")
    }
}
*/
*/
