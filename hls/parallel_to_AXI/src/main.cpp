#include <ap_int.h>

void parallel_to_AXI(
ap_uint<32> wdata,
ap_uint<32> wadd,
ap_uint<32> *rdata,
ap_uint<32> radd,
ap_uint<8> cmd,
ap_uint<8> *sta,
ap_uint<32> AXI[256]
);

int main()
{
	ap_uint<32> Mem[256];
	ap_uint<32> rdata;
	ap_uint<8> sta;
	parallel_to_AXI(0x55, 0x00, &rdata, 0x00, 0x01, &sta, Mem);
	if (sta != 1) return -1;
	parallel_to_AXI(0x55, 0x00, &rdata, 0x00, 0x00, &sta, Mem);


	parallel_to_AXI(0xAA, 0x01, &rdata, 0x00, 0x01, &sta, Mem);
	if (sta != 1) return -1;
	parallel_to_AXI(0x55, 0x00, &rdata, 0x00, 0x00, &sta, Mem);


	parallel_to_AXI(0xff, 0x02, &rdata, 0x00, 0x01, &sta, Mem);
	if (sta != 1) return -1;
	parallel_to_AXI(0x55, 0x00, &rdata, 0x00, 0x00, &sta, Mem);


	parallel_to_AXI(0x00, 0x00, &rdata, 0x00, 0x02, &sta, Mem);
	if (sta != 2) return -1;
	parallel_to_AXI(0x55, 0x00, &rdata, 0x00, 0x00, &sta, Mem);

	parallel_to_AXI(0x00, 0xAA, &rdata, 0x01, 0x02, &sta, Mem);
	if (sta != 2 ) return -1;
	parallel_to_AXI(0x55, 0x00, &rdata, 0x00, 0x00, &sta, Mem);

	parallel_to_AXI(0x00, 0x00, &rdata, 0x02, 0x02, &sta, Mem);
	if (sta != 2) return -1;
	parallel_to_AXI(0x55, 0x00, &rdata, 0x00, 0x00, &sta, Mem);


	return 0;
}
