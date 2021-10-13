//
//  MemoTableViewController.swift
//  SeSAC_03_Mylog
//
//  Created by mac on 2021/10/12.
//

import UIKit

class MemoTableViewController: UITableViewController {
    
    var list:[String] = ["장 보기","메모 확인하기","영화보러가기","WWDC시청하기"]{
        didSet{
            tableView.reloadData()
        }
    }

    @IBOutlet weak var memoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

      }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        //배열에 텍스트뷰의 텍스트 값 추가
        if let text = memoTextView.text{
            list.append(text)
//            tableView.reloadData()
            print(list)
        } else {
            print("")
        }
        
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
        } else {
            cell.textLabel?.text = list[indexPath.row]
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .italicSystemFont(ofSize: 13)
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
