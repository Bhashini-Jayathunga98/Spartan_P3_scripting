#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_gmem "../tv/cdatafile/c.parallel_to_AXI.autotvin_gmem.dat"
#define AUTOTB_TVOUT_gmem "../tv/cdatafile/c.parallel_to_AXI.autotvout_gmem.dat"
// wrapc file define:
#define AUTOTB_TVIN_wdata "../tv/cdatafile/c.parallel_to_AXI.autotvin_wdata.dat"
#define AUTOTB_TVOUT_wdata "../tv/cdatafile/c.parallel_to_AXI.autotvout_wdata.dat"
// wrapc file define:
#define AUTOTB_TVIN_wadd "../tv/cdatafile/c.parallel_to_AXI.autotvin_wadd.dat"
#define AUTOTB_TVOUT_wadd "../tv/cdatafile/c.parallel_to_AXI.autotvout_wadd.dat"
// wrapc file define:
#define AUTOTB_TVIN_rdata "../tv/cdatafile/c.parallel_to_AXI.autotvin_rdata.dat"
#define AUTOTB_TVOUT_rdata "../tv/cdatafile/c.parallel_to_AXI.autotvout_rdata.dat"
// wrapc file define:
#define AUTOTB_TVIN_radd "../tv/cdatafile/c.parallel_to_AXI.autotvin_radd.dat"
#define AUTOTB_TVOUT_radd "../tv/cdatafile/c.parallel_to_AXI.autotvout_radd.dat"
// wrapc file define:
#define AUTOTB_TVIN_cmd "../tv/cdatafile/c.parallel_to_AXI.autotvin_cmd.dat"
#define AUTOTB_TVOUT_cmd "../tv/cdatafile/c.parallel_to_AXI.autotvout_cmd.dat"
// wrapc file define:
#define AUTOTB_TVIN_sta "../tv/cdatafile/c.parallel_to_AXI.autotvin_sta.dat"
#define AUTOTB_TVOUT_sta "../tv/cdatafile/c.parallel_to_AXI.autotvout_sta.dat"
// wrapc file define:
#define AUTOTB_TVIN_AXI "../tv/cdatafile/c.parallel_to_AXI.autotvin_AXI.dat"
#define AUTOTB_TVOUT_AXI "../tv/cdatafile/c.parallel_to_AXI.autotvout_AXI.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem "../tv/rtldatafile/rtl.parallel_to_AXI.autotvout_gmem.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_wdata "../tv/rtldatafile/rtl.parallel_to_AXI.autotvout_wdata.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_wadd "../tv/rtldatafile/rtl.parallel_to_AXI.autotvout_wadd.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_rdata "../tv/rtldatafile/rtl.parallel_to_AXI.autotvout_rdata.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_radd "../tv/rtldatafile/rtl.parallel_to_AXI.autotvout_radd.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_cmd "../tv/rtldatafile/rtl.parallel_to_AXI.autotvout_cmd.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_sta "../tv/rtldatafile/rtl.parallel_to_AXI.autotvout_sta.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_AXI "../tv/rtldatafile/rtl.parallel_to_AXI.autotvout_AXI.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  gmem_depth = 0;
  wdata_depth = 0;
  wadd_depth = 0;
  rdata_depth = 0;
  radd_depth = 0;
  cmd_depth = 0;
  sta_depth = 0;
  AXI_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{gmem " << gmem_depth << "}\n";
  total_list << "{wdata " << wdata_depth << "}\n";
  total_list << "{wadd " << wadd_depth << "}\n";
  total_list << "{rdata " << rdata_depth << "}\n";
  total_list << "{radd " << radd_depth << "}\n";
  total_list << "{cmd " << cmd_depth << "}\n";
  total_list << "{sta " << sta_depth << "}\n";
  total_list << "{AXI " << AXI_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
  public:
    int gmem_depth;
    int wdata_depth;
    int wadd_depth;
    int rdata_depth;
    int radd_depth;
    int cmd_depth;
    int sta_depth;
    int AXI_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
struct __cosim_s4__ { char data[4]; };
struct __cosim_s1__ { char data[1]; };
extern "C" void parallel_to_AXI_hw_stub(__cosim_s4__, __cosim_s4__, volatile void *, __cosim_s4__, __cosim_s1__, volatile void *, volatile void *);

