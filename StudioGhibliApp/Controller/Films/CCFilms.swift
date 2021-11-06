//
//  CCFilms.swift
//  StudioGhibliApp
//
//  Created by Caroline Feldhaus de Souza on 05/11/21.
//

import UIKit
import SnapKit

class CCFilms: UITableViewCell {
    
    @IBOutlet weak var imageFilms: UIImageView!
    @IBOutlet weak var titleFilms: UILabel!
    @IBOutlet weak var descriptionFilms: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //usando SnapKit para as constraints
                titleFilms.snp.makeConstraints { make in
                    
                    make.top.equalTo(self).offset(10)
                    make.right.equalTo(self).offset(-15)
                    make.left.equalTo(imageFilms.snp.right).offset(-5)
                    make.bottom.equalTo(descriptionFilms.snp.top).offset(-10)
                    
                }
                
                descriptionFilms.snp.makeConstraints { make in
                    
                    make.top.equalTo(titleFilms.snp.bottom).offset(5)
                    make.left.equalTo(imageFilms.snp.right).offset(-5)
                    make.right.equalTo(self).offset(-15)
                    make.bottom.greaterThanOrEqualTo(self).offset(-10)
                    
                }
                
               imageFilms.snp.makeConstraints { make in
                    
                    make.centerY.equalTo(self).offset(0)
                    make.left.equalTo(self).offset(0)
                    make.width.equalTo(140)
                    make.height.equalTo(130)
                }

            
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
