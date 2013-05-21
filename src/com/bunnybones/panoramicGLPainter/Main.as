package com.bunnybones.panoramicGLPainter
{
	import away3d.cameras.Camera3D;
	import away3d.cameras.lenses.PerspectiveLens;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.core.render.DefaultRenderer;
	import com.bunnybones.model.io.ModelIOAir;
	import com.bunnybones.model.NetModel;
	import com.bunnybones.MouseToolTip;
	import com.bunnybones.panoramicGLPainter.model.SettingsModel;
	import com.bunnybones.ui.keyboard.StageKeyBoard;
	import com.bunnybones.ui.wacom.StageWacom;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Tomasz Dysinski
	 */
	public class Main extends Sprite 
	{
		private var loadAs;
		private var settings:SettingsModel;
		
		public function Main():void 
		{
			
			//init UI
			StageKeyBoard.bind(stage);
			MouseToolTip.bind(stage);
			StageWacom.instance.bind(stage, this);
			
			//implement UI like hotkeys
			//stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
			//stage.addEventListener(Event.MOUSE_LEAVE, onMouseLeave);
			
			//graphics
			var lens:PerspectiveLens = new PerspectiveLens();
			var camera:Camera3D = new Camera3D(lens);
			var canvas:Scene3D = new Scene3D();
			var renderer:DefaultRenderer
			var view:View3D = new View3D(canvas, camera, renderer);
			
			StageKeyBoard.bindKey("New Painting", Keyboard.N, newPainting, null, true);
			StageKeyBoard.bindKey("Save", Keyboard.S, save, null, true);
			StageKeyBoard.bindKey("SaveAs", Keyboard.S, saveAs, null, true, true);
			
			StageKeyBoard.bindKey("Open", Keyboard.O, loadAs, null, true);
			
			//StageWacom.instance.bindPressureValue(Brush, "pressure");
			
			//io
			NetModel.ioClass = ModelIOAir;
			settings = new SettingsModel();
			settings.addEventListener(Event.COMPLETE, onSettingsFileComplete);
			settings.init("userModel/settings.xml");
		}
		
		private function saveAs():void 
		{
			
		}
		
		private function save():void 
		{
			
		}
		
		private function newPainting():void 
		{
			
		}
		
		private function onSettingsFileComplete(e:Event):void 
		{
			dtrace("!");
		}
		
	}
	
}