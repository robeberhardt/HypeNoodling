package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Canvas extends Sprite
	{
		private var _width:uint;
		private var _height:uint;
		
		public function Canvas(w:uint, h:uint)
		{
			_width = w;
			_height = h;
			
			if(stage) { init(); } else { addEventListener(Event.ADDED_TO_STAGE, init); }
		}
		
		private function init(e:Event=null):void
		{
			graphics.beginFill(0x000000, 0);
			graphics.drawRect(0, 0, _width, _height);
			stage.addEventListener(Event.RESIZE, onResize);
		}
		
		private function onResize(e:Event):void
		{
			trace(stage.stageWidth + ", " + stage.stageHeight);
		}
	}
}