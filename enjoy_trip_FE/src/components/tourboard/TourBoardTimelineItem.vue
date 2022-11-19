<template>
  <li class="timeline-item">
    <div class="timeline-badge" :id="item.contentId"></div>
    <div class="timeline-panel">
      <div class="timeline-heading">
        <h4 class="timeline-title">
          {{ item.title }}
        </h4>
      </div>
      <b-row>
        <b-col md="4"><b-img thumbnail :src="item.firstImage" alt="" /></b-col>
        <b-col
          style="
            margin-right: 15px;
            border-radius: 10px;
            border: 1px solid #d4d4d4;
            padding-top: 1rem;
          "
          ><div class="timeline-body">
            {{ item.contentDesc }}
          </div></b-col
        >
      </b-row>
    </div>
  </li>
</template>

<script>
export default {
  name: "TourBoardTimelineItem",
  props: {
    item: Object,
  },
  mounted() {
    let badge = document.getElementById(`${this.item.contentId}`);

    if (this.item.contentTypeId == 12) {
      badge.setAttribute("style", "background-color : #007bff");
      badge.innerHTML += `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" width="1.5rem" fill="white"><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 256c-35.3 0-64-28.7-64-64s28.7-64 64-64s64 28.7 64 64s-28.7 64-64 64z"/></svg>`;
    } else if (this.item.contentTypeId == 14) {
      badge.setAttribute("style", "background-color : #6c757d");
      badge.innerHTML += `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" width="1.5rem" fill="white"><path d="M48 0C21.5 0 0 21.5 0 48V464c0 26.5 21.5 48 48 48h96V432c0-26.5 21.5-48 48-48s48 21.5 48 48v80h96c26.5 0 48-21.5 48-48V48c0-26.5-21.5-48-48-48H48zM64 240c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V240zm112-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H176c-8.8 0-16-7.2-16-16V240c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H272c-8.8 0-16-7.2-16-16V240zM80 96h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H176c-8.8 0-16-7.2-16-16V112zM272 96h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H272c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16z"/></svg>`;
    } else if (this.item.contentTypeId == 15) {
      badge.setAttribute("style", "background-color : #28a745");
      badge.innerHTML += `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1.5rem" fill="white"><path d="M256 512c141.4 0 256-114.6 256-256S397.4 0 256 0S0 114.6 0 256S114.6 512 256 512zM164.1 325.5C182 346.2 212.6 368 256 368s74-21.8 91.9-42.5c5.8-6.7 15.9-7.4 22.6-1.6s7.4 15.9 1.6 22.6C349.8 372.1 311.1 400 256 400s-93.8-27.9-116.1-53.5c-5.8-6.7-5.1-16.8 1.6-22.6s16.8-5.1 22.6 1.6zM208.4 208c0 17.7-14.3 32-32 32s-32-14.3-32-32s14.3-32 32-32s32 14.3 32 32zm128 32c-17.7 0-32-14.3-32-32s14.3-32 32-32s32 14.3 32 32s-14.3 32-32 32z"/></svg>`;
    } else if (this.item.contentTypeId == 25) {
      badge.setAttribute("style", "background-color : #ffc107");
      badge.innerHTML += `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1.5rem" fill="white"><path d="M416 256s96-96 96-160c0-53-43-96-96-96s-96 43-96 96c0 29.4 20.2 65.5 42.1 96H320c-53 0-96 43-96 96s43 96 96 96h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H188.6c-6.2 9.6-12.6 18.8-19 27.2c-10.7 14.2-21.3 26.9-30 36.8H416c53 0 96-43 96-96s-43-96-96-96H320c-17.7 0-32-14.3-32-32s14.3-32 32-32h96zm0-128c-17.7 0-32-14.3-32-32s14.3-32 32-32s32 14.3 32 32s-14.3 32-32 32zM149.9 448c21.9-30.5 42.1-66.6 42.1-96c0-53-43-96-96-96s-96 43-96 96c0 64 96 160 96 160s3.5-3.5 9.2-9.6c.4-.4 .7-.8 1.1-1.2c3.3-3.5 7.1-7.8 11.4-12.8c.2-.2 .4-.4 .6-.6c9.4-10.8 20.7-24.6 31.6-39.8zM96 384c-17.7 0-32-14.3-32-32s14.3-32 32-32s32 14.3 32 32s-14.3 32-32 32z"/></svg>`;
    } else if (this.item.contentTypeId == 28) {
      badge.setAttribute("style", "background-color : #343a40");
      badge.innerHTML += `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="1.5rem" fill="white"><path d="M336 48c0-26.5-21.5-48-48-48s-48 21.5-48 48s21.5 48 48 48s48-21.5 48-48zM141.7 175.5c9.9-9.9 23.4-15.5 37.5-15.5c1.9 0 3.8 .1 5.6 .3L153.6 254c-9.3 28 1.7 58.8 26.8 74.5l86.2 53.9-25.4 88.8c-4.9 17 5 34.7 22 39.6s34.7-5 39.6-22l28.7-100.4c5.9-20.6-2.6-42.6-20.7-53.9L254 299l30.9-82.4 5.1 12.3C305 264.7 339.9 288 378.7 288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H378.7c-12.9 0-24.6-7.8-29.5-19.7l-6.3-15c-14.6-35.1-44.1-61.9-80.5-73.1l-48.7-15c-11.1-3.4-22.7-5.2-34.4-5.2c-31 0-60.8 12.3-82.7 34.3L73.4 153.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l23.1-23.1zM107.2 352H48c-17.7 0-32 14.3-32 32s14.3 32 32 32h69.6c19 0 36.2-11.2 43.9-28.5L173 361.6l-9.5-6c-17.5-10.9-30.5-26.8-37.9-44.9L107.2 352z"/></svg>`;
    } else if (this.item.contentTypeId == 32) {
      badge.setAttribute("style", "background-color : #6c757d");
      badge.innerHTML += `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="1.5rem" fill="white"><path d="M32 0C14.3 0 0 14.3 0 32S14.3 64 32 64V448c-17.7 0-32 14.3-32 32s14.3 32 32 32H208V448h96v64H480c17.7 0 32-14.3 32-32s-14.3-32-32-32V64c17.7 0 32-14.3 32-32s-14.3-32-32-32H32zm80 96h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H112c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16zm112 16c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H240c-8.8 0-16-7.2-16-16V112zM368 96h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H368c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16zM96 208c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H112c-8.8 0-16-7.2-16-16V208zm144-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H240c-8.8 0-16-7.2-16-16V208c0-8.8 7.2-16 16-16zm112 16c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H368c-8.8 0-16-7.2-16-16V208zm-3 152.2c3.3 12.8-7.8 23.8-21 23.8H184c-13.3 0-24.3-10.9-21-23.8c10.6-41.5 48.2-72.2 93-72.2s82.5 30.7 93 72.2z"/></svg>`;
    } else if (this.item.contentTypeId == 38) {
      badge.setAttribute("style", "background-color : #17a2b8");
      badge.innerHTML += `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="1.5rem" fill="white"><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>`;
    } else if (this.item.contentTypeId == 39) {
      badge.setAttribute("style", "background-color : #ff8491");
      badge.innerHTML += `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="1.5rem" fill="white"><path d="M416 0C400 0 288 32 288 176V288c0 35.3 28.7 64 64 64h32V480c0 17.7 14.3 32 32 32s32-14.3 32-32V352 240 32c0-17.7-14.3-32-32-32zM64 16C64 7.8 57.9 1 49.7 .1S34.2 4.6 32.4 12.5L2.1 148.8C.7 155.1 0 161.5 0 167.9c0 45.9 35.1 83.6 80 87.7V480c0 17.7 14.3 32 32 32s32-14.3 32-32V255.6c44.9-4.1 80-41.8 80-87.7c0-6.4-.7-12.8-2.1-19.1L191.6 12.5c-1.8-8-9.3-13.3-17.4-12.4S160 7.8 160 16V150.2c0 5.4-4.4 9.8-9.8 9.8c-5.1 0-9.3-3.9-9.8-9L127.9 14.6C127.2 6.3 120.3 0 112 0s-15.2 6.3-15.9 14.6L83.7 151c-.5 5.1-4.7 9-9.8 9c-5.4 0-9.8-4.4-9.8-9.8V16zm48.3 152l-.3 0-.3 0 .3-.7 .3 .7z"/></svg>`;
    }
  },
};
</script>

