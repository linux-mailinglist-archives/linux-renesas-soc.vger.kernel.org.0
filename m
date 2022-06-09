Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5A565458B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238467AbiFIXkx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237871AbiFIXkw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:40:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BCA205F99
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:50 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60FA68A3;
        Fri, 10 Jun 2022 01:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818042;
        bh=Ih78H6BBuREsJ11JmKq0zRU+QBnHJfpR8VpKf2J8m3Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dHpT+7HUuGxhIjSc1yyI99Wtfa7AEUZLxMcbEsX/IuMnAoEHlG8NoKJKc+6JriXxe
         duQz5NZQHNRsCTtH6YCbBN1RyuyMWhTq3ksOtxuGl4Bzg/7pxKWei0jFiNRhnYXIQD
         w55oWTLjVRAihC9nLBQcTnsb1hS0vat+nsUjp8zI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 02/10] tests: Convert to formatted string literals
Date:   Fri, 10 Jun 2022 02:40:23 +0300
Message-Id: <20220609234031.14803-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Use formatted string literals to replace legacy printf-style string
formatting.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-allplanes.py      | 12 ++++++------
 tests/kms-test-brxalloc.py       | 28 +++++++++++++---------------
 tests/kms-test-connectors.py     |  2 +-
 tests/kms-test-crc.py            | 21 ++++++++++-----------
 tests/kms-test-formats.py        | 10 +++++-----
 tests/kms-test-legacy-modeset.py | 10 +++++-----
 tests/kms-test-modes.py          |  8 ++++----
 tests/kms-test-modeset.py        |  8 ++++----
 tests/kms-test-pageflip.py       | 18 +++++++++---------
 tests/kms-test-planeposition.py  | 16 ++++++++--------
 tests/kms-test-routing.py        | 10 +++++-----
 tests/kmstest.py                 | 30 +++++++++++++++---------------
 12 files changed, 85 insertions(+), 88 deletions(-)

diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
index 710ae660f0ff..0fe6cfab0a2d 100755
--- a/tests/kms-test-allplanes.py
+++ b/tests/kms-test-allplanes.py
@@ -25,7 +25,7 @@ class AllPlanesTest(kmstest.KMSTest):
                     connectors[crtc] = connector
 
         for crtc in self.card.crtcs:
-            self.start('composition on CRTC %u' % crtc.id)
+            self.start(f'composition on CRTC {crtc.id}')
 
             # Get the connector and default mode
             try:
@@ -45,8 +45,8 @@ class AllPlanesTest(kmstest.KMSTest):
                 self.skip('no plane available for CRTC')
                 continue
 
-            self.logger.log('Testing connector %s, CRTC %u, mode %s with %u planes' % \
-                  (connector.fullname, crtc.id, mode.name, len(planes)))
+            self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
+                            f'mode {mode.name} with {len(planes)} planes')
 
             # Create a frame buffer
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
@@ -55,7 +55,7 @@ class AllPlanesTest(kmstest.KMSTest):
             # Set the mode with a primary plane
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
             if ret < 0:
-                self.fail('atomic mode set failed with %d' % ret)
+                self.fail(f'atomic mode set failed with {ret}')
                 continue
 
             self.run(3)
@@ -67,10 +67,10 @@ class AllPlanesTest(kmstest.KMSTest):
                 destination = kmstest.Rect(offset, offset, fb.width, fb.height)
                 ret = self.atomic_plane_set(plane, crtc, source, destination, fb)
                 if ret < 0:
-                    self.fail('atomic plane set failed with %d' % ret)
+                    self.fail(f'atomic plane set failed with {ret}')
                     break
 
-                self.logger.log('Adding plane %u' % plane.id)
+                self.logger.log(f'Adding plane {plane.id}')
                 self.run(1)
 
                 if self.flips == 0:
diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index af6dd49f5c59..7170ee6c7708 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -38,12 +38,11 @@ class BRxAllocTest(kmstest.KMSTest):
         # Verify that the two CRTCs share the same planes
         planes = outputs[0].crtc.possible_planes
         if planes != outputs[1].crtc.possible_planes:
