# LiveActivitySample

### Live Activity에 대해 알아보고 샘플 만들어보기

<br>
<br>

<p>
  <img src="https://img.shields.io/badge/iOS-16.2+-blue"/>
</p>
<p align="leading">
  <img width="25%" src="https://github.com/cyeond/LiveActivitySample/assets/139483587/130beb50-0bfb-47ec-81e7-66862da8ba01">
  <img width="25%" src="https://github.com/cyeond/LiveActivitySample/assets/139483587/68b277a9-92ed-460e-b678-a316064270a2">
</p>
<p align="leading">
  <img width="20%" src="https://github.com/cyeond/LiveActivitySample/assets/139483587/35795156-8230-4858-b551-12c2d00065c5">
  <img width="20%" src="https://github.com/cyeond/LiveActivitySample/assets/139483587/ea2bd89f-6dc8-4d66-bdf5-e8ff9a83915b">
  <img width="20%" src="https://github.com/cyeond/LiveActivitySample/assets/139483587/37e5bc32-c6d9-4efd-849f-341156fa23bf">
</p>

<br>

## 기본 내용
- ActivityKit 사용
- 잠금화면 또는 다이나믹 아일랜드에 앱 실시간 현황을 보여줌
- App setting → Info → Supports Live Activities 추가 필요(알림 및 실시간 현황 권한)
- 대부분 기능이 iOS 16.1 버전부터 지원(+ 다이나믹 아일랜드는 아이폰 14 프로 기기 이상부터)

<br>

## 시행 착오
- ActivityAttributes가 Codable을 채택하고 있어서 이미지를 직접 넘겨줄 수 없음
  - 해결 방안: 이미지를 Data로 변환하여 사용함
   
<br>

- Activity를 통해 넘겨주는 데이터의 크기가 4KB를 초과할 수 없음
  - 해결 방안: 이미지를 변환한 Data를 UserDefaults에 저장하여 사용함(앱과 위젯 extension 간 group 세팅)
 
<br>

- 일정 용량 이상의 파일은 UserDefaults를 통해 불러오지 못함
  - 해결 방안: 이미지를 리사이징해서 사용함
 
<br>

- Live Activity에 버튼 액션을 지원하지 않음
  - 애플 자체 앱 또는 시스템에서 Live activity를 제어하는 앱(ex: 음악 재생 앱)에만 버튼 액션이 들어가는 듯함
  - 애플 측 답변
    - 잠금 화면 및 다이나믹 아일랜드의 Live activity는 버튼이나 기타 컨트롤과 같은 상호 작용을 제공하지 않습니다. 이러한 이유로 UI에 버튼과 유사한 어떤 것도 표시하지 않으려고 합니다.

<br>
<br>
