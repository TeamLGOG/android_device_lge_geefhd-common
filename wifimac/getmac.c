/*
 * Copyright (C) 2011 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

/* Read device NVRAM and set the Wifi MAC address accordingly */

int main() {
	FILE *fd1; FILE *fd2;
	char macaddr[18];
	memset(macaddr, 0, 18);

	fd1 = fopen("/dev/block/platform/msm_sdcc.1/by-name/misc", "r");
	fd2 = fopen("/data/misc/wifi/config","w");

	fseek(fd1,0x3000,SEEK_SET);
	unsigned char macbuf[6];
	fread(macbuf, 6, 1, fd1);
	sprintf(macaddr,"%02x:%02x:%02x:%02x:%02x:%02x",
	macbuf[0], macbuf[1], macbuf[2],
	macbuf[3], macbuf[4], macbuf[5]);

	fclose(fd1);

	fprintf(fd2,"btc_mode=1\n\
country=US/100\n\
vlan_mode=0\n\
mpc=1\n\
wme_auto_trigger=0\n\
wme_apsd_trigger=290000\n\
roam_off=0\n\
roam_scan_period=10\n\
roam_delta=20\n\
roam_trigger=-80\n\
PM=2\n\
assoc_listen=1\n\
assoc_retry_max=7\n\
cur_etheraddr=%s\n\
",macaddr);

	fclose(fd2);
	return 0;
}
