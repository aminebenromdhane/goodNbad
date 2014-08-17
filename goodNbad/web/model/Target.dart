part of goodNbad;

class Target {

	double _x;
	double _y;
	double _hight;
    double _width;
	String _imagePath;
	double _speedY;
	double _speedX;
	List<Point> _polygon;
	// should also have _hight and width so it can do the right operation in the goDown()

	Target(this._x, this._y, this._imagePath){
		_speedY = 10.5;
		_speedX = 130.2;
    	_hight = 171.toDouble();
    	_width = 129.toDouble();
    	_polygon = new List<Point>();
	}
	
    double get hight => _hight;
    void set hight(_hight){
    	this._hight = _hight;
    }
    double get width => _width;
    void set width(_width){
    	this._width = _width;
    }
    double get x => _x;
    void set x(_x){
    	this._x = _x;
    }
    double get y => _y;
    void set _(_y){
    	this._y = _y;
    }
    
    void setMarioPolygon(){
    	_polygon.add(new Point(975, 20));
    	_polygon.add(new Point(1300, 130));
    	_polygon.add(new Point(1050, 990));    	
    	_polygon.add(new Point(1220, 1170));
    	_polygon.add(new Point(1470, 1200));
    	_polygon.add(new Point(1545, 1075));    	
    	_polygon.add(new Point(1740, 1140));
    	_polygon.add(new Point(1640, 1610));
    	_polygon.add(new Point(1270, 1510));    	
    	_polygon.add(new Point(1120, 1590));
    	_polygon.add(new Point(1010, 1820));
    	_polygon.add(new Point(740, 2040));
    	_polygon.add(new Point(730, 2170));
    	_polygon.add(new Point(530, 2200));
    	_polygon.add(new Point(460, 1710));    	
    	_polygon.add(new Point(725, 1620));
    	_polygon.add(new Point(630, 1230));
    	_polygon.add(new Point(461, 1320));
    	_polygon.add(new Point(320, 1500));
    	_polygon.add(new Point(60, 1345));
    	_polygon.add(new Point(50, 1200));    	
    	_polygon.add(new Point(500, 1000));
    	_polygon.add(new Point(260, 740));
    	_polygon.add(new Point(425, 270));    	
    	_polygon.add(new Point(625, 135));
    	_polygon.add(new Point(770, 190));
    	_polygon.add(new Point(870, 280));
    	_polygon.add(new Point(960, 20));
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
		return new ImageContainer(_imagePath, _x, _y, hight, _width);
	}
	
	/**
	 * Don't work. bad polygon coordinates
	 */ 
	bool isHit(Point poinClick){		
		Point previousPointPolygon = null;
		int nbBetweensX = 0;
		int nbBetweensY = 0;

		_polygon.forEach((pointPolygon){
			if (previousPointPolygon == null){
				previousPointPolygon = pointPolygon;
			}
			else{ 
				if (isBetween(poinClick.x, previousPointPolygon.x, pointPolygon.x)){
					nbBetweensX++;
				}
				if (isBetween(poinClick.y, previousPointPolygon.y, pointPolygon.y)){
					nbBetweensY++;
				}
				if (nbBetweensX >= 2 && nbBetweensY >= 2){
					return true;
				}
			}
			console3.text = "nbBetweensX: " + nbBetweensX.toString() + 
					", nbBetweensY: " + nbBetweensY.toString();
			print("nbBetweensX: " + nbBetweensX.toString() + 
					", nbBetweensY: " + nbBetweensY.toString());
		});
		return false; 
	}

	bool isRectHit(Point poinClick){
		if (isBetween(poinClick.x, _x, _x+width) && isBetween(poinClick.y, _y, _y+_hight)) {
			return true;
		}
		return false;
	}
	
	/**
	 * first and last are switchable
	 */
	bool isBetween(number, first, last){
		if (number>= first && number <= last){
			return true;
		}
		else if (number>= last && number <= first){
			return true;
		}
		else{
			return false;
		}
	}

}
