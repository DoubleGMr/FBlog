$(function(){
	let weekday = ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Satursday'];
	if($('.right-other').length>0){
		scrollAnimate();
		$(window).scroll(function(){
			scrollAnimate();
		});
	}
	if($('.leftWord').length>0){
		let date = new Date();
		let str = '';
		str += weekday[date.getDay()]+' ';
		str += (date.getDate() < 10 ? '0'+date.getDate() : date.getDate()) + ' ';
		str += (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + ',';
		str += date.getFullYear();
		$('.leftWord h2').html(str);
	}
	if($('.weekDate').length>0){
		let date = new Date();
		let strWeekDate = '';
		let strClearDate = '';
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
		let c = $(e.target).parents('.post-data').children('.comment');
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
	$('.close').click(function(){
		if($('.comment').css('display')=='block'){
			$('.comment').slideUp(300);
		}else if($('.message-box').css('display')=='flex'){
			$('.message-box').css('display','none');
		}else if($('.tags-box').css('display')=='flex'){
			$('.tags-box').css('display','none');
		}else if($('.userChange-box').css('display')=='flex'){
			$('.userChange-box').css('display','none');
		}else if($('.introduce-box').css('display')=='flex'){
			$('.introduce-box').css('display','none');
		}
	});

});
function scrollAnimate(){
	let ro = $('.right-other');
	let st = $(window).scrollTop();
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