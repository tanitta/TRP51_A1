require("ttata/Material.lua")
namespace"trit"{
	namespace"model"{
		namespace"trp51_a1"{
			class"Material"
			:description("Material"){
			    	metamethod"_init"
			    	:body(function(self, id, fncGGV, fncSGV)
			    		self.id = id
			    		self.GetGlobalValue = fncGGV
			    		self.SetGlobalValue = fncSGV
			    		self.mat = {}
			    		self.mat.Body1 = trit.Material:new(body,solid)
			    		self.mat.Body1Cowl = trit.Material:new(body,solid)
			    		
			    		
			    	end);
			
			    	metamethod"__call"
			    	:body(function(self)
			    		self.mat.Body1:SetColorHSV(0,0,0.8)
						self.mat.Body1:SetEffect(0,0,7,5)
						
						self.mat.Body1Cowl:SetColorHSV(0,0,0.8*0.5)
						self.mat.Body1Cowl:SetEffect(0,0,7,5)
			    	end);
			    	
			    	method"Value"
			    	:body(function(self)
			    		self:SetGlobalValue("C_BODY1",self.mat.Body1:ComDecColor())
			    		self:SetGlobalValue("E_BODY1",self.mat.Body1:ComDecEffect())
			    		
			    		self:SetGlobalValue("C_BODY1_COWL",self.mat.Body1Cowl:ComDecColor())
			    		self:SetGlobalValue("E_BODY1_COWL",self.mat.Body1Cowl:ComDecEffect())
			    		
			    		
			    	end);
			};
		}
	}
}