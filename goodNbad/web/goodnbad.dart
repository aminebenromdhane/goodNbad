library goodNbad;

import 'dart:html';
import 'dart:async';
//import 'package:logging/logging.dart';
//import 'dart:async';

part 'event/event_bus.dart';
part 'event/simple_event_bus.dart';
//part 'event/logging_event_bus.dart';

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

WorldPresenter _worldPresenter;
CanvasRenderingContext2D _ctx2d;

// à supprimer. après avoir changer le mode de dessin
// ce n'est pas une solution de créer une ImageContainer à chaque déplacement d'objet
// devrai être récupérer du word. oubien de son background
var canvasHight = 768.toDouble();
var canvasWidth = 1024.toDouble();

void gameLoop(num delta){
    print("begin loop");
	// args : eventName, object passed
	eventBus.fire(playEvent, null);

	new Future.delayed(const Duration(milliseconds: 500), (){
		window.animationFrame.then(gameLoop);
	});
    print("re loop");
}

void gameInit(num delta){

	// init world presenter
	_worldPresenter = new WorldPresenter();

	// send init game event
	eventBus.fire(initEvent, _ctx2d);

	new Future((){
    	window.animationFrame.then(gameLoop);
    });
}

void main() {
    print("begin main");
	// select console
	console1 = querySelector("#console1");
	console2 = querySelector("#console2");
	console3 = querySelector("#console3");

	// select canvas div
	CanvasElement canvas = querySelector("#gameCanvas");
 	_ctx2d = canvas.context2D;

 	// init mouse event manager
	MouseEventManager mouseEventManager = new MouseEventManager(_ctx2d, console1);

	// load game imgs then lunch the gameLoop (the beggining of the game)
	AssetsLoader mainLoader = new AssetsLoader();
    	mainLoader.loadImages((){
    		window.animationFrame.then(gameInit);
    });
    print("end main");
}
