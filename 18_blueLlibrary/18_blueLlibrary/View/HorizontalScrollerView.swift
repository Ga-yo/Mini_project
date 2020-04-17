//
//  HorizontalScrollerView.swift
//  18_blueLlibrary
//
//  Created by 이가영 on 2020/04/16.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

//수평 스크롤 내부의 데이터 소스 요청과 반환
protocol HorizontalSxrollerViewDataSOurce: class {
    func numberOfViews(in horizontalScrollerView: HorizontalScrollerView) -> Int

    func horizontalScrollerView(_ horizontalScrollerView: HorizontalScrollerView, viewAt index: Int) -> UIView

}

protocol  HorizontalScrollerViewDelegate : class  {
   // <index>의 뷰가 선택되었음을 대리자에게 알려
    func horizontalScrollerView(_ horizontalScrollerView: HorizontalScrollerView, didSelectViewAt index: Int)

}

class HorizontalScrollerView: UIView {

    weak var dataSource: HorizontalSxrollerViewDataSOurce?
    weak var delegate: HorizontalScrollerViewDelegate?
    
    private enum ViewConstants{
        static let Padding: CGFloat = 10
        static let Dimensions: CGFloat = 100
        static let Offset: CGFloat = 100
    }
    
    private let scroller = UIScrollView()
    private var contentViews = [UIView]()
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        initaializeScrollView()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        initaializeScrollView()
    }
    
    func initaializeScrollView(){
        addSubview(scroller)
        
        scroller.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scroller.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scroller.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scroller.topAnchor.constraint(equalTo: self.topAnchor),
            scroller.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollerTapped(gesture:)))
        scroller.addGestureRecognizer(tapRecognizer)
        
        scroller.delegate = self
        
    }
    
    func scrollToView(at index: Int, animated: Bool = true) {
      let centralView = contentViews[index]
      let targetCenter = centralView.center
      let targetOffsetX = targetCenter.x - (scroller.bounds.width / 2)
      scroller.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: animated)
    }
    
    @objc func scrollerTapped(gesture: UITapGestureRecognizer) {
      let location = gesture.location(in: scroller)
      guard
        let index = contentViews.index(where: { $0.frame.contains(location)})
        else { return }
      
      delegate?.horizontalScrollerView(self, didSelectViewAt: index)
      scrollToView(at: index)
    }

    func view(index: Int) -> UIView{
        return contentViews[index]
    }
    
    func reload() {
      guard let dataSource = dataSource else {
        return
      }
      //오래된 뷰를 지운다
      contentViews.forEach { $0.removeFromSuperview() }
      
      //앨범표지를 지워야하므로 기존 보기 제거
      var xValue = ViewConstants.Offset
      //새로운 뷰를 가진다
      contentViews = (0..<dataSource.numberOfViews(in: self)).map {
        index in
        //새로운 컨텐츠를 보는 배열(?).
        xValue += ViewConstants.Padding
        let view = dataSource.horizontalScrollerView(self, viewAt: index)
        view.frame = CGRect(x: CGFloat(xValue), y: ViewConstants.Padding, width: ViewConstants.Dimensions, height: ViewConstants.Dimensions)
        scroller.addSubview(view)
        xValue += ViewConstants.Dimensions + ViewConstants.Padding
        return view
      }
              scroller.contentSize = CGSize(width: CGFloat(xValue + ViewConstants.Offset), height: frame.size.height)
    }
    
    //앨범 표지가 센터에 있는지 확인
    private func centerCurrentView(){
        let centerRect = CGRect(
            origin: CGPoint(x: scroller.bounds.midX - ViewConstants.Padding, y: 0),
            size: CGSize(width: ViewConstants.Padding, height: bounds.height)
        )
        
        guard let selectedIndex = contentViews.index(where: { $0.frame.intersects(centerRect) }) else
        {return}
        
        let centralView = contentViews[selectedIndex]
        let targetCenter = centralView.center
        let targetOffsetX = targetCenter.x - (scroller.bounds.width / 2)
        
        scroller.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: true)
        delegate?.horizontalScrollerView(self, didSelectViewAt: selectedIndex)
    }
}


extension HorizontalScrollerView: UIScrollViewDelegate {
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    if !decelerate {
      centerCurrentView()
    }
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    centerCurrentView()
  }
}

  
   

   

