package com.vravichandran.cms.context
{
	import com.ravi.framework.robolegs2.AbstractConfigure;
	import com.vravichandran.cms.commands.ArtistCommand;
	import com.vravichandran.cms.commands.ArtistMovieCommand;
	import com.vravichandran.cms.commands.ArtistTypeCommand;
	import com.vravichandran.cms.commands.FamilyCommand;
	import com.vravichandran.cms.commands.MovieCommand;
	import com.vravichandran.cms.commands.RelationTypeCommand;
	import com.vravichandran.cms.commands.SongCommand;
	import com.vravichandran.cms.delegate.ArtistDelegate;
	import com.vravichandran.cms.delegate.ArtistMovieDelegate;
	import com.vravichandran.cms.delegate.ArtistTypeDelegate;
	import com.vravichandran.cms.delegate.FamilyDelegate;
	import com.vravichandran.cms.delegate.MovieDelegate;
	import com.vravichandran.cms.delegate.RelationTypeDelegate;
	import com.vravichandran.cms.delegate.SongDelegate;
	import com.vravichandran.cms.events.ArtistEvent;
	import com.vravichandran.cms.events.ArtistMovieEvent;
	import com.vravichandran.cms.events.ArtistTypeEvent;
	import com.vravichandran.cms.events.FamilyEvent;
	import com.vravichandran.cms.events.MovieEvent;
	import com.vravichandran.cms.events.RelationTypeEvent;
	import com.vravichandran.cms.events.SongEvent;
	import com.vravichandran.cms.mediator.ArtistMovieViewMediator;
	import com.vravichandran.cms.mediator.ArtistTypeViewMediator;
	import com.vravichandran.cms.mediator.ArtistViewMediator;
	import com.vravichandran.cms.mediator.FamilyViewMediator;
	import com.vravichandran.cms.mediator.HomeViewMediator;
	import com.vravichandran.cms.mediator.MovieViewMediator;
	import com.vravichandran.cms.mediator.RelationTypeViewMediator;
	import com.vravichandran.cms.mediator.SongViewMediator;
	import com.vravichandran.cms.mediator.View1Mediator;
	import com.vravichandran.cms.mediator.renderer.TrashArtistTypeIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.TrashRelationTypeIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.artist.EditArtistIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.artist.TrashArtistIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.artist_movie.ArtistNameIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.artist_movie.ArtistTypeIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.artist_movie.TrashArtistMovieIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.family.RelationTypeIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.family.RelativeIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.family.TrashFamilyIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.movie.EditMovieIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.movie.TrashMovieIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.song.LyricsIRendererMediator;
	import com.vravichandran.cms.mediator.renderer.song.Singer1IRendererMediator;
	import com.vravichandran.cms.mediator.renderer.song.Singer2IRendererMediator;
	import com.vravichandran.cms.mediator.renderer.song.Singer3IRendererMediator;
	import com.vravichandran.cms.mediator.renderer.song.TrashSongIRendererMediator;
	import com.vravichandran.cms.model.AppModuleLocator;
	import com.vravichandran.cms.renderer.TrashArtistTypeIRenderer;
	import com.vravichandran.cms.renderer.TrashRelationTypeIRenderer;
	import com.vravichandran.cms.renderer.artist.EditArtistIRenderer;
	import com.vravichandran.cms.renderer.artist.TrashArtistIRenderer;
	import com.vravichandran.cms.renderer.artist_movie.ArtistNameIRenderer;
	import com.vravichandran.cms.renderer.artist_movie.ArtistTypeIRenderer;
	import com.vravichandran.cms.renderer.artist_movie.TrashArtistMovieIRenderer;
	import com.vravichandran.cms.renderer.family.RelationTypeIRenderer;
	import com.vravichandran.cms.renderer.family.RelativeIRenderer;
	import com.vravichandran.cms.renderer.family.TrashFamilyIRenderer;
	import com.vravichandran.cms.renderer.movie.EditMovieIRenderer;
	import com.vravichandran.cms.renderer.movie.TrashMovieIRenderer;
	import com.vravichandran.cms.renderer.song.LyricsIRenderer;
	import com.vravichandran.cms.renderer.song.Singer1IRenderer;
	import com.vravichandran.cms.renderer.song.Singer2IRenderer;
	import com.vravichandran.cms.renderer.song.Singer3IRenderer;
	import com.vravichandran.cms.renderer.song.TrashSongIRenderer;
	import com.vravichandran.cms.view.ArtistMovieView;
	import com.vravichandran.cms.view.ArtistTypeView;
	import com.vravichandran.cms.view.ArtistView;
	import com.vravichandran.cms.view.FamilyView;
	import com.vravichandran.cms.view.HomeView;
	import com.vravichandran.cms.view.MovieView;
	import com.vravichandran.cms.view.RelationTypeView;
	import com.vravichandran.cms.view.SongView;
	import com.vravichandran.cms.view.View1;
	
	public class ContextMain extends AbstractConfigure
	{	
		override public function configure():void
		{			
			mapInjector();
			mapMediators();
			mapCommands();
			
			dispatch(new MovieEvent(MovieEvent.GET_ALL_MOVIE));
			dispatch(new ArtistEvent(ArtistEvent.GET_ALL_ARTIST));			
						
			dispatch(new ArtistTypeEvent(ArtistTypeEvent.GET_ALL_ARTIST_TYPE));			
			dispatch(new RelationTypeEvent(RelationTypeEvent.GET_ALL_RELATION_TYPE));
			
			dispatch(new FamilyEvent(FamilyEvent.GET_ALL_FAMILY));
			dispatch(new SongEvent(SongEvent.GET_ALL_SONG));
		}
		
		/**
		 * 	Injection Mapping with the Injector Class
		 */
		private function mapInjector():void
		{
			injector.map(AppModuleLocator).asSingleton();
			
			injector.map(ArtistMovieDelegate).asSingleton();
			injector.map(ArtistDelegate).asSingleton();
			injector.map(ArtistTypeDelegate).asSingleton();
			injector.map(MovieDelegate).asSingleton();
			injector.map(SongDelegate).asSingleton();
			injector.map(FamilyDelegate).asSingleton();
			injector.map(RelationTypeDelegate).asSingleton();			
		}
		
		/**
		 * Injection Mapping with the MediatorMap Class
		 */
		private function mapMediators():void
		{
			// Item renderer
			mediatorMap.map(ArtistNameIRenderer).toMediator(ArtistNameIRendererMediator);
			mediatorMap.map(ArtistTypeIRenderer).toMediator(ArtistTypeIRendererMediator);
			mediatorMap.map(TrashArtistMovieIRenderer).toMediator(TrashArtistMovieIRendererMediator);			
			mediatorMap.map(TrashArtistIRenderer).toMediator(TrashArtistIRendererMediator);
			
			// renderer > Movie
			mediatorMap.map(TrashMovieIRenderer).toMediator(TrashMovieIRendererMediator);
			mediatorMap.map(EditMovieIRenderer).toMediator(EditMovieIRendererMediator);
			
			
			// renderer > ArtistType
			mediatorMap.map(TrashArtistTypeIRenderer).toMediator(TrashArtistTypeIRendererMediator);
			mediatorMap.map(EditArtistIRenderer).toMediator(EditArtistIRendererMediator);
			
			// renderer > RelationType
			mediatorMap.map(TrashRelationTypeIRenderer).toMediator(TrashRelationTypeIRendererMediator);
			
			// renderer > Song
			mediatorMap.map(LyricsIRenderer).toMediator(LyricsIRendererMediator);
			mediatorMap.map(Singer1IRenderer).toMediator(Singer1IRendererMediator);
			mediatorMap.map(Singer2IRenderer).toMediator(Singer2IRendererMediator);
			mediatorMap.map(Singer3IRenderer).toMediator(Singer3IRendererMediator);
			mediatorMap.map(TrashSongIRenderer).toMediator(TrashSongIRendererMediator);	
			
			// renderer > Family
			mediatorMap.map(RelativeIRenderer).toMediator(RelativeIRendererMediator);
			mediatorMap.map(RelationTypeIRenderer).toMediator(RelationTypeIRendererMediator);
			mediatorMap.map(TrashFamilyIRenderer).toMediator(TrashFamilyIRendererMediator);	
			
			// Views
			mediatorMap.map(HomeView).toMediator(HomeViewMediator);
			mediatorMap.map(View1).toMediator(View1Mediator);
			
			mediatorMap.map(MovieView).toMediator(MovieViewMediator);
			mediatorMap.map(ArtistView).toMediator(ArtistViewMediator);
			mediatorMap.map(ArtistMovieView).toMediator(ArtistMovieViewMediator);
			mediatorMap.map(SongView).toMediator(SongViewMediator);
			mediatorMap.map(FamilyView).toMediator(FamilyViewMediator);
			mediatorMap.map(RelationTypeView).toMediator(RelationTypeViewMediator);
			mediatorMap.map(ArtistTypeView).toMediator(ArtistTypeViewMediator);
		}
		
		
		/**
		 *	Injection Mapping with the CommandMap Class
		 */
		private function mapCommands():void
		{
			commandMap.map(ArtistMovieEvent.ARTIST_MOVIE_COMMAND).toCommand(ArtistMovieCommand);
			commandMap.map(MovieEvent.MOVIE_COMMAND).toCommand(MovieCommand);
			commandMap.map(ArtistEvent.ARTIST_COMMAND).toCommand(ArtistCommand);
			commandMap.map(ArtistTypeEvent.ARTIST_TYPE_COMMAND).toCommand(ArtistTypeCommand);
			commandMap.map(FamilyEvent.FAMILY_COMMAND).toCommand(FamilyCommand);
			commandMap.map(SongEvent.SONG_COMMAND).toCommand(SongCommand);
			commandMap.map(RelationTypeEvent.RELATION_TYPE_COMMAND).toCommand(RelationTypeCommand);
		}
	}
}
