package com.ravi.fontawesome.fa
{
	
	import spark.components.Button;
	import spark.components.Label;
	
	
	
	public class FaButtonAdvanced extends Button
	{
		
		//--------------------------------------------------------------------------
		//
		//	Skin Parts
		//
		//--------------------------------------------------------------------------
		
		[SkinPart(required="false")]
		public var faDisplay:Label;
		
		[SkinPart(required="false")]
		public var labelDisplay2:Label;
		
		
		
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
		
		
		
		private var _description:String;
		
		/**
		 *	Adds second label to the button.  
		 * @param string
		 * 
		 */		
		public function set description(string:String):void
		{
			_description = string;
			if(labelDisplay2) labelDisplay2.text = _description;
		}
		
		public function get description():String
		{
			return _description;
		}
		
		//--------------------------------------------------------------------------
		//
		//	Constructor
		//
		//--------------------------------------------------------------------------
		
		public function FaButtonAdvanced()
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
			
			if(instance==labelDisplay2) {
				labelDisplay2.text  = _description;
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object) : void
		{
			super.partRemoved(partName, instance);
		}
		
	}
}