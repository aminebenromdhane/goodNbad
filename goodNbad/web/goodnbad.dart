library goodNbad;

import 'dart:html';
import 'dart:async';
import 'package:event_bus/event_bus.dart';

part 'service_model/WorldServiceModel.dart';
part 'model/World.dart';
part 'model/Target.dart';
part 'view/StaticImage.dart';
part 'view/Assets.dart';
part 'view/AssetsLoader.dart';
part 'view/ImageLoader.dart';
part 'view/ImageContainer.dart';
part 'view/WorldView.dart';
part 'presenter/WordPresenter.dart';
part 'event/MouseEventManager.dart';

// public objects
final EventBus eventBus = new EventBus();
final EventType<CanvasRenderingContext2D> initEvent = new EventType<CanvasRenderingContext2D>();
final EventType<Object> playEvent = new EventType<Object>();

var console1;
var console2;
var console3;

void gameLoop(num delta){
	// args : eventName, object passed
	eventBus.fire(playEvent, null);

	new Future.delayed(const Duration(milliseconds: 500), (){
		window.animationFrame.then(gameLoop);
	});
}

void main() {
	// select console
	console1 = querySelector("#console1");
	console2 = querySelector("#console2");
	console3 = querySelector("#console3");

	// select canvas div
	CanvasElement canvas = querySelector("#gameCanvas");
 	CanvasRenderingContext2D ctx2d = canvas.context2D;

 	// init mouse event manager
	MouseEventManager mouseEventManager = new MouseEventManager(ctx2d, console1);

	// send init game event
	eventBus.fire(initEvent, ctx2d);

	// load game imgs then lunch the gameLoop (the beggining of the game)
	AssetsLoader mainLoader = new AssetsLoader();
    	mainLoader.loadImages((){
    		window.animationFrame.then(gameLoop);
    });
}
