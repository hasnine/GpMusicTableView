
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerTableview: UITableView!
    @IBOutlet weak var bodyTableview: UITableView!
    
    var tArray = ["1","2","3","4","1","2","3","4","1","2","3","4","3","4","1","2","3","4","3","4","1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bodyTableview.delegate = self
        bodyTableview.dataSource = self
        headerTableview.delegate = self
        headerTableview.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return tArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
        if(tableView == headerTableview)   {
             let cell1 = self.headerTableview.dequeueReusableCell(withIdentifier: "cell1") as! headerCellTableViewCell
            cell1.bodyImage.image = UIImage(named: tArray[indexPath.row])
            cell1.layoutIfNeeded()
             return cell1
        }else{
            let cell2 = self.bodyTableview.dequeueReusableCell(withIdentifier: "cell2") as! bodyTableviewCell
            cell2.bodyImage.image = UIImage(named: tArray[indexPath.row])
            cell2.bodyLabel.text = "Cell no: \(indexPath.row)"
            cell2.layoutIfNeeded()
             return cell2
        }
        
       
    }
    
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let firstVisibleIndexPath = self.bodyTableview.indexPathsForVisibleRows?[0]
        //ChangeHeader(index: firstVisibleIndexPath!, section: (firstVisibleIndexPath?.section)!, row: (firstVisibleIndexPath?.row)!)
        ChangeHeader(index: firstVisibleIndexPath!, section: (firstVisibleIndexPath?.section)!, row: (firstVisibleIndexPath?.row)!) { (succes) in
            if succes{
                print(firstVisibleIndexPath?.row as Any,"Hello i am here")
                //headerTableview.beginUpdates()
                headerTableview.scrollToRow(at: firstVisibleIndexPath!, at: UITableView.ScrollPosition.middle, animated: true)
                //headerTableview.endUpdates()
            }else{
                print("Missed")
            }
            
        }
        print("First visible cell section=\(String(describing: firstVisibleIndexPath?.section)), and row=\(String(describing: firstVisibleIndexPath?.row))")

    }

    
    
    func ChangeHeader(index: IndexPath,section: Int ,row : Int, completion: (Bool) -> ()) {
        print("First line of code executed")
        let moveToIndexPath = index
                self.headerTableview.reloadRows(at: [moveToIndexPath as IndexPath], with: .none)
                self.headerTableview.scrollToRow(at: moveToIndexPath as IndexPath, at: UITableView.ScrollPosition(rawValue: row)!, animated: true)
                headerTableview.reloadRows(at: [index], with: .bottom)
        
        completion(true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == headerTableview{
            return 180
        }
        return 85
    }
}
