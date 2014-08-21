part of goodNbad;

class MenuScreen {

	CanvasRenderingContext2D _ctx2d;
	String _welcomMsg;
	ImageContainer _startButton;
	ImageContainer _optionButton;
	
	Point _welcomMsgPosition;
	
	MenuScreen(this._ctx2d){
		_welcomMsg = "Welcom to the good'n'bad game";
		_welcomMsgPosition = new Point(500, 200);
		_startButton = new ImageContainer(Assets.START_GAME_IMAGE, 500.0, 400.0, null, null);
		_optionButton = new ImageContainer(Assets.OPTION_IMAGE, 500.0, 600.0, null, null);
	}
	
	void show () {
		_ctx2d.fillText(_welcomMsg, _welcomMsgPosition.x, _welcomMsgPosition.y);
		_ctx2d.drawImage(_startButton.imageContent, _welcomMsgPosition.x, _welcomMsgPosition.y);
		_ctx2d.drawImage(_optionButton.imageContent, _welcomMsgPosition.x, _welcomMsgPosition.y);
	}

}