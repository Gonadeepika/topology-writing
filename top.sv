/************************************************************************
  
Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
  
www.maven-silicon.com 
  
All Rights Reserved. 
This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd. 
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.
  
Filename		:   top.sv

Description		:	Top Module 
  
Author Name		:   Putta Satish

Support e-mail	: 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

************************************************************************/


module top;
  	import uvm_pkg::*;
	// import the ram_pkg
  
    import ram_pkg::*;
       	 

	// Declare two handles of write_xtn class wr_copy_xtnh and wr_clone_xtnh 
	// Do the same for read_xtn class(optional)
       
    write_xtn wr_copy_xtnh, wr_clone_xtnh;

 	// Declare dynamic array of handles for write_xtn as wr_xtnh

	write_xtn wr_xtnh[]; 
	// Declare a varible no_trans as int data type and initialize it with value 10.
 	int no_trans=10;
        
	// Within initial block
 	initial
	begin

		// Allocate the size of above declared array equal to 10

		wr_xtnh = new[no_trans];  
		// Within for loop, Generate ten random transactions	
		// Create 10 tr class objects with different strings using $sformatf 
		// randomize & print the 10 transaction class objects
		
		for(int i=0;i<no_trans;i++)
			begin
				wr_xtnh[i]=write_xtn::type_id::create($sformatf("wr_xtnh[%0d]",i));
				assert(wr_xtnh[i].randomize());
				// Print the transaction item using different methods
				// wr_xtnh[i].print(uvm_default_tree_printer);
				wr_xtnh[i].print(uvm_default_table_printer);
			end	
			
	  
	  
		// Copy the 5th transaction item into the 3rd transaction item using copy method 
		wr_xtnh[3].copy(wr_xtnh[5]);

		// Copy the 3rd transaction item into another item(wr_copy_xtnh) using copy method
		// Note : Do create an instance for wr_copy_xtnh
		wr_copy_xtnh=write_xtn::type_id::create("wr_copy_xtnh");
		wr_copy_xtnh.copy(wr_xtnh[3]);
		//Print the object wr_copy_xtnh in a tree format
		wr_copy_xtnh.print(uvm_default_tree_printer);

		// Call Compare method on the 5th and 3rd transaction items
		if(wr_xtnh[3].compare(wr_xtnh[5], null))
			$display("COMPARE SUCCESSFUL");
		else
			$display("COMPARE FAILURE");

		// Using clone() method copy the 8th item to another item(wr_clone_xtnh)
		// Note : Do not create an instance for wr_clone_xtnh
		$cast(wr_clone_xtnh,wr_xtnh[8].clone());
		//Print the object wr_clone_xtnh in a line format
		wr_clone_xtnh.print(uvm_default_line_printer);
		

    end
		// Do the same for Read Transaction item(Optional)


endmodule : top


