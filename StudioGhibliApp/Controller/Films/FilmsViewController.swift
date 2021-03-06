//
//  ViewController.swift
//  StudioGhibliApp
//
//  Created by Caroline Feldhaus de Souza on 05/11/21.
//

import UIKit
import Kingfisher

class FilmsViewController: UIViewController {
    
    var arrayDeFilmes: [films] = []
    var api: sGAPI?
    let reuseIdentifier = "Celula"
    convenience init (api: sGAPI) {
        self.init()
        self.api = api
    }
    
    lazy var tabelaFilmes: UITableView = {
        
        var tabela = UITableView()
        tabela.frame = self.view.bounds
        tabela.dataSource = self
        tabela.delegate = self
        
        let nib = UINib(nibName: "CCFilms", bundle: nil)
        tabela.register(nib, forCellReuseIdentifier: reuseIdentifier)
        
        return tabela
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Studio Ghibli Movies"
        
        self.view.addSubview(self.tabelaFilmes)
        
        self.createRightBarButton()
        
        self.view.backgroundColor = UIColor.meuRosa()
        self.tabelaFilmes.backgroundColor = .clear
        
        let footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 80))
        footer.backgroundColor = .meuRoxo()
        tabelaFilmes.tableFooterView = footer
        
        apiGet()
        
        
    }
    
    //criando funcao para popular a api
    func getFilmes(completion: @escaping (Result<[films], SGApiError>) -> Void) {
      
        guard let mApi = self.api else { return }
        
        mApi.getSG(urlString: mApi.setSGURL(), method: .GET) {
            [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let filmes):
                self?.arrayDeFilmes = filmes
             
                DispatchQueue.main.async {
                self?.tabelaFilmes.reloadData()
                }
            case .failure (let error):
                self?.userAlert(mensagem: "No Internet connection")
                print(error)
            }
        }
    }
    
    private func apiGet(){
        
        self.getFilmes{ [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let filmes):
                self?.arrayDeFilmes = filmes
                self?.tabelaFilmes.reloadData()
            case .failure (let error):
                self?.userAlert(mensagem: "No Internet connection")
                print(error)
            }
            
        }
    }
    
    //funcao para mostrar erro de sem intenrnet na tela
    func userAlert(mensagem: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Warning", message: mensagem, preferredStyle: .alert)
            
            let buttonBack = UIAlertAction(title: "Try Again", style: .default) { _ in
                self.apiGet()            }
            let buttonOk = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alert.addAction(buttonBack)
            alert.addAction(buttonOk)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    //botao que leva aos favoritos
    func createRightBarButton() {
        
        let starImage = UIImage(systemName: "star.fill")
        
        let rightButton = UIBarButtonItem(image: starImage, style: UIBarButtonItem.Style.plain, target: self, action: #selector(getFavoritos))
        rightButton.tintColor = .yellow
        
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func getFavoritos() {
        let favVC = FavoritesViewController()
        self.show(favVC, sender: nil)
    }
    
}

//MARK: UITableViewDataSource
extension FilmsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.arrayDeFilmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //editando a celula customizada
        let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier, for: indexPath) as? CCFilms
        
        
        cell?.titleFilms.text = self.arrayDeFilmes[indexPath.row].title
        cell?.descriptionFilms.text = self.arrayDeFilmes[indexPath.row].description
        cell?.descriptionFilms.adjustsFontSizeToFitWidth = false
        cell?.descriptionFilms.numberOfLines = 0
        
        if let image = self.arrayDeFilmes[indexPath.row].image {
            
            let url = URL(string: image)
            
            //usando kingfisher para configurar a imagem
            cell?.imageFilms.kf.setImage(with: url, options: [.transition(ImageTransition.fade(2.0)), .cacheOriginalImage],
                                          progressBlock: nil, completionHandler: { resultado in
                switch resultado {
                case .success(let image):
                    print(image.cacheType)
                case .failure(let erro):
                    print(erro.localizedDescription)
                }
            })
        }
        return cell!
    }
    
    //configurando o tamanho da linha
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 146.0
    }
    
}

//MARK: UITableViewDelegate
//mandando para a tela de detalhes
extension FilmsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail = DetailViewController()
        
        detail.sGTocado = self.arrayDeFilmes[indexPath.row]
        
        self.show(detail, sender: nil)
    }
    
}




