분석 정리
------------------
> Contributor 👩‍💻 : 임혜진


분석 항목
-------------------
1. 중국 도시의 미세먼지 농도는 서울 미세먼지 농도 증가에 영향을 미치는가? 
  * 중국 산동성 16개의 도시와 베이징, 상하이의 미세먼지 농도는 서울 미세먼지 농도에 영향을 미치는가?
  * 중국 산동성 16개의 도시의 미세먼지 농도는 서울 미세먼지 농도에 영향을 미치는가?
  * 중국 베이징의 미세먼지 농도는 서울 미세먼지 농도에 영향을 미치는가?
  * 중국 상하이의 미세먼지 농도는 서울 미세먼지 농도에 영향을 미치는가?


데이터 수집
--------------------
[중국 & 서울 미세먼지 데이터](https://aqicn.org/data-platform/register/kr/)


데이터 분석
--------------------
1. 중국의 모든 도시가 서울 미세먼지에 연관되어 있지 않을 것이라고 판단하여 우리나라와 지리적으로 가까운 중국의 산동성에 해당하는 16개의 도시와 베이징, 상하이의 미세먼지 데이터를 이용하여 분석
2. 분석에 들어가기 앞서, pm10(미세먼지)에 결측치가 있는 것으로 보여 그 전날의 미세먼지 농도를 결측치에 넣어줌
3. R에서 테이블을 outer join과 grouping 하는 과정에서 생긴 결측치들은 제거한 뒤 분석을 진행하였음


분석 결과
---------------------
1. 중국 18개의 도시의 미세먼지와 서울 미세먼지 분석
 1-1. 산점도
  <img src="./screenshot/correlation graph between china and korea.png"> 

 1-2. 연도별 및 1월부터 4월까지 그래프
 
  <img src="./screenshot/graph between china and seoul since 2014.PNG" height = 400>
 
 1-3. 월별 그래프
 
  <img src="./screenshot/graph between china and seoul.PNG">
 
 1-4. 연도별 1월부터 4월까지 그래프
 
  <img src="./screenshot/graph between china and seoul from Jan to Apr.PNG">

2. 중국 산동성의 미세먼지와 서울 미세먼지 분석
 2-1. 산점도
 
  <img src="./screenshot/correlation graph between shandong and seoul.PNG">
 
 2-2. 월별 그래프
 
  <img src="./screenshot/graph between shandong and seoul.PNG">

 2-3. 연도별 1월부터 4월 그래프
 
  <img src="./screenshot/graph between shandong and seoul from Jan to Apr.PNG">

3. 중국 베이징의 미세먼지와 서울 미세먼지 분석
 3-1. 산점도
 
  <img src="./screenshot/correlation graph between beijing and seoul.PNG">

 3-2. 월별 그래프
 
  <img src="./screenshot/graph between beijing and seoul.PNG">

 3-3. 연도별 1월부터 4월 그래프
 
  <img src="./screenshot/graph between beijing and seoul from Jan to Apr.PNG">

4. 중국 상하이의 미세먼지와 서울 미세먼지 분석
 4-1. 산점도
 
  <img src="./screenshot/correlation graph between shanghai and seoul.PNG">

 4-2. 월별 그래프
 
  <img src="./screenshot/graph between shanghai and seoul.PNG">
 
 4-3. 연도별 1월부터 4월 그래프
 
  <img src="./screenshot/graph between shanghai and seoul for Jan to Apr.PNG">


결과
------------------------
1. 중국 18개의 도시의 미세먼지와 서울 미세먼지의 상관관계를 분석한 결과 뚜렷한 양의 상관관계를 보였음
2. 중국 산동성의 미세먼지와 서울 미세먼지의 상관관계를 분석한 결과 뚜렷한 양의 상관관계를 보였음
3. 중국 베이징의 미세먼지와 서울 미세먼지의 상관관계를 분석한 결과 뚜렷한 양의 상관관계를 보였음
4. 중국 상하이의 미세먼지와 서울 미세먼지의 상관관계를 분석한 결과 뚜렷한 양의 상관관계를 보였음