-            self.skip('Planes differ for CRTCs %u and %u' % \
-                      (outputs[0].crtc.id, outputs[1].crtc.id))
+            self.skip(f'Planes differ for CRTCs {outputs[0].crtc.id} and {outputs[1].crtc.id}')
             return
 
-        self.logger.log('Found %u planes for CRTCs %u and %u' % \
-                        (len(planes), outputs[0].crtc.id, outputs[1].crtc.id))
+        self.logger.log(f'Found {len(planes)} planes for CRTCs {outputs[0].crtc.id} '
+                        f'and {outputs[1].crtc.id}')
 
         # Get one connector for each CRTC
         for connector in self.output_connectors():
@@ -58,12 +57,12 @@ class BRxAllocTest(kmstest.KMSTest):
                     outputs[1].connector = connector
 
         if not outputs[0].connector or not outputs[1].connector:
-            self.skip('No connected connectors for CRTCs %u and %u ' % \
-                      (outputs[0].crtc.id, outputs[1].crtc.id))
+            self.skip(f'No connected connectors for CRTCs {outputs[0].crtc.id} '
+                      f'and {outputs[1].crtc.id}')
             return
 
-        self.start('Moving %u planes from %s to %s' % \
-                   (len(planes), outputs[0].connector.fullname, outputs[1].connector.fullname))
+        self.start(f'Moving {len(planes)} planes from {outputs[0].connector.fullname} '
+                   f'to {outputs[0].connector.fullname}')
 
         # Set the initial mode for both outputs and wait 5s for the monitors to
         # wake up.
@@ -76,8 +75,7 @@ class BRxAllocTest(kmstest.KMSTest):
             # Set the mode with no plane
             ret = self.atomic_crtc_mode_set(output.crtc, output.connector, mode, sync=True)
             if ret < 0:
-                self.fail('atomic mode set on %s failed with %d' % \
-                          (output.connector.fullname, ret))
+                self.fail(f'atomic mode set on {output.connector.fullname} failed with {ret}')
                 return
 
         self.logger.log('Initial atomic mode set completed')
@@ -88,13 +86,13 @@ class BRxAllocTest(kmstest.KMSTest):
         output = outputs[0]
 
         for plane in planes:
-            self.logger.log('Adding plane %u to %s' % (plane.id, output.connector.fullname))
+            self.logger.log(f'Adding plane {plane.id} to {output.connector.fullname}')
 
             source = kmstest.Rect(0, 0, output.fb.width, output.fb.height)
             destination = kmstest.Rect(offset, offset, output.fb.width, output.fb.height)
             ret = self.atomic_plane_set(plane, output.crtc, source, destination, output.fb, sync=True)
             if ret < 0:
-                self.fail('atomic plane set failed with %d' % ret)
+                self.fail(f'atomic plane set failed with {ret}')
                 return
 
             offset += 50
@@ -106,20 +104,20 @@ class BRxAllocTest(kmstest.KMSTest):
         output = outputs[1]
 
         for plane in planes:
-            self.logger.log('Moving plane %u to %s' % (plane.id, output.connector.fullname))
+            self.logger.log(f'Moving plane {plane.id} to {output.connector.fullname}')
 
             # Switching CRTC directly is not supported by DRM, start by
             # disabling the plane.
             ret = self.atomic_plane_disable(plane)
             if ret < 0:
-                self.fail('atomic plane disable failed with %d' % ret)
+                self.fail(f'atomic plane disable failed with {ret}')
                 return
 
             source = kmstest.Rect(0, 0, output.fb.width, output.fb.height)
             destination = kmstest.Rect(offset, offset, output.fb.width, output.fb.height)
             ret = self.atomic_plane_set(plane, output.crtc, source, destination, output.fb)
             if ret < 0:
-                self.fail('atomic plane set failed with %d' % ret)
+                self.fail(f'atomic plane set failed with {ret}')
                 return
 
             self.run(1)
diff --git a/tests/kms-test-connectors.py b/tests/kms-test-connectors.py
index 54cc89ff308e..d2ca636eb2a0 100755
--- a/tests/kms-test-connectors.py
+++ b/tests/kms-test-connectors.py
@@ -10,7 +10,7 @@ class ConnectorsTest(kmstest.KMSTest):
 
     def main(self):
         for connector in self.card.connectors:
