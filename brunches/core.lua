namespace"trit"{
	namespace"model"{
		class"TRP51_A1"
		:inherits(trit.spine.BaseDriver)
		:description("hoge"){
			field"strName"
			:attributes(static)
			:init("TRP51_A1");
	
			method"SetGlobalValue"
			:body(function(self,strValue,numValue)
				_G["_ID"..self.id.."_1_"..strValue] = numValue
			end);
	
			method"GetGlobalValue"
			:body(function(self,strValue)
				return _G["_ID"..self.id.."_1_"..strValue]
			end);
	
	    	method"Init"
			:attributes(override)
	    	:body(function(self)
	    		self.id = 1
				self:cOut("...loaded Init")
					
				self.namMain = _G["_ID"..self.id.."_1_N_SENS_MAIN"]
				out(0,"ok")
				self.objECS = trit.model.trp51_a1.ECS:new(self.id,self.GetGlobalValue,self.SetGlobalValue)
				self.objACS = trit.model.trp51_a1.ACS:new(self.id,self.GetGlobalValue,self.SetGlobalValue)
				self.objTVCS = trit.model.trp51_a1.TVCS:new(self.id,self.GetGlobalValue,self.SetGlobalValue)
				self.objGear = trit.model.trp51_a1.Gear:new(self.id,self.GetGlobalValue,self.SetGlobalValue)
				self.objMaterial = trit.model.trp51_a1.Material:new(self.id,self.GetGlobalValue,self.SetGlobalValue)
				
				-- self.objFile1 = trit.fileio.BaseFile:new("Buffer.txt")
				self.objVImport = trit.vmodeler.VImport:new("lib/ttata/Model/TRP51_A1/brunches/Basic.rcd")
				
				_SPLIT(1)
	    	end);
	    	
	    	method"Call"
			:attributes(override)
	    	:body(function(self)
	    		self:objECS()
	    		self:objACS()
	    		self:objTVCS()
	    		self:objGear()
	    		self:objMaterial()
	    		
	    		if _KEYDOWN(0) == 1 then
	    			self.objGear:SetSwitch(not self.objGear.booUp)
	    		end
	    		
	    		-- self:cOut(GetLongModelName())
	    		-- self:cOut(self.objFile1:GetString())
				self.objVImport:GenerateData()
	    		
	    	end);
	    	
	    	method"Value"
	    	:attributes(override)
	    	:body(function(self)
	    		out(0,_VZ(1)*3.6.."km/h")

				self.objECS:Value()
				self.objTVCS:Value()
				self.objACS:Value()
				self.objGear:Value()
	    		self.objMaterial:Value()
				
					    		
	    	end);
	    	
			method"Draw"
			:attributes(override)
			:body(
				function(self)
				end
			);
		};
	}
}