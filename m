Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD2D23F52D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 01:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgHGXVo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 19:21:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHGXVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:21:44 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1E6E2DBE;
        Sat,  8 Aug 2020 01:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596842498;
        bh=O6qPwnDu7+zuP82snoOX8PffvOsIGQbvut2zQ5+6ch8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W1toD6jCLxbxr/3doSEr/Wv7TCuvAzi2P9hn1+wvv0N+7EH1IEavmVjaBqQFaKUCn
         3eCCVYbSIYgJCqnSOkPel0d1QTjBivGagErwouElrCcw75V0eyPpF03SbQSG+DtOfP
         pydYUUohLVwe+ghzboZRYqjAd5iOoEfMMIfS1rIo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [kms-tests] [PATCH 6/6] crc: Add a utility to compute the CRC of a frame
Date:   Sat,  8 Aug 2020 02:21:19 +0300
Message-Id: <20200807232119.28854-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
References: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The discom-crc utility computes the CRC of a frame using the same
algorithm as the DISCOM hardware block. This is useful to precompute CRC
values and then compare them with the hardware-generated values.

The utility computes the CRC on data stored in a file passed as a
command line argument. It supports two optional arguments, --crop and
--size, to specify the crop rectangle and the image size. The size only
needs to be specified if a crop rectangle is set, it is deduced from the
file size otherwise.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Makefile       |   2 +-
 crc/Makefile   |  32 ++++++
 crc/gen-crc.py |  14 +++
 crc/main.c     | 271 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 318 insertions(+), 1 deletion(-)
 create mode 100644 crc/Makefile
 create mode 100755 crc/gen-crc.py
 create mode 100644 crc/main.c

diff --git a/Makefile b/Makefile
index 1f0da15546b8..e9c0edb785e7 100644
--- a/Makefile
+++ b/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: CC0-1.0
 
-SUBDIRS=tests
+SUBDIRS=crc tests
 
 recursive=all clean install
 
