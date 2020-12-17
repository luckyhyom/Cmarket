//'use strict'
//
//$('#dips').on("click",function(){
//
//				var board_sq = ${b.board_sq};
//				var profile_sq = ${memberProfile.profile_sq};
//
//				$.ajax({
//					url:"dips.do",
//					data:JSON.stringify({
//						board_sq:board_sq,
//						profile_sq:profile_sq
//					}),
//					dataType:'text',
//					type:"post",
//					headers: {
//					        'Content-Type':'application/json'
//					},
//					success:function(data){
//							  const dipsCount = document.querySelector('.dipsCount');
//							  console.log(dipsCount);
//							  dipsCount.innerHTML = data;
//							  console.log(data);
//					}, error:function(request,status,errorData){
//						console.log(request.status+" : " + errorData);
//					}
//				})
//				
//}) 