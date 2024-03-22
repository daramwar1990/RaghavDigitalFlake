//
//  DetailsViewController.swift
//  DigitalFlake
//
//  Created by saurabh wattamwar on 22/03/24.
//

import UIKit

class DetailsViewController: UIViewController {

    var arrnames = ["Pune","Mumbai","Delhi","Bengaluru","Kolkata","Jaipur"]
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var listTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
        
        // Do any additional setup after loading the view.
    }
//MARK: Initiak setup
    func setUp(){
        self.btnBack.isHidden = true
        listTableView.delegate = self
        listTableView.dataSource = self
        self.listTableView.layer.cornerRadius = 20
        listTableView.register(UINib(nibName: "NotifyTableViewCell", bundle: nil), forCellReuseIdentifier: "NotifyTableViewCell")
    }
    @IBAction func btnBackClicked(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
}

extension DetailsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrnames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifyTableViewCell", for: indexPath) as! NotifyTableViewCell
        cell.selectionStyle = .none
        cell.btnNotify.tag = indexPath.row
        cell.lblNotify.text = arrnames[indexPath.row]
        cell.closureNotify = {
            tag in
            self.showNotification(tag: tag)
        }
        return cell
    }
    
    func showNotification(tag: Int){
        var lablLocal = self.arrnames[tag]
        let alert = UIAlertController(title: lablLocal, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: {
            action in
            
        }))
        self.present(alert,animated: true)
    }
    
    
}

extension DetailsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
