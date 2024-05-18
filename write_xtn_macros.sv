/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   write_xtn_macros.sv

Description		:	Write transaction class for Dual port RAM
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

//------------------------------------------
// CLASS DESCRIPTION
//------------------------------------------


// Extend write_xtn from uvm_sequence_item
class write_xtn extends uvm_sequence_item;



	//------------------------------------------
	// DATA MEMBERS (Outputs non rand, inputs rand)
	//------------------------------------------

	// Add the rand fields - data (`RAM_WIDTH-1:0), address(`ADDR_SIZE – 1:0),declared in tb_defs.sv
	// write (type bit) 

	rand bit[`RAM_WIDTH-1 : 0] data;    
	rand bit[`ADDR_SIZE-1 : 0] address;
	rand bit write;
  
	// Add the rand control knobs declared in tb_defs.sv

    // xtn_type (enumerated type addr_t)  -  for controlling the type of transaction 
	// xtn_delay (integer type) - for inserting delay between transactions
	
	rand addr_t xtn_type;
	rand bit[63:0] xtn_delay;
         

  
	// Factory registration and use macros for all the fields

	`uvm_object_utils_begin(write_xtn)
	  `uvm_field_int(data,UVM_ALL_ON)
	  `uvm_field_int(address,UVM_ALL_ON)
	  `uvm_field_int(write,UVM_ALL_ON)
	  `uvm_field_enum(addr_t,xtn_type,UVM_ALL_ON)
	  `uvm_field_int(xtn_delay,UVM_ALL_ON)
	`uvm_object_utils_end  

	//------------------------------------------
	// CONSTRAINTS
	//------------------------------------------
	 
	// Add the following constraints :
	// Data between 20 through 90
	// Address between 0 through 200
	// Distribute weights for xtn_type : BAD_XTN=2 and GOOD_XTN=30

	constraint a{ data inside {[20:90]};
		      address inside {[0:200]};
		      xtn_type dist {BAD_XTN:=2 , GOOD_XTN:=30}; 
		    }
	//------------------------------------------
	// METHODS
	//------------------------------------------

	// Standard UVM Methods like constructor,post_randomize
	extern function new(string name = "write_xtn");
	extern function void post_randomize();
endclass:write_xtn

//-----------------  constructor new method  -------------------//
//Add code for new()

function write_xtn::new(string name = "write_xtn");
	super.new(name);
endfunction:new
	  

function void write_xtn::post_randomize();
    if(xtn_type == BAD_XTN)
		begin
			this.address = 6000;
    end
endfunction : post_randomize
   
 
