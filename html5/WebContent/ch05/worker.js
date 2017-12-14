onmessage = function(event){
		var num = event.data;
		var sum = 0;
		for(var i = 1 ; i<num ; i++){
			sum += i;
		}
		postMessage(sum);
}