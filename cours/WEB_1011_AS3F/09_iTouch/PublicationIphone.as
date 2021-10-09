package
{
	import flash.display.Sprite;
	import flash.events.GesturePhase;
	import flash.events.TransformGestureEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	public final class PublicationIphone extends Sprite
	{
		public function PublicationIphone()
		{
			init();
		}
		private function init():void {
			Multitouch.inputMode = MultitouchInputMode.GESTURE;
			var gestures:Vector.<String> = Multitouch.supportedGestures;
			var ln:int = gestures.length;
			while ( --ln > -1 ){
				if ( gestures[ ln ] == TransformGestureEvent.GESTURE_ROTATE ){
					jacket.addEventListener(TransformGestureEvent.GESTURE_ROTATE, onRotation);
				}
				if ( gestures[ ln ] == TransformGestureEvent.GESTURE_ZOOM ){
					jacket.addEventListener(TransformGestureEvent.GESTURE_ZOOM, onZoom);
				}
			}
		}
		private function onRotation(e:TransformGestureEvent):void {
			if ( e.phase == GesturePhase.UPDATE ){
				jacket.rotation += e.rotation;
			}
		}
		private function onZoom(e:TransformGestureEvent):void {
			if ( e.phase == GesturePhase.UPDATE ){
				jacket.scaleX *= e.scaleX;
				jacket.scaleY *= e.scaleY;
			}
		}
	}
}