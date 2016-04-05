package com.vravichandran.cms.logger
{
	import com.hurlant.util.Hex;
	
	import flash.events.Event;
	import flash.events.FileListEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	
	import mx.core.FlexGlobals;
	import mx.core.UIComponent;
	import mx.core.mx_internal;
	import mx.events.FlexEvent;
	import mx.logging.targets.LineFormattedTarget;
	import mx.utils.StringUtil;
	
	import spark.components.WindowedApplication;
	

	use namespace mx_internal;

	public class EncriptApplicationLogSave extends LineFormattedTarget
	{
		
		private var stream:FileStream = new FileStream();
		private var file:File = new File();
		public var logName:String = "robotlegs2";
		public var directory:String = "app-storage:/logs"
		public var format:String;
		public var fileCounter:int = 1;
		
		public static const DIRECTORY_SIZE_LIMIT:Number = 50000000;//50MB
		public static const FILE_SIZE_LIMIT:Number = 5000000;      //5MB
		
		
		public function EncriptApplicationLogSave()
		{
			super();
		}

		override mx_internal function internalLog(message:String):void
		{
			var isFileTooLarge:Boolean = file.size >= FILE_SIZE_LIMIT;
			
			if (isFileTooLarge) {
				internalLog(" ***** LOG CONTINUED IN FILE: client" + fileCounter + " *****");
				createFile();
				cleanup();
			}
			
			trace(message);			
			stream.writeBytes(Hex.toArray(Hex.fromString(message)));
			stream.writeMultiByte(File.lineEnding, "utf-8");
		}
		
		override public function initialized(document:Object, id:String):void {
			super.initialized(document, id);
			
			var comp:UIComponent = document as UIComponent;
			
			if (comp) {
				comp.addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
			}
		}
		
		private function cleanup():void {
			var logDir:File = new File(directory);
			
			if (logDir.isDirectory) {
				logDir.addEventListener(FileListEvent.DIRECTORY_LISTING, onDirectoryListing);
				logDir.getDirectoryListingAsync();
			}
			
		}
		
		private function orderModificationDate(a:File, b:File):int{
			var aCreationTimestamp : Number = a.modificationDate.getTime();
			var bCreationTimestamp : Number = b.modificationDate.getTime();
			if(aCreationTimestamp < bCreationTimestamp){
				return 1;
			}
			else if (aCreationTimestamp > bCreationTimestamp){
				return -1;
			}
			else return 0;
		}
		
		protected function onDirectoryListing(event:FileListEvent):void {
			try {
				
				event.files.sort(orderModificationDate);
				var total:Number = 0;
				var isPastLimit:Boolean = false;
				for each (var file:File in event.files) {
					if (isPastLimit) {
						file.deleteFileAsync();
					} else {
						total += file.size;
						if (total > DIRECTORY_SIZE_LIMIT) {
							isPastLimit = true;
							file.deleteFileAsync();
						}
					}
				}
				
			} catch(e:Error) {
			}
		}
		
		
		protected function onCreationComplete(event:FlexEvent):void {
			var comp:UIComponent = event.target as UIComponent;
			comp.removeEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);	
			(FlexGlobals.topLevelApplication as WindowedApplication).addEventListener(Event.CLOSING, endSessionLog, false, int.MAX_VALUE);			
			createFile();		
			beginLog();
		}


		private function createFile():void
		{
			var timestamp:String = new Date().getTime().toString();
			var path:String = "{0}/{1}-client-{2}-{3}.log";
			path = StringUtil.substitute(path, directory, logName, timestamp, fileCounter);
			
			file = new File(path);
			
			stream.open(file, FileMode.WRITE);
			fileCounter++;
		}

		private function beginLog():void
		{
			internalLog("*** *** *** *** BEGINNING OF LOG FILE - SESSION ID = " + id + " *** *** *** ***");
			internalLog("");
			internalLog("Log Generated: " + new Date().toLocaleString() + " | z=" + new Date().getTimezoneOffset());
			internalLog("");
			internalLog("===========================================================================================================");
			internalLog("");
		}

		private function endSessionLog(event:Event):void
		{
			internalLog("************ END OF LOG FOR SESSION ******************");
		}
	}
}
