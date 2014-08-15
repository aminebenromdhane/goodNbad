part of goodNbad;


class WorldView {

	CanvasRenderingContext2D _ctx2d;

	WorldView(this._ctx2d);

	/**
	 * draw word images
	 */
	void draw(World world){
		List<ImageContainer> images = world.getImages();
        images.forEach((image){
        	image.draw(_ctx2d);
        });
	}

}