//
//  ImageViewCell.swift
//  ProjetoFinalStudioGhibliAPI
//
//  Created by Caroline Feldhaus de Souza on 31/10/21.
//

import UIKit
import SnapKit
import Kingfisher

class ImageViewCell: UITableViewCell {
    
    private var imagess = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(self.imagess)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageView(url: URL, rounded: Bool = false) {
        
        if rounded {
            
        //    self.UIImageMain.layer.cornerRadius = 125.0
            self.imagess.layer.masksToBounds = true
        }
        
        self.imagess.contentMode = .scaleAspectFit
        //self.uiiv_Image.backgroundColor = .red
        
//usando kingfisher pra configurar a imagem
        self.imagess.kf.setImage(with: url, options: [.cacheOriginalImage], completionHandler: { result in })
        
//usando snapkit para as constrains
        self.imagess.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(250)
            make.height.equalTo(250)
        }
    }
}


