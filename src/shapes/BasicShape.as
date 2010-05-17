package shapes
{
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class BasicShape extends Sprite
	{
		private var _params : Object;
		
		private var _stroke : Shape;
		private var _strokeColor : uint = 0x000000;
		private var _strokeWidth : Number = 1;
		private var _strokeOpacity : Number = 1;
		
		private var _fill : Shape;
		private var _fillColor : uint = 0x330000;
		private var _fillOpacity : Number = 1;
		
		private var _center : Shape;
		private var drawCenter : Boolean = true;
		
		public function BasicShape(params:Object)
		{
			_params = params || {};
			_stroke = new Shape();
			_stroke.name = "stroke";
			_fill = new Shape();
			_fill.name = "fill";
			_center = new Shape();
			
			addChild(_fill);
			addChild(_stroke);
			addChild(_center);
			
			init(_params);
		}

		public function get stroke():Shape
		{
			return _stroke;
		}

		public function set stroke(value:Shape):void
		{
			_stroke = value;
		}

		public function get fill():Shape
		{
			return _fill;
		}

		public function set fill(value:Shape):void
		{
			_fill = value;
		}

		private function init(params:Object):void
		{
			for (var item:* in params)
			{	
				if (hasOwnProperty(item))
				{
					this[item] = params[item];
				} else
				{
					trace("there is no such thing as " + item);
				}
				
			}
		}
		
		public function draw():void
		{
			if (drawCenter)
			{
				_center.graphics.clear();
				_center.graphics.lineStyle(1);
				_center.graphics.moveTo(0, -5);
				_center.graphics.lineTo(0, 5);
				_center.graphics.moveTo(-5, 0);
				_center.graphics.lineTo(5, 0);
			}
		}

		public function get strokeColor():uint
		{
			return _strokeColor;
		}

		public function set strokeColor(value:uint):void
		{
			_strokeColor = value;
			draw();
		}

		public function get strokeWidth():Number
		{
			return _strokeWidth;
		}

		public function set strokeWidth(value:Number):void
		{
			_strokeWidth = value;
			draw();
		}

		public function get fillColor():uint
		{
			return _fillColor;
		}

		public function set fillColor(value:uint):void
		{
			_fillColor = value;
			draw();
		}

		public function get fillOpacity():Number
		{
			return _fillOpacity;
		}

		public function set fillOpacity(value:Number):void
		{
			_fillOpacity = value;
			draw();
		}


		public function get strokeOpacity():Number
		{
			return _strokeOpacity;
		}

		public function set strokeOpacity(value:Number):void
		{
			_strokeOpacity = value;
			draw();
		}


	}
}