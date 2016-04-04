//
//  MusicVideoDetailVC.swift
//  MusicVideo
//
//  Created by Officefront on 30/03/16.
//  Copyright © 2016 jfol73. All rights reserved.
//

import UIKit

class MusicVideoDetailVC: UIViewController {
    
    var videos:Videos!
    
    
    @IBOutlet weak var vName: UILabel!
    
    
    @IBOutlet weak var videoImage: UIImageView!
    
    
    
    @IBOutlet weak var vGenre: UILabel!
    
    
    @IBOutlet weak var vPrice: UILabel!
    
    
    @IBOutlet weak var vRights: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MusicVideoDetailVC.preferredFontChange), name: UIContentSizeCategoryDidChangeNotification, object: nil)
        
        
        title = videos.vArtist
        vName.text = videos.vName
        vPrice.text = videos.vPrice
        vRights.text = videos.vRights
        vGenre.text = videos.vGenre
        
        if videos.vImageData != nil {
            videoImage.image = UIImage(data: videos.vImageData!)
        } else {
            videoImage.image = UIImage(named: "imageNotAvailable")
        }
    }
    
    func preferredFontChange() {
        print("The preferred font has changed")
        vName.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        vPrice.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        vRights.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        vGenre.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
