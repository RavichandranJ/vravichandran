package com.vravichandran.cms.vo
{
	[Bindable]
	public class ArtistMovieVO
	{
		public function ArtistMovieVO()
		{
		}
		
		// db table->cols values
		public var artist_movie_id:int=0; 
		public var movie_id:int; 
		public var movie_name:String; 
		public var artist_id:int; 
		public var artist_name:String; 
		public var artist_type_id:int; 
		public var artist_type_label:String;
		
		// Update this value is data modified
		public var isDirty:Boolean = false;
		
		// to set selected index in cb
		public var artistIndex:int = -1;
		public var artistTypeIndex:int = -1;
		
	}
}