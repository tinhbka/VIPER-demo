//
//  MovieTableViewCell.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ movie: Movie) {
        self.mTitle.text = movie.title
        self.mDescription.text = movie.brief

        if let source = movie.imagesource, let url = URL(string: source) {
            mImageView.af_setImage(withURL: url)
        }
    }

}
