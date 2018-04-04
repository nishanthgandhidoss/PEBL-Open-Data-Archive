/**
 * Nishanth Gandhidoss
 */

$(document).ready(function(){
	$("#trackerID").focus();
	var topDivHeight = Math.max($(".leftTopDiv").height(), $(".rightTopDiv").height());
    $(".leftTopDiv").height(topDivHeight);
    $(".rightTopDiv").height(topDivHeight);
    var bottomDivHeight = Math.max($(".leftBottomDiv").height(), $(".rightBottomDiv").height());
    $(".leftBottomDiv").height(topDivHeight);
    $(".rightBottomDiv").height(topDivHeight);
});

function routeCardSearch() {
	var url = "viewRouteCard.sp";
	
	var trackId=$("#hiddenId").val()
	
	//$("#hiddenId").val($("#trackerID").val());
	$("#trackingForm").attr('action', url);
	$("#trackingForm").attr('method', "POST");
	$("#trackingForm").submit();
}