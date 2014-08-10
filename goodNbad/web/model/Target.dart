part of goodNbad;

class Target {

	int _x;
	int _y;
	String _imagePath;
	int _speed;

	Target(_x, _y, _imagePath){
		_speed = 10;
	}

	void goDown(){
		_y = _y + _speed;
	}

	ImageContainer toImage(){
		new ImageContainer(_imagePath, _x, _y);
	}

}