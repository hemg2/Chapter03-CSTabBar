//
//  CSTabBarController.swift
//  Chapter03-CSTabBar
//
//  Created by 1 on 2022/07/11.
//

import UIKit

class CSTabBarController: UITabBarController {
    
    let csView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
    
    override func viewDidLoad() {
        // 처음에 첫 번째 탭이 선택되어 있도록 초기 상태를 정의해 준다.
        self.onTabBarItemClick(self.tabItem01)
        // 기존 탭 바를 숨김처리
        self.tabBar.isHidden = true
        
        let width = self.view.frame.width //뷰의 너비를 화면전체와 동일하게
        let height: CGFloat = 50 // 높이 50
        let x: CGFloat = 0 // 탭바처럼 빈공간 없이 채워지도록 0설정
        let y = self.view.frame.height - height
        
        // 정의된 값을 이용하여 새로운 뷰의 속성을 설정합니다.
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = .brown
        
        self.view.addSubview(self.csView)
        // 버튼의 너비와 높이 설정
        let tabBtnWidth = self.csView.frame.size.width / 3
        let tabBtnHeight = self.csView.frame.height
        
        // 버튼 영역을 차례로 설정한다
        self.tabItem01.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem02.frame = CGRect(x: tabBtnWidth, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem03.frame = CGRect(x: tabBtnWidth * 2, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        
        // 버튼의 공통 속성을 설정 뷰에 추가
        self.addTabBarBtn(btn: self.tabItem01, title: "첫 번째 버튼", tag: 0)
        self.addTabBarBtn(btn: self.tabItem02, title: "두 번째 버튼", tag: 1)
        self.addTabBarBtn(btn: self.tabItem03, title: "세 번째 버튼", tag: 2)
    }
    // 버튼의 공통 속성을 정의하기 위한 메소드
    func addTabBarBtn(btn: UIButton, title:String, tag:Int) {
        // 버튼의 타이틀과 태그값을 입력
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        // 버튼의 텍스트 색상을 일반 상태와 선택된 상태로 나누어 설정
        btn.setTitleColor(UIColor.white, for: .normal)  // 일반 상태의 버튼 색상
        btn.setTitleColor(UIColor.yellow, for: .selected) //선택되었을 때의 버튼 색상
        
        // 버튼에 액션 메소드를 연결한다.
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        
        self.csView.addSubview(btn)
    }
    
    @objc func onTabBarItemClick(_ sender: UIButton) {
        // 모든 버튼을 선택되지 않은 상태로 초기화 처리한다.
        self.tabItem01.isSelected = false
        self.tabItem02.isSelected = false
        self.tabItem03.isSelected = false
        
        //인자값으로 입력된 버튼만 선택된 상태로 변경한다.
        sender.isSelected = true
        
        // 버튼에 설정된 태그값을 사용하여 뷰 컨트롤러를 전환한다.
        self.selectedIndex = sender.tag
    }
}
