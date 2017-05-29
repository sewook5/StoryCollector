//
//  ViewController.swift
//  StoryCollector
//
//  Created by Matthew Oh on 5/25/17.
//  Copyright © 2017 BB Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var stories : [Story] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            stories = try context.fetch(Story.fetchRequest())
            print(stories)
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let story = stories[indexPath.row]
        cell.textLabel?.text = story.title
        cell.imageView?.image = UIImage(data: story.imageToAdd as! Data)
        return cell
    }
}