-            self.start('connector %s' % connector.fullname)
+            self.start(f'connector {connector.fullname}')
 
             # Every connector should have at least one suitable CRTC
             crtcs = connector.get_possible_crtcs()
diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index 5b8a679ffadc..efb3cf0dbe41 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -121,7 +121,7 @@ class CRCTest(kmstest.KMSTest):
                     connectors[crtc] = connector
 
         for crtc in self.card.crtcs:
-            self.start('CRC calculation on CRTC %u' % crtc.id)
+            self.start(f'CRC calculation on CRTC {crtc.id}')
 
             # Get the connector and default mode
             try:
@@ -141,8 +141,8 @@ class CRCTest(kmstest.KMSTest):
                 self.skip('no plane available for CRTC')
                 continue
 
-            self.logger.log('Testing connector %s, CRTC %u, mode %s with %u planes' % \
-                  (connector.fullname, crtc.id, mode.name, len(planes)))
+            self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
+                            f'mode {mode.name} with {len(planes)} planes')
 
             # Create a frame buffer and draw a test pattern.
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
@@ -154,7 +154,7 @@ class CRCTest(kmstest.KMSTest):
             # Set the mode and add all planes
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, sync=True)
             if ret < 0:
-                self.fail('atomic mode set failed with %d' % ret)
+                self.fail(f'atomic mode set failed with {ret}')
                 continue
 
             req = kmstest.AtomicRequest(self)
@@ -177,7 +177,7 @@ class CRCTest(kmstest.KMSTest):
 
             ret = req.commit(0)
             if ret < 0:
-                self.fail('atomic plane set failed with %d' % ret)
+                self.fail(f'atomic plane set failed with {ret}')
                 continue
 
             # Wait for one second and make sure the page flip has completed.
@@ -191,9 +191,9 @@ class CRCTest(kmstest.KMSTest):
                 if source == crtc:
                     crc_source = 'auto'
                 else:
-                    crc_source = 'plane%u' % source.id
+                    crc_source = f'plane{source.id}'
 
-                self.logger.log('Computing CRC from source %s' % crc_source)
+                self.logger.log(f'Computing CRC from source {crc_source}')
 
                 # Set the CRC source and acquire 10 CRC values. Discard the
                 # first value, as the device is running and the new source
@@ -204,7 +204,7 @@ class CRCTest(kmstest.KMSTest):
                 crc_reader.stop()
 
                 crcs = [c.crcs[0] for c in crcs[1:]]
-                self.logger.log('CRC value[0] 0x%08x' % crcs[0])
+                self.logger.log(f'CRC value[0] 0x{crcs[0]:08x}')
 
                 failures = 0
                 ref_crc = composer.crc(source)
@@ -212,12 +212,11 @@ class CRCTest(kmstest.KMSTest):
                 for i in range(len(crcs)):
                     crc = crcs[i]
                     if crc != ref_crc:
-                        self.logger.log('CRC value[%u] 0x%08x does not match reference 0x%08x'
-                                        % (i, crc, ref_crc))
+                        self.logger.log(f'CRC value[{i}] 0x{crc:08x} does not match reference 0x{ref_crc:08x}')
                         failures += 1
 
                 if failures:
-                    self.fail('Incorrect CRC values on source %s' % crc_source)
+                    self.fail(f'Incorrect CRC values on source {crc_source}')
                     break
 
             else:
diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index ce849437b2fa..5c3bfd441a38 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -37,8 +37,8 @@ class FormatsTest(kmstest.KMSTest):
             self.skip('no CRTC available with connector')
             return
 
-        self.logger.log('Testing connector %s, CRTC %u, mode %s' % \
-              (connector.fullname, crtc.id, mode.name))
+        self.logger.log(f'Testing connector {connector.fullname}, '
+                        f'CRTC {crtc.id}, mode {mode.name}')
 
         failed = 0
 
@@ -46,7 +46,7 @@ class FormatsTest(kmstest.KMSTest):
         for i in range(num_formats):
             format = crtc.primary_plane.formats[i]
 
-            self.logger.log('Testing format %s' % format)
+            self.logger.log(f'Testing format {format}')
             self.progress(i+1, num_formats)
 
             # Create a frame buffer
