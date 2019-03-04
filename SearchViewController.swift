//
//  SearchViewController.swift
//  WowCompanion
//
//  Created by Joseph Storer on 2/27/19.
//  Copyright © 2019 Joseph Storer. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var token:AuthToken? = nil
    var realmList: RealmListing? = nil
    var searchResults = [SearchResult]()
    var searchCalls: Int = 0
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SearchForPlayer(name: searchBar.text!)
        searchBar.resignFirstResponder()
    }
    
    
    private func SearchForPlayer(name: String){
        GETPlayers(name: name, realms: realmList!, token: token!)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // manually hide our empty boys
        if searchResults.count > 0{
            for realm in 0...(searchResults.count - 1){
                if searchResults[realm].GetAvatar() == nil{
                    searchResults.remove(at: realm)
                }
            }
        }
        
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_result") as? ResultTableViewCell
        let char = searchResults[indexPath.row]
        cell?.playerName.text = char.GetName()
        cell?.plearerDetail.text = char.GetRealm()
        cell?.playerRealm.text = char.GetDetails()
        cell?.playerIcon.image = char.GetAvatar()

        return cell!
        
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
