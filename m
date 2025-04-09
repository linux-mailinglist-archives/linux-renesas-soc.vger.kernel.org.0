Return-Path: <linux-renesas-soc+bounces-15614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D1A81A0A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 02:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DE983AD181
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Apr 2025 00:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D79E2C190;
	Wed,  9 Apr 2025 00:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QlECgrwR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D954C80
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Apr 2025 00:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159711; cv=none; b=RYSwVspVnbmeK6WqeRWMhDKRodSddWu5G67Z/yMn/CdfUmTODNA4sDUTLZHur+3myfmKzwV0WL4s2togu4hR3etPEk2DFtKA2B7RdBizxHWMbu/nKwhxKxEMpw1zXZjqCy1hWy6pnW27kl8XzvcKUVJYioSlpPndum+BcOOtiYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159711; c=relaxed/simple;
	bh=Q3gGfKPEzJ+TUo2dOUVWjv1STFaeURFs0JSF/A1gPxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KM8JrQM3MKG8JRiQNZHD7pBPg/TozmcXo8vpkq1aEa06pVBkQ8oTKiUaQRteBOrm4UG/N6EZFbI/kQxIDdrBQvtItcfb1L+E0mG40WbQKW+RZ3K3cyEA1Ha9VralcOXfDUA065SmZfQ5BsqGbfWL6W5tRF8yWp1O+GF/YTEnpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QlECgrwR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FA7799F;
	Wed,  9 Apr 2025 02:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744159589;
	bh=Q3gGfKPEzJ+TUo2dOUVWjv1STFaeURFs0JSF/A1gPxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QlECgrwRGjGosh0pUReC8IqxLpST7ektRRzaNhUInuDx3qyMLbaxwK5gkCQWtH4QN
	 ztg2G5dcSY3SDEzaLJSvXIMYWESyONhM6PA8W92IEVYTZtejxD5OtEPccmVIlEB3z1
	 T7mtV2Qcxapt/S4b8iilT1K3OSeiFKaGiAezuJ2o=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [vsp-tests] [PATCH 02/16] Convert from make to meson
Date: Wed,  9 Apr 2025 03:47:44 +0300
Message-ID: <20250409004758.11014-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
References: <20250409004758.11014-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Meson makes cross compilation easier. Replace the make-based build
system with meson.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 data/frames/.gitignore => .gitignore |  2 +-
 Makefile                             | 14 -------
 README                               |  8 ++--
 data/Makefile                        | 14 -------
 data/frames/Makefile                 | 17 ---------
 data/frames/gen-lut.py               | 56 +++++++++++++++++-----------
 data/frames/meson.build              | 28 ++++++++++++++
 src/.gitignore => data/meson.build   |  4 +-
 meson.build                          | 36 ++++++++++++++++++
 scripts/Makefile                     | 10 -----
 scripts/meson.build                  | 11 ++++++
 src/Makefile                         | 29 --------------
 src/meson.build                      | 21 +++++++++++
 tests/Makefile                       | 10 -----
 tests/meson.build                    | 34 +++++++++++++++++
 15 files changed, 172 insertions(+), 122 deletions(-)
 rename data/frames/.gitignore => .gitignore (81%)
 delete mode 100644 Makefile
 delete mode 100644 data/Makefile
 delete mode 100644 data/frames/Makefile
 create mode 100644 data/frames/meson.build
 rename src/.gitignore => data/meson.build (57%)
 create mode 100644 meson.build
 delete mode 100644 scripts/Makefile
 create mode 100644 scripts/meson.build
 delete mode 100644 src/Makefile
 create mode 100644 src/meson.build
 delete mode 100644 tests/Makefile
 create mode 100644 tests/meson.build

diff --git a/data/frames/.gitignore b/.gitignore
similarity index 81%
rename from data/frames/.gitignore
rename to .gitignore
index 2c0a1ff3d654..e06192977743 100644
--- a/data/frames/.gitignore
+++ b/.gitignore
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: CC0-1.0
 
