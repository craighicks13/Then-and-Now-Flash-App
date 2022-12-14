package
{
	import com.criticalfusion.thenandnow.view.Application;
	import com.criticalfusion.thenandnow.view.LoaderWindow;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	import com.greensock.plugins.AutoAlphaPlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class MainLoader extends Sprite
	{
		public var loaderWindow:LoaderWindow;
		public var loader:Loader;
		
		public var app:Application;
		
		public function MainLoader()
		{
			super();
			initialize();
		}
		
		final protected function onLoadProgress(event:ProgressEvent):void
		{
			loaderWindow.updateLoading(event.bytesLoaded / event.bytesTotal);
		}
		
		final protected function onLoadComplete(event:Event):void
		{
			app = loader.content as Application;
			loaderWindow.loadComplete();
		}
		
		final protected function onLoadError(event:IOErrorEvent):void
		{
			trace(event);
		}
		
		final protected function animateLoaderOut():void
		{
			TweenMax.to(loaderWindow, .7, {y:stage.stageHeight, ease:Back.easeIn, onComplete:mainMovieIn});
		}
		
		final protected function mainMovieIn():void
		{
			removeChild(loaderWindow);
			loaderWindow = null;
			
			addChild(app);
		}
		
		final protected function onResizeStage(event:Event):void
		{
			TweenMax.to(loaderWindow, .5, {x:stage.stageWidth * .5, y: stage.stageHeight * .5, ease:Sine.easeOut, overwrite:2, delay:.2});
		}
		
		final protected function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			stage.addEventListener(Event.RESIZE, onResizeStage);
			
			loaderWindow.x = stage.stageWidth * .5;
			loaderWindow.y = stage.stageHeight * .5;
			
			loaderWindow.enterApplication = animateLoaderOut;
		}

		final protected function initialize():void
		{
			this.cacheAsBitmap = true;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			TweenPlugin.activate([AutoAlphaPlugin]);
			
			var paramObj:Object = LoaderInfo(this.root.loaderInfo).parameters;
			var movie:String = paramObj.main || "ThenAndNow.swf";
			
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onLoadProgress, false, 0, true);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete, false, 0, true);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadError, false, 0, true);
			loader.load(new URLRequest(movie)); // + "?" + new Date().getTime()));
		}
	}
}