extern "C" void apatb_parallel_to_AXI_hw(__cosim_s4__ __xlx_apatb_param_wdata, __cosim_s4__ __xlx_apatb_param_wadd, volatile void * __xlx_apatb_param_rdata, __cosim_s4__ __xlx_apatb_param_radd, __cosim_s1__ __xlx_apatb_param_cmd, volatile void * __xlx_apatb_param_sta, volatile void * __xlx_apatb_param_AXI) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_gmem);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > gmem_pc_buffer(256);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "gmem");
  
            // push token into output port buffer
            if (AESL_token != "") {
              gmem_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_AXI)[j] = gmem_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_rdata);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > rdata_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "rdata");
  
            // push token into output port buffer
            if (AESL_token != "") {
              rdata_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {
            ((int*)__xlx_apatb_param_rdata)[0] = rdata_pc_buffer[0].to_int64();
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_sta);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<8> > sta_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "sta");
  
            // push token into output port buffer
            if (AESL_token != "") {
              sta_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {
            ((char*)__xlx_apatb_param_sta)[0] = sta_pc_buffer[0].to_int64();
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//gmem
aesl_fh.touch(AUTOTB_TVIN_gmem);
aesl_fh.touch(AUTOTB_TVOUT_gmem);
//wdata
aesl_fh.touch(AUTOTB_TVIN_wdata);
aesl_fh.touch(AUTOTB_TVOUT_wdata);
//wadd
aesl_fh.touch(AUTOTB_TVIN_wadd);
aesl_fh.touch(AUTOTB_TVOUT_wadd);
//rdata
aesl_fh.touch(AUTOTB_TVIN_rdata);
aesl_fh.touch(AUTOTB_TVOUT_rdata);
//radd
aesl_fh.touch(AUTOTB_TVIN_radd);
aesl_fh.touch(AUTOTB_TVOUT_radd);
//cmd
aesl_fh.touch(AUTOTB_TVIN_cmd);
aesl_fh.touch(AUTOTB_TVOUT_cmd);
//sta
aesl_fh.touch(AUTOTB_TVIN_sta);
aesl_fh.touch(AUTOTB_TVOUT_sta);
//AXI
aesl_fh.touch(AUTOTB_TVIN_AXI);
aesl_fh.touch(AUTOTB_TVOUT_AXI);
CodeState = DUMP_INPUTS;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
  {  if (__xlx_apatb_param_AXI) {
    for (int j = 0, e = 256; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_AXI)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
}
// print wdata Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_wdata, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_wdata);
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_wdata, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.wdata_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_wdata, __xlx_sprintf_buffer.data());
}
// print wadd Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_wadd, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_wadd);
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_wadd, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.wadd_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_wadd, __xlx_sprintf_buffer.data());
}
// print rdata Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_rdata, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_rdata);
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_rdata, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.rdata_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_rdata, __xlx_sprintf_buffer.data());
}
// print radd Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_radd, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_radd);
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_radd, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.radd_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_radd, __xlx_sprintf_buffer.data());
}
// print cmd Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_cmd, __xlx_sprintf_buffer.data());
  {
    sc_bv<8> __xlx_tmp_lv = *((char*)&__xlx_apatb_param_cmd);
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_cmd, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.cmd_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_cmd, __xlx_sprintf_buffer.data());
}
// print sta Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_sta, __xlx_sprintf_buffer.data());
  {
    sc_bv<8> __xlx_tmp_lv = *((char*)__xlx_apatb_param_sta);
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_sta, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.sta_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_sta, __xlx_sprintf_buffer.data());
}
// print AXI Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_AXI, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv;
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_AXI, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.AXI_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_AXI, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
parallel_to_AXI_hw_stub(__xlx_apatb_param_wdata, __xlx_apatb_param_wadd, __xlx_apatb_param_rdata, __xlx_apatb_param_radd, __xlx_apatb_param_cmd, __xlx_apatb_param_sta, __xlx_apatb_param_AXI);
CodeState = DUMP_OUTPUTS;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
  {  if (__xlx_apatb_param_AXI) {
    for (int j = 0, e = 256; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_AXI)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_gmem, __xlx_sprintf_buffer.data());
}
// print rdata Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_rdata, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_rdata);
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_rdata, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.rdata_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_rdata, __xlx_sprintf_buffer.data());
}
// print sta Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_sta, __xlx_sprintf_buffer.data());
  {
    sc_bv<8> __xlx_tmp_lv = *((char*)__xlx_apatb_param_sta);
    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_sta, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.sta_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_sta, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
