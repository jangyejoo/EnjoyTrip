# :airplane:EnjoyTrip
> 국내 관광지 정보와 여행 계획 공유 서비스를 제공하는 웹 사이트

<img src="https://img.shields.io/badge/Vue.js-4FC08D?style=flat-square&logo=Vue.js&logoColor=white"/> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logoJavaScript&logoColor=white"/> <img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white"/> <img src="https://img.shields.io/badge/npm-CB3837?style=flat-square&logo=npm&logoColor=white"/> <img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat-square&logo=Spring Boot&logoColor=white"/> <img src="https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=MySQL&logoColor=white"/>  

- EnjoyTrip은 [한국관광공사의 관광정보 서비스 API](https://www.data.go.kr/tcs/dss/selectApiDataDetailView.do?publicDataPk=15101578) 기반 다양한 국내 관광지 정보를 포함한 웹 사이트입니다. 
- [카카오맵 API](https://apis.map.kakao.com/web/)를 사용하여 관광지의 위치와 정보를 쉽게 확인할 수 있으며 회원가입을 한 회원들은 여행 계획 만들어 공유할 수 있습니다.
- 회원가입을 하지 않은 비회원도 공유된 여행 계획을 볼 수 있습니다. 

<div align = center>
  
![ezgif com-gif-maker](https://user-images.githubusercontent.com/69101568/205478371-f2aaecc4-9cfe-446b-910b-fac53b22c06b.gif)

</div>

## 설치방법

:heavy_check_mark: enjoy_trip_FE

- vscode로 실행

```sh
npm install
```

```sh
npm run serve
```

:heavy_check_mark: enjoytrip_spring_BE

- 첨부된 FinalDump.sql 실행
- sts에서 Run As Spring Boot App

<br/>

## 상세기능

:heavy_check_mark: 관광지 찾기

- select box, kakao map 두 개의 버전
- 페이징 기능
- 클릭시 상세보기 모달창 띄움
- 관광지를 선택하면 해당 위치로 map 이동

![search](https://user-images.githubusercontent.com/69101568/205479244-704d1ac3-4896-42ae-a587-ae2284a7a073.gif)

:heavy_check_mark: 여행계획 게시판 글 보기

- 조회수 기능
- 페이징 기능
- 클릭시 모달창 띄움
- 여행지의 카테고리별로 지정된 아이콘 보여줌

![view](https://user-images.githubusercontent.com/69101568/205479300-f586f1d0-38c1-4be2-bc42-22eede76df2a.gif)

:heavy_check_mark: 여행계획 게시판 글 올리기

- 로그인시 글 올리기 버튼 보여줌
- 원하는 관광지를 검색하면 우측에 리스트로 출력
- 토글 버튼으로 여행지 추가, 삭제
- x 버튼으로 삭제
- 여행지마다 짧은 설명을 남길 수 있음
- 여행지를 선택하면 해당 위치로 map 이동

![create](https://user-images.githubusercontent.com/69101568/205479307-64f067c6-e573-409c-b325-fc28a4db4de6.gif)

:heavy_check_mark: 여행계획 게시판 글 수정, 삭제하기

- 본인의 글 수정, 삭제
- 수정 후 바로 모달창으로 이동

![update,delete](https://user-images.githubusercontent.com/69101568/205479309-e076d978-0c0b-42b3-bb2d-2769f890daa1.gif)