@@ -62,7 +62,7 @@ class FormatsTest(kmstest.KMSTest):
             # Set the mode with a primary plane
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
             if ret < 0:
-                self.logger.log('atomic mode set failed with %d' % ret)
+                self.logger.log(f'atomic mode set failed with {ret}')
                 failed += 1
                 continue
 
@@ -71,7 +71,7 @@ class FormatsTest(kmstest.KMSTest):
         self.atomic_crtc_disable(crtc)
 
         if failed:
-            self.fail('%s/%s formats failed' % (failed, num_formats))
+            self.fail(f'{failed}/{num_formats} formats failed')
         else:
             self.success()
 
diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
index f856178172c0..06eceade19c4 100755
--- a/tests/kms-test-legacy-modeset.py
+++ b/tests/kms-test-legacy-modeset.py
@@ -13,7 +13,7 @@ class LegacyModeSetTest(kmstest.KMSTest):
 
     def main(self):
         for connector in self.output_connectors():
-            self.start('legacy mode set on connector %s' % connector.fullname)
+            self.start(f'legacy mode set on connector {connector.fullname}')
 
             # Skip disconnected connectors
             if not connector.connected():
@@ -36,8 +36,8 @@ class LegacyModeSetTest(kmstest.KMSTest):
                 self.skip('no mode available')
                 continue
 
-            self.logger.log('Testing connector %s on CRTC %u with mode %s' % \
-                  (connector.fullname, crtc.id, mode.name))
+            self.logger.log(f'Testing connector {connector.fullname} '
+                            f'on CRTC {crtc.id} with mode {mode.name}')
 
             # Create a frame buffer
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
@@ -46,7 +46,7 @@ class LegacyModeSetTest(kmstest.KMSTest):
             # Perform a mode set
             ret = crtc.set_mode(connector, fb, mode)
             if ret < 0:
-                self.fail('legacy mode set failed with %d' % ret)
+                self.fail(f'legacy mode set failed with {ret}')
                 continue
 
             self.logger.log('Legacy mode set complete')
@@ -54,7 +54,7 @@ class LegacyModeSetTest(kmstest.KMSTest):
 
             ret = crtc.disable_mode()
             if ret < 0:
-                self.fail('legacy mode set disable failed with %d' % ret)
+                self.fail(f'legacy mode set disable failed with {ret}')
                 continue
 
             self.success()
diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
index 433bb0bdd157..c47848904ec4 100755
--- a/tests/kms-test-modes.py
+++ b/tests/kms-test-modes.py
@@ -12,8 +12,8 @@ class ModesTest(kmstest.KMSTest):
         self.logger.log('Page flip complete')
 
     def test_mode(self, connector, crtc, mode):
-        self.logger.log('Testing connector %s on CRTC %u with mode %s' % \
-              (connector.fullname, crtc.id, mode.name))
+        self.logger.log(f'Testing connector {connector.fullname} '
+                        f'on CRTC {crtc.id} with mode {mode.name}')
 
         # Create a frame buffer
         fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
@@ -22,7 +22,7 @@ class ModesTest(kmstest.KMSTest):
         # Perform the mode set
         ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
         if ret < 0:
-            raise RuntimeError('atomic mode set failed with %d' % ret)
+            raise RuntimeError(f'atomic mode set failed with {ret}')
 
         self.logger.log('Atomic mode set complete')
         self.run(4)
@@ -33,7 +33,7 @@ class ModesTest(kmstest.KMSTest):
 
     def main(self):
         for connector in self.output_connectors():
-            self.start('modes on connector %s' % connector.fullname)
+            self.start(f'modes on connector {connector.fullname}')
 
             # Skip disconnected connectors
             if not connector.connected():
diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
index a6ba61c920e5..e8b3d9ac37f9 100755
--- a/tests/kms-test-modeset.py
+++ b/tests/kms-test-modeset.py
@@ -13,7 +13,7 @@ class ModeSetTest(kmstest.KMSTest):
 
     def main(self):
         for connector in self.output_connectors():
-            self.start('atomic mode set on connector %s' % connector.fullname)
+            self.start(f'atomic mode set on connector {connector.fullname}')
 
             # Skip disconnected connectors
             if not connector.connected():
