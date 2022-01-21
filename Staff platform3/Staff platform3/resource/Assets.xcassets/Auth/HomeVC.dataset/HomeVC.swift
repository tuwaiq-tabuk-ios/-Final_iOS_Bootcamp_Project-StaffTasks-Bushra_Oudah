//
//  HomeVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit


class HomeVC: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
  
  
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var bossButton: UIButton!
  @IBOutlet weak var employeeButton: UIButton!
  @IBOutlet weak var LoginBtn: UIButton!
  
  var arrPic = [UIImage(named: "pic1"),UIImage(named: "pic2"),UIImage(named: "pic3"),UIImage(named: "pic4"),UIImage(named: "pic5")]
  var timer: Timer?
  var currentCellIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    pageControl.numberOfPages = arrPic.count
    
    bossButton.cmShadow()
    employeeButton.cmShadow()
    LoginBtn.cmShadow()
    startTimer()
  }
  
  
  func startTimer(){
    timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
  }
  
  
  @objc func moveToNextIndex(){
    if currentCellIndex < arrPic.count - 1 {
      currentCellIndex += 1
    } else {
      currentCellIndex = 0
    }
    collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
    pageControl.currentPage = currentCellIndex
  }
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrPic.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! CollectionViewCell
    
    cell.imageCollection.image = arrPic[indexPath.row]
    return cell
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
}
extension HomeVC :Storyboarded{
    static var storyboardName: StoryboardName = .main
}

