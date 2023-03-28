<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ include file="sub_menu_left2.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>The Recipe</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="admin/admin.css" rel="stylesheet">  
<script src="https://kit.fontawesome.com/74c64a7de1.js" crossorigin="anonymous"></script>
<script src="script/jquery-3.6.3.js" type="text/javascript"></script>
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="admin/admin.js" type="text/javascript"></script>
<script type="text/javascript">
/* 도표 출력 메서드 */
/* const chart1 = document.querySelector('.doughnut1');
let tempRepRate;
function settingValue( RepRate ){
	tempRepRate = Math.floor( RepRate );
	console.log(tempRepRate);
	chart1.style.background = `conic-gradient(#ff0000 0% ${tempRepRate}%, #dedede ${tempRepRate}% 100%`;
}

const makeChart = (percent, classname, color) =>{
    let i = 1;
    let chartFn = setInterval(function(){
        if(i <= percent){
            colorFn(i, classname, color);
            i++;
        } else {
            clearInterval(chartFn);
        }
    }, 10);
}

const colorFn = (i, classname, color) => {
    classname.style.background = `conic-gradient(${color} 0% ${i}%, #dedede ${i}% 100%`;
}

makeChart(tempRepRate, chart1, '#f5b914');
*/
</script>
</head>
<body>

<div id="wrap">
	
	<header>
        <div class="">
           <div class="boxFlexTop">
	           <div><a class="navbar-brand" href="/">우리의 식탁</a>
	       </div>
	   	</div>
	</header>
	<main class="">