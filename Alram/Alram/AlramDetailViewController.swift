//
//  AlramDetailViewController.swift
//  Watch
//
//  Created by 이가영 on 2020/05/07.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit


class AlramDetailViewController: UIViewController {
    var countAlram: Int = 0
   
    @IBOutlet weak var clockPicker: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveBtn: UIBarButtonItem!
    @IBOutlet weak var cancelBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func SaveData(_ sender: UIBarButtonItem) {
        if clockdata == nil ||  Alram.isEmpty {
            let alert = UIAlertController(title: "잠깐!", message: "시간이 지정되지 않았거나 반복회수를 지정하지 않았습니다.", preferredStyle: .alert)
            let alertaction = UIAlertAction(title: "OK", style: .default, handler: nil)

            alert.addAction(alertaction)

            present(alert, animated: true, completion: nil)
        }else{
            let item: AlramMD = AlramMD(clock: clockdata!, repeatAlram: Alram[countAlram].repeatAlram , isInsert: true)
            Alram.append(item)
            countAlram+=1
            print(item.repeatAlram)
            let alert = UIAlertController(title: "확인", message: "시간이 \(item.clock)이 맞습니까?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.navigationController?.popViewController(animated: true)
            })
            let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            
            alert.addAction(alertAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    @IBAction func cancelData(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ChooseDate(_ sender: UIDatePicker) {
        clockPicker.addTarget(nil, action: #selector(change), for: .valueChanged)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func change(){
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .none
        dateformatter.timeStyle = .short
        let date = dateformatter.string(from: clockPicker.date)
        clockdata = date
        print(date)
    }
    

}

extension AlramDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reapetcell", for: indexPath)
        
        cell.textLabel?.text = "반복"
        
        return cell
    }
    
    
}
