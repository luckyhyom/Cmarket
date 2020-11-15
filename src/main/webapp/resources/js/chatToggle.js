"user strict";

function includeTest(object, class_name) {
  let result = false;
  for (let i = 0; i <= object.classList.length - 1; i++) {
    if (object.classList[i] === class_name) {
      result = true;
    }
  }
  return result;
}

const body = document.querySelector("body");

// Fixed Chat
const btn = document.querySelector(".chat");
const chatBox = document.querySelector(".chatBox");
const chatClose = document.querySelector(".chatClose");
const friendsMenuBtn = document.querySelector(".friendsMenuBtn");
const chatBox2 = document.querySelector(".chatBox2");

btn.addEventListener("click", () => {
  chatBox.classList.toggle("viewChat");
  if (chatBox2.classList.toggle("viewChat")) {
    chatBox2.classList.toggle("viewChat");
  }
});

chatClose.addEventListener("click", () => {
  chatBox.classList.toggle("viewChat");
  if (chatBox2.classList.toggle("viewChat")) {
    chatBox2.classList.toggle("viewChat");
  }
});

friendsMenuBtn.addEventListener("click", () => {
  chatBox2.classList.toggle("viewChat");
});

// chatList
const chatListToggle = document.querySelector(".chatListToggle");
const chatList = document.querySelector(".chatList");
const chatListUser = document.querySelectorAll(".chatList .chatList__User");
const chatListUserBtn = document.querySelectorAll(".chatListUserBtn");
const chatListUserOption = document.querySelectorAll(".chatListUserOption");

const alarmToggle = document.querySelector(".alarmToggle");
const alarmList = document.querySelector(".alarmList");
chatListToggle.addEventListener("click", () => {
  // body.classList.add("notScroll");

  chatList.classList.toggle("viewChat");
  if (alarmList.classList.toggle("viewChat")) {
    alarmList.classList.toggle("viewChat");
  }
  if (
    chatList.classList[1] !== "viewChat" &&
    alarmList.classList[1] !== "viewChat"
  ) {
    // body.classList.remove("notScroll");
  }
});

chatListUser.forEach((user) => {
  user.addEventListener("click", (e) => {
    const class_name = e.target.classList[0];
    if (class_name === "fas" || class_name === "chatIcon") {
      return;
    }
    // if (e.target.classList.ex === "chatListUserOption") {
    //   console.log(e.target.classList);
    // }
    chatBox.classList.toggle("viewChat");
    chatList.classList.toggle("viewChat");
  });
});

chatListUserBtn.forEach((option) => {
  option.addEventListener("click", () => {
    const object = option.parentNode.children[3];
    object.classList.toggle("viewChat");
  });
});

// alarm

alarmToggle.addEventListener("click", () => {
  // body.classList.add("notScroll");
  alarmList.classList.toggle("viewChat");
  if (chatList.classList.toggle("viewChat")) {
    chatList.classList.toggle("viewChat");
  }

  if (
    chatList.classList[1] !== "viewChat" &&
    alarmList.classList[1] !== "viewChat"
  ) {
    // body.classList.remove("notScroll");
  }
});

// window.scrollTo({ top: window.screenY, left: 0, behavior: "auto" });
