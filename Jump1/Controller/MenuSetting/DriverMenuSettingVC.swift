//
//  DriverMenuSettingVC.swift
//  Jump1
//
//  Created by vuminhtam on 5/15/21.
//

import UIKit

class DriverMenuSettingVC: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    var arrSetting: [String] = ["Thu nhập","Thanh toán","JUMP Benefits","Trợ giúp","Cài đặt"]

    var hideStatusBar: Bool = false {
            didSet {
                setNeedsStatusBarAppearanceUpdate()
            }
        }

        override var prefersStatusBarHidden: Bool {
               return hideStatusBar
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTableView.dataSource = self
        menuTableView.delegate = self
        menuTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(true);
        self.hideStatusBar = true
   }

    override func viewDidDisappear(_ animated: Bool) {
        self.hideStatusBar = false
    }
   
}

extension DriverMenuSettingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 114
        case 1:
            return 71
        case 2:
            return 81
        default:
            return 62
        }
    }
}

extension DriverMenuSettingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 + arrSetting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableCell", for: indexPath) as? ProfileTableCell  else {
                return UITableViewCell()
            }
            return setDataProfileCell(cell: cell)
        case 1, 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesTableCell", for: indexPath) as? MessagesTableCell  else {
                return UITableViewCell()
            }
            return setDataMessagesCell(cell: cell, indexPath: indexPath)
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableCell", for: indexPath) as? SettingTableCell  else {
                return UITableViewCell()
            }
            cell.nameLabel.text = arrSetting[indexPath.row - 3]
            return cell
        }
        
       
    }
    
    func setDataProfileCell(cell: ProfileTableCell) -> ProfileTableCell {
        cell.backgroundImageView.layer.cornerRadius = cell.backgroundImageView.frame.size.width/2
        cell.backgroundImageView.clipsToBounds = true
        return cell
    }
    
    func setDataMessagesCell(cell: MessagesTableCell, indexPath: IndexPath) -> MessagesTableCell {
        if indexPath.row == 1 {
            cell.arrowImage.isHidden = false
            cell.nameLabel.text = "Tin nhắn"
        } else {
            cell.arrowImage.isHidden = true
            cell.nameLabel.text = "TOYOTA FORTUNER 7(TRẮNG)"
        }
        return cell
    }
    
}
