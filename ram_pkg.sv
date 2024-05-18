/************************************************************************

Copyright 2019 - Maven Silicon Softech Pvt Ltd.   

www.maven-silicon.com 

All Rights Reserved This source code is an unpublished work belongs to 
Maven Silicon Softech Pvt Ltd. It is not to be shared with or used by any third
parties who have not enrolled d written authorization from Maven Silicon Softech Pvt.Ltd.


Filename		:   ram_pkg.sv

Description		:	Package for RAM TB

Author Name		:	Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/

package ram_pkg;
	// import uvm_pkg
   	import uvm_pkg::*;

	// include the uvm_macros.svh
 	`include "uvm_macros.svh"

  
	// include the tb_defs.sv

	`include "tb_defs.sv"
 
	//include write_xtn.sv  
//	`include "write_xtn.sv"
    `include "write_xtn_macros.sv"	

endpackage