-*.bin
+/build/
diff --git a/Makefile b/Makefile
deleted file mode 100644
index 4d311e1b84a9..000000000000
--- a/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-
-SUBDIRS=data scripts src tests
-
-recursive=all clean install
-
-all:
-
-$(recursive):
-	@target=$@ ; \
-	for subdir in $(SUBDIRS); do \
-		echo "Making $$target in $$subdir" ; \
-		$(MAKE) -C $$subdir $$target; \
-	done
diff --git a/README b/README
index e45d03a0e944..d4211d742afa 100644
--- a/README
+++ b/README
@@ -20,16 +20,18 @@ The vsp-tests suite requires the following tools to be installed on the host
 to generate the test scripts, applications and data.
 
 * gcc
-* make
+* meson
+* ninja
 * python
 
 After installing the needed packages, you can build the test suite by running
 
-	make
+	meson setup build/
+	meson compile -C build/
 
 in the vsp-tests root directory. Then, to install the test suite, run
 
-	make install INSTALL_DIR=/path/to/target/directory
+	meson install -C build/ --destdir=/path/to/target/directory
 
 This will copy the test scripts and applications to the target directory to be
 copied or exported to the host.
diff --git a/data/Makefile b/data/Makefile
deleted file mode 100644
index a65b5bcdc4e4..000000000000
--- a/data/Makefile
+++ /dev/null
@@ -1,14 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-
-SUBDIRS=frames
-
-recursive=all clean install
-
-all:
-
-$(recursive):
-	@target=$@ ; \
-	for subdir in $(SUBDIRS); do \
-		echo "Making $$target in $$subdir" ; \
-		$(MAKE) -C $$subdir $$target; \
-	done
diff --git a/data/frames/Makefile b/data/frames/Makefile
deleted file mode 100644
index 026cbdd53eed..000000000000
--- a/data/frames/Makefile
+++ /dev/null
@@ -1,17 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-
-frames=$(patsubst %.pnm.gz,%.pnm,$(wildcard *.pnm.gz))
-
-all:
-	./gen-lut.py
-
-clean:
-	@rm -f *.bin
-
-%.pnm: %.pnm.gz
-	gzip -dk $<
-
-install: $(frames)
-	mkdir -p $(INSTALL_DIR)/frames/
-	mv $(frames) $(INSTALL_DIR)/frames/
-	cp *.bin $(INSTALL_DIR)/frames/
diff --git a/data/frames/gen-lut.py b/data/frames/gen-lut.py
index c3591f90c2d3..bd371a483c05 100755
--- a/data/frames/gen-lut.py
+++ b/data/frames/gen-lut.py
@@ -2,37 +2,38 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2016 Renesas Electronics Corporation
 
+import argparse
 import math
 import sys
 
-clu_configs = (
-    ('zero', {
+clu_configs = {
+    'zero': {
         'scale': 0.0,
         'a': 0.0,
         'freq': 1.0,
         'weights': (1.0, 1.0, 1.0)
-    } ),
-    ('identity', {
+    },
+    'identity': {
         'scale': 1.0,
         'a': 0.0,
         'freq': 1.0,
         'weights': (1.0, 1.0, 1.0)
-    } ),
+    },
     # Keep the three weights different to generate an anisothropic
     # look up table.
-    ('wave', {
+    'wave': {
         'scale': 1.0,
         'a': 0.1,
         'freq': 3.0,
         'weights': (1.0, 2.0, 3.0)
-    } ),
-)
+    },
+}
 
-lut_configs = (
-    ('zero',     0.0, 1.0, 1.0, 1.0),
-    ('identity', 1.0, 1.0, 1.0, 1.0),
-    ('gamma',    1.0, 0.5, 1.0, 2.0),
-)
+lut_configs = {
+    'zero':     (0.0, 1.0, 1.0, 1.0),
+    'identity': (1.0, 1.0, 1.0, 1.0),
+    'gamma':    (1.0, 0.5, 1.0, 2.0),
+}
 
 def clu_value(x, y, z, scale, a, freq, weights):
     x = x / 16.
@@ -54,9 +55,9 @@ def generate_clu(config):
     for z in range(17):
         for y in range(17):
             for x in range(17):
-                clu.extend(clu_value(x, y, z, **config[1]))
+                clu.extend(clu_value(x, y, z, **config))
 
-    open('clu-%s.bin' % config[0], 'wb').write(clu)
+    return clu
 
 
 def gamma(vin, gamma, scale):
