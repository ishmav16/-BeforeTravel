//  ViewController.swift
//  BeforeTravel_Final
//
//  Created by saikumar on 29/04/17.
//  Copyright © 2017 Vamshi. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController,UISearchBarDelegate {

    @IBOutlet weak var tktCategory: UIButton!

    @IBOutlet weak var EstlCategory: UIButton!
    
    @IBOutlet weak var FormalsCat: UIButton!
    
    @IBOutlet weak var FoodCat: UIButton!
    
    @IBOutlet weak var filesCat: UIButton!
    
    @IBOutlet weak var BCardsCat: UIButton!
    
    @IBOutlet weak var listText: UITextView!
    
    @IBOutlet weak var cheklist: UILabel!
    
    var tickedIcon = UIImage(named: "tickedCheckbox")
    
    var tktIcon = UIImage(named: "ticket")
    var estlIcon = UIImage(named: "essentials")
    var formalsIcon = UIImage(named: "formals")
    var foodIcon = UIImage(named: "food")
    var filesIcon = UIImage(named: "files")
    var bCardsIcon = UIImage(named: "Bcards")
    
    @IBOutlet weak var getAct: UIButton!
    
    @IBOutlet weak var ActLbl: UILabel!
    
    @IBOutlet weak var TktHead: UILabel!
    
    @IBOutlet weak var gngTkt: UISwitch!

    @IBOutlet weak var gngTktLbl: UILabel!
    
    @IBOutlet weak var rtnTkt: UISwitch!
    
    @IBOutlet weak var rtnTktLbl: UILabel!
    
    @IBOutlet weak var EstlHead: UILabel!
    
    @IBOutlet weak var lpt: UISwitch!
    
    @IBOutlet weak var lptLbl: UILabel!
    
    @IBOutlet weak var lptCharg: UISwitch!
    
    @IBOutlet weak var lptChargLbl: UILabel!
    
    @IBOutlet weak var Mbl: UISwitch!
    
    @IBOutlet weak var MobileLbl: UILabel!
    
    @IBOutlet weak var FormalsHead: UILabel!
    
    @IBOutlet weak var Blazer: UISwitch!
    
    @IBOutlet weak var BlzLbl: UILabel!
    
    @IBOutlet weak var Tie: UISwitch!
    
    @IBOutlet weak var TieLbl: UILabel!
    
    @IBOutlet weak var Food: UISwitch!
    
    @IBOutlet weak var FoodLbl: UILabel!
   
    @IBOutlet weak var Files: UISwitch!
   
    @IBOutlet weak var FilesLbl: UILabel!
    
    @IBOutlet weak var BCards: UISwitch!
   
    @IBOutlet weak var BCardsLbl: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var cityLbl: UILabel!
    
    @IBOutlet weak var conditionLbl: UILabel!
    
    @IBOutlet weak var degreeLbl: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var addActBtn: UIButton!
    
    @IBOutlet weak var Submitbtn: UIButton!
    
    struct Category {
        static var tktCLick = false
        static var estlClick = false
        static var formalsClick = false
        static var foodClick = false
        static var filesClick = false
        static var bCardsClick = false
        
    }
    
    struct Acts {
        static var gngtktactClick = false
        static var rtntktactClick = false
        static var laptopactClick = false
        static var laptopChargeractClick = false
        static var mobileactClick = false
        static var blazeractClick = false
        static var tieactClick = false
        static var foodactClick = false
        static var filesactClick = false
        static var bcardsactClick = false
        static var ActivitiesList = "Things you need to pack are :\n "
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
      //  searchBar.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tktMarked(_ sender: UIButton) {
        if Category.tktCLick == false {
            Category.tktCLick = true
            tktCategory.setImage(tickedIcon, for: UIControlState.normal)
        }
        else{
            Category.tktCLick = false
            tktCategory.setImage(tktIcon, for: UIControlState.normal)
        }
        
    }
    
    @IBAction func estlMarked(_ sender: UIButton) {
        if Category.estlClick == false {
            Category.estlClick = true
            EstlCategory.setImage(tickedIcon, for: UIControlState.normal)
        }
        else{
            Category.estlClick = false
            EstlCategory.setImage(estlIcon, for: UIControlState.normal)
        }
        
    }
    
    @IBAction func formalsMarked(_ sender: UIButton) {
        if Category.formalsClick == false {
            Category.formalsClick = true
            FormalsCat.setImage(tickedIcon, for: UIControlState.normal)
        }
        else{
            Category.formalsClick = false
            FormalsCat.setImage(formalsIcon, for: UIControlState.normal)
        }
        
    }
    
    @IBAction func foodMarked(_ sender: UIButton) {
        if Category.foodClick == false {
            Category.foodClick = true
            FoodCat.setImage(tickedIcon, for: UIControlState.normal)
        }
        else{
            Category.foodClick = false
            FoodCat.setImage(foodIcon, for: UIControlState.normal)
        }
        
    }
    
    @IBAction func fileMarked(_ sender: UIButton) {
        if Category.filesClick == false {
            Category.filesClick = true
            filesCat.setImage(tickedIcon, for: UIControlState.normal)
        }
        else{
            Category.filesClick = false
            filesCat.setImage(filesIcon, for: UIControlState.normal)
        }
        
        
    }
    
    @IBAction func bCardsMarked(_ sender: UIButton) {
        if Category.bCardsClick == false {
            Category.bCardsClick = true
            BCardsCat.setImage(tickedIcon, for: UIControlState.normal)
        }
        else{
            Category.bCardsClick = false
            BCardsCat.setImage(bCardsIcon, for: UIControlState.normal)
        }
        
    }

    
    
    @IBAction func getActClick(_ sender: UIButton) {
        getAct.isHidden = true
        ActLbl.isHidden = false
        addActBtn.isHidden = false
        Submitbtn.isHidden = false
        if(Category.tktCLick == true)
        {
            TktHead.isHidden = false
            gngTkt.isHidden = false
            gngTktLbl.isHidden = false
            rtnTkt.isHidden = false
            rtnTktLbl.isHidden = false
        }
        if(Category.estlClick == true)
        {
            EstlHead.isHidden = false
            lpt.isHidden = false
            lptLbl.isHidden = false
            lptCharg.isHidden = false
            lptChargLbl.isHidden = false
            Mbl.isHidden = false
            MobileLbl.isHidden = false
        }
        if(Category.formalsClick == true)
        {
            FormalsHead.isHidden = false
            Blazer.isHidden = false
            BlzLbl.isHidden = false
            Tie.isHidden = false
            TieLbl.isHidden = false
        }
        if(Category.foodClick == true)
        {
            Food.isHidden = false
            FoodLbl.isHidden = false
        }
        if(Category.filesClick == true)
        {
            Files.isHidden = false
            FilesLbl.isHidden = false
        }
        if(Category.bCardsClick == true)
        {
            BCards.isHidden = false
            BCardsLbl.isHidden = false
        }
    }
    
    @IBAction func gngtklbtnclicked(_ sender: UISwitch) {
        if(Acts.gngtktactClick == false)
        {
            Acts.gngtktactClick = true
            Acts.ActivitiesList  = Acts.ActivitiesList + "Going Tkts\n"

            
        }
        else{
            Acts.gngtktactClick = false
        }
        
    }
    
    @IBAction func rtntktbnClicked(_ sender: UISwitch) {
        if(Acts.rtntktactClick == false)
        {
            Acts.rtntktactClick = true
            Acts.ActivitiesList  = Acts.ActivitiesList + "Return Tkts\n"
            
        }
        else{
            Acts.rtntktactClick = false
        }
    }
    
    
    @IBAction func latopbtnClick(_ sender: UISwitch) {
        if(Acts.laptopactClick == false)
        {
            Acts.laptopactClick = true
            
            Acts.ActivitiesList  = Acts.ActivitiesList + " Laptop\n"
        }
        else{
            Acts.laptopactClick = false
        }
    }
    
    
    @IBAction func lptChargerbtnClick(_ sender: UISwitch) {
        if(Acts.laptopChargeractClick == false)
        {
            Acts.laptopChargeractClick = true
            
            Acts.ActivitiesList  = Acts.ActivitiesList + "Laptop Charger\n"
        }
        else{
            Acts.laptopChargeractClick = false
        }
    }
    
    @IBAction func MobileBtnClicked(_ sender: UISwitch) {
        if(Acts.mobileactClick == false)
        {
            Acts.mobileactClick = true
            
            Acts.ActivitiesList  = Acts.ActivitiesList + "Mobile\n"
        }
        else{
            Acts.mobileactClick = false
        }
    }
    
    @IBAction func BlazerBtnClicked(_ sender: UISwitch) {
        if(Acts.blazeractClick == false){
            
            Acts.blazeractClick = true
            
            Acts.ActivitiesList = Acts.ActivitiesList + "Blazer\n"
        }
        else{
            Acts.blazeractClick = false
        }
        
    }
    
    @IBAction func TieBtnClicked(_ sender: UISwitch) {
        if(Acts.tieactClick == false)
        {
            Acts.tieactClick = true
            Acts.ActivitiesList = Acts.ActivitiesList + "Tie\n"
        }
        else{
            Acts.tieactClick = false
        }
        
    }
    
    @IBAction func foodBtnClicked(_ sender: UISwitch) {
        if(Acts.foodactClick == false){
            Acts.foodactClick = true
            Acts.ActivitiesList = Acts.ActivitiesList + "Food\n"
            
        }
        else{
            Acts.foodactClick = false
        }
    }
    
    @IBAction func filesBtnClicked(_ sender: UISwitch) {
        if(Acts.filesactClick == false)
        {
            Acts.filesactClick = true
            Acts.ActivitiesList = Acts.ActivitiesList + "Files\n"
        }
        else{
            Acts.filesactClick = false
        }
    }
    
    @IBAction func BCardsBtnClicked(_ sender: UISwitch) {
        if(Acts.bcardsactClick == false)
        {
            Acts.bcardsactClick = true
            Acts.ActivitiesList = Acts.ActivitiesList + "Bussiness Cards\n"
            
        }
        else{
            Acts.bcardsactClick = false
        }
    }
    
    
    
    @IBOutlet weak var shrbtnLbl: UIButton!
    
    @IBOutlet weak var weatherBtn: UIButton!
    
    @IBAction func ActSubmits(_ sender: UIButton) {
        print(Acts.ActivitiesList)
        
    }
    @IBOutlet weak var sharebtn: UIButton!
    @IBOutlet weak var getClbtn: UIButton!
    @IBOutlet weak var finalList: UILabel!
    @IBAction func getlistBtn(_ sender: UIButton) {
        getClbtn.isHidden = true
        finalList.text = Acts.ActivitiesList
        finalList.isHidden = false
        shrbtnLbl.isHidden = false
        weatherBtn.isHidden = false
        
    }
    
    @IBAction func shrlistbtn(_ sender: UIButton) {
        //Alert
        let alert = UIAlertController(title: "Share", message: "Share your checklist with #BeforeTravel!", preferredStyle: .actionSheet)
        
        //First action
        let actionOne = UIAlertAction(title: "Share on Facebook", style: .default) { (action) in
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
                
                post.setInitialText("#Before Travel")
                post.add(UIImage(named: "img.png"))
                
                self.present(post, animated: true, completion: nil)
                
            }
        }
        
        //Second action
        let actionTwo = UIAlertAction(title: "Share on Twitter", style: .default) { (action) in
            
            //Checking if user is connected to Facebook
            if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter)
            {
                let post = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
                
                post.setInitialText("Poem of the day")
                post.add(UIImage(named: "img.png"))
                
                self.present(post, animated: true, completion: nil)
                
            }
        }
        
        let actionThree = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        //Add action to action sheet
        alert.addAction(actionOne)
        alert.addAction(actionTwo)
        alert.addAction(actionThree)
        
        //Present alert
        self.present(alert, animated: true, completion: nil)
        
    }
    func showAlert(service:String)
    {
        let alert = UIAlertController(title: "Error", message: "You are not connected to \(service)", preferredStyle: .alert)
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    var degree: Int!
    var condition: String!
    var imgURL: String!
    var city: String!
    
    var exists: Bool = true
    

    
    
}

