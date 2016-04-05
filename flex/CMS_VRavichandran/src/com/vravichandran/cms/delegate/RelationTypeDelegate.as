package com.vravichandran.cms.delegate
{
	import com.vravichandran.cms.events.RelationTypeEvent;
	import com.vravichandran.cms.services.ServiceLocator;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;
	
	public class RelationTypeDelegate
	{
		
		private var service:ServiceLocator = new ServiceLocator();
		
		public function getAllRelationType():AsyncToken
		{
			var token:AsyncToken = service.relationTypeService.getAllRelationType();
			token.serviceMethod = RelationTypeEvent.GET_ALL_RELATION_TYPE;
			return token;
		}
		
		
		public function addRelationType(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.relationTypeService.addRelationType(param);
			token.serviceMethod = RelationTypeEvent.ADD_RELATION_TYPE;
			token.vo = item;
			return token;
		}
		
		public function updateRelationType(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.relationTypeService.updateRelationType(param);
			token.serviceMethod = RelationTypeEvent.UPDATE_RELATION_TYPE;
			return token;
		}
		
		public function deleteRelationTypeById(item:Object):AsyncToken
		{
			var param:Object = new Object();
			param.vo = item;
			var token:AsyncToken = service.relationTypeService.deleteRelationTypeById(param);
			token.serviceMethod = RelationTypeEvent.DELETE_RELATION_TYPE_BY_ID;
			token.vo = item;
			return token;
		}		
		
	}
}