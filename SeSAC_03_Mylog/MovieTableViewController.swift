//
//  MovieTableViewController.swift
//  SeSAC_03_Mylog
//
//  Created by mac on 2021/10/13.
//

import UIKit

class MovieTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        //타입캐스팅 MovieTableViewCell을 연결 / guard로 nil이 아닐경우만 cell연결. 연결 안될시 비어있는 UITableViewCell() 반환
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.posterImageView.backgroundColor = .red
        cell.titleLable.text = "7번방의 선물"
        cell.releaseDateLabel.text = "2021.02.02"
        cell.overviewLabel.text = "영화 줄거리가 보이는 곳 입니다.영화 줄거리가 보이는 곳 입니다.영화 줄거리가 보이는 곳 입니다.영화 줄거리가 보이는 곳 입니다.영화 줄거리가 보이는 곳 입니다.영화 줄거리가 보이는 곳 입니다.영화 줄거리가 보이는 곳 입니다."
        cell.overviewLabel.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 5
    }
}
