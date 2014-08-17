part of goodNbad;

class MouseEventManager{

	MouseEventManager(objView, console){
		if (objView is CanvasRenderingContext2D){
			objView.canvas.onClick.listen((e) {
				fireClickEvent(e, console, "ctx");
			});
		}

		// in test mode. to be deleted if not working
		if (objView is ImageContainer){
			objView._imageContent.onClick.listen((e) {
				fireClickEvent(e, console, "ctx");
			});
		}

	}

	/**
	 * type: object type. in test mode. to be deleted if not used
	 */
	void fireClickEvent(e, console, type){
		int x = e.offset.x;
		int y = e.offset.y;

        eventBus.fire(clickEvent, new Point(x, y));

		console.text = type + ": " + x.toString() + ", " + y.toString();
	}


}