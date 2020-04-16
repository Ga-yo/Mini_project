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
    
    @IBOutlet weak var horizontalScrollerView: HorizontalScrollerView!
    
    private var currentAlbumIndex = 0
    private var currentAlbumData: [AlbumData]?
    private var allAlbums = [Album] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        allAlbums = LibraryAPI.share.getAlbums()
        showDataForAlbum(at:currentAlbumIndex)

        horizontalScrollerView.delegate = self
        horizontalScrollerView.dataSource = self
        horizontalScrollerView.reload()
        
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

extension ViewController: HorizontalScrollerViewDelegate{
    func horizontalScrollerView(_ horizontalScrollerView: HorizontalScrollerView, didSelectViewAt index: Int) {
      //1
        let previousAlbumView = horizontalScrollerView.view(index: currentAlbumIndex) as! AlbumView
      previousAlbumView.highlightAlbum(false)
      //2
      currentAlbumIndex = index
      //3
        let albumView = horizontalScrollerView.view(index: currentAlbumIndex) as! AlbumView
      albumView.highlightAlbum(true)
      //4
      showDataForAlbum(at: index)
    }
}

extension ViewController: HorizontalSxrollerViewDataSOurce {
  func numberOfViews(in horizontalScrollerView: HorizontalScrollerView) -> Int {
    return allAlbums.count
  }
  
  func horizontalScrollerView(_ horizontalScrollerView: HorizontalScrollerView, viewAt index: Int) -> UIView {
    
    let album = allAlbums[index]
    let albumView = AlbumView(frame: CGRect(x: 0, y: 0, width: 100, height: 100 ))
    if currentAlbumIndex == index {
      albumView.highlightAlbum(true)
    } else {
      albumView.highlightAlbum(false)
    }
    return albumView
  }
}
