/*
 * Copyright 2012 The Android Open Source Project
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
#include <getopt.h>

#define LOG_TAG "bdAddrLoader"

#include <cutils/log.h>
#include <cutils/properties.h>

#define DEFAULT_BDADDR_PROP "persist.service.bdroid.bdaddr"

int main() {
	FILE *fd1; FILE *fd2;
	char macaddr[18];
	memset(macaddr, 0, 18);

	fd1 = fopen("/dev/block/platform/msm_sdcc.1/by-name/misc", "r");

	fseek(fd1,0x4000,SEEK_SET);
	unsigned char macbuf[6];
	fread(macbuf, 6, 1, fd1);
	sprintf(macaddr,"%02x:%02x:%02x:%02x:%02x:%02x",
	macbuf[0], macbuf[1], macbuf[2],
	macbuf[3], macbuf[4], macbuf[5]);

	fclose(fd1);

	ALOGI("mac address: %s", macaddr);
	if (property_set(DEFAULT_BDADDR_PROP, macaddr) < 0) {
		 ALOGE("Failed to set address in prop %s", DEFAULT_BDADDR_PROP);
	}

	return 0;
}
