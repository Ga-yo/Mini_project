//
//  ViewController.swift
//  18_blueLlibrary
//
//  Created by 이가영 on 2020/04/13.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var undoBarButtonItem: UIBarButtonItem!
    @IBOutlet var trashBarButtonItem: UIBarButtonItem!
    
    private var currentAlbumIndex = 0
    private var currentAlbumData: [AlbumData]?
    private var allAlbums = [Album] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        allAlbums = LibraryAPI.share.getAlbums()
        showDataForAlbum(at:currentAlbumIndex)

        
    }

    private func showDataForAlbum(at index: Int){
        if (index < allAlbums.count && index > -1) {
            let album = allAlbums[index]
            currentAlbumData = album.tableRepresentation
        }else{
            currentAlbumData = nil
        }
        
        tableView.reloadData()
    }
    

}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let albumData = currentAlbumData else {
            return 0
        }
        return albumData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentiifer = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentiifer, for: indexPath)
        if let albumData = currentAlbumData{
            let row = indexPath.row
            cell.textLabel?.text = albumData[row].title
            cell.detailTextLabel?.text = albumData[row].value
        }
        return cell
    }
    
    
}
