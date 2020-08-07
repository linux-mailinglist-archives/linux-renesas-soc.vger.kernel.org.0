Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F8D23F52B
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 01:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgHGXVl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 19:21:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHGXVl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:21:41 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A88CCBB9;
        Sat,  8 Aug 2020 01:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596842497;
        bh=ZE51QNZuqyl3m922NtrlAUqMPprNOKNqrBQBRpIZLXk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VzACkLVx7BIzolY4agWbuwTm7FncrnonBvMa29GRAbq7TdaH2oQkaoNB3XEQLW0+y
         zb6EE6Ib9DMtaSMA2ZycY+QBBecfU28/N1syK5hrrPC+ch+tR1Tfd0O6xx1UP0E7x+
         dyI00fpiCZ64zRURy0yA+wNWFK2gCfeX2rJKlpoQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [kms-tests] [PATCH 5/6] tests: crc: Compute reference CRC values and compare them
Date:   Sat,  8 Aug 2020 02:21:18 +0300
Message-Id: <20200807232119.28854-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
References: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of only checking that the CRC value is constant, compute the
expected CRC value, and compare it to the hardware-generated CRC.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 README                |   1 +
 tests/kms-test-crc.py | 103 +++++++++++++++++++++++++++++++++++++-----
 2 files changed, 93 insertions(+), 11 deletions(-)

diff --git a/README b/README
index 7f770d4170a3..dcd34611d820 100644
--- a/README
+++ b/README
@@ -33,6 +33,7 @@ The tests scripts require the following dependencies to be installed on the
 target.
 
 * Python 3
+* The Python module 'crcmod'
 * kmsxx Python bindings (https://github.com/tomba/kmsxx.git)
 
 kmsxx hasn't released any stable version yet, it is recommended to use the
diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index 8876c88506c1..60187eff1c48 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -3,8 +3,10 @@
 # SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
 import copy
+import crcmod
 import kmstest
 import pykms
+import tempfile
 
 
 class Composer(object):
@@ -17,15 +19,31 @@ class Composer(object):
     START_POINT = kmstest.Point(0, 0)
     INCREMENT = kmstest.Dist(50, 50)
 
-    def __init__(self, crtc, planes, fb):
+    # The CRC initial value is XORed with the final XOR value, so we need to
+    # pass 0 to get the desired  0xffffffff initial value.
+    CRC = crcmod.Crc(0x104c11db7, 0x00000000, True, 0xffffffff)
+
+    def __init__(self, mode, crtc, planes, fb):
+        self.__screen_size = kmstest.Size(mode.hdisplay, mode.vdisplay)
         self.__fb_size = kmstest.Size(fb.width, fb.height)
         self.__planes_positions = {}
+        self.__crcs = {}
+
+        # Dump the contents of the frame buffer to compute the CRCs.
+        file = tempfile.TemporaryFile()
+        pykms.dump_framebuffer(fb, file.fileno())
+        file.seek(0)
+        image = file.read()
+        file.close()
 
         position = copy.copy(Composer.START_POINT)
         for plane in planes:
             self.__planes_positions[plane] = copy.copy(position)
+            self.__crcs[plane] = self.__plane_crc(plane, image)
             position.move(Composer.INCREMENT)
 
+        self.__crcs[crtc] = self.__crtc_crc(planes, image)
+
     def source(self, plane):
         pos = self.__planes_positions[plane]
         return kmstest.Rect(0, 0,
@@ -39,6 +57,50 @@ class Composer(object):
                             max(0, self.__fb_size.height - pos.y))
 
 
+    def crc(self, obj):
+        return self.__crcs[obj]
+
+    def __plane_crc(self, plane, image):
+        # Compute the reference CRC for a plane. Only the visible part of the
+        # plane is used by the hardware.
+
+        crcg = Composer.CRC.new()
+
+        src = self.source(plane)
+        if src.isEmpty():
+            return 0
+
+        for y in range(src.height):
+            src_offset = ((src.top + y) * self.__fb_size.width + src.left) * 4
+            crcg.update(image[src_offset:src_offset+src.width*4])
+
+        return crcg.crcValue
+
+    def __crtc_crc(self, planes, image):
+        # Compute the reference CRC for the composed display output. Start with
+        # a black background and compose the planes.
+
+        crcg = Composer.CRC.new()
+
+        # The background is set to black, with and alpha value of 255 (opaque)
+        # to match the BRx configuration.
+        output = [0, 0, 0, 255] * (self.__screen_size.width * self.__screen_size.height)
+
+        # Compose planes on top.
+        for plane in planes:
+            src = self.source(plane)
+            dst = self.destination(plane)
+
+            for y in range(src.height):
+                src_offset = ((src.top + y) * self.__fb_size.width + src.left) * 4
+                dst_offset = ((dst.top + y) * self.__screen_size.width + dst.left) * 4
+                output[dst_offset:dst_offset+src.width*4] = image[src_offset:src_offset+src.width*4]
+
+        crcg.update(bytes(output))
+
+        return crcg.crcValue
+
+
 class CRCTest(kmstest.KMSTest):
     """Test CRC calculation on pipeline output."""
 
@@ -86,8 +148,8 @@ class CRCTest(kmstest.KMSTest):
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
             pykms.draw_test_pattern(fb)
 
-            # Create a composer.
-            composer = Composer(crtc, planes, fb)
+            # Create a composer. This will compute the reference CRCs.
+            composer = Composer(mode, crtc, planes, fb)
 
             # Set the mode and add all planes
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, sync=True)
@@ -124,21 +186,40 @@ class CRCTest(kmstest.KMSTest):
                 self.fail("No page flip registered")
                 continue
 
-            sources = ["auto"] + ["plane%u" % plane.id for plane in planes]
-            for src in sources:
-                self.logger.log("Computing CRC in source %s" % src)
+            sources = [crtc] + planes
+            for source in sources:
+                if source == crtc:
+                    crc_source = "auto"
+                else:
+                    crc_source = "plane%u" % source.id
 
+                self.logger.log("Computing CRC from source %s" % crc_source)
+
+                # Set the CRC source and acquire 10 CRC values. Discard the
+                # first value, as the device is running and the new source
+                # needs one frame to take effect.
                 crc_reader = kmstest.CRCReader(crtc)
-                crc_reader.start(src)
+                crc_reader.start(crc_source)
                 crcs = crc_reader.read(10)
                 crc_reader.stop()
 
-                crcs = [c.crcs[0] for c in crcs]
-                if len(set(crcs)) != 1:
-                    self.fail("CRC values not constant on source %s" % src)
+                crcs = [c.crcs[0] for c in crcs[1:]]
+                self.logger.log("CRC value[0] 0x%08x" % crcs[0])
+
+                failures = 0
+                ref_crc = composer.crc(source)
+
+                for i in range(len(crcs)):
+                    crc = crcs[i]
+                    if crc != ref_crc:
+                        self.logger.log("CRC value[%u] 0x%08x does not match reference 0x%08x"
+                                        % (i, crc, ref_crc))
+                        failures += 1
+
+                if failures:
+                    self.fail("Incorrect CRC values on source %s" % crc_source)
                     break
 
-                self.logger.log("CRC value 0x%08x" % crcs[0])
             else:
                 self.success()
 
-- 
Regards,

Laurent Pinchart

