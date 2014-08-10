part of goodNbad;

class Target {

	int _x;
	int _y;
	String _imagePath;
	int _speed;
	
	Target(_x, _y){
		_speed = 10;
		_imagePath = "";
	}

	void goDown(){
		_y += _speed;
	}

}