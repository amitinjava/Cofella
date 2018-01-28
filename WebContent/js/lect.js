 var path;
		var drag= false;
/*
        var textItem = new PointText({
            content: 'Click and drag to draw a line.',
            point: new Point(20, 30),
            fillColor: 'black',
        });
*/		
		jQuery(document).ready(function(){
		
		
		var windowW = window.innerWidth;
		var windowH = window.innerHeight;
		
		canvas = document.getElementById("canvas");
		ctx = canvas.getContext("2d");
		canvas.width = windowW - 60;
		canvas.height = windowH - 85;
		
		canvasOffset = $("#canvas").offset();
		offsetX = canvasOffset.left;
		offsetY = canvasOffset.top;
		
		paper.setup(canvas);
		alert(paper);
		$("#canvas").on('mousedown', function (e) {
			e.preventDefault();
			console.log("mousedown");
			if (path) {
                path.selected = false;
            }
			drag= true;
            // Create a new path and set its stroke color to black:
			point = new paper.Point(e.pageX-offsetX,e.pageY-offsetY);
            path = new paper.Path({
                segments: [point],
                strokeColor: 'black',
                // Select the path, so we can see its segment points:
                fullySelected: false
            });
			
		}).on('mouseup', function(e) {
			e.preventDefault();
			console.log("mouseup");
			 path.simplify(10);

            // Select the path, so we can see its segments:
            path.fullySelected = false;
			drag = false;
		}).on('mousemove', function(e) {
			console.log("mousemove");
			if(drag){
				console.log(path);
				var point = new paper.Point(e.pageX-offsetX,e.pageY-offsetY);
				path.add(point);
			    path.smooth();
				paper.view.draw();
			}
		});
});
	