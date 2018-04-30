$(document).on("turbolinks:load",function(){
	var weekday = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Satursday'];
	scrollAnimate();
	topControl();
	$(window).scroll(function(){
		if($('.right-other').length>0){
			scrollAnimate();
		}
		topControl();
	});
	if($('.leftWord').length>0){
		var date = new Date();
		var str = '';
		str += weekday[date.getDay()]+' ';
		str += (date.getDate() < 10 ? '0'+date.getDate() : date.getDate()) + ' ';
		str += (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + ',';
		str += date.getFullYear();
		$('.leftWord h2').html(str);
	}
	if($('.weekDate').length>0){
		var date = new Date();
		var strWeekDate = '';
		var strClearDate = '';
		strWeekDate += ' ' + weekday[date.getDay()];
		strClearDate += (date.getDate() < 10 ? '0'+date.getDate() : date.getDate()) + ' ';
		strClearDate += (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + ',';
		strClearDate += date.getFullYear();
		$('.weekDate').html(strWeekDate);
		$('.clearDate').html(strClearDate);
	}
	$('.more').click(function(){
		$('.down-tags').slideToggle(300);
	});
	$('.comments').click(function(e){
		var c = $(e.target).parents('.post-data').children('.comment');
		c.slideToggle(300);
	});
	$('.message').click(function(){
		actionBox($('.message-box'));
	});
	$('.tag-create').click(function(){
		actionBox($('.tags-box'));
	});
	$('.userChange').click(function(){
		actionBox($('.userChange-box'));
	});
	$('.introduceChange').click(function(){
		actionBox($('.introduce-box'));
	});
	$('.post-create').click(function(){
		actionBox($('.posts-box'));
	});
	$('.close').click(function(e){
		var c = $(e.target).parents('.post-data').children('.comment');
		if(c.css('display')=='block' && $('.posts-box').css('display')=='flex'){
			$('.posts-box').css('display','none');
		}else if(c.css('display')=='block' && $('.posts-box').css('display')!='flex'){
			c.slideToggle(300);
		}else if($('.message-box').css('display')=='flex'){
			$('.message-box').css('display','none');
		}else if($('.tags-box').css('display')=='flex'){
			$('.tags-box').css('display','none');
		}else if($('.userChange-box').css('display')=='flex'){
			$('.userChange-box').css('display','none');
		}else if($('.introduce-box').css('display')=='flex'){
			$('.introduce-box').css('display','none');
		}else if($('.error-box').length>0){
			$('.error-box').fadeOut(300);
		}else if($('.alert').length>0){
			$('.alert').fadeOut(300);
		}else if($('.posts-box').css('display')=='flex'){
			$('.posts-box').css('display','none');
		}
	});
	$('.in_use').click(function(){
		alert('该标签仍在使用中,不可删除.');
	});
	$('.topControl').click(function(){
		$('document,html').animate({scrollTop:0},300);
	});

});
function scrollAnimate(){
	var ro = $('.right-other');
	var st = $(window).scrollTop();
	if( st >= 0 ){
		ro.css('marginTop',st);
	}else{
		ro.css('marginTop',0);
	}
}
function actionBox(actionTarget){
	if(actionTarget.length > 0){
		actionTarget.css('display','flex');
	}
}
function topControl(){
	if($(window).scrollTop()>=50){
			$('.topControl').fadeIn(200);
	}else{
		$('.topControl').fadeOut(200);
	}
}