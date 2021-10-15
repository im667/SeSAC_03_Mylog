//
//  MemoTableViewController.swift
//  SeSAC_03_Mylog
//
//  Created by mac on 2021/10/12.
//

import UIKit

class MemoTableViewController: UITableViewController {
    
    
    var list = [Memo]() {
        didSet{
           saveData()
        }
    }

    @IBOutlet weak var memoTextView: UITextView!
    
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        
        //셀 자동 높이 계산 UITableView.automaticDimension
        
        
        loadData()
      }
    
    @objc func closeButtonClicked(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveBtn(_ sender: UIButton) {
        //배열에 텍스트뷰의 텍스트 값 추가
        if let text = memoTextView.text{
            
            let segmentIndex = categorySegmentedControl.selectedSegmentIndex
            
            let segmentCategory = Category(rawValue: segmentIndex) ?? .others
            
            let memo = Memo(content: text, category: segmentCategory)
            
            list.append(memo)
//            tableView.reloadData()
 
        } else {
            print("ERROR")
        }
        
    }
    func loadData(){
        let userDefaults = UserDefaults.standard
        
        if let data = userDefaults.object(forKey: "memoList") as? [[String:Any]]{
            
            var memo = [Memo]()
            
            for datum in data {
                
                guard let category = datum["category"] as? Int else {return}
                guard let content = datum["content"] as? String else {return}
                
                let enumCategoty = Category(rawValue: category) ?? .others
                
                memo.append(Memo(content: content, category: enumCategoty))
            }
            
            self.list = memo
        }
    }
    
    
    func saveData(){
        var memo:[[String:Any]] = []
      
        for i in list {
            let data: [String:Any] = [
                "category": i.category.rawValue,
                "content": i.content
            ]
            memo.append(data)
        }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(memo, forKey: "memoList")
        
        tableView.reloadData()
    }
    
    //옵션: 섹션의 수: numberOfSections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //옵션: 섹션 타이틀설정:titleForHeaderInSection
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "섹션타이틀"
    }
    
    //필수 : 1. 셀의 갯수: numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if section == 0 {
//            return 2 // 0번 index에 해당하는 section에는 2개의 셀
//        } else if section == 1 {
//            return 4 // 그렇지 않으면 4개
//        } else {
//            return 3
//        }
        
        return section == 0 ? 2 : list.count
    }
    
    //필수 : 2. 셀의 디자인 및 데이터처리: cellForRowAt
    //재사용 메커니즘, 옵셔널 체이닝, 옵셔널 바인딩
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        //Early Exit
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell") else{
            return UITableViewCell()
        }
        
        
        if indexPath.section == 0 {
            
            cell.textLabel?.text = " 첫번째 섹션 입니다. - \(indexPath)"
            cell.textLabel?.textColor = .brown
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            cell.imageView?.image = nil
            cell.detailTextLabel?.text = nil
        } else {
            
            let row = list[indexPath.row]
            
            cell.textLabel?.text = row.content
            cell.detailTextLabel?.text = row.category.description
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .italicSystemFont(ofSize: 13)
       
            switch row.category {
            case .business: cell.imageView?.image = UIImage(systemName: "building.2")
            case .personal: cell.imageView?.image = UIImage(systemName: "person")
            case .others: cell.imageView?.image = UIImage(systemName: "square.and.pencil")
            }
            
            cell.imageView?.tintColor = .red
        }
        
        return cell
        
    }
    
    //옵션(didSelectRowAt) 셀을 클릭했을 때 기능
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("셀 선택")
    }
    
    
    //옵션(default = 44px) 필수 권장 3. 셀의 높이: heightForRowAt
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return indexPath.section == 0 ? 44 : 80
        return indexPath.row == 0 ? 44 : 80
    }
    
    //옵션 셀 스와이프 ON/OFF 유무
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? false : true
    }
    
  //옵션 셀 편집 상태 : edittingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
        
        if editingStyle == .delete{
            list.remove(at: indexPath.row)
//            tableView.reloadData()
        }
        }
    }
}