@@ -36,8 +36,8 @@ class ModeSetTest(kmstest.KMSTest):
                 self.skip('no mode available')
                 continue
 
-            self.logger.log('Testing connector %s on CRTC %u with mode %s' % \
-                  (connector.fullname, crtc.id, mode.name))
+            self.logger.log(f'Testing connector {connector.fullname} '
+                            f'on CRTC {crtc.id} with mode {mode.name}')
 
             # Create a frame buffer
             fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
@@ -46,7 +46,7 @@ class ModeSetTest(kmstest.KMSTest):
             # Perform a mode set
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
             if ret < 0:
-                self.fail('atomic mode set failed with %d' % ret)
+                self.fail(f'atomic mode set failed with {ret}')
                 continue
 
             self.logger.log('Atomic mode set complete')
diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
index 15dae6a23ab3..14bea0a877a3 100755
--- a/tests/kms-test-pageflip.py
+++ b/tests/kms-test-pageflip.py
@@ -13,12 +13,12 @@ class PageFlipTest(kmstest.KMSTest):
 
     def handle_page_flip(self, frame, time):
         if self.flips == 1:
-            self.logger.log('first page flip frame %u time %f' % (frame, time))
+            self.logger.log(f'first page flip frame {frame} time {time}')
             self.frame_start = frame
             self.time_start = time
 
         if self.stop_requested:
-            self.logger.log('last page flip frame %u time %f' % (frame, time))
+            self.logger.log(f'last page flip frame {frame} time {time}')
             self.frame_end = frame
             self.time_end = time
             self.loop.stop()
@@ -43,7 +43,7 @@ class PageFlipTest(kmstest.KMSTest):
 
     def main(self):
         for connector in self.output_connectors():
-            self.start('page flip on connector %s' % connector.fullname)
+            self.start(f'page flip on connector {connector.fullname}')
 
             # Skip disconnected connectors
             if not connector.connected():
@@ -67,7 +67,7 @@ class PageFlipTest(kmstest.KMSTest):
                     self.plane = plane
                     break
             else:
-                self.skip('no plane available for CRTC %u' % crtc.id)
+                self.skip(f'no plane available for CRTC {crtc.id}')
                 continue
 
             # Get the default mode for the connector
@@ -77,8 +77,8 @@ class PageFlipTest(kmstest.KMSTest):
                 self.skip('no mode available')
                 continue
 
-            self.logger.log('Testing connector %s, CRTC %u, plane %u, mode %s' % \
-                  (connector.fullname, crtc.id, self.plane.id, mode.name))
+            self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
+                            f'plane {self.plane.id}, mode {mode.name}')
 
             # Create two frame buffers
             self.fbs = []
@@ -88,7 +88,7 @@ class PageFlipTest(kmstest.KMSTest):
             # Set the mode and perform the initial page flip
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, self.fbs[0])
             if ret < 0:
-                self.fail('atomic mode set failed with %d' % ret)
+                self.fail(f'atomic mode set failed with {ret}')
                 continue
 
             # Flip pages for 10s
@@ -114,8 +114,8 @@ class PageFlipTest(kmstest.KMSTest):
 
             frames = self.frame_end - self.frame_start + 1
             interval = self.time_end - self.time_start
-            self.logger.log('Frame rate: %f (%u/%u frames in %f s)' % \
-                (frames / interval, self.flips, frames, interval))
+            self.logger.log(f'Frame rate: {frames / interval} '
+                            f'({self.flips}/{frames} frames in {interval} s)')
             self.success()
 
 PageFlipTest().execute()
diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-planeposition.py
index e843ae13c50c..aceb849950a1 100755
--- a/tests/kms-test-planeposition.py
+++ b/tests/kms-test-planeposition.py
@@ -42,8 +42,8 @@ class PlanePositionTest(kmstest.KMSTest):
             self.skip('no CRTC available with connector and at least two planes')
             return
 
-        self.logger.log('Testing connector %s, CRTC %u, mode %s with %u planes' % \
-              (connector.fullname, crtc.id, mode.name, len(planes)))
+        self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
+                        f'mode {mode.name} with {len(planes)} planes')
 
         # Create a frame buffer
         fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
