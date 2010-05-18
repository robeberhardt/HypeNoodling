package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.filters.BlurFilter;
	
	import hype.extended.behavior.MouseFollowSpring;
	import hype.extended.rhythm.FilterRhythm;
	import hype.framework.display.BitmapCanvas;
	
	
	[SWF(width="800", height="600", frameRate="30", backgroundColor="#000000", pageTitle="Floating Head of Gemmell!")]
	
	public class FHog extends Sprite
	{
		
		[Embed(source="gemmell.jpg")]
		public var Gemmel:Class;
		
		private var headClip:Sprite;
		private var head:Bitmap;
		
		public function FHog()
		{
			
			graphics.lineStyle(0x000000, 4);
			graphics.drawRect(0, 0, stage.stageWidth-2, stage.stageHeight-2);
			
			headClip = new Sprite();
			headClip.scaleX =headClip.scaleY = .7;
			headClip.x = 300;
			headClip.y = 300;
			
			addChild(headClip);
			head = new Gemmel();
			head.alpha = .5;
			
			head.scaleX = head.scaleY = .9;
			head.x = -head.width * .5;
			head.y = -head.height * .5;
			
			headClip.addChild(head);
			
			var maskSprite:Sprite = new Sprite();
			maskSprite.graphics.beginFill(0x00FF00, 1);
			maskSprite.graphics.drawCircle(0, 0, 170);
			maskSprite.scaleX = .7;
			maskSprite.scaleY = .8;
			headClip.addChild(maskSprite);
			head.mask = maskSprite;
			
			var container:Sprite = new Sprite();
			container.addChild(headClip);
			addChild(container);
			
			var bcanvas:BitmapCanvas = new BitmapCanvas(800, 600);
			bcanvas.startCapture(container, true);
			addChild(bcanvas);
			
			var blur:BlurFilter = new BlurFilter(5, 5, 3);
			var blurRhythm:FilterRhythm = new FilterRhythm([blur], bcanvas.bitmap.bitmapData);
			blurRhythm.start();
			
			var b:MouseFollowSpring = new MouseFollowSpring(headClip, 0.8, 0.1);
			b.start();
		}
	}
}