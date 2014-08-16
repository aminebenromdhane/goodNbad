part of goodNbad;

class Target {

	double _x;
	double _y;
	String _imagePath;
	double _speedY;
	double _speedX;
	// should also have _hight and width so it can do the right operation in the goDown()

	Target(this._x, this._y, this._imagePath){
		_speedY = 10.5;
		_speedX = 130.2;
	}

	// to be changed. Must be dynamic with game level
	void goDown(){
		if ((_y+_speedY) > canvasHight) {
			_y = 0.0;
			if ( (_x+_speedX) > canvasWidth) {
				_x = 0.0;
			}
			else {
				// speedX can be randam in this game
				_x += _speedX;
			}
		}
		else {
			_y += _speedY;
		}
	}

	ImageContainer toImage(){
		return new ImageContainer(_imagePath, _x, _y);
	}

}
