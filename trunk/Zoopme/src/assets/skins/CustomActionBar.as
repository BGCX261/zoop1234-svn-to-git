package assets.skins
{
	
	import flash.display.GradientType;
	import flash.geom.Matrix;
	
	import spark.skins.mobile.ActionBarSkin;
	
	public class CustomActionBar extends ActionBarSkin
	{
		private static var colorMatrix:Matrix = new Matrix();
		
		private var mFillColors:Array = [0xCCCCCC, 0x207cca, 0x2989d8];
		private var mFillAlphas:Array = [1, 1, 1];
		private var mFillRatios:Array = [0, 50, 255];
		private var mLineColor:uint = 0x70b0e0;
		private var mLineWeight:int = 2;
		
		public function CustomActionBar()
		{
			super();
			
			borderClass = null;
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			var fillColors:Array = (getStyle("actionBarColors") == null) ? mFillColors : getStyle("actionBarColors");
			var fillAlphas:Array = (getStyle("actionBarAlphas") == null) ? mFillAlphas : getStyle("actionBarAlphas");
			var fillRatios:Array = (getStyle("actionBarRatios") == null) ? mFillRatios : getStyle("actionBarRatios");
			
			var lineColor:uint = (isNaN(getStyle("lineColor"))) ? mLineColor : getStyle("lineColor");
			var lineWeight:int = (isNaN(getStyle("lineWeight"))) ? mLineWeight : getStyle("lineWeight");
			
			colorMatrix.createGradientBox(unscaledWidth, unscaledHeight, Math.PI / 2, 0, 0);
			
			graphics.beginGradientFill(GradientType.LINEAR, fillColors, fillAlphas, fillRatios, colorMatrix);
			graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
			graphics.endFill();
			
			graphics.beginFill(lineColor, 1);
			graphics.drawRect(0, unscaledHeight - lineWeight, unscaledWidth, lineWeight);
			graphics.endFill();
		}
	}
}