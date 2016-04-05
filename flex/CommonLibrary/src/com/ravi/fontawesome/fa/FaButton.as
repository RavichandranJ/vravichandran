package com.ravi.fontawesome.fa
{
	
	import spark.components.Button;
	import spark.components.Label;
	
	public class FaButton extends Button
	{
		
		//--------------------------------------------------------------------------
		//
		//	Skin Parts
		//
		//--------------------------------------------------------------------------
		
		[SkinPart(required="false")]
		public var faDisplay:Label;
		
		
		
		//--------------------------------------------------------------------------
		//
		//	Properties
		//
		//--------------------------------------------------------------------------
		
		
		private var _fa:String;
		
		/**
		 * Display the fontAwesome icons. Enter the string in unicode format specified in Font Awesome 4.2.0.
		 * Visit http://fortawesome.github.io/Font-Awesome/cheatsheet/ for list of icons available. 
		 * @param string
		 * 
		 */		
		public function set fa(string:String):void
		{
			_fa = string;
			if(faDisplay) faDisplay.text = _fa;
		}
		
		public function get fa():String
		{
			return _fa;
		}
		
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		
		public function FaButton()
		{
			super();
		}
		
		override protected function getCurrentSkinState():String
		{
			return super.getCurrentSkinState();
		} 
		
		override protected function partAdded(partName:String, instance:Object) : void
		{
			super.partAdded(partName, instance);
			if(instance==faDisplay) {
				faDisplay.text  = _fa;
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
	}
}