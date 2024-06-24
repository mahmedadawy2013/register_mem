/******************************************************************************
* Module: Private - Register File
*
* File Name: Register_file.v
*
* Description:  A register file consists of 8 registers, each register of 16-bit width.
*               ? The register file has read data bus(RdData), write data bus(WrData) 
*               and one address bus (Address) used for both read and write operations.
*               ? Each register can be read and written by applying a registeraddress to be accessed.
*               ? Only one operation (read or write) can be evaluated at a time.
*               ? Write Operation is done only when WrEn is high
*               ? Read operation is done only when RdEn is high.
*               ? Read and Write operations are done on positive edge of Clock
*               ? All the registers are cleared using Asynchronous active low Reset
*
* Author: Mohamed A. Eladawy
*
*******************************************************************************/

//**************************** Port Declaration ******************************//
module Register_file (
  
input wire [15:0]  WrData  , //Declaring the Variable As an Input Port with width 16 bits
input wire [3:0]   Address , //Declaring the Variable As an Input Port with width 4 bits
input wire         WrEn    , //Declaring the Variable As an Input Port with width 1 bit 
input wire         RdEn    , //Declaring the Variable As an Input Port with width 1 bit 
input wire         CLK     , //Declaring the Variable As an Input Port with width 1 bit 
input wire         RST     , //Declaring the Variable As an Input Port with width 1 bit 
output reg [15:0]  RdData    //Declaring the Variable As an Output Port with width 16 bits

);

//******************** Declaration Of 2D Array As an Register File *****************//

reg [15:0] Register_File [7:0] ;  //Register File With Width 16 bits 
 
//******************************The RTL Code********************************//

/********************Starting The Sequential Always Block********************/

always @(posedge CLK or negedge RST )

begin 

  if (! RST )  //Check if the Rest is on or Off
     
     begin 
          
       Register_File[0] <= 16'b0 ;
       Register_File[1] <= 16'b0 ;
       Register_File[2] <= 16'b0 ;
       Register_File[3] <= 16'b0 ;
       Register_File[4] <= 16'b0 ;
       Register_File[5] <= 16'b0 ;
       Register_File[6] <= 16'b0 ;
       Register_File[7] <= 16'b0 ;
         
         
     end

 else if ( WrEn == 1'b1 ) 
     
     begin  
      
       Register_File[Address] <= WrData ;
    
     end  
  
 else if ( RdEn == 1'b1 ) 
     
     begin  
      
       RdData <=  Register_File[Address] ;
    
     end    

 else 
     
     begin  
      
       RdData <=  16'b0  ;
    
     end  
  
end 


endmodule