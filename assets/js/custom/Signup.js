const Keyword=document.getElementById("searchValue");Keyword.addEventListener("keyup",function(e){if(13===e.keyCode){let e=new URL(base_url);const n={k:Keyword.value};e.search=new URLSearchParams(n).toString(),window.location=e}}),formRegister.onsubmit=(async e=>{const n=new FormData;let a=new URL(base_url+"Signup/Now");e.preventDefault(),n.append("fullname",document.getElementById("fullname").value),n.append("username",document.getElementById("username").value),n.append("email",document.getElementById("email").value),n.append("password",document.getElementById("password").value),await fetch(a,{method:"POST",body:n}).then(e=>e.json()).then(({res:e,status:n})=>{n?(alert(e.message),window.location=base_url+"Signin"):alert(e.message)}).catch(e=>{alert(e.response),window.location=base_url})});