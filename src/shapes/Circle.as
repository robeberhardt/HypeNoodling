package shapes
{
	public class Circle extends BasicShape
	{
		private var _radius : Number = 10;
		
		public function Circle(params:Object)
		{
			super(params);
		}
		
		override public function draw():void
		{			
			stroke.graphics.clear();
			stroke.graphics.lineStyle(strokeWidth, strokeColor);
			stroke.graphics.drawCircle(0, 0, _radius);
			
			fill.graphics.clear();
			fill.graphics.beginFill(fillColor, fillOpacity);
			fill.graphics.drawCircle(0, 0, _radius);
			
			super.draw();
		}

		public function get radius():Number
		{
			return _radius;
		}

		public function set radius(value:Number):void
		{
			_radius = value;
			draw();
		}
	}
}