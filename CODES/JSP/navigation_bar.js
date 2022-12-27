const nav = document.querySelector('.navbar')
fetch('../HTML/demo_navigation_bar.html')
.then(res => res.text())
.then(data=>{
    nav.innerHTML=data
})