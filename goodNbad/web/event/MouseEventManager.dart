part of goodNbad;

class MouseEventManager{

	// mouse click coordinates in the canvas
	int _x;
	int _y;

	MouseEventManager(ctx, console){
		ctx.canvas.onClick.listen((e) {
			_x = e.offset.x;
			_y = e.offset.y;

	        //TODO do stuff
			console.text = _x.toString() + ", " + _y.toString();
		});
	}


}