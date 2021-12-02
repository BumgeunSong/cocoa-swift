//
//  DummyData.swift
//  Sprep_2
//
//  Created by Bumgeun Song on 2021/12/01.
//

import Foundation

class Dummy {
    var dum = DummyCards()
    lazy var OSCards = [dum.card1, dum.card2, dum.card3, dum.card4]
    lazy var HTTPCards = [dum.card5, dum.card6, dum.card7, dum.card8, dum.card9]
    lazy var decks = [Deck(cards: OSCards, name: "OS"), Deck(cards: HTTPCards, name: "HTTP")]
    
}

class DummyCards {

    var card1 = Card(id: UUID(),front: "운영체제란 무엇인가?", back: "운영체제는 컴퓨터 시스템을 운영하는 소프트웨어다. 즉, 하드웨어를 다룰 수 있는 기능을 어플리케이션에게 제공해준다.", lastTestTime: Date.init(timeIntervalSinceNow: Double.random(in: (-300000)..<(-86400))))
    
    var card2 = Card(id: UUID(), front: "지역성(Locality)이란 무엇인가?", back: "프로세스가 데이터의 특정 영역을 집중적으로 참조하는 현상. \n한번 참조한 곳이나 최근에 참조한 곳을 더 많이 참조하는 현상이다.", lastTestTime: Date.init(timeIntervalSinceNow: Double.random(in: (-300000)..<(-86400))))
    
    var card3 = Card(id: UUID(), front: "프로세스란 무엇인가?", back: "실행 중인 프로그램을 말한다. 좀 더 정확히 말하면, 운영체제가 메모리를 할당해서 프로세서가 연산할 준비가 된 프로그램이다.",  lastTestTime: Date.init(timeIntervalSinceNow: Double.random(in: (-300000)..<(-86400))))
    
    var card4 = Card(id: UUID(), front: "컨텍스트 스위칭(Context Switching)이란?", back: "컨텍스트 스위칭은 CPU에서 처리 중인 프로세스가 바뀌는 것을 의미한다. \n컨텍스트 스위칭은 최소화하는 것이 성능에 좋다.", lastTestTime: Date.init(timeIntervalSinceNow: Double.random(in: (-300000)..<(-86400))))
    
    var card5 = Card(id: UUID(), front: "HTTP에서 쿠키는 왜 사용하는가?", back: "HTTP는 무상태 프로토콜이기 때문에 클라이언트가 다시 요청하면 이전 요청을 기억하지 못한다.\n하지만 쿠키를 사용하면 상태를 유지할 수 있다.", lastTestTime: Date.init(timeIntervalSinceNow: Double.random(in: (-300000)..<(-86400))))
    
    var card6 = Card(id: UUID(), front: "HTTP에서 PUT과 PATCH의 차이는?", back: "PUT는 전체를 덮어쓴다. PATCH는 부분만 지정해서 업데이트할 수 있다. ", lastTestTime: Date.init(timeIntervalSinceNow: Double.random(in: (-300000)..<(-86400))))
    
    var card7 = Card(id: UUID(), front: "HTTP에서 리다이렉션은 무엇인가?", back: "HTTP 응답 결과에 300대 코드와 Location 헤더가 있으면 브라우저가 자동으로 Location 위치로 이동한다.", lastTestTime: Date.init(timeIntervalSinceNow: Double.random(in: (-300000)..<(-86400))))
    
    var card8 = Card(id: UUID(), front: "HTTP 메서드 중 '안전(safe)'한 것은 무엇인가?", back: "GET. GET은 여러 번 호출 해도 대상 리소스가 변하지 않는다.", lastTestTime: Date.init(timeIntervalSinceNow: Double.random(in: (-300000)..<(-86400))))
    
    var card9 = Card(id: UUID(), front: "HTTP의 특징인 무상태(Stateless)란 무엇인가?", back: "무상태란, 서버가 클라이언트의 상태를 저장하지 않는다는 뜻이다.", lastTestTime: Date.init(timeIntervalSinceNow: Double.random(in: (-300000)..<(-86400))))
    
    
}
