//
//  DetailViewController.swift
//  MovieViewer
//
//  Created by Bhatt, Gaurang on 2/13/16.
//  Copyright © 2016 Gb0143. All rights reserved.
//

import UIKit
import Cosmos

class DetailViewController: UIViewController {

    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var scrlDetails: UIScrollView!
    @IBOutlet weak var lblInfo: UIView!
    @IBOutlet weak var rtngStars: CosmosView!
    
    var movie: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(movie)
        lblTitle.text = movie["title"] as? String
        lblOverview.text = movie["overview"] as? String
        lblOverview.sizeToFit()
        lblInfo.frame.size = CGSize(width: lblInfo.frame.size.width, height: lblOverview.frame.size.height + lblTitle.frame.size.height + rtngStars.frame.size.height + 10)
        
        scrlDetails.contentSize = CGSize(width: scrlDetails.frame.size.width, height: lblInfo.frame.origin.y + lblInfo.frame.size.height + 50);
        
        let baseURL = "http://image.tmdb.org/t/p/w500";
        if let posterPath = movie["poster_path"] as? String {
            let imageURL = NSURL(string: baseURL + posterPath)
            imgPoster.setImageWithURL(imageURL!);
        }
        
        rtngStars.rating = movie["vote_average"] as! Double
        // Do any additional setup after loading the view.
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
