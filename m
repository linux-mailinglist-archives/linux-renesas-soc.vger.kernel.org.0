Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8DB34AEFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 02:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbfFSAW4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 20:22:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33220 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfFSAWz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 20:22:55 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07C6E333;
        Wed, 19 Jun 2019 02:22:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560903773;
        bh=P8rG6+Vi+FJ9nHfZcnLSQtKJjjFpGmjAiB29J5twW/U=;
        h=From:To:Cc:Subject:Date:From;
        b=risuuin5xToZ7v5YST33WeLUEUv39/G3UvXUgXHpi7WjWxtLSD8ubF/hgs31YAffh
         556jBD/R9qaU35wT3HBrmn6D0cVJVqoo95pvDc54tQW0P1DNuRepf7ejbOq6vSlPQl
         VGzP0tQtCjh7UDQYcaqB490Stgs7uHxeg5dAV9ZU=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-tests] [PATCH] kmstest.py: Add output_connectors() helper to skip writeback connectors
Date:   Wed, 19 Jun 2019 03:22:31 +0300
Message-Id: <20190619002231.8239-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a generator method to the KMSTest class to enumerate all
non-writeback connectors, and use it through tests.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-allplanes.py      |  2 +-
 tests/kms-test-brxalloc.py       |  2 +-
 tests/kms-test-crc.py            |  2 +-
 tests/kms-test-formats.py        |  2 +-
 tests/kms-test-legacy-modeset.py |  2 +-
 tests/kms-test-modes.py          |  2 +-
 tests/kms-test-modeset.py        |  2 +-
 tests/kms-test-pageflip.py       |  2 +-
 tests/kms-test-planeposition.py  |  2 +-
 tests/kms-test-routing.py        | 10 ++--------
 tests/kmstest.py                 |  6 ++++++
 11 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
index f416723bc7fc..ca7baa07af42 100755
--- a/tests/kms-test-allplanes.py
+++ b/tests/kms-test-allplanes.py
@@ -12,7 +12,7 @@ class AllPlanesTest(kmstest.KMSTest):
     def main(self):
         # Create the connectors to CRTCs map
         connectors = {}
-        for connector in self.card.connectors:
+        for connector in self.output_connectors():
             # Skip disconnected connectors
             if not connector.connected():
                 continue
diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index e6d9f03fc211..a0ae46a8b53e 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -44,7 +44,7 @@ class BRxAllocTest(kmstest.KMSTest):
                         (len(planes), outputs[0].crtc.id, outputs[1].crtc.id))
 
         # Get one connector for each CRTC
-        for connector in self.card.connectors:
+        for connector in self.output_connectors():
             # Skip disconnected connectors
             if not connector.connected():
                 continue
diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index 29147e5bd0a3..e0e0eabd9950 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -12,7 +12,7 @@ class CRCTest(kmstest.KMSTest):
     def main(self):
         # Create the connectors to CRTCs map
         connectors = {}
-        for connector in self.card.connectors:
+        for connector in self.output_connectors():
             # Skip disconnected connectors
             if not connector.connected():
                 continue
diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index ae89bb542485..15e6f591aea9 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -11,7 +11,7 @@ class FormatsTest(kmstest.KMSTest):
         self.start("plane formats")
 
         # Find a CRTC with a connected connector and at least one plane
-        for connector in self.card.connectors:
+        for connector in self.output_connectors():
             if not connector.connected():
                 self.skip("unconnected connector")
                 continue
diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
index eac365f44b64..17a81792a2b8 100755
--- a/tests/kms-test-legacy-modeset.py
+++ b/tests/kms-test-legacy-modeset.py
@@ -10,7 +10,7 @@ class LegacyModeSetTest(kmstest.KMSTest):
         self.logger.log("Page flip complete")
 
     def main(self):
-        for connector in self.card.connectors:
+        for connector in self.output_connectors():
             self.start("legacy mode set on connector %s" % connector.fullname)
 
             # Skip disconnected connectors
diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
index 2ca45c46b50d..82a1a3b21e93 100755
--- a/tests/kms-test-modes.py
+++ b/tests/kms-test-modes.py
@@ -30,7 +30,7 @@ class ModesTest(kmstest.KMSTest):
             raise RuntimeError("Page flip not registered")
 
     def main(self):
-        for connector in self.card.connectors:
+        for connector in self.output_connectors():
             self.start("modes on connector %s" % connector.fullname)
 
             # Skip disconnected connectors
diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
index f8a78ad2926b..224b39143a8e 100755
--- a/tests/kms-test-modeset.py
+++ b/tests/kms-test-modeset.py
@@ -10,7 +10,7 @@ class ModeSetTest(kmstest.KMSTest):
         self.logger.log("Page flip complete")
 
     def main(self):
-        for connector in self.card.connectors:
+        for connector in self.output_connectors():
             self.start("atomic mode set on connector %s" % connector.fullname)
 
             # Skip disconnected connectors
diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
index 2aeaf3478dc3..bef1f4990a10 100755
--- a/tests/kms-test-pageflip.py
+++ b/tests/kms-test-pageflip.py
@@ -40,7 +40,7 @@ class PageFlipTest(kmstest.KMSTest):
         self.stop_requested = True
 
     def main(self):
-        for connector in self.card.connectors:
+        for connector in self.output_connectors():
             self.start("page flip on connector %s" % connector.fullname)
 
             # Skip disconnected connectors
diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-planeposition.py
index 63f745b5dbed..ac4b4d0eb407 100755
--- a/tests/kms-test-planeposition.py
+++ b/tests/kms-test-planeposition.py
@@ -11,7 +11,7 @@ class PlanePositionTest(kmstest.KMSTest):
         self.start("plane positioning boundaries")
 
         # Find a CRTC with a connected connector and at least two planes
-        for connector in self.card.connectors:
+        for connector in self.output_connectors():
             if not connector.connected():
                 self.skip("unconnected connector")
                 continue
diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
index 2cf02ddcc6b5..a24dc1c0fb1e 100755
--- a/tests/kms-test-routing.py
+++ b/tests/kms-test-routing.py
@@ -23,10 +23,7 @@ class RoutingTest(kmstest.KMSTest):
         max_hdisplay = 0
         max_vdisplay = 0
 
-        for connector in self.card.connectors:
-            if connector.fullname.startswith('writeback-'):
-                continue
-
+        for connector in self.output_connectors():
             mode = connector.get_default_mode()
             max_hdisplay = max(mode.hdisplay, max_hdisplay)
             max_vdisplay = max(mode.vdisplay, max_vdisplay)
@@ -39,10 +36,7 @@ class RoutingTest(kmstest.KMSTest):
         # Find a connector that can be routed to at least two CRTCs that have
         # at least two output routes each.
         shared_connector = None
-        for connector in self.card.connectors:
-            if connector.fullname.startswith('writeback-'):
-                continue
-
+        for connector in self.output_connectors():
             pipes = []
             for crtc in connector.get_possible_crtcs():
                 if len(self.crtc_to_connectors[crtc]) >= 2:
diff --git a/tests/kmstest.py b/tests/kmstest.py
index 336e31a55d47..8a483d7b5259 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -364,6 +364,12 @@ class KMSTest(object):
         else:
             return req.commit(0)
 
+    def output_connectors(self):
+        for connector in self.card.connectors:
+            if connector.fullname.startswith('writeback-'):
+                continue
+            yield connector
+
     def __handle_page_flip(self, frame, time):
         self.flips += 1
         try:
-- 
Regards,

Laurent Pinchart

