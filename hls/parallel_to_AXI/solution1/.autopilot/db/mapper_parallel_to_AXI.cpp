#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
struct __cosim_s4__ { char data[4]; };
struct __cosim_s1__ { char data[1]; };
extern "C" void parallel_to_AXI(int*, __cosim_s4__, __cosim_s4__, volatile void *, __cosim_s4__, __cosim_s1__, volatile void *, int);
extern "C" void apatb_parallel_to_AXI_hw(__cosim_s4__ __xlx_apatb_param_wdata, __cosim_s4__ __xlx_apatb_param_wadd, volatile void * __xlx_apatb_param_rdata, __cosim_s4__ __xlx_apatb_param_radd, __cosim_s1__ __xlx_apatb_param_cmd, volatile void * __xlx_apatb_param_sta, volatile void * __xlx_apatb_param_AXI) {
  // Collect __xlx_AXI__tmp_vec
  vector<sc_bv<32> >__xlx_AXI__tmp_vec;
  for (int j = 0, e = 256; j != e; ++j) {
    __xlx_AXI__tmp_vec.push_back(((int*)__xlx_apatb_param_AXI)[j]);
  }
  int __xlx_size_param_AXI = 256;
  int __xlx_offset_param_AXI = 0;
  int __xlx_offset_byte_param_AXI = 0*4;
  int* __xlx_AXI__input_buffer= new int[__xlx_AXI__tmp_vec.size()];
  for (int i = 0; i < __xlx_AXI__tmp_vec.size(); ++i) {
    __xlx_AXI__input_buffer[i] = __xlx_AXI__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  parallel_to_AXI(__xlx_AXI__input_buffer, __xlx_apatb_param_wdata, __xlx_apatb_param_wadd, __xlx_apatb_param_rdata, __xlx_apatb_param_radd, __xlx_apatb_param_cmd, __xlx_apatb_param_sta, __xlx_offset_byte_param_AXI);
// print __xlx_apatb_param_AXI
  sc_bv<32>*__xlx_AXI_output_buffer = new sc_bv<32>[__xlx_size_param_AXI];
  for (int i = 0; i < __xlx_size_param_AXI; ++i) {
    __xlx_AXI_output_buffer[i] = __xlx_AXI__input_buffer[i+__xlx_offset_param_AXI];
  }
  for (int i = 0; i < __xlx_size_param_AXI; ++i) {
    ((int*)__xlx_apatb_param_AXI)[i] = __xlx_AXI_output_buffer[i].to_uint64();
  }
}
