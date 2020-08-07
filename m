Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92A8323F52C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 01:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgHGXVl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 19:21:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48952 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgHGXVl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 19:21:41 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49524BA5;
        Sat,  8 Aug 2020 01:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596842497;
        bh=wyn9RVGGss7xHEGUQHTaN1UiUDyDmKEP48Vox06yoPo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VJncaFf7pnkYO/XbAc1vm0w6JtLRfb3PU/8Y2IiDInu03HXvnB2DDj8YzH99fp9md
         iBLJel90MycYRCl626/yevmU5W1KDMiSqCibTsuyNQFlv0XRzhH0AGpWZ6OQ9DPY4G
         b1BcZ8hEJUE5lMpxGLBIyGzl/619+phGK5exQ6XQ=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [kms-tests] [PATCH 4/6] tests: crc: Introduce Composer class
Date:   Sat,  8 Aug 2020 02:21:17 +0300
Message-Id: <20200807232119.28854-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
References: <20200807232119.28854-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Composer gathers the computation of planes position. It is currently
only used to configure the planes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-crc.py | 45 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 5 deletions(-)

diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index e3e31b34e2d4..8876c88506c1 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -2,9 +2,43 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # SPDX-FileCopyrightText: 2017-2019 Renesas Electronics Corporation
 
+import copy
 import kmstest
 import pykms
 
+
+class Composer(object):
+    # Manage the composition of planes on the screen by computing the source
+    # and destination rectangles of each plane.
+    #
+    # Stack the plane, starting at START_POINT, with a fixed INCREMENT.
+    #
+
+    START_POINT = kmstest.Point(0, 0)
+    INCREMENT = kmstest.Dist(50, 50)
+
+    def __init__(self, crtc, planes, fb):
+        self.__fb_size = kmstest.Size(fb.width, fb.height)
+        self.__planes_positions = {}
+
+        position = copy.copy(Composer.START_POINT)
+        for plane in planes:
+            self.__planes_positions[plane] = copy.copy(position)
+            position.move(Composer.INCREMENT)
+
+    def source(self, plane):
+        pos = self.__planes_positions[plane]
+        return kmstest.Rect(0, 0,
+                            max(0, self.__fb_size.width - pos.x),
+                            max(0, self.__fb_size.height - pos.y))
+
+    def destination(self, plane):
+        pos = self.__planes_positions[plane]
+        return kmstest.Rect(pos.x, pos.y,
+                            max(0, self.__fb_size.width - pos.x),
+                            max(0, self.__fb_size.height - pos.y))
+
+
 class CRCTest(kmstest.KMSTest):
     """Test CRC calculation on pipeline output."""
 
@@ -48,10 +82,13 @@ class CRCTest(kmstest.KMSTest):
             self.logger.log("Testing connector %s, CRTC %u, mode %s with %u planes" % \
                   (connector.fullname, crtc.id, mode.name, len(planes)))
 
-            # Create a frame buffer
+            # Create a frame buffer and draw a test pattern.
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
             pykms.draw_test_pattern(fb)
 
+            # Create a composer.
+            composer = Composer(crtc, planes, fb)
+
             # Set the mode and add all planes
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, sync=True)
             if ret < 0:
@@ -60,10 +97,9 @@ class CRCTest(kmstest.KMSTest):
 
             req = kmstest.AtomicRequest(self)
 
-            offset = 100
             for plane in planes:
-                source = kmstest.Rect(0, 0, fb.width, fb.height)
-                destination = kmstest.Rect(offset, offset, fb.width, fb.height)
+                source = composer.source(plane)
+                destination = composer.destination(plane)
                 req.add(plane, {
                         'FB_ID': fb.id,
                         'CRTC_ID': crtc.id,
@@ -76,7 +112,6 @@ class CRCTest(kmstest.KMSTest):
                         'CRTC_W': destination.width,
                         'CRTC_H': destination.height,
                 })
-                offset += 50
 
             ret = req.commit(0)
             if ret < 0:
-- 
Regards,

Laurent Pinchart

