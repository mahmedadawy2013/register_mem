module Register_file_tb  () ;
  

// all design inputs are defined in testbench as reg to be used inside initial block 
// all design outputs are defined in testbench as wire   
  reg    [15:0]    WrData_tb     ; 
  reg    [3:0]     Address_tb    ;
  reg              CLK_tb        ;
  reg              RST_tb        ;
  reg              WrEn_tb       ; 
  reg              RdEn_tb       ;
  wire   [15:0]    RdData_tb     ; 
/***********************************************************************/ 
initial 
  begin
    $dumpfile("Register_file.vcd") ;
    $dumpvars ;
    //initial values
    WrData_tb        = 16'b0 ;   
    Address_tb       = 4'b0  ;
    RST_tb           = 1'b1  ;
    WrEn_tb          = 1'b0  ;
    RdEn_tb          = 1'b0  ;
    CLK_tb           = 1'b0  ;
/***********************************************************************/    
    $display ("TEST CASE 1") ;  // test Addition Function
    #3
    WrData_tb  = 16'b0011 ;
    Address_tb = 4'b0010  ;
    WrEn_tb    = 1'b1     ;  
    #7
    Address_tb = 4'b0010  ;
    RdEn_tb    = 1'b1     ;  
    if( RdData_tb != 16'b0011 )
      $display ("TEST CASE 1 IS FAILED") ;
    else
      $display ("TEST CASE 1 IS PASSED") ;
/***********************************************************************/    
                  
    #100
    $finish ;  
  
      
end 

// Clock Generator  
always begin #5 CLK_tb = ~ CLK_tb; 
end
  
// instaniate design instance 
Register_file DUT (
 .WrData(WrData_tb)  ,
 .Address(Address_tb),
 .CLK(CLK_tb)        , 
 .RST(RST_tb)        ,
 .WrEn(WrEn_tb)      ,
 .RdEn(RdEn_tb)      ,
 .RdData(RdData_tb)  

);

  
endmodule
  