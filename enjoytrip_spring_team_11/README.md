# **1. Enjoy Trip 소개**
- Enjoy Trip은 사용자들에게 다양한 관광지 및 주변시설을 소개해주는 웹 사이트입니다.
- 사용자 위치 정보 기반 관광지 소개, 지역별 관광지 소개, 지역별 주변시설 조회 기능, 여행 계획 공유 게시판 기능을 가지고 있습니다.

</br>  

# **2. 기능**

### 1) 메인 페이지

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/250e7312716f9d05cff556b15c755994/image.png)
1. nav bar
    - 로그인, 회원가입, 일정 공유, 여행지 추천, 여행지 주변시설 페이지로 이동 가능 
    - 로그인 상태일 때는 로그인, 회원가입 대신 로그아웃, 마이페이지를 출력
4. 사용자 위치 기반 주변 관광지 소개
    - 사용자 위치 정보(위도, 경도)를 이용해서 그 주변 이미지가 있는 관광지 정보를 가까운 거리순으로 4개를 출력
    - 버튼을 클릭하면 해당 정보를 표시하는 위치로 스크롤 이동

</br>
</br>

### 2) 메인 페이지에서 '춘보만두' 버튼을 눌렀을 때

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/6b5390d73bca419ec3746cc47923ea1f/image.png)
1. 해당 관광지의 대표 이미지 출력
2. 해당 관광지의 정보 출력 
    - 제목을 누르면 관광지 상세정보 페이지로 연결

</br>
</br>

### 3) 로그인 페이지

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/500b7677eaf148025d7617b27f1fc6bf/image.png)
1. 아이디 저장
    - ~~이전에 로그인한 정보(아이디)를 저장~~
2. 비밀번호 찾기
    - 비밀번호 찾기 모달창을 띄움
3. 회원가입 페이지로 연결되는 버튼

</br>
</br>

### 4) 비밀번호 찾기 모달창

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/2fa5ca3de3932da2e3966fe911fb0e2e/image.png)
1. 현재 비밀번호 출력
    - 올바른 아이디와 이름이 입력되면 현재 비밀번호를 출력
    - 틀린 아이디와 이름이 입력되면 "일치하는 계정이 없습니다."라고 띄움

</br>
</br>

### 5) 회원가입 페이지

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/977655b9086bc402652a392c6fcb5214/image.png)
1. 회원가입 폼
    - 폼에 입력된 정보에 따라 알맞은 alert창을 띄움
2. 회원가입 버튼

</br>
</br>

### 6) 마이 페이지

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/b0e566829202d01baaf0ea612bfa7ea1/image.png)
![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/6414b087e0bb1616fafaaa95b640e2f9/image.png)
1. 회원정보 수정 페이지로 연결되는 버튼
2. 회원탈퇴 버튼
    - 회원탈퇴 모달창을 띄움
    - 올바른 비밀번호를 입력하면 회원탈퇴!

</br>
</br>

### 7) 프로필 변경 페이지

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/6d930289ec7116fcdf30c52a26de8576/image.png)
1. 현재 사용자의 정보 출력
    - 바꾸고 싶은 정보 입력
    - 올바른 비밀번호를 입력해야 변경 가능
2. 비밀번호 보기 버튼
    - 기본적으로 비밀번호는 마스킹 처리
    - 버튼 클릭시 비밀번호 마스킹 처리가 사라지고 비밀번호 
2. 정보 변경 완료 버튼
    - 버튼 클릭시 password란에 입력된 정보와 현재 비밀번호가 일치한지 검사
    - 비밀번호가 일치하면 마이페이지로 리다이렉트

</br>
</br>

### 8) 여행지 추천 페이지

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/5f8412480c90fb9a09f83137b0536556/image.png)
1. 로그인시 바뀐 navbar 모습
2. 지역 설정 select box
    - 시도선택을 하면 구군선택 option이 변경
    - 시도, 구군을 모두 선택하고 Go! 버튼을 누르면 해당 지역의 관광지 18개의 대표 이미지 출력
    - 18개 선정 기준 : 이미지가 있는 관광지 정보를 조회순으로 정렬한 후 상위 18개