@@ -65,18 +66,31 @@ def gamma(vin, gamma, scale):
 def generate_lut(config):
     lut = bytearray()
     for i in range(256):
-        lut.extend([gamma(i, g, config[1]) for g in config[2:]])
+        lut.extend([gamma(i, g, config[0]) for g in config[1:]])
         lut.append(0)
 
-    open('lut-%s.bin' % config[0], 'wb').write(lut)
+    return lut
 
 
 def main(argv):
-    for config in clu_configs:
-        generate_clu(config)
+    # Parse command line arguments
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--output', '-o', metavar='file', type=str,
+                        help='Output file name. Defaults to standard output if not specified.')
+    parser.add_argument('--type', '-t', dest='table_type', type=str, required=True,
+                        choices=['clu', 'lut'], help='Select the look up table type.')
+    parser.add_argument('table', type=str,
+                        help='Table contents')
+    args = parser.parse_args(argv[1:])
 
-    for config in lut_configs:
-        generate_lut(config)
+    out = open(args.output, 'wb')
+
+    if args.table_type == 'clu':
+        table = generate_clu(clu_configs[args.table])
+    else:
+        table = generate_lut(lut_configs[args.table])
+
+    out.write(table)
 
     return 0
 
diff --git a/data/frames/meson.build b/data/frames/meson.build
new file mode 100644
index 000000000000..f4ec8e30bdac
--- /dev/null
+++ b/data/frames/meson.build
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: CC0-1.0
+
+gen_lut = find_program('./gen-lut.py')
+gzip = find_program('gzip')
+
+tables = [
+    ['clu', 'identity'],
+    ['clu', 'wave'],
+    ['clu', 'zero'],
+    ['lut', 'gamma'],
+    ['lut', 'identity'],
+    ['lut', 'zero'],
+]
+
+foreach table : tables
+    name = '@0@-@1@.bin'.format(table[0], table[1])
+    custom_target(output : name,
+                  command : [gen_lut, '-o', '@OUTPUT@', '-t', table[0], table[1]],
+                  install : true,
+                  install_dir : 'frames')
+endforeach
+
+custom_target(input : files('frame-reference-1024x768.pnm.gz'),
+              output : 'frame-reference-1024x768.pnm',
+              capture : true,
+              command : [gzip, '-cd', '@INPUT@'],
+              install : true,
+              install_dir : 'frames')
diff --git a/src/.gitignore b/data/meson.build
similarity index 57%
rename from src/.gitignore
rename to data/meson.build
index 817142c8a3e8..2171e041a8cb 100644
--- a/src/.gitignore
+++ b/data/meson.build
@@ -1,5 +1,3 @@
 # SPDX-License-Identifier: CC0-1.0
 
