# 분석 정리

> contributor: 김보영

## 분석항목

- 풍향이 서울 미세먼지 농도에 영향을 미치는가?

## 데이터 수집

- [종관기상관측(ASOS)](https://data.kma.go.kr/data/grnd/selectAsosRltmList.do?pgmNo=36&tabNo=1) : 종관기상관측이란 종관규모의 날씨를 파악하기 위하여 정해진 시각에 모든 관측소에서 같은 시각에 실시하는 지상관측을 말함.
  - 제공 요소: 시간대별 기온, 습도, 기압, 지면온도, 풍향, 풍속, 일조
- [황사관측(PM10)](https://data.kma.go.kr/data/climate/selectDustRltmList.do?pgmNo=68) : 미세먼지 등 대기 중에 부유하는 에어로졸 중 직경이 10㎛ 이하인 입자의 농도를 관측한 자료
  - 제공 요소: 시간대별 미세먼지 농도
  
## 데이터 분석

### 1. 풍향이 미세먼지 농도에 영항을 미치는가?

- 2014년부터 2020년까지의 서울 기상관측소에서 측정된 풍향 데이터와 미세먼지 농도 데이터를 이용하여 풍향이 미세먼지 농도에 영향을 미치는지 알아보고 시각화함.
- 이를 위해 기상청 기상자료개방포털에서 해당 데이터를 1년 단위로 수집함. 종관기상관측(ASOS) 데이터에서는 풍향 데이터만 사용함. 
- 풍향 데이터와 미세먼지 데이터 모두 한시간마다 측정된 데이터임.
- 풍향 데이터는 숫자(각도)로 표현되어 있었기 때문에 16방위 풍향에 맞는 문자로 바꿔줌 (예: 270 -> N)
- 미세먼지 데이터에서 결측값이 상당수 있었기 때문에 미세먼지 데이터 전처리 실시함. 결측값은 하루동안의 평균 미세먼지 농도로 대체하였음.
- 년도별, 풍향별로 미세먼지 농도의 평균을 집계하여 그래프로 나타냄

## 분석 결과

- 2014년 풍향별 미세먼지 농도

<img src="https://user-images.githubusercontent.com/33210702/80915679-e3815d80-8d8e-11ea-935b-5b6dfa0f2540.png">

- 2015년 풍향별 미세먼지 농도

<img src="https://user-images.githubusercontent.com/33210702/80915706-06ac0d00-8d8f-11ea-8efd-4e692f1d5e20.png">

- 2016년 풍향별 미세먼지 농도

<img src="https://user-images.githubusercontent.com/33210702/80915724-162b5600-8d8f-11ea-893e-312fbcb79e6b.png">

- 2017년 풍향별 미세먼지 농도

<img src="https://user-images.githubusercontent.com/33210702/80915731-217e8180-8d8f-11ea-8464-e6c4621e865d.png">

- 2018년 풍향별 미세먼지 농도

<img src="https://user-images.githubusercontent.com/33210702/80915733-2ba08000-8d8f-11ea-95c9-15bc41132b33.png">

- 2019년 풍향별 미세먼지 농도

<img src="https://user-images.githubusercontent.com/33210702/81633651-32428d80-9448-11ea-9f10-267c63eb4dd0.png">

- 2020(1월~4월)년 풍향별 미세먼지 농도

<img src="https://user-images.githubusercontent.com/33210702/81633657-340c5100-9448-11ea-9acf-3b3bd231703c.png">

- 전체 기간 동안 미세먼지 농도가 100㎍/㎥ 이상일 때의 풍향을 나타낸 그래프

*WHO 기준 미세먼지 농도가 100㎍/㎥ 이상일 때 '매우 나쁨'임*

<img src="https://user-images.githubusercontent.com/33210702/81637722-06c4a080-9452-11ea-9c83-bedb322e5f02.png">

- 서풍 계열 바람의 비율이 절반 이상을 차지하고 있는 것을 알 수 있다.

### 2. 계절이 풍향과 미세먼지 농도에 영항을 미치는가?

- 2014년~2019년 6년동안 미세먼지 농도가 50㎍/㎥ 이하일 때('보통')와 100㎍/㎥ 초과일 때('매우 나쁨')의 주풍향을 그래프로 나타내었다.

## 분석결과

- 2014년~2019년 봄철 미세먼지 농도가 50㎍/㎥ 이하일 때의 주풍향 / 미세먼지 농도가 100㎍/㎥ 초과일 때의 주풍향

<img src="https://user-images.githubusercontent.com/33210702/82300544-f6806880-99f1-11ea-867c-588fa5809c98.png" width="400" height="415"><img src="https://user-images.githubusercontent.com/33210702/82300548-f8e2c280-99f1-11ea-8e39-20bc3fd6e5ee.png" width="400" height="415">


- 2014년~2019년 여름철 미세먼지 농도가 50㎍/㎥ 이하일 때의 주풍향 / 미세먼지 농도가 100㎍/㎥ 초과일 때의 주풍향


<img src="https://user-images.githubusercontent.com/33210702/82300553-faac8600-99f1-11ea-8468-17e7fd28c43c.png" width="400" height="415"><img src="https://user-images.githubusercontent.com/33210702/82300558-fbddb300-99f1-11ea-9d52-33ea5a0d1680.png" width="400" height="415">

- 2014년~2019년 가을철 미세먼지 농도가 50㎍/㎥ 이하일 때의 주풍향 / 미세먼지 농도가 100㎍/㎥ 초과일 때의 주풍향


<img src="https://user-images.githubusercontent.com/33210702/82300570-fe400d00-99f1-11ea-9830-802605d7b8ea.png" width="400" height="415"><img src="https://user-images.githubusercontent.com/33210702/82300578-00a26700-99f2-11ea-87fa-1ef1338d321d.png" width="400" height="415">

- 2014년~2019년 겨울철 미세먼지 농도가 50㎍/㎥ 이하일 때의 주풍향 / 미세먼지 농도가 100㎍/㎥ 초과일 때의 주풍향


<img src="https://user-images.githubusercontent.com/33210702/82300591-026c2a80-99f2-11ea-8460-b832d80a5fe0.png" width="400" height="415"><img src="https://user-images.githubusercontent.com/33210702/82300596-0435ee00-99f2-11ea-86ab-7569caa02895.png" width="400" height="415">


## 결론

- 우리나라는 1년 내내 편서풍의 영향을 받으므로 4계절 모두 서풍의 비율이 대체로 높게 나타나긴 함
- 미세먼지 농도가 50㎍/㎥ 이하일 때는 동풍 계열 바람의 비율이 100㎍/㎥ 초과일 때와 비교하여 비교적 높게 나타남
- 미세먼지 농도가 100㎍/㎥ 초과일 때는 서풍 계열 바람이 주풍향으로 나타남


* * *

### 상관 관계 분석

- 앞선 분석에서 서풍 계열 바람이 불 때 미세먼지 농도가 높게 나타난다는 것을 알게 되었다.
- 따라서 상관 관계 분석을 진행하기 위해 미세먼지 농도에 가장 영향을 높게 주는 것으로 나타난 서풍과 서북서풍에 변수를 '2'로, 나머지 서풍 계열에 변수를 '1'로, 그 외 나머지 풍향에 변수를 '0'으로 주었다.
- 이런 방식으로 부여한 풍향의 변수를 일자별로 count하여 하루동안 서풍이 얼마나 불었는지를 나타내었고, 일자별로 평균 미세먼지 농도도 집계하였다.
- 이렇게 해서 풍향과 미세먼지 농도와의 상관 관계 분석을 해보았다.

- 풍향 & 미세먼지 상관계수: <img src="https://user-images.githubusercontent.com/33210702/82301895-d651a900-99f3-11ea-8751-163ce15fcad7.PNG">

  - 위와 같이 상관계수가 약 0.22로 약한 양적 선형관계가 있는 것으로 나타남

- 산점도:
<img src="https://user-images.githubusercontent.com/33210702/82301883-d487e580-99f3-11ea-948f-08320cba056c.png">


#### 결론

- 대체로 서풍이 많이 불 수록 미세먼지 농도가 높아진다는 것을 알 수 있다.
