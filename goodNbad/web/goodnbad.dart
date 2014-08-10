library goodNbad;

import 'dart:html';
import 'dart:async';
part 'view/StaticImage.dart';
part 'model/World.dart';
part 'model/Target.dart';
part 'shared/ImageContainer.dart';
part 'view/Assets.dart';

CanvasElement _canvas;
CanvasRenderingContext2D _ctx2d;
var _console1;
var _console2;
var _console3;
int i=0;
StaticImage background;
World world;

void gameLoop(num delta){
	world.play();

	List<ImageContainer> images = world.getImages();
	images.forEach((image){
		image.draw(_ctx2d);
	});

	new Future.delayed(const Duration(milliseconds: 500), (){
		window.animationFrame.then(gameLoop);
	});
}

void main() {
	world = new World();
	_canvas = querySelector("#gameCanvas");
	_console1 = querySelector("#console1");
	_console2 = querySelector("#console2");
	_console3 = querySelector("#console3");
	_ctx2d = _canvas.context2D;

	background = new StaticImage("resources/Mario-Luigi-Paper-Backgrounds.jpg", 0, 0, 0, 0);
	background.loadImage(callbackLoadResources);
	world.init();
	window.animationFrame.then(gameLoop);
}


void callbackLoadResources(Event e){
	i++;
	print(i);
	background.draw(_ctx2d, false);
}

void callback(MouseEvent event) {

}

