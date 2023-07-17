# LiveActivitySample

### Live Activity에 대해 알아보고 샘플 만들어보기

<br>
<br>

<p align="leading">
  <img width="25%" src="https://github.com/cyeond/LiveActivitySample/assets/139483587/b236e5f1-6c14-4d45-afbd-5a005fb5006f">
</p>

<br>

## 기본 내용
- ActivityKit 사용
- 잠금화면 또는 다이나믹 아일랜드에 앱 실시간 현황을 보여줌
- App setting → Info → Supports Live Activities 추가 필요(알림 및 실시간 현황 권한)
- 대부분 기능이 iOS 16.1 버전부터 지원(+ 다이나믹 아일랜드는 아이폰 14 프로 기기 이상부터)

<br>

## 시행 착오
- Live Activity에 버튼 액션을 지원하지 않음
  - 애플 자체 앱 또는 시스템에서 Live activity를 제어하는 앱(ex: 음악 재생 앱)에만 버튼 액션이 들어가는 듯함
  - 애플 측 답변
    - 잠금 화면 및 다이나믹 아일랜드의 Live activity는 버튼이나 기타 컨트롤과 같은 상호 작용을 제공하지 않습니다. 이러한 이유로 UI에 버튼과 유사한 어떤 것도 표시하지 않으려고 합니다. 자세한 내용은 아래 HIG 문서를 참고해주시기 바랍니다.
    - https://developer.apple.com/design/human-interface-guidelines/components/system-experiences/live-activities/
<br>

- 다이나믹 아일랜드에 이미지를 넣을 때 규격을 맞추지 않으면 Live activity가 아예 실행되지 않음
  - 이미지 용량보다는 해상도에 영향을 받는 것으로 보임
  - png 이미지로 테스트했을 때 220x220 크기까지 동작하는 것을 확인
  - 정확한 규격이 명시되어 있는 문서는 아직 찾지 못함

<br>
<br>
