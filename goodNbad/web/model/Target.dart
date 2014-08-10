part of goodNbad;

class Target {

	double _x;
	double _y;
	String _imagePath;
	double _speed;

	Target(this._x, this._y){
		_speed = 10.5;
		_imagePath = Assets.TARGET_IMAGE;
	}

	void goDown(){
		_y += _speed;
	}

	ImageContainer toImage(){
		return new ImageContainer(_imagePath, _x, _y);
	}

}