diff --git a/crc/Makefile b/crc/Makefile
new file mode 100644
index 000000000000..0922163da31b
--- /dev/null
+++ b/crc/Makefile
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: CC0-1.0
+
+CROSS_COMPILE ?=
+
+CC	:= $(CROSS_COMPILE)gcc
+CFLAGS	?= -O2 -W -Wall -Wno-unused-parameter -Iinclude
+LDFLAGS	?=
+LIBS	:=
+
+OUTPUT	:= discom-crc
+OBJECTS	:= main.o
+
+%.o : %.c
+	$(CC) $(CFLAGS) -c -o $@ $<
+
+all: $(OUTPUT)
+
+$(OUTPUT): $(OBJECTS)
+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
+
+crc.c : gen-crc.py
+	./$< $@
+
+main.o : crc.c
+
+clean:
+	-rm -f *.o
+	-rm -f crc.c
+	-rm -f $(OUTPUT)
+
+install:
+	cp $(OUTPUT) $(INSTALL_DIR)/
diff --git a/crc/gen-crc.py b/crc/gen-crc.py
new file mode 100755
index 000000000000..10c5776d071d
--- /dev/null
+++ b/crc/gen-crc.py
@@ -0,0 +1,14 @@
+#!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2020 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+import crcmod
+import sys
+
+# The initial value is ignored, it must instead be passed to the generated C
+# function.
+crc = crcmod.Crc(0x104c11db7, 0xffffffff, True, 0xffffffff)
+
+f = open(sys.argv[1], 'w')
+crc.generateCode('calculate_crc', f, 'uint8_t', 'uint32_t')
+f.close()
diff --git a/crc/main.c b/crc/main.c
new file mode 100644
index 000000000000..b63421902f18
--- /dev/null
+++ b/crc/main.c
@@ -0,0 +1,271 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-FileCopyrightText: 2020 Laurent Pinchart <laurent.pinchart@ideasonboard.com> */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "crc.c"
+
+struct image_rect {
+	int left;
+	int top;
+	unsigned int width;
+	unsigned int height;
+};
+
+struct image_size {
+	unsigned int width;
+	unsigned int height;
+};
+
+struct options {
+	const char *filename;
+	struct image_rect crop;
+	struct image_size size;
+};
+
+/* -----------------------------------------------------------------------------
+ * Miscellaneous helpers
+ */
+
+static bool rect_is_empty(const struct image_rect *rect)
+{
+	return !rect->width || !rect->height;
+}
+
+static bool rect_is_null(const struct image_rect *rect)
+{
+	return !rect->left && !rect->top && !rect->width && !rect->height;
+}
+
+static bool size_is_null(const struct image_size *size)
+{
+	return !size->width && !size->height;
+}
+
+static int readall(int fd, void *buf, size_t count)
+{
+	int ret;
+
+	do {
+		ret = read(fd, buf, count);
+		if (ret == -1)
+			return -errno;
+		if (ret == 0)
+			return -ENODATA;
+
+		count -= ret;
+		buf += ret;
+	} while (count);
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Usage and argument parsing
+ */
+
+static void usage(const char *argv0)
+{
+	printf("Usage: %s [options] <infile>\n\n", argv0);
+	printf("Calculate the R-Car DISCOM CRC for the image stored in <infile>\n\n");
+	printf("Supported options:\n");
+	printf("-c, --crop (X,Y)/WxH		Crop the input image (needs --size)\n");
+	printf("-s, --size WxH			Input image size\n");
+}
+
+static struct option opts[] = {
+	{"crop", 1, 0, 'c'},
+	{"size", 1, 0, 's'},
+	{0, 0, 0, 0}
+};
+
+static int parse_args(struct options *options, int argc, char *argv[])
+{
+	int ret;
+	int c;
+
+	if (argc < 2) {
+		usage(argv[0]);
+		return 1;
+	}
+
+	memset(options, 0, sizeof(*options));
+
+	opterr = 0;
+	while ((c = getopt_long(argc, argv, "c:s:", opts, NULL)) != -1) {
+		int count;
+
+		switch (c) {
+		case 'c':
+			ret = sscanf(optarg, "(%d,%d)/%ux%u%n",
+				     &options->crop.left, &options->crop.top,
+				     &options->crop.width, &options->crop.height,
+				     &count);
+			if (ret != 4 || count != (int)strlen(optarg)) {
+				printf("Invalid crop value '%s'\n", optarg);
+				return 1;
+			}
+			break;
+
+		case 's':
+			ret = sscanf(optarg, "%ux%u%n",
+				     &options->size.width, &options->size.height,
+				     &count);
+			if (ret != 2 || count != (int)strlen(optarg)) {
+				printf("Invalid size value '%s'\n", optarg);
+				return 1;
+			}
+			break;
+
+		default:
+			printf("Invalid option -%c\n", c);
+			printf("Run %s -h for help.\n", argv[0]);
+			return 1;
+		}
+	}
+
+	if (optind != argc - 1) {
+		usage(argv[0]);
+		return 1;
+	}
+
+	options->filename = argv[optind];
+
+	return 0;
+}
+
+/* -----------------------------------------------------------------------------
+ * Main
+ */
+
+int main(int argc, char *argv[])
+{
+	struct options options;
+	void *image = NULL;
+	uint32_t crc;
+	off_t offset;
+	off_t size;
+	int fd = -1;
+	int ret;
+
+	/* Parse and validate options. */
+	ret = parse_args(&options, argc, argv);
+	if (ret)
+		return ret;
+
+	if (!rect_is_null(&options.crop)) {
+		if (size_is_null(&options.size)) {
+			printf("--crop requires --size\n");
+			goto error;
+		}
+
+		if (rect_is_empty(&options.crop)) {
+			printf("Crop rectangle is empty\n");
+			goto error;
+		}
+
+		if (options.crop.left < 0 || options.crop.top < 0 ||
+		    options.crop.left + options.crop.width > options.size.width ||
+		    options.crop.top + options.crop.height > options.size.height) {
+			printf("Crop rectangle out of image bounds\n");
+			goto error;
+		}
+	}
+
+	/* Open the file and determine its size. */
+	fd = open(options.filename, O_RDONLY);
+	if (fd == -1) {
+		printf("Failed to open '%s': %s\n", options.filename,
+		       strerror(errno));
+		goto error;
+	}
+
+	size = lseek(fd, 0, SEEK_END);
+	if (size == -1) {
+		printf("Failed to determine file size: %s\n", strerror(errno));
+		goto error;
+	}
+
+	if (!size_is_null(&options.size) &&
+	    options.size.width * options.size.height * 4 != size) {
+		printf("Image size %ux%u doesn't match file size %jd\n",
+		       options.size.width, options.size.height, (intmax_t)size);
+		goto error;
+	}
+
+	/* Read the image data. */
+	if (!rect_is_null(&options.crop))
+		size = options.crop.width * options.crop.height * 4;
+
+	image = malloc(size);
+	if (!image) {
+		printf("Unable to allocate memory for image data\n");
+		goto error;
+	}
+
+	offset = (options.crop.top * options.size.width + options.crop.left) * 4;
+	lseek(fd, offset, SEEK_SET);
+
+	if (!options.crop.width || options.crop.width == options.size.width) {
+		/*
+		 * When the crop rectangle width spans the whole image, read it
+		 * in one go.
+		 */
+		ret = readall(fd, image, size);
+		if (ret < 0) {
+			printf("Unable to read image: %s\n", strerror(errno));
+			goto error;
+		}
+	} else {
+		/* Otherwise, read line by line. */
+		void *line = image;
+		unsigned int y;
+
+		offset = (options.size.width - options.crop.width) * 4;
+
+		for (y = 0; y < options.crop.height; ++y) {
+			ret = readall(fd, line, options.crop.width * 4);
+			if (ret < 0) {
+				printf("Unable to read line %u: %s\n", y,
+				       strerror(errno));
+				goto error;
+			}
+
+			lseek(fd, offset, SEEK_CUR);
+			line += options.crop.width * 4;
+		}
+	}
+
+	close(fd);
+	fd = -1;
+
+	/*
+	 * Compute the CRC. The generate CRC code XORs the initial value with
+	 * the final XOR value, so we need to pass 0 to get the desired
+	 * 0xffffffff initial value.
+	 */
+	crc = calculate_crc(image, size, 0);
+
+	free(image);
+	image = NULL;
+
+	printf("0x%08x\n", crc);
+
+	return 0;
+
+error:
+	free(image);
+	if (fd != -1)
+		close(fd);
+	return 1;
+}
-- 
Regards,

Laurent Pinchart