-*.o
-gen-image
-monotonic-ts
+subdir('frames')
diff --git a/meson.build b/meson.build
new file mode 100644
index 000000000000..026bc0d29187
--- /dev/null
+++ b/meson.build
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: CC0-1.0
+
+project('vsp-tests', 'c',
+    meson_version : '>= 0.60',
+    version : '0.0.0',
+    default_options : [
+        'werror=true',
+        'warning_level=2',
+    ],
+    license : 'GPL 2.0+')
+
+#
+# Configure the build environment
+#
+cc = meson.get_compiler('c')
+
+cc_arguments = [
+    '-Wno-unused-parameter',
+]
+
+if cc.get_id() == 'clang'
+    # Turn _FORTIFY_SOURCE by default on optimised builds (as it requires -O1
+    # or higher). This is needed on clang only as gcc enables it by default.
+    if get_option('optimization') != '0'
+        cc_arguments += [
+            '-D_FORTIFY_SOURCE=2',
+        ]
+    endif
+endif
+
+add_project_arguments(cc_arguments, language : 'c')
+
+subdir('data')
+subdir('scripts')
+subdir('src')
+subdir('tests')
diff --git a/scripts/Makefile b/scripts/Makefile
deleted file mode 100644
index 6511c3c61ebf..000000000000
--- a/scripts/Makefile
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-
-SCRIPTS=$(wildcard *.sh)
-
-all:
-
-clean:
-
-install:
-	cp $(SCRIPTS) $(INSTALL_DIR)/
diff --git a/scripts/meson.build b/scripts/meson.build
new file mode 100644
index 000000000000..a86f1a568f6b
--- /dev/null
+++ b/scripts/meson.build
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: CC0-1.0
+
+scripts = files([
+    'bin2png.sh',
+    'histo2png.py',
+    'logger.sh',
+    'vsp-lib.sh',
+    'vsp-tests.sh',
+])
+
+install_data(scripts, install_dir : get_option('prefix'))
diff --git a/src/Makefile b/src/Makefile
deleted file mode 100644
index c40e95afca50..000000000000
--- a/src/Makefile
+++ /dev/null
@@ -1,29 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-
-CROSS_COMPILE ?=
-
-CC	:= $(CROSS_COMPILE)gcc
-CFLAGS	?= -O0 -g -W -Wall -Wno-unused-parameter -Iinclude
-LDFLAGS	?=
-LIBS	:= -lm
-GEN-IMAGE := gen-image
-MONOTONIC-TS := monotonic-ts
-
-%.o : %.c
-	$(CC) $(CFLAGS) -c -o $@ $<
-
-all: $(GEN-IMAGE) $(MONOTONIC-TS)
-
-$(GEN-IMAGE): gen-image.o
-	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
-
-$(MONOTONIC-TS): monotonic-ts.o
-	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
-
-clean:
-	-rm -f *.o
-	-rm -f $(GEN-IMAGE) $(MONOTONIC_TS)
-
-install:
-	cp $(GEN-IMAGE) $(INSTALL_DIR)/
-	cp $(MONOTONIC-TS) $(INSTALL_DIR)/
diff --git a/src/meson.build b/src/meson.build
new file mode 100644
index 000000000000..3a6118bd3ea8
--- /dev/null
+++ b/src/meson.build
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: CC0-1.0
+
+gen_image_sources = files([
+    'gen-image.c',
+])
+
+monotonic_ts_sources = files([
+    'monotonic-ts.c',
+])
+
+m_dep = cc.find_library('m', required : false)
+
+executable('gen-image', gen_image_sources,
+           dependencies : [m_dep],
+           install : true,
+           install_dir : '')
+
+executable('monotonic-ts', monotonic_ts_sources,
+           dependencies : [m_dep],
+           install : true,
+           install_dir : '')
diff --git a/tests/Makefile b/tests/Makefile
deleted file mode 100644
index 6511c3c61ebf..000000000000
--- a/tests/Makefile
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: CC0-1.0
-
-SCRIPTS=$(wildcard *.sh)
-
-all:
-
-clean:
-
-install:
-	cp $(SCRIPTS) $(INSTALL_DIR)/
diff --git a/tests/meson.build b/tests/meson.build
new file mode 100644
index 000000000000..e5396cc0a132
--- /dev/null
+++ b/tests/meson.build
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: CC0-1.0
+
+tests = files([
+    'vsp-unit-test-0000.sh',
+    'vsp-unit-test-0001.sh',
+    'vsp-unit-test-0002.sh',
+    'vsp-unit-test-0003.sh',
+    'vsp-unit-test-0004.sh',
+    'vsp-unit-test-0005.sh',
+    'vsp-unit-test-0006.sh',
+    'vsp-unit-test-0007.sh',
+    'vsp-unit-test-0008.sh',
+    'vsp-unit-test-0009.sh',
+    'vsp-unit-test-0010.sh',
+    'vsp-unit-test-0011.sh',
+    'vsp-unit-test-0012.sh',
+    'vsp-unit-test-0013.sh',
+    'vsp-unit-test-0014.sh',
+    'vsp-unit-test-0015.sh',
+    'vsp-unit-test-0016.sh',
+    'vsp-unit-test-0017.sh',
+    'vsp-unit-test-0018.sh',
+    'vsp-unit-test-0019.sh',
+    'vsp-unit-test-0020.sh',
+    'vsp-unit-test-0021.sh',
+    'vsp-unit-test-0022.sh',
+    'vsp-unit-test-0023.sh',
+    'vsp-unit-test-0024.sh',
+    'vsp-unit-test-0025.sh',
+    'vsp-unit-test-0026.sh',
+    'vsp-unit-test-0027.sh',
+])
+
+install_data(tests, install_dir : get_option('prefix'))
-- 
Regards,

Laurent Pinchart


