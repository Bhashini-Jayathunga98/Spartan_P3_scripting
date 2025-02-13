#include <ap_int.h>

void parallel_to_AXI(
ap_uint<32> wdata,
ap_uint<32> wadd,
ap_uint<32> *rdata,
ap_uint<32> radd,
ap_uint<8> cmd,
ap_uint<8> *sta,
ap_uint<32> AXI[256]
)
{
	static ap_uint<1> clear_flag = 0;

	if((cmd == 1) && (clear_flag == 0))
	{
		AXI[wadd] = wdata;
		*sta = 0x01;
		clear_flag = 1;
	}
	else if ((cmd == 2) && (clear_flag == 0))
	{
		*rdata = AXI[radd];
		*sta = 0x02;
		clear_flag = 1;
	}
	else if ((cmd == 3) && (clear_flag = 0))
	{
		AXI[wadd] = wdata;
		*rdata = AXI[radd];
		*sta = 0x03;
		clear_flag = 1;
	}
	else if (clear_flag == 1)
	{
		if (cmd == 0x0)
			{
			*sta = 0x00;
			clear_flag = 0;
			}
	}
}
