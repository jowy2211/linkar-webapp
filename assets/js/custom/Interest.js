let lst=[];const selected=e=>{const t=e.split(".");if(document.getElementById("boxInterest_"+t[0]).checked){document.getElementById("cardInterest_"+t[0]).classList.add("active");const e={value:t[0],text:t[1]};lst=[...lst,e]}else document.getElementById("cardInterest_"+t[0]).classList.remove("active"),lst=lst.filter(({value:e})=>e!==t[0]);showSelected()},showSelected=()=>{const e=lst.length;let t="<p>"+e+" selected interest</p>";lst.map(e=>{t+='<div class="selected-interest"><span class="selected-text">'+e.text+"</span></div>"}),e>=3&&(t+='<button onClick="continueButton();" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored">Continue</button>'),document.getElementById("selectedInterest").innerHTML=t},continueButton=async()=>{if(confirm("Do you want to continue ?")){var e=JSON.stringify(lst);const t=new URL(base_url+"interest/Store");await fetch(t,{method:"POST",body:e,headers:{"Content-Type":"application/json"}}).then(e=>e.json()).then(({res:e,status:t})=>{alert(e.message),window.location=base_url}).catch(e=>{alert(e),window.location=base_url})}};