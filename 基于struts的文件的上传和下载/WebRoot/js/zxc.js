function checkCurrentPage(input,totalPages){
    if(input.match(/^\D*$/)){
       alert("只能输入数字!");
       document.getElementById("jumpPageBox").value=document.getElementById("pages").value;
       document.getElementById("jumpPageBox").focus();
    }else if(input>totalPages||input.value<=0){
       alert("对不起，你输入的页码有误!");
       document.getElementById("jumpPageBox").value=document.getElementById("pages").value;
       document.getElementById("jumpPageBox").focus();
    }
}