3. 카테고리 설정
    - 18개의 관광지를 카테고리별로 볼 수 있는 버튼
4. 관광지 대표 이미지 출력
    - 지역 설정을 하지 않았을 경우 : 사용자 위치 정보를 이용해서 그 주변 이미지가 있는 관광지 정보를 가까운 거리순으로 18개 출력
    - 관광지 대표 이미지에 마우스를 올리면 관광지 제목 확인 가능
    - 링크 버튼을 클릭하면 관광지 상세정보 페이지로 이동

</br>
</br>

### 9) 관광지 상세정보 페이지

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/dc87b899f5c5e9567b900e224fe3bada/image.png)
1. 해당 관광지의 대표 이미지 출력
2. 해당 관광지의 정보 출력 (제목, 카테고리, 주소, 전화번호)
3. 해당 관광지의 overview 출력
![image](/uploads/17d5d90e7b759b3dc3b5b6386c48d014/image.png)
- 더블클릭 시 모달창을 띄우는 것으로 변경!

</br>
</br>

### 10) 여행지 주변시설 페이지

</br>

![image](https://lab.ssafy.com/rhfemsqpf90/enjoytrip_frontend_team_01/uploads/eb7f7bbe7e38625c83f7ff7db7c49a2d/image.png)
1. 사용자 위치를 마커로 표시
</br>
</br>
![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/6677b363875828146849da16d257fb5f/image.png)

1. 지역/옵션 설정 select box
    - 시도선택을 하면 구군선택 option이 변경
    - 구군선택을 하면 옵션선택 option이 변경
    - 모두 선택하고 Go! 버튼을 누르면 해당 지역의 해당 카테고리인 모든 시설의 위치를 맵에 마커로 표시
2. 카카오 맵 api
    - 마커들의 위치에 따라 지도 범위가 재설정
3. 마커를 누르면 볼 수 있는 custom overlay
    - 다른 마커를 클릭하면 이전 custom overlay는 사라짐

</br>
</br>

### 11) 일정 공유 목록 페이지

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/a05bdd7dc614345e599cc9878d3cb6be/image.png)
1. 일정 공유 작성 페이지로 이동하는 버튼
2. 공유된 일정을 간단하게 보여줌 (썸네일, 제목, 조회수)
    - 일정 공유 게시글을 누를 때 조회수 증가

</br>
</br>

### 12) 일정 공유 작성 페이지

</br>

![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/c2356148a83f6f589dbd9359bc2ab453/image.png)
![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/202e885ca3bcd6735e1b955c94d8f1fb/image.png)
1. 게시물 제목
2. 관광지 검색
    - 검색어를 입력하고 검색 버튼 클릭 (enter도 가능)
3. 카카오 맵 api
4. 검색된 관광지 결과를 리스트로 출력
    - 관광지를 클릭하면 카카오 맵 범위가 해당 관광지쪽으로 바뀜
    - 체크박스를 선택하면 해당 관광지가 관광지 카트에 들어감
5. 관광지 카트
    - 최대 4개까지 관광지를 담을 수 있음
    - 짧은 설명을 관광지마다 남길 수 있음
6. 등록 버튼
![image](/uploads/3661f20e642fd736d3c68ea86c0beafc/image.png)
- 모달 창으로 변경!
- 모달 창으로 변경 후 카카오맵 오류 발생...
     
</br>
</br>

### 13) 일정 공유 상세 페이지

</br>
![image](https://lab.ssafy.com/abcdq12345/enjoytrip_backend_team_01/uploads/6fcf01d616ba9be2c86d69012ddcbef6/image.png)

1. 목록보기, 삭제하기 버튼
    - 목록보기 버튼을 클릭하면 일정 공유 목록 페이지로 이동
    - 글을 작성한 회원만 삭제하기 버튼이 보임
![image](/uploads/f5e24ddd037e7ca21a8de6691bc5f828/image.png)
- 더블클릭 시 모달창을 띄우는 것으로 변경!

</br>
</br>

