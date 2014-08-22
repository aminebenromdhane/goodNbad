part of goodNbad;

class MenuScreen {

	CanvasRenderingContext2D _ctx2d;
	String _welcomMsg;
	String _startMsg;
	String _optionMsg;
	Point _welcomMsgPosition;
	Point _startMsgPosition;
	Point _optionMsgPosition;
	
	MenuScreen(this._ctx2d){
    	print("construct MenuScreen 1");
		_welcomMsg = "Welcom to the good'n'bad game";
		_startMsg = "Start Game";
		_optionMsg = "Option";
		_welcomMsgPosition = new Point(100, 50);
		_startMsgPosition = new Point(100, 100);
		_optionMsgPosition = new Point(100, 200);
    	print("construct MenuScreen 3");
	}
	
	void show () {
		var gradient = _ctx2d.createRadialGradient(238, 50, 10, 238, 50, 300);
		gradient.addColorStop(0, '#8ed6ff');  // light blue
		gradient.addColorStop(1, '#004cb3');  // dark blue
        _ctx2d.fillStyle = gradient;
   		_ctx2d.fillRect(_startMsgPosition.x, _startMsgPosition.y, 200, 50);
		_ctx2d.fillRect(_optionMsgPosition.x, _optionMsgPosition.y, 200, 50);
		
		_ctx2d.font = "40pt Calibri";
        _ctx2d.fillStyle = "blue";
		_ctx2d.fillText(_welcomMsg, _welcomMsgPosition.x, _welcomMsgPosition.y);		
		_ctx2d.fillText(_startMsg, _startMsgPosition.x, _startMsgPosition.y+50);
		_ctx2d.fillText(_optionMsg, _optionMsgPosition.x, _optionMsgPosition.y+50);
	}

}