<style lang="less" scoped>
.timeline {
  list-style: none;
  padding: 20px 0 20px;
  position: relative;

  &:before {
    background-color: #ff8491;
    bottom: 0;
    content: " ";
    left: 50px;
    margin-left: -1.5px;
    position: absolute;
    top: 0;
    width: 3px;
  }

  > li {
    margin-bottom: 20px;
    position: relative;

    &:before,
    &:after {
      content: " ";
      display: table;
    }

    &:after {
      clear: both;
    }

    > .timeline-panel {
      border-radius: 2px;
      border: 1px solid #d4d4d4;
      box-shadow: 0 1px 2px rgba(100, 100, 100, 0.2);
      margin-left: 100px;
      padding: 20px;
      position: relative;

      .timeline-heading {
        .timeline-panel-controls {
          position: absolute;
          right: 8px;
          top: 5px;

          .timestamp {
            display: inline-block;
          }

          .controls {
            display: inline-block;
            padding-right: 5px;
            border-right: 1px solid #aaa;

            a {
              color: #999;
              font-size: 11px;
              padding: 0 5px;

              &:hover {
                color: #333;
                text-decoration: none;
                cursor: pointer;
              }
            }
          }

          .controls + .timestamp {
            padding-left: 5px;
          }
        }
      }
    }

    .timeline-badge {
      background-color: #999;
      border-radius: 50%;
      color: #fff;
      font-size: 1.4em;
      height: 50px;
      left: 50px;
      line-height: 52px;
      margin-left: -25px;
      position: absolute;
      text-align: center;
      top: 16px;
      width: 50px;
      z-index: 100;
    }

    .timeline-badge + .timeline-panel {
      &:before {
        border-bottom: 15px solid transparent;
        border-left: 0 solid #ccc;
        border-right: 15px solid #ccc;
        border-top: 15px solid transparent;
        content: " ";
        display: inline-block;
        position: absolute;
        left: -15px;
        right: auto;
        top: 26px;
      }

      &:after {
        border-bottom: 14px solid transparent;
        border-left: 0 solid #fff;
        border-right: 14px solid #fff;
        border-top: 14px solid transparent;
        content: " ";
        display: inline-block;
        position: absolute;
        left: -14px;
        right: auto;
        top: 27px;
      }
    }
  }
}

.timeline-title {
  margin-top: 0;
  color: inherit;
  margin-bottom: 1rem;
}

.timeline-body {
  > p,
  > ul {
    margin-bottom: 0;
  }

  > p + p {
    margin-top: 5px;
  }
}

.copy {
  position: absolute;
  top: 5px;
  right: 5px;
  color: #aaa;
  font-size: 11px;
  > * {
    color: #444;
  }
}
</style>
