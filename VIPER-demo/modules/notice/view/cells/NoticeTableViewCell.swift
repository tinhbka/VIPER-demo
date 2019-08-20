//
//  NoticeTableViewCell.swift
//  VIPER-demo
//
//  Created by Tinh Vu on 8/20/19.
//  Copyright © 2019 Alatin. All rights reserved.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {

    @IBOutlet private weak var id: UILabel!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var brief: UILabel!
    @IBOutlet private weak var file_source: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ notice: Notice) {
        self.id.text = notice.id
        self.title.text = notice.title
        self.brief.text = notice.brief
        self.file_source.text = notice.filesource
    }
}
