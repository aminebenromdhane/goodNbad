part of goodNbad;

class MouseEventManager{

	int _x;
	int _y;

	MouseEventManager(ctx, console){
		ctx.canvas.onMouseDown.listen((e) {
			_x = e.offset.x;
			_y = e.offset.y;

	        //TODO do stuff
			console.text = _x.toString() + ", " + _y.toString();
		});
	}


}