//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Arpit Inder Singh on 06/11/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var fav: UIButton!
    var tweetId: Int = -1
    
    var isFavorite:Bool = false
    var isRetweeted:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !isFavorite
        if toBeFavorited {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Retweet did not succeed")
        })
    }
    
    func setFavorite(_ isFavorite:Bool) {
        self.isFavorite = isFavorite
        if(self.isFavorite) {
            self.fav.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            self.fav.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted: Bool) {
        self.isRetweeted = isRetweeted
        if(self.isRetweeted) {
            self.retweet.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            self.retweet.isEnabled = false
        } else {
            self.retweet.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            self.retweet.isEnabled = true
        }
    }
}
