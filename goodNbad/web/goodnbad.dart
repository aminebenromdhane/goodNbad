library goodNbad;

import 'dart:html';
import 'dart:async';
//import 'package:logging/logging.dart';
//import 'dart:async';

part 'event/event_bus.dart';
part 'event/simple_event_bus.dart';
//part 'event/logging_event_bus.dart';

part 'view/screen/GameScreen.dart';
part 'view/screen/MenuScreen.dart';
part 'view/screen/OptionScreen.dart';
part 'service_model/WorldServiceModel.dart';
part 'model/World.dart';
part 'model/Target.dart';
part 'model/GameState.dart';
part 'view/StaticImage.dart';
part 'view/Assets.dart';
part 'view/AssetsLoader.dart';
part 'view/ImageLoader.dart';
part 'view/ImageContainer.dart';
part 'view/WorldView.dart';
part 'presenter/WordPresenter.dart';
part 'presenter/MenuPresenter.dart';
part 'event/MouseEventManager.dart';

// public objects
final EventBus eventBus = new EventBus();
final EventType<CanvasRenderingContext2D> initEvent = new EventType<CanvasRenderingContext2D>();
final EventType<Object> playEvent = new EventType<Object>();
final EventType<Point> clickEvent = new EventType<Point>();
final EventType<String> menuLunchEvent = new EventType<String>();

var console1;
var console2;
var console3;

CanvasRenderingContext2D _ctx2d;

// à supprimer. après avoir changer le mode de dessin
// ce n'est pas une solution de créer une ImageContainer à chaque déplacement d'objet
// devrai être récupérer du word. oubien de son background
var canvasHight = 768.toDouble();
var canvasWidth = 1024.toDouble();

MenuPresenter _menuPresenter;

void main() {
    print("begin main");
	// select console
	console1 = querySelector("#console1");
	console2 = querySelector("#console2");
	console3 = querySelector("#console3");

	// select canvas div
	CanvasElement canvas = querySelector("#gameCanvas");
 	_ctx2d = canvas.context2D;
 	_menuPresenter = new MenuPresenter(_ctx2d);
 	
 	eventBus.fire(menuLunchEvent, GameState.INIT);
}
