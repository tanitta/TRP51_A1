namespace"trit"{
	namespace"model"{
		namespace"trp51_a1"{
			class"TVCS"
			:description("Thrust Vectoring Control System"){
			    	metamethod"_init"
			    	:body(function(self, id, fncGGV, fncSGV)
			    		self.id = id
			    		self.GetGlobalValue = fncGGV
			    		self.SetGlobalValue = fncSGV
			    		
			    	end);
			
			    	metamethod"__call"
			    	:body(function(self)
			    	end);
			    	
			    	method"Value"
			    	:body(function(self)
						self:SetGlobalValue("A_ENGINE_X_L",90+_ANALOG(1)/1000*-30)
						self:SetGlobalValue("A_ENGINE_X_R",90+_ANALOG(1)/1000*-30)
						
						self:SetGlobalValue("A_ENGINE_Y_L",0)
						self:SetGlobalValue("A_ENGINE_Y_R",0)
						
			    	end);
			};
		}
	}
}