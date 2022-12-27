const nav = document.querySelector('.login-logout')
fetch('../JSP/___login_logout___.jsp')
.then(res => res.text())
.then(data=>{
    nav.innerHTML = data
})