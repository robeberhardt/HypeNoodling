package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.filters.BlurFilter;
	
	import hype.extended.behavior.MouseFollowSpring;
	import hype.extended.rhythm.FilterRhythm;
	import hype.framework.display.BitmapCanvas;
	
	import net.hires.debug.Stats;
	
	import shapes.Circle;
	
	[SWF(widthPercent="100%", heightPercent="100%", frameRate="30", backgroundColor="#8899aa", pageTitle="HypeNoodling")]
	
	public class HypeNoodling extends Sprite
	{
		private var canvas : Canvas;
		
		public function HypeNoodling()
		{
			stage.align = StageAlign.TOP;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			canvas = new Canvas(800, 600);
			addChild(canvas);
	
			var myCircle:Circle = new Circle({radius:50, fillColor:0xFFF000});
			myCircle.strokeColor = 0xFF00AC;
			myCircle.strokeWidth = 1;
//			addChild(myCircle);
			
			var container:Sprite = new Sprite();
			container.addChild(myCircle);
			canvas.addChild(container);
			
			var bcanvas:BitmapCanvas = new BitmapCanvas(800, 600);
			bcanvas.startCapture(container, true);
			canvas.addChild(bcanvas);
			
			var blur:BlurFilter = new BlurFilter(5, 5, 3);
			var blurRhythm:FilterRhythm = new FilterRhythm([blur], bcanvas.bitmap.bitmapData);
			blurRhythm.start();
			
			var b:MouseFollowSpring = new MouseFollowSpring(myCircle, 0.8, 0.1);
			b.start();
			
			var stats : Stats = new Stats();
			addChild(stats);
		}
	}
}