@@ -52,7 +52,7 @@ class PlanePositionTest(kmstest.KMSTest):
         # Set the mode with no plane, wait 5s for the monitor to wake up
         ret = self.atomic_crtc_mode_set(crtc, connector, mode, sync=True)
         if ret < 0:
-            self.fail('atomic mode set failed with %d' % ret)
+            self.fail(f'atomic mode set failed with {ret}')
             return
 
         self.logger.log('Initial atomic mode set completed')
@@ -63,7 +63,7 @@ class PlanePositionTest(kmstest.KMSTest):
         destination = kmstest.Rect(0, 0, fb.width // 2, fb.height)
         ret = self.atomic_plane_set(planes[0], crtc, source, destination, fb, sync=True)
         if ret < 0:
-            self.fail('atomic plane set for first plane failed with %d' % ret)
+            self.fail(f'atomic plane set for first plane failed with {ret}')
             return
 
         self.logger.log('Root plane enabled')
@@ -79,10 +79,10 @@ class PlanePositionTest(kmstest.KMSTest):
 
             ret = self.atomic_plane_set(planes[1], crtc, source, destination, fb, sync=True)
             if ret < 0:
-                self.fail('atomic plane set with offset %d,%d' % offset)
+                self.fail(f'atomic plane set with offset {offset}')
                 return
 
-            self.logger.log('Moved overlay plane to %d,%d' % offset)
+            self.logger.log(f'Moved overlay plane to {offset}')
             time.sleep(3)
 
         # Try to move the plane completely off-screen. The device is expected
@@ -97,10 +97,10 @@ class PlanePositionTest(kmstest.KMSTest):
 
             ret = self.atomic_plane_set(planes[1], crtc, source, destination, fb, sync=True)
             if ret < 0:
-                self.fail('atomic plane set with offset %d,%d' % offset)
+                self.fail(f'atomic plane set with offset {offset}')
                 return
 
-            self.logger.log('Moved overlay plane to %d,%d' % offset)
+            self.logger.log(f'Moved overlay plane to {offset}')
             time.sleep(3)
 
         # Disable and re-enable the plane when it is off-screen. The device is
diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
index 69f8be127d2f..68aff9c11cff 100755
--- a/tests/kms-test-routing.py
+++ b/tests/kms-test-routing.py
@@ -64,10 +64,10 @@ class RoutingTest(kmstest.KMSTest):
         fb = pykms.DumbFramebuffer(self.card, max_hdisplay, max_vdisplay, 'XR24')
         pykms.draw_test_pattern(fb)
 
-        self.start('Moving connector %s between CRTCs %s' % \
-                   (shared_connector.fullname, [pipe.crtc.id for pipe in pipes]))
+        self.start(f'Moving connector {shared_connector.fullname} '
+                   f'between CRTCs {[pipe.crtc.id for pipe in pipes]}')
 
-        self.logger.log('Highest display resolution: %ux%u' % (max_hdisplay, max_vdisplay))
+        self.logger.log(f'Highest display resolution: {max_hdisplay}x{max_vdisplay}')
 
         for master_pipe in pipes:
             req = kmstest.AtomicRequest(self)
@@ -97,13 +97,13 @@ class RoutingTest(kmstest.KMSTest):
                             'CRTC_H': mode.vdisplay,
                         })
 
-                route.append('CRTC %u to connector %s' % (pipe.crtc.id, pipe.connector.fullname))
+                route.append(f'CRTC {pipe.crtc.id} to connector {pipe.connector.fullname}')
 
             self.logger.log('Routing ' + ', '.join(route))
 
             ret = req.commit_sync(True)
             if ret < 0:
-                self.fail('atomic commit failed with %d' % ret)
+                self.fail(f'atomic commit failed with {ret}')
                 return
 
             time.sleep(5)
diff --git a/tests/kmstest.py b/tests/kmstest.py
index 708e6999d1f0..14e28cd47fbd 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -113,7 +113,7 @@ class KernelLogReader(object):
 
 class Logger(object):
     def __init__(self, name):
-        self.logfile = open('%s.log' % name, 'w')
+        self.logfile = open(f'{name}.log', 'w')
         self._kmsg = KernelLogReader()
 
     def __del__(self):
