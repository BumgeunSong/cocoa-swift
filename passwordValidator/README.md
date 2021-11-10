#  비밀번호 입력 앱


##기본 동작

```
func passwordValidator(password:String) -> Int
```

View Controller 클래스에 입력 암호를 분석해서 다음 레벨을 리턴하는 메서드를 만든다.

- 숫자로만 구성되고 길이가 8글자 미만 : 아주 약한 암호(1 Level)
- 영문자로만 구성되고 길이가 8글자 미만 : 약한 암호 (2 Level)
- 영문자와 한 개 이상의 숫자로만 구성되어 있고 길이 8글자 이상 : 강한 암호 (4 Level)
- 영문자와 숫자, 특수문자(-, +, !, @, #, $, %)가 한 개 이상씩 구성되어 있고 길이가 8글자 이상 : 아주 강한 암호 (5 Level)
- 나머지 경우는 : 보통 암호 (3 Level)


## 설명 문구
- IBAction으로 연결하고 버튼을 누르면 입력값을 검사해서 레벨을 확인한다.
- 확인한 레벨에 맞도록 levelView 배경색과 설명 문구를 descriptionLabel에 표시한다.

레벨 |  배경색  |  설명문구     |
----|--------|-------------|
1   | red    |  아주 약한 암호 |
2   | orange |  약한 암호    |
3   | yellow |  보통 암호    |
4   | blue   |  강한 암호    |
5   | green  |  아주 강한 암호 |


## 결과 화면

![demo1](./passwordValidator/demo1.png)
![demo2](./passwordValidator/demo2.png)
![demo3](./passwordValidator/demo3.png)
