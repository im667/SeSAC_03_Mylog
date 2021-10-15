//
//  ViewController.swift
//  SeSAC_03_Mylog
//
//  Created by mac on 2021/10/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //present -> Dissmiss
    @IBAction func IsClickedMEMO(_ sender: UIButton) {
    //  1.스토리보드 특정
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
    //  2. 스토리보드 안에 많은 뷰 컨트롤러 중 전환하고자 하는 뷰 컨트롤러 가져오기
        let vc = storyboard.instantiateViewController(withIdentifier: "MemoTableViewController") as! MemoTableViewController
        

        
        //2-1 네이게이션 컨트롤러 임베드
        let nav = UINavigationController(rootViewController: vc)

        //(옵션)트랜지션 스타일 (전환 방식)
//        vc.modalTransitionStyle = .coverVertical //디폴트 값
        nav.modalTransitionStyle = .crossDissolve
        nav.modalPresentationStyle = .fullScreen
        
        
        
    //  3.Present
        self.present(nav, animated: true, completion: nil)
    }
    
    
    
    
    //Push - Pop
    @IBAction func IsClickedMovie(_ sender: UIButton) {
        
        //  1.스토리보드 특정
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
        //  2. 스토리보드 안에 많은 뷰 컨트롤러 중 전환하고자 하는 뷰 컨트롤러 가져오기
            let vc = storyboard.instantiateViewController(withIdentifier: "MovieTableViewController") as! MovieTableViewController
            
        //  3.Present
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

