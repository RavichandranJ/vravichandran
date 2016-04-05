package com.vravichandran.cms.model
{
    import com.ravi.framework.robolegs2.AbstractClass;
    import com.ravi.framework.robolegs2.AbstractMediator;
    import com.vravichandran.cms.vo.ArtistVO;
    import com.vravichandran.cms.vo.MovieVO;
    
    import mx.collections.ArrayCollection;
    import mx.collections.ArrayList;

    [Bindable]
    public class AppModuleLocator extends AbstractClass
    {
		public var artistList:ArrayCollection = new ArrayCollection();
		public var artistMovieList:ArrayCollection = new ArrayCollection();
		public var artistTypeList:ArrayCollection = new ArrayCollection();
		public var movieList:ArrayCollection = new ArrayCollection();
		public var songList:ArrayCollection = new ArrayCollection();
		public var familyList:ArrayCollection = new ArrayCollection();
		public var relationTypeList:ArrayCollection = new ArrayCollection();
		
		public var selectedMovieVO:MovieVO = new MovieVO();
		public var selectedArtist:ArtistVO = new ArtistVO();
		
		
		public var selectedViewIndex:int = 0;
		public var message:String = "Defaut message";
		
    }
}