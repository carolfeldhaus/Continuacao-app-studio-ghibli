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
        setupFilms()
        setupPeople()
        setupSpecies()
        setupLocations()
        setupVehicles()
    }

    @IBAction func getFilms(_ sender: UIButton) {
        let fViewController = FilmsViewController()
        navigationController?.pushViewController(fViewController, animated: true)
    }
   
    @IBAction func getPeople(_ sender: UIButton) {
        let pViewController = FilmsViewController()
        navigationController?.pushViewController(pViewController, animated: true)
    }
    
    @IBAction func getSpecies(_ sender: UIButton) {
        let sViewController = FilmsViewController()
        navigationController?.pushViewController(sViewController, animated: true)
    }
    
    @IBAction func getLocations(_ sender: UIButton) {
        let lViewController = FilmsViewController()
        navigationController?.pushViewController(lViewController, animated: true)
    }
    
    @IBAction func getVehicles(_ sender: UIButton) {
        let vViewController = FilmsViewController()
        navigationController?.pushViewController(vViewController, animated: true)
    }
    
    func setupFilms (){
           buttonFilmes?.layer.cornerRadius = 12
           navigationController?.navigationBar.tintColor = .white
       }
    
    func setupPeople (){
           buttonPeople?.layer.cornerRadius = 12
           navigationController?.navigationBar.tintColor = .white
       }
    
    func setupSpecies (){
           buttonSpecies?.layer.cornerRadius = 12
           navigationController?.navigationBar.tintColor = .white
       }
    
    func setupLocations (){
           buttonLocations?.layer.cornerRadius = 12
           navigationController?.navigationBar.tintColor = .white
       }
    
    func setupVehicles (){
           buttonVehicles?.layer.cornerRadius = 12
           navigationController?.navigationBar.tintColor = .white
       }
}

