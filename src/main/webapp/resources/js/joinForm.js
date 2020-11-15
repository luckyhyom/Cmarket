const pwd1 = document.querySelector("input[id=password1]");
const pwd2 = document.querySelector("input[id=password2]");
const confirmPwd = document.querySelector(".confirmPwd");
pwd2.addEventListener("keyup", (e) => {
  if (pwd1.value === "" || pwd2.value === "") {
    confirmPwd.style.color = "black";
    confirmPwd.textContent = `비밀번호를 입력해주세요`;
    return;
  } else if (pwd1.value === pwd2.value) {
    confirmPwd.style.color = "green";
    confirmPwd.textContent = `비밀번호 일치`;
  } else if (pwd1.value !== pwd2.value) {
    confirmPwd.style.color = "red";
    confirmPwd.textContent = `비밀번호 불일치`;
  }
});
