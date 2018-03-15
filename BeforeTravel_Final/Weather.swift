//
//  Weather.swift
//  BeforeTravel_Final
//
//  Created by saikumar on 02/05/17.
//  Copyright © 2017 Vamshi. All rights reserved.
//

import Foundation
import UIKit

class Weather: UIViewController, UISearchBarDelegate {
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var conditionLbl: UILabel!
    @IBOutlet weak var degreeLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
//    @IBOutlet weak var searchBar: UISearchBar!
//    
//    @IBOutlet weak var cityLbl: UILabel!
//    @IBOutlet weak var conditionLbl: UILabel!
//    @IBOutlet weak var degreeLbl: UILabel!
//    @IBOutlet weak var imgView: UIImageView!
//    
    var degree: Int!
    var condition: String!
    var imgURL: String!
    var city: String!
    
    @IBOutlet weak var PrecLbl: UILabel!
    
    var exists: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchBar.delegate = self
    }
    
    
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
self.PrecLbl.isHidden = false
        
        
        let urlRequest = URLRequest(url: URL(string: "https://api.apixu.com/v1/current.json?key=ff9549fab9d54a0680d170512172804&q=\(searchBar.text!.replacingOccurrences(of: " ", with: "%20"))")!)
        print(urlRequest)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error == nil {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                    
                    if let current = json["current"] as? [String : AnyObject] {
                        
                        if let temp = current["temp_c"] as? Int {
                            self.degree = temp
                            print(temp)
                        }
                        if let condition = current["condition"] as? [String : AnyObject] {
                            self.condition = condition["text"] as! String
                            let icon = condition["icon"] as! String
                            self.imgURL = "http:\(icon)"
                        }
                    }
                    if let location = json["location"] as? [String : AnyObject] {
                        self.city = location["name"] as! String
                    }
                    
                    if let _ = json["error"] {
                        self.exists = false
                    }
                    
                    DispatchQueue.main.async {
                        if self.exists{
                            self.degreeLbl.isHidden = false
                            self.conditionLbl.isHidden = false
                            self.imgView.isHidden = false
                            self.degreeLbl.text = "\(self.degree.description)°"
                            self.cityLbl.text = self.city
                            self.conditionLbl.text = self.condition
                            self.imgView.downloadImage(from: self.imgURL!)
                        }else {
                            self.degreeLbl.isHidden = true
                            self.conditionLbl.isHidden = true
                            self.imgView.isHidden = true
                            self.cityLbl.text = "No matching city found"
                            self.exists = true
                        }
                    }
                    if(self.degree <= 15)
                    {
                        self.PrecLbl.text = "Its better to take coats"
                            print(self.PrecLbl.text)
                    }
                    
                    
                    
                } catch let jsonError {
                    print(jsonError.localizedDescription)
                }
            }
        }
        
        task.resume()
    }
}


extension UIImageView {
    
    func downloadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }
        task.resume()
    }
    
}

