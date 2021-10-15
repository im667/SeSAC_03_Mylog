//
//  MovieTableViewController.swift
//  SeSAC_03_Mylog
//
//  Created by mac on 2021/10/13.
//

import UIKit

class MovieTableViewController: UITableViewController {
    let movieInfomation = MovieInfomation()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "닫기", style: .plain, target: self, action: #selector(isClickedCloseBtn))
    }
    
    @objc func isClickedCloseBtn(){
        //Push-Pop
//        self.navigationController?.popViewController(animated: true)
        
//        self.dismiss(animated: true, completion: nil))
            
            }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInfomation.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        //타입캐스팅 MovieTableViewCell을 연결 / guard로 nil이 아닐경우만 cell연결. 연결 안될시 비어있는 UITableViewCell() 반환
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let row = movieInfomation.movie[indexPath.row]
        
        cell.posterImageView.backgroundColor = .red
        cell.posterImageView.image = UIImage(named: row.title)
        cell.titleLable.text = row.title
        cell.releaseDateLabel.text = row.releaseDate
        cell.overviewLabel.text = row.overview
        cell.overviewLabel.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 5
    }
    //cell클릭했을때
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "MyMovie", bundle: nil)
        
//        guard let vc = sb.instantiateViewController(withIdentifier: "MyMovieViewController") as? MyMovieViewController else {
//            print("ERROR")
//            return
//        }
        
        let vc = sb.instantiateViewController(withIdentifier: "MyMovieViewController") as! MyMovieViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
