part of goodNbad;

class Target {

	Double _x;
	Double _y;
	String _imagePath = "";
	Double _speed;
	
	Target(_contentPath, _x, _y){
	}

	void goDown(){
		_y += _speed;
	}

}