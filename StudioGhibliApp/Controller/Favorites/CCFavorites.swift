//
//  CCFavorites.swift
//  StudioGhibliApp
//
//  Created by Caroline Feldhaus de Souza on 05/11/21.
//

import UIKit
import SnapKit

class CCFavorites: UITableViewCell {
    
    static var favoriteCell = "celulaCustomizada"

    @IBOutlet weak var titleFav: UILabel!
    @IBOutlet weak var imageFav: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //usando SnapKit para as constraints
                titleFav.snp.makeConstraints { make in
                    
                    make.top.equalTo(self).offset(10)
                    make.right.equalTo(self).offset(-10)
                    make.left.equalTo(imageFav.snp.right).offset(0)
                    make.bottom.equalTo(self).offset(-10)
                    
                }
                    
                imageFav.snp.makeConstraints { make in
                    
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