@@ -129,7 +129,7 @@ class Logger(object):
     def event(self):
         kmsgs = self._kmsg.read()
         for msg in kmsgs:
-            self.logfile.write('K [%6f] %s\n' % (msg.timestamp, msg.msg))
+            self.logfile.write(f'K [{msg.timestamp:6f} {msg.msg}\n')
         self.logfile.flush()
 
     @property
@@ -146,7 +146,7 @@ class Logger(object):
         self.event()
 
         now = time.clock_gettime(time.CLOCK_MONOTONIC)
-        self.logfile.write('U [%6f] %s\n' % (now, msg))
+        self.logfile.write(f'U [{now:6f}] {msg}\n')
         self.logfile.flush()
 
 
@@ -171,7 +171,7 @@ class CRCReader(object):
 
         # Hardcode the device minor to 0 as the KMSTest constructor opens the
         # default card object.
-        self.dir = os.open('/sys/kernel/debug/dri/0/crtc-%u/crc' % self.pipe, 0)
+        self.dir = os.open('f/sys/kernel/debug/dri/0/crtc-{self.pipe}/crc', 0)
         self.ctrl = os.open('control', os.O_WRONLY, dir_fd = self.dir)
         self.data = -1
 
@@ -211,7 +211,7 @@ class Dist(object):
         self.y = y
 
     def __repr__(self):
-        return '(%d,%d)' % (self.x, self.y)
+        return f'({self.x},{self.y})'
 
 
 class Point(object):
@@ -220,7 +220,7 @@ class Point(object):
         self.y = y
 
     def __repr__(self):
-        return '(%d,%d)' % (self.x, self.y)
+        return f'({self.x},{self.y})'
 
     def move(self, distance):
         self.x += distance.x
@@ -233,7 +233,7 @@ class Size(object):
         self.height = height
 
     def __repr__(self):
-        return '%ux%u' % (self.width, self.height)
+        return f'{self.width}x{self.height}'
 
 
 class Rect(object):
@@ -244,7 +244,7 @@ class Rect(object):
         self.height = height
 
     def __repr__(self):
-        return '(%d,%d)/%ux%u' % (self.left, self.top, self.width, self.height)
+        return f'({self.left},{self.top})/{self.width}x{self.height}'
 
     def isEmpty(self):
         """Check if the rectangle has a zero width or height"""
@@ -462,24 +462,24 @@ class KMSTest(object):
     def start(self, name):
         """Start a test."""
         self.test_name = name
-        self.logger.log('Testing %s' % name)
-        sys.stdout.write('Testing %s: ' % name)
+        self.logger.log(f'Testing {name}')
+        sys.stdout.write(f'Testing {name}: ')
         sys.stdout.flush()
 
     def progress(self, current, maximum):
-        sys.stdout.write('\rTesting %s: %u/%u' % (self.test_name, current, maximum))
+        sys.stdout.write(f'\rTesting {self.test_name}: {current}/{maximum}')
         sys.stdout.flush()
 
     def fail(self, reason):
         """Complete a test with failure."""
-        self.logger.log('Test failed. Reason: %s' % reason)
+        self.logger.log(f'Test failed. Reason: {reason}')
         self.logger.flush()
-        sys.stdout.write('\rTesting %s: FAIL\n' % self.test_name)
+        sys.stdout.write(f'\rTesting {self.test_name}: FAIL\n')
         sys.stdout.flush()
 
     def skip(self, reason):
         """Complete a test with skip."""
-        self.logger.log('Test skipped. Reason: %s' % reason)
+        self.logger.log(f'Test skipped. Reason: {reason}')
         self.logger.flush()
         sys.stdout.write('SKIP\n')
         sys.stdout.flush()
@@ -488,6 +488,6 @@ class KMSTest(object):
         """Complete a test with success."""
         self.logger.log('Test completed successfully')
         self.logger.flush()
-        sys.stdout.write('\rTesting %s: SUCCESS\n' % self.test_name)
+        sys.stdout.write(f'\rTesting {self.test_name}: SUCCESS\n')
         sys.stdout.flush()
 
-- 
Regards,

Laurent Pinchart

