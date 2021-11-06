//
//  HomeViewController.swift
//  StudioGhibliApp
//
//  Created by Caroline Feldhaus de Souza on 05/11/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var imageHome: UIImageView!
    @IBOutlet weak var labelHome: UILabel!
    @IBOutlet weak var buttonFilmes: UIButton!
    @IBOutlet weak var buttonPeople: UIButton!
    @IBOutlet weak var buttonSpecies: UIButton!
    @IBOutlet weak var buttonLocations: UIButton!
    @IBOutlet weak var buttonVehicles: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getFilms(_ sender: UIButton) {
        let fViewController = FilmsViewController()
        navigationController?.pushViewController(fViewController, animated: true)
    }
   
    @IBAction func getPeople(_ sender: UIButton) {
    }
    
    @IBAction func getSpecies(_ sender: UIButton) {
    }
    
    @IBAction func getLocations(_ sender: UIButton) {
    }
    
    @IBAction func getVehicles(_ sender: UIButton) {
    }
    
    func setupfilms (){
           buttonFilmes.layer.cornerRadius = 12
           navigationController?.navigationBar.tintColor = .white
       }
    
}

