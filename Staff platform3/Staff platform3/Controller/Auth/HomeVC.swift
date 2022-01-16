//
//  HomeVC.swift
//  Staff platform3
//
//  Created by Bushra alatwi on 19/05/1443 AH.
//

import UIKit


class HomeVC: UIViewController {
  
  // MARK: - Properties
  
  var arrPic = [UIImage(named: "pic1"),
                UIImage(named: "pic2"),
                UIImage(named: "pic3"),
                UIImage(named: "pic4"),
                UIImage(named: "pic5")]
  var timer: Timer?
  var currentCellIndex = 0
  
  
  // MARK: - IBOoutLet
  
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var signUpBossBtn: UIButton!
  @IBOutlet weak var signUpEmpBtn: UIButton!
  @IBOutlet weak var LoginBtn: UIButton!
  
  
  // MARK: - View controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    overrideUserInterfaceStyle = .light
    collectionView.delegate = self
    collectionView.dataSource = self
    pageControl.numberOfPages = arrPic.count
    signUpBossBtn.cmShadow()
    signUpEmpBtn.cmShadow()
    LoginBtn.cmShadow()
    startTimer()
    navigationItem.setHidesBackButton(true, animated: true)
  }
  
  // MARK: - Methods
  
  
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
}
// MARK: - Table data source

extension HomeVC: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arrPic.count
  }
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! CollectionViewCell
    cell.imageCollection.image = arrPic[indexPath.row]
    return cell
  }
}

// MARK: - Navigation

extension HomeVC: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
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

