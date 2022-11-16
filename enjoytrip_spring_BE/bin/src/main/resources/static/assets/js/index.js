if (navigator.geolocation) {

    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function (position) {
        var lat = position.coords.latitude; // 위도
        var lon = position.coords.longitude; // 경도
    
        console.log(lat);
        console.log(lon);
    
        var link = `
        https://apis.data.go.kr/B551011/KorService/locationBasedList?serviceKey=aGSPgrRExk7ThlMw7gajazYPMs0nVuDOoodc%2B6t%2BY7atYcaw5PWKXVaDwyxyBXLZm2c3NM7bbB%2FTcT7QdMsXZA%3D%3D&numOfRows=4&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=P&mapX=${lon}&mapY=${lat}&radius=10000`;
        
        curPlaceTourist(link);
        });
    } else {
        lon = 37.5012743,
            lat = 127.039585;
            
        link = `
        https://apis.data.go.kr/B551011/KorService/locationBasedList?serviceKey=aGSPgrRExk7ThlMw7gajazYPMs0nVuDOoodc%2B6t%2BY7atYcaw5PWKXVaDwyxyBXLZm2c3NM7bbB%2FTcT7QdMsXZA%3D%3D&numOfRows=4&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=P&mapX=${lon2}&mapY=${lat2}&radius=10000`;
        
    curPlaceTourist(link);
}

function curPlaceTourist(link) {
    console.log(link);
    fetch(link)
        .then((response) => response.json())
        .then((data) => makeList(data));
}

function makeList(data) {
    let index = 0;
    console.log(data);
    data.response.body.items.item.forEach((item) => {
        let aEl = document.createElement("a");
        
        // console.log(item.title);
        let sectionId = `#section_${index}`;
        aEl.setAttribute("href", sectionId);
        aEl.setAttribute("class", "btn-get-started animate__animated animate__fadeInUp");
        // aEl.appendChild(document.createTextNode(item.title));
        aEl.innerText = item.title;
        
        document.querySelector(".button-box").appendChild(aEl);

        // 섹션 파트
        let category = "";
          switch (item.contenttypeid) {
            case "12":
              category = "관광지";
              break;
            case "14":
              category = "문화시설";
              break;
            case "15":
              category = "행사/공연/축제";
              break;
            case "28":
              category = "레포츠";
              break;
            case "32":
              category = "숙박";
              break;
            case "38":
              category = "쇼핑";
              break;
            case "39":
              category = "음식점";
              break;
            default:
              category = "여행코스";
              break;
          }

            let detailUrl = "attraction-details.html";
            let queryParams =
            encodeURIComponent("addr") +
            "=" +
            encodeURIComponent(
            item.addr1
            );
          queryParams +=
            "&" +
            encodeURIComponent("firstimage") +
            "=" +
            encodeURIComponent(item.firstimage);
          queryParams +=
            "&" +
            encodeURIComponent("title") +
            "=" +
            encodeURIComponent(item.title);
          queryParams +=
            "&" +
            encodeURIComponent("tel") +
            "=" +
            encodeURIComponent(item.tel);
          queryParams += "&" + encodeURIComponent("category") + "=" + encodeURIComponent(category);

        let section = `
        <section class="why-us section-bg" data-aos="fade-up" date-aos-delay="200" id="section_${index}" style="width: 100%; height: 80%;">
        <div class="container" >
          <div class="row">
            <div class="col-lg-6 text-center">
              <img src="${item.firstimage}" alt="" style="width:100%; height:100%"/>
            </div>

            <div class="col-lg-6 d-flex flex-column justify-content-center p-5">
              <div class="icon-box">
                <h4 class="title"><a href="${detailUrl}?${queryParams}" target="_blank" class="link"> >> ${item.title} << </a></h4>
                <p class="description">
                  주소 : ${item.addr1}<br>
                  전화번호 : ${item.tel}
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
        `;
        index += 1;
        document.querySelector("#main").innerHTML += section;
    });
}