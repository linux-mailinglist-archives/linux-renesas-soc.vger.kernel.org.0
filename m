Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67DE35458B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238189AbiFIXkv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiFIXku (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:40:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 012D22046C1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:44 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8FB5741;
        Fri, 10 Jun 2022 01:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818042;
        bh=bzApXnMrMiM14QgHoLd+r2vX6njqiXXq9CsaK7Jadjs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qLKxvrnkqT2ghjZ88Ok/bmO+4JSJ88DcZm7Ggwcgb9anujRoajiPY0SLULWOxNQl4
         qrznTkvcTOb/3htZZycSW6V9gt71ahAfavnQJPl1fSpXkR/jlqrHPkhQLXoLtcDUUl
         4B+OIXhNJ4TJ3vRzxnscjRUmiqbWLe6YSK/1LrSs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 01/10] tests: Replace double quotes with single quotes
Date:   Fri, 10 Jun 2022 02:40:22 +0300
Message-Id: <20220609234031.14803-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
References: <20220609234031.14803-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The code base mixes single and double quotes. Standardize on single
quotes except for triple-quoted strings (to match the PEP8 coding style)
and where the string contains single quotes to avoid the need to escape
them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-allplanes.py      | 20 +++++------
 tests/kms-test-brxalloc.py       | 30 ++++++++--------
 tests/kms-test-connectors.py     |  6 ++--
 tests/kms-test-crc.py            | 30 ++++++++--------
 tests/kms-test-formats.py        | 16 ++++-----
 tests/kms-test-legacy-modeset.py | 18 +++++-----
 tests/kms-test-modes.py          | 18 +++++-----
 tests/kms-test-modeset.py        | 18 +++++-----
 tests/kms-test-pageflip.py       | 24 ++++++-------
 tests/kms-test-planeposition.py  | 30 ++++++++--------
 tests/kms-test-routing.py        | 14 ++++----
 tests/kmstest.py                 | 60 ++++++++++++++++----------------
 12 files changed, 142 insertions(+), 142 deletions(-)

diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
index d88326293782..710ae660f0ff 100755
--- a/tests/kms-test-allplanes.py
+++ b/tests/kms-test-allplanes.py
@@ -9,7 +9,7 @@ class AllPlanesTest(kmstest.KMSTest):
     """Test composition with all planes enabled on all CRTCs."""
 
     def handle_page_flip(self, frame, time):
-        self.logger.log("Page flip complete")
+        self.logger.log('Page flip complete')
 
     def main(self):
         # Create the connectors to CRTCs map
@@ -25,14 +25,14 @@ class AllPlanesTest(kmstest.KMSTest):
                     connectors[crtc] = connector
 
         for crtc in self.card.crtcs:
-            self.start("composition on CRTC %u" % crtc.id)
+            self.start('composition on CRTC %u' % crtc.id)
 
             # Get the connector and default mode
             try:
                 connector = connectors[crtc];
                 mode = connector.get_default_mode()
             except KeyError:
-                self.skip("no connector or mode available")
+                self.skip('no connector or mode available')
                 continue
 
             # List planes available for the CRTC
@@ -42,20 +42,20 @@ class AllPlanesTest(kmstest.KMSTest):
                     planes.append(plane)
 
             if len(planes) == 0:
-                self.skip("no plane available for CRTC")
+                self.skip('no plane available for CRTC')
                 continue
 
-            self.logger.log("Testing connector %s, CRTC %u, mode %s with %u planes" % \
+            self.logger.log('Testing connector %s, CRTC %u, mode %s with %u planes' % \
                   (connector.fullname, crtc.id, mode.name, len(planes)))
 
             # Create a frame buffer
-            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
+            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
             pykms.draw_test_pattern(fb)
 
             # Set the mode with a primary plane
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
             if ret < 0:
-                self.fail("atomic mode set failed with %d" % ret)
+                self.fail('atomic mode set failed with %d' % ret)
                 continue
 
             self.run(3)
@@ -67,14 +67,14 @@ class AllPlanesTest(kmstest.KMSTest):
                 destination = kmstest.Rect(offset, offset, fb.width, fb.height)
                 ret = self.atomic_plane_set(plane, crtc, source, destination, fb)
                 if ret < 0:
-                    self.fail("atomic plane set failed with %d" % ret)
+                    self.fail('atomic plane set failed with %d' % ret)
                     break
 
-                self.logger.log("Adding plane %u" % plane.id)
+                self.logger.log('Adding plane %u' % plane.id)
                 self.run(1)
 
                 if self.flips == 0:
-                    self.fail("No page flip registered")
+                    self.fail('No page flip registered')
                     break
 
                 offset += 50
diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index dbdc78946b04..af6dd49f5c59 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -21,9 +21,9 @@ class BRxAllocTest(kmstest.KMSTest):
         # instance to test dynamic assignment of the BRU and BRS to pipelines.
         # This is only occurs on H3 ES2.0 and M3-N. Check the SoC model through
         # sysfs as we can't detected it through the DRM/KMS API.
-        soc = open("/sys/devices/soc0/soc_id", "rb").read().strip().decode()
-        if soc not in ["r8a7795", "r8a77965"]:
-            self.skip("VSPDL (BRU+BRS) not available")
+        soc = open('/sys/devices/soc0/soc_id', 'rb').read().strip().decode()
+        if soc not in ['r8a7795', 'r8a77965']:
+            self.skip('VSPDL (BRU+BRS) not available')
             return
 
         outputs = [Output(), Output()]
@@ -38,11 +38,11 @@ class BRxAllocTest(kmstest.KMSTest):
         # Verify that the two CRTCs share the same planes
         planes = outputs[0].crtc.possible_planes
         if planes != outputs[1].crtc.possible_planes:
-            self.skip("Planes differ for CRTCs %u and %u" % \
+            self.skip('Planes differ for CRTCs %u and %u' % \
                       (outputs[0].crtc.id, outputs[1].crtc.id))
             return
 
-        self.logger.log("Found %u planes for CRTCs %u and %u" % \
+        self.logger.log('Found %u planes for CRTCs %u and %u' % \
                         (len(planes), outputs[0].crtc.id, outputs[1].crtc.id))
 
         # Get one connector for each CRTC
@@ -58,11 +58,11 @@ class BRxAllocTest(kmstest.KMSTest):
                     outputs[1].connector = connector
 
         if not outputs[0].connector or not outputs[1].connector:
-            self.skip("No connected connectors for CRTCs %u and %u " % \
+            self.skip('No connected connectors for CRTCs %u and %u ' % \
                       (outputs[0].crtc.id, outputs[1].crtc.id))
             return
 
-        self.start("Moving %u planes from %s to %s" % \
+        self.start('Moving %u planes from %s to %s' % \
                    (len(planes), outputs[0].connector.fullname, outputs[1].connector.fullname))
 
         # Set the initial mode for both outputs and wait 5s for the monitors to
@@ -70,17 +70,17 @@ class BRxAllocTest(kmstest.KMSTest):
         for output in outputs:
             # Get the default mode and create a framebuffer
             mode = output.connector.get_default_mode()
-            output.fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
+            output.fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
             pykms.draw_test_pattern(output.fb)
 
             # Set the mode with no plane
             ret = self.atomic_crtc_mode_set(output.crtc, output.connector, mode, sync=True)
             if ret < 0:
-                self.fail("atomic mode set on %s failed with %d" % \
+                self.fail('atomic mode set on %s failed with %d' % \
                           (output.connector.fullname, ret))
                 return
 
-        self.logger.log("Initial atomic mode set completed")
+        self.logger.log('Initial atomic mode set completed')
         time.sleep(5)
 
         # Add all planes
@@ -88,13 +88,13 @@ class BRxAllocTest(kmstest.KMSTest):
         output = outputs[0]
 
         for plane in planes:
-            self.logger.log("Adding plane %u to %s" % (plane.id, output.connector.fullname))
+            self.logger.log('Adding plane %u to %s' % (plane.id, output.connector.fullname))
 
             source = kmstest.Rect(0, 0, output.fb.width, output.fb.height)
             destination = kmstest.Rect(offset, offset, output.fb.width, output.fb.height)
             ret = self.atomic_plane_set(plane, output.crtc, source, destination, output.fb, sync=True)
             if ret < 0:
-                self.fail("atomic plane set failed with %d" % ret)
+                self.fail('atomic plane set failed with %d' % ret)
                 return
 
             offset += 50
@@ -106,20 +106,20 @@ class BRxAllocTest(kmstest.KMSTest):
         output = outputs[1]
 
         for plane in planes:
-            self.logger.log("Moving plane %u to %s" % (plane.id, output.connector.fullname))
+            self.logger.log('Moving plane %u to %s' % (plane.id, output.connector.fullname))
 
             # Switching CRTC directly is not supported by DRM, start by
             # disabling the plane.
             ret = self.atomic_plane_disable(plane)
             if ret < 0:
-                self.fail("atomic plane disable failed with %d" % ret)
+                self.fail('atomic plane disable failed with %d' % ret)
                 return
 
             source = kmstest.Rect(0, 0, output.fb.width, output.fb.height)
             destination = kmstest.Rect(offset, offset, output.fb.width, output.fb.height)
             ret = self.atomic_plane_set(plane, output.crtc, source, destination, output.fb)
             if ret < 0:
-                self.fail("atomic plane set failed with %d" % ret)
+                self.fail('atomic plane set failed with %d' % ret)
                 return
 
             self.run(1)
diff --git a/tests/kms-test-connectors.py b/tests/kms-test-connectors.py
index 4c58b99f8fbf..54cc89ff308e 100755
--- a/tests/kms-test-connectors.py
+++ b/tests/kms-test-connectors.py
@@ -10,19 +10,19 @@ class ConnectorsTest(kmstest.KMSTest):
 
     def main(self):
         for connector in self.card.connectors:
-            self.start("connector %s" % connector.fullname)
+            self.start('connector %s' % connector.fullname)
 
             # Every connector should have at least one suitable CRTC
             crtcs = connector.get_possible_crtcs()
             if len(crtcs) == 0:
-                self.fail("no possible CRTC")
+                self.fail('no possible CRTC')
                 continue
 
             # Connected connectors should have at least one mode
             if connector.connected():
                 modes = connector.get_modes()
                 if len(modes) == 0:
-                    self.fail("no mode available")
+                    self.fail('no mode available')
                     continue
 
             self.success()
diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index 60187eff1c48..5b8a679ffadc 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -105,7 +105,7 @@ class CRCTest(kmstest.KMSTest):
     """Test CRC calculation on pipeline output."""
 
     def handle_page_flip(self, frame, time):
-        self.logger.log("Page flip complete")
+        self.logger.log('Page flip complete')
 
     def main(self):
         # Create the connectors to CRTCs map
@@ -121,14 +121,14 @@ class CRCTest(kmstest.KMSTest):
                     connectors[crtc] = connector
 
         for crtc in self.card.crtcs:
-            self.start("CRC calculation on CRTC %u" % crtc.id)
+            self.start('CRC calculation on CRTC %u' % crtc.id)
 
             # Get the connector and default mode
             try:
                 connector = connectors[crtc];
                 mode = connector.get_default_mode()
             except KeyError:
-                self.skip("no connector or mode available")
+                self.skip('no connector or mode available')
                 continue
 
             # List planes available for the CRTC
@@ -138,14 +138,14 @@ class CRCTest(kmstest.KMSTest):
                     planes.append(plane)
 
             if len(planes) == 0:
-                self.skip("no plane available for CRTC")
+                self.skip('no plane available for CRTC')
                 continue
 
-            self.logger.log("Testing connector %s, CRTC %u, mode %s with %u planes" % \
+            self.logger.log('Testing connector %s, CRTC %u, mode %s with %u planes' % \
                   (connector.fullname, crtc.id, mode.name, len(planes)))
 
             # Create a frame buffer and draw a test pattern.
-            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
+            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
             pykms.draw_test_pattern(fb)
 
             # Create a composer. This will compute the reference CRCs.
@@ -154,7 +154,7 @@ class CRCTest(kmstest.KMSTest):
             # Set the mode and add all planes
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, sync=True)
             if ret < 0:
-                self.fail("atomic mode set failed with %d" % ret)
+                self.fail('atomic mode set failed with %d' % ret)
                 continue
 
             req = kmstest.AtomicRequest(self)
@@ -177,23 +177,23 @@ class CRCTest(kmstest.KMSTest):
 
             ret = req.commit(0)
             if ret < 0:
-                self.fail("atomic plane set failed with %d" % ret)
+                self.fail('atomic plane set failed with %d' % ret)
                 continue
 
             # Wait for one second and make sure the page flip has completed.
             self.run(1)
             if self.flips == 0:
-                self.fail("No page flip registered")
+                self.fail('No page flip registered')
                 continue
 
             sources = [crtc] + planes
             for source in sources:
                 if source == crtc:
-                    crc_source = "auto"
+                    crc_source = 'auto'
                 else:
-                    crc_source = "plane%u" % source.id
+                    crc_source = 'plane%u' % source.id
 
-                self.logger.log("Computing CRC from source %s" % crc_source)
+                self.logger.log('Computing CRC from source %s' % crc_source)
 
                 # Set the CRC source and acquire 10 CRC values. Discard the
                 # first value, as the device is running and the new source
@@ -204,7 +204,7 @@ class CRCTest(kmstest.KMSTest):
                 crc_reader.stop()
 
                 crcs = [c.crcs[0] for c in crcs[1:]]
-                self.logger.log("CRC value[0] 0x%08x" % crcs[0])
+                self.logger.log('CRC value[0] 0x%08x' % crcs[0])
 
                 failures = 0
                 ref_crc = composer.crc(source)
@@ -212,12 +212,12 @@ class CRCTest(kmstest.KMSTest):
                 for i in range(len(crcs)):
                     crc = crcs[i]
                     if crc != ref_crc:
-                        self.logger.log("CRC value[%u] 0x%08x does not match reference 0x%08x"
+                        self.logger.log('CRC value[%u] 0x%08x does not match reference 0x%08x'
                                         % (i, crc, ref_crc))
                         failures += 1
 
                 if failures:
-                    self.fail("Incorrect CRC values on source %s" % crc_source)
+                    self.fail('Incorrect CRC values on source %s' % crc_source)
                     break
 
             else:
diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index 86f16511f1ea..ce849437b2fa 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -10,12 +10,12 @@ class FormatsTest(kmstest.KMSTest):
     """Test all available plane formats."""
 
     def main(self):
-        self.start("plane formats")
+        self.start('plane formats')
 
         # Find a CRTC with a connected connector and at least one plane
         for connector in self.output_connectors():
             if not connector.connected():
-                self.skip("unconnected connector")
+                self.skip('unconnected connector')
                 continue
 
             try:
@@ -34,10 +34,10 @@ class FormatsTest(kmstest.KMSTest):
                 break
 
         else:
-            self.skip("no CRTC available with connector")
+            self.skip('no CRTC available with connector')
             return
 
-        self.logger.log("Testing connector %s, CRTC %u, mode %s" % \
+        self.logger.log('Testing connector %s, CRTC %u, mode %s' % \
               (connector.fullname, crtc.id, mode.name))
 
         failed = 0
@@ -46,14 +46,14 @@ class FormatsTest(kmstest.KMSTest):
         for i in range(num_formats):
             format = crtc.primary_plane.formats[i]
 
-            self.logger.log("Testing format %s" % format)
+            self.logger.log('Testing format %s' % format)
             self.progress(i+1, num_formats)
 
             # Create a frame buffer
             try:
                 fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, format)
             except ValueError:
-                self.logger.log("Failed to create frame buffer")
+                self.logger.log('Failed to create frame buffer')
                 failed += 1
                 continue
 
@@ -62,7 +62,7 @@ class FormatsTest(kmstest.KMSTest):
             # Set the mode with a primary plane
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
             if ret < 0:
-                self.logger.log("atomic mode set failed with %d" % ret)
+                self.logger.log('atomic mode set failed with %d' % ret)
                 failed += 1
                 continue
 
@@ -71,7 +71,7 @@ class FormatsTest(kmstest.KMSTest):
         self.atomic_crtc_disable(crtc)
 
         if failed:
-            self.fail("%s/%s formats failed" % (failed, num_formats))
+            self.fail('%s/%s formats failed' % (failed, num_formats))
         else:
             self.success()
 
diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
index 4b5605345391..f856178172c0 100755
--- a/tests/kms-test-legacy-modeset.py
+++ b/tests/kms-test-legacy-modeset.py
@@ -9,15 +9,15 @@ class LegacyModeSetTest(kmstest.KMSTest):
     """Test mode setting on all connectors in sequence with the default mode through the legacy mode set API."""
 
     def handle_page_flip(self, frame, time):
-        self.logger.log("Page flip complete")
+        self.logger.log('Page flip complete')
 
     def main(self):
         for connector in self.output_connectors():
-            self.start("legacy mode set on connector %s" % connector.fullname)
+            self.start('legacy mode set on connector %s' % connector.fullname)
 
             # Skip disconnected connectors
             if not connector.connected():
-                self.skip("unconnected connector")
+                self.skip('unconnected connector')
                 continue
 
             # Find a CRTC suitable for the connector
@@ -33,28 +33,28 @@ class LegacyModeSetTest(kmstest.KMSTest):
             try:
                 mode = connector.get_default_mode()
             except ValueError:
-                self.skip("no mode available")
+                self.skip('no mode available')
                 continue
 
-            self.logger.log("Testing connector %s on CRTC %u with mode %s" % \
+            self.logger.log('Testing connector %s on CRTC %u with mode %s' % \
                   (connector.fullname, crtc.id, mode.name))
 
             # Create a frame buffer
-            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
+            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
             pykms.draw_test_pattern(fb)
 
             # Perform a mode set
             ret = crtc.set_mode(connector, fb, mode)
             if ret < 0:
-                self.fail("legacy mode set failed with %d" % ret)
+                self.fail('legacy mode set failed with %d' % ret)
                 continue
 
-            self.logger.log("Legacy mode set complete")
+            self.logger.log('Legacy mode set complete')
             self.run(5)
 
             ret = crtc.disable_mode()
             if ret < 0:
-                self.fail("legacy mode set disable failed with %d" % ret)
+                self.fail('legacy mode set disable failed with %d' % ret)
                 continue
 
             self.success()
diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
index b298a19beedf..433bb0bdd157 100755
--- a/tests/kms-test-modes.py
+++ b/tests/kms-test-modes.py
@@ -9,35 +9,35 @@ class ModesTest(kmstest.KMSTest):
     """Test all available modes on all available connectors."""
 
     def handle_page_flip(self, frame, time):
-        self.logger.log("Page flip complete")
+        self.logger.log('Page flip complete')
 
     def test_mode(self, connector, crtc, mode):
-        self.logger.log("Testing connector %s on CRTC %u with mode %s" % \
+        self.logger.log('Testing connector %s on CRTC %u with mode %s' % \
               (connector.fullname, crtc.id, mode.name))
 
         # Create a frame buffer
-        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
+        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
         pykms.draw_test_pattern(fb)
 
         # Perform the mode set
         ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
         if ret < 0:
-            raise RuntimeError("atomic mode set failed with %d" % ret)
+            raise RuntimeError('atomic mode set failed with %d' % ret)
 
-        self.logger.log("Atomic mode set complete")
+        self.logger.log('Atomic mode set complete')
         self.run(4)
         self.atomic_crtc_disable(crtc)
 
         if self.flips == 0:
-            raise RuntimeError("Page flip not registered")
+            raise RuntimeError('Page flip not registered')
 
     def main(self):
         for connector in self.output_connectors():
-            self.start("modes on connector %s" % connector.fullname)
+            self.start('modes on connector %s' % connector.fullname)
 
             # Skip disconnected connectors
             if not connector.connected():
-                self.skip("unconnected connector")
+                self.skip('unconnected connector')
                 continue
 
             # Find a CRTC suitable for the connector
@@ -52,7 +52,7 @@ class ModesTest(kmstest.KMSTest):
             # Test all available modes
             modes = connector.get_modes()
             if len(modes) == 0:
-                self.skip("no mode available")
+                self.skip('no mode available')
                 continue
 
             for i in range(len(modes)):
diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
index 0dbe67fb2a4f..a6ba61c920e5 100755
--- a/tests/kms-test-modeset.py
+++ b/tests/kms-test-modeset.py
@@ -9,15 +9,15 @@ class ModeSetTest(kmstest.KMSTest):
     """Test mode setting on all connectors in sequence with the default mode."""
 
     def handle_page_flip(self, frame, time):
-        self.logger.log("Page flip complete")
+        self.logger.log('Page flip complete')
 
     def main(self):
         for connector in self.output_connectors():
-            self.start("atomic mode set on connector %s" % connector.fullname)
+            self.start('atomic mode set on connector %s' % connector.fullname)
 
             # Skip disconnected connectors
             if not connector.connected():
-                self.skip("unconnected connector")
+                self.skip('unconnected connector')
                 continue
 
             # Find a CRTC suitable for the connector
@@ -33,28 +33,28 @@ class ModeSetTest(kmstest.KMSTest):
             try:
                 mode = connector.get_default_mode()
             except ValueError:
-                self.skip("no mode available")
+                self.skip('no mode available')
                 continue
 
-            self.logger.log("Testing connector %s on CRTC %u with mode %s" % \
+            self.logger.log('Testing connector %s on CRTC %u with mode %s' % \
                   (connector.fullname, crtc.id, mode.name))
 
             # Create a frame buffer
-            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
+            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
             pykms.draw_test_pattern(fb)
 
             # Perform a mode set
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
             if ret < 0:
-                self.fail("atomic mode set failed with %d" % ret)
+                self.fail('atomic mode set failed with %d' % ret)
                 continue
 
-            self.logger.log("Atomic mode set complete")
+            self.logger.log('Atomic mode set complete')
             self.run(5)
             self.atomic_crtc_disable(crtc)
 
             if self.flips == 0:
-                self.fail("Page flip not registered")
+                self.fail('Page flip not registered')
             else:
                 self.success()
 
diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
index 19c3adaa601f..15dae6a23ab3 100755
--- a/tests/kms-test-pageflip.py
+++ b/tests/kms-test-pageflip.py
@@ -13,12 +13,12 @@ class PageFlipTest(kmstest.KMSTest):
 
     def handle_page_flip(self, frame, time):
         if self.flips == 1:
-            self.logger.log("first page flip frame %u time %f" % (frame, time))
+            self.logger.log('first page flip frame %u time %f' % (frame, time))
             self.frame_start = frame
             self.time_start = time
 
         if self.stop_requested:
-            self.logger.log("last page flip frame %u time %f" % (frame, time))
+            self.logger.log('last page flip frame %u time %f' % (frame, time))
             self.frame_end = frame
             self.time_end = time
             self.loop.stop()
@@ -43,11 +43,11 @@ class PageFlipTest(kmstest.KMSTest):
 
     def main(self):
         for connector in self.output_connectors():
-            self.start("page flip on connector %s" % connector.fullname)
+            self.start('page flip on connector %s' % connector.fullname)
 
             # Skip disconnected connectors
             if not connector.connected():
-                self.skip("unconnected connector")
+                self.skip('unconnected connector')
                 continue
 
             # Find a CRTC suitable for the connector
@@ -67,28 +67,28 @@ class PageFlipTest(kmstest.KMSTest):
                     self.plane = plane
                     break
             else:
-                self.skip("no plane available for CRTC %u" % crtc.id)
+                self.skip('no plane available for CRTC %u' % crtc.id)
                 continue
 
             # Get the default mode for the connector
             try:
                 mode = connector.get_default_mode()
             except ValueError:
-                self.skip("no mode available")
+                self.skip('no mode available')
                 continue
 
-            self.logger.log("Testing connector %s, CRTC %u, plane %u, mode %s" % \
+            self.logger.log('Testing connector %s, CRTC %u, plane %u, mode %s' % \
                   (connector.fullname, crtc.id, self.plane.id, mode.name))
 
             # Create two frame buffers
             self.fbs = []
             for i in range(2):
-                self.fbs.append(pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24"))
+                self.fbs.append(pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24'))
 
             # Set the mode and perform the initial page flip
             ret = self.atomic_crtc_mode_set(crtc, connector, mode, self.fbs[0])
             if ret < 0:
-                self.fail("atomic mode set failed with %d" % ret)
+                self.fail('atomic mode set failed with %d' % ret)
                 continue
 
             # Flip pages for 10s
@@ -105,16 +105,16 @@ class PageFlipTest(kmstest.KMSTest):
             self.atomic_crtc_disable(crtc)
 
             if not self.flips:
-                self.fail("No page flip registered")
+                self.fail('No page flip registered')
                 continue
 
             if self.stop_requested:
-                self.fail("Last page flip not registered")
+                self.fail('Last page flip not registered')
                 continue
 
             frames = self.frame_end - self.frame_start + 1
             interval = self.time_end - self.time_start
-            self.logger.log("Frame rate: %f (%u/%u frames in %f s)" % \
+            self.logger.log('Frame rate: %f (%u/%u frames in %f s)' % \
                 (frames / interval, self.flips, frames, interval))
             self.success()
 
diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-planeposition.py
index 0381896f1da8..e843ae13c50c 100755
--- a/tests/kms-test-planeposition.py
+++ b/tests/kms-test-planeposition.py
@@ -10,12 +10,12 @@ class PlanePositionTest(kmstest.KMSTest):
     """Test boundaries of plane positioning."""
 
     def main(self):
-        self.start("plane positioning boundaries")
+        self.start('plane positioning boundaries')
 
         # Find a CRTC with a connected connector and at least two planes
         for connector in self.output_connectors():
             if not connector.connected():
-                self.skip("unconnected connector")
+                self.skip('unconnected connector')
                 continue
 
             try:
@@ -39,23 +39,23 @@ class PlanePositionTest(kmstest.KMSTest):
                 break
 
         else:
-            self.skip("no CRTC available with connector and at least two planes")
+            self.skip('no CRTC available with connector and at least two planes')
             return
 
-        self.logger.log("Testing connector %s, CRTC %u, mode %s with %u planes" % \
+        self.logger.log('Testing connector %s, CRTC %u, mode %s with %u planes' % \
               (connector.fullname, crtc.id, mode.name, len(planes)))
 
         # Create a frame buffer
-        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, "XR24")
+        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
         pykms.draw_test_pattern(fb)
 
         # Set the mode with no plane, wait 5s for the monitor to wake up
         ret = self.atomic_crtc_mode_set(crtc, connector, mode, sync=True)
         if ret < 0:
-            self.fail("atomic mode set failed with %d" % ret)
+            self.fail('atomic mode set failed with %d' % ret)
             return
 
-        self.logger.log("Initial atomic mode set completed")
+        self.logger.log('Initial atomic mode set completed')
         time.sleep(5)
 
         # Add the first plane to cover half of the CRTC
@@ -63,10 +63,10 @@ class PlanePositionTest(kmstest.KMSTest):
         destination = kmstest.Rect(0, 0, fb.width // 2, fb.height)
         ret = self.atomic_plane_set(planes[0], crtc, source, destination, fb, sync=True)
         if ret < 0:
-            self.fail("atomic plane set for first plane failed with %d" % ret)
+            self.fail('atomic plane set for first plane failed with %d' % ret)
             return
 
-        self.logger.log("Root plane enabled")
+        self.logger.log('Root plane enabled')
         time.sleep(3)
 
         # Add the second plane and move it around to cross all CRTC boundaries
@@ -79,10 +79,10 @@ class PlanePositionTest(kmstest.KMSTest):
 
             ret = self.atomic_plane_set(planes[1], crtc, source, destination, fb, sync=True)
             if ret < 0:
-                self.fail("atomic plane set with offset %d,%d" % offset)
+                self.fail('atomic plane set with offset %d,%d' % offset)
                 return
 
-            self.logger.log("Moved overlay plane to %d,%d" % offset)
+            self.logger.log('Moved overlay plane to %d,%d' % offset)
             time.sleep(3)
 
         # Try to move the plane completely off-screen. The device is expected
@@ -97,17 +97,17 @@ class PlanePositionTest(kmstest.KMSTest):
 
             ret = self.atomic_plane_set(planes[1], crtc, source, destination, fb, sync=True)
             if ret < 0:
-                self.fail("atomic plane set with offset %d,%d" % offset)
+                self.fail('atomic plane set with offset %d,%d' % offset)
                 return
 
-            self.logger.log("Moved overlay plane to %d,%d" % offset)
+            self.logger.log('Moved overlay plane to %d,%d' % offset)
             time.sleep(3)
 
         # Disable and re-enable the plane when it is off-screen. The device is
         # still expected to handle this gracefully.
         ret = self.atomic_plane_disable(planes[1])
         if ret < 0:
-            self.fail("off-screen atomic plane disable failed")
+            self.fail('off-screen atomic plane disable failed')
             return
 
         width = fb.width - 100
@@ -117,7 +117,7 @@ class PlanePositionTest(kmstest.KMSTest):
 
         ret = self.atomic_plane_set(planes[1], crtc, source, destination, fb, sync=True)
         if ret < 0:
-            self.fail("off-scrren atomic plane enable failed")
+            self.fail('off-scrren atomic plane enable failed')
             return
 
         self.atomic_crtc_disable(crtc)
diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
index 806adb8c68a8..69f8be127d2f 100755
--- a/tests/kms-test-routing.py
+++ b/tests/kms-test-routing.py
@@ -49,7 +49,7 @@ class RoutingTest(kmstest.KMSTest):
                 break
 
         if not shared_connector:
-            self.skip("No suitable connector")
+            self.skip('No suitable connector')
             return
 
         # Allocate planes for each CRTC.
@@ -61,13 +61,13 @@ class RoutingTest(kmstest.KMSTest):
             pool = [(elem[0], [p for p in elem[1] if p != pipe.plane]) for elem in pool[:-1]]
 
         # Create a framebuffer big enough for all connectors.
-        fb = pykms.DumbFramebuffer(self.card, max_hdisplay, max_vdisplay, "XR24")
+        fb = pykms.DumbFramebuffer(self.card, max_hdisplay, max_vdisplay, 'XR24')
         pykms.draw_test_pattern(fb)
 
-        self.start("Moving connector %s between CRTCs %s" % \
+        self.start('Moving connector %s between CRTCs %s' % \
                    (shared_connector.fullname, [pipe.crtc.id for pipe in pipes]))
 
-        self.logger.log("Highest display resolution: %ux%u" % (max_hdisplay, max_vdisplay))
+        self.logger.log('Highest display resolution: %ux%u' % (max_hdisplay, max_vdisplay))
 
         for master_pipe in pipes:
             req = kmstest.AtomicRequest(self)
@@ -97,13 +97,13 @@ class RoutingTest(kmstest.KMSTest):
                             'CRTC_H': mode.vdisplay,
                         })
 
-                route.append("CRTC %u to connector %s" % (pipe.crtc.id, pipe.connector.fullname))
+                route.append('CRTC %u to connector %s' % (pipe.crtc.id, pipe.connector.fullname))
 
-            self.logger.log("Routing " + ", ".join(route))
+            self.logger.log('Routing ' + ', '.join(route))
 
             ret = req.commit_sync(True)
             if ret < 0:
-                self.fail("atomic commit failed with %d" % ret)
+                self.fail('atomic commit failed with %d' % ret)
                 return
 
             time.sleep(5)
diff --git a/tests/kmstest.py b/tests/kmstest.py
index 949bb20b8b1a..708e6999d1f0 100755
--- a/tests/kmstest.py
+++ b/tests/kmstest.py
@@ -63,23 +63,23 @@ class EventLoop(selectors.DefaultSelector):
 
 class KernelLogMessage(object):
     def __init__(self, msg):
-        pos = msg.find(";")
+        pos = msg.find(';')
         header = msg[:pos]
         msg = msg[pos+1:]
 
-        facility, sequence, timestamp, *other = header.split(",")
+        facility, sequence, timestamp, *other = header.split(',')
         self.facility = int(facility)
         self.sequence = int(sequence)
         self.timestamp = int(timestamp) / 1000000.
 
-        msg = msg.split("\n")
+        msg = msg.split('\n')
         self.msg = msg[0]
         self.tags = {}
 
         try:
             tags = msg[1:-1]
             for tag in tags:
-                tag = tag.strip().split("=")
+                tag = tag.strip().split('=')
                 self.tags[tag[0]] = tag[1]
         except:
             pass
@@ -87,7 +87,7 @@ class KernelLogMessage(object):
 
 class KernelLogReader(object):
     def __init__(self):
-        self.kmsg = os.open("/dev/kmsg", 0)
+        self.kmsg = os.open('/dev/kmsg', 0)
         flags = fcntl.fcntl(self.kmsg, fcntl.F_GETFL)
         fcntl.fcntl(self.kmsg, fcntl.F_SETFL, flags | os.O_NONBLOCK)
         os.lseek(self.kmsg, 0, os.SEEK_END)
@@ -100,7 +100,7 @@ class KernelLogReader(object):
         while True:
             try:
                 msg = os.read(self.kmsg, 8191)
-                msg = msg.decode("utf-8")
+                msg = msg.decode('utf-8')
             except OSError as e:
                 if e.errno == errno.EAGAIN:
                     break
@@ -113,7 +113,7 @@ class KernelLogReader(object):
 
 class Logger(object):
     def __init__(self, name):
-        self.logfile = open("%s.log" % name, "w")
+        self.logfile = open('%s.log' % name, 'w')
         self._kmsg = KernelLogReader()
 
     def __del__(self):
@@ -129,7 +129,7 @@ class Logger(object):
     def event(self):
         kmsgs = self._kmsg.read()
         for msg in kmsgs:
-            self.logfile.write("K [%6f] %s\n" % (msg.timestamp, msg.msg))
+            self.logfile.write('K [%6f] %s\n' % (msg.timestamp, msg.msg))
         self.logfile.flush()
 
     @property
@@ -146,13 +146,13 @@ class Logger(object):
         self.event()
 
         now = time.clock_gettime(time.CLOCK_MONOTONIC)
-        self.logfile.write("U [%6f] %s\n" % (now, msg))
+        self.logfile.write('U [%6f] %s\n' % (now, msg))
         self.logfile.flush()
 
 
 class CRC(object):
     def __init__(self, crc):
-        if crc.startswith("XXXXXXXXXX"):
+        if crc.startswith('XXXXXXXXXX'):
             self.frame = None
         else:
             self.frame = int(crc[:10], 16)
@@ -171,8 +171,8 @@ class CRCReader(object):
 
         # Hardcode the device minor to 0 as the KMSTest constructor opens the
         # default card object.
-        self.dir = os.open("/sys/kernel/debug/dri/0/crtc-%u/crc" % self.pipe, 0)
-        self.ctrl = os.open("control", os.O_WRONLY, dir_fd = self.dir)
+        self.dir = os.open('/sys/kernel/debug/dri/0/crtc-%u/crc' % self.pipe, 0)
+        self.ctrl = os.open('control', os.O_WRONLY, dir_fd = self.dir)
         self.data = -1
 
     def __del__(self):
@@ -181,8 +181,8 @@ class CRCReader(object):
         os.close(self.dir)
 
     def start(self, source):
-        os.write(self.ctrl, source.encode("ascii"))
-        self.data = os.open("data", os.O_RDONLY, dir_fd = self.dir)
+        os.write(self.ctrl, source.encode('ascii'))
+        self.data = os.open('data', os.O_RDONLY, dir_fd = self.dir)
 
     def stop(self):
         if self.data != -1:
@@ -194,7 +194,7 @@ class CRCReader(object):
         while len(crcs) < num_entries:
             try:
                 crc = os.read(self.data, CRCReader.MAX_LINE_LEN)
-                crc = crc.decode("ascii")
+                crc = crc.decode('ascii')
             except OSError as e:
                 if e.errno == errno.EAGAIN:
                     break
@@ -211,7 +211,7 @@ class Dist(object):
         self.y = y
 
     def __repr__(self):
-        return "(%d,%d)" % (self.x, self.y)
+        return '(%d,%d)' % (self.x, self.y)
 
 
 class Point(object):
@@ -220,7 +220,7 @@ class Point(object):
         self.y = y
 
     def __repr__(self):
-        return "(%d,%d)" % (self.x, self.y)
+        return '(%d,%d)' % (self.x, self.y)
 
     def move(self, distance):
         self.x += distance.x
@@ -233,7 +233,7 @@ class Size(object):
         self.height = height
 
     def __repr__(self):
-        return "%ux%u" % (self.width, self.height)
+        return '%ux%u' % (self.width, self.height)
 
 
 class Rect(object):
@@ -244,7 +244,7 @@ class Rect(object):
         self.height = height
 
     def __repr__(self):
-        return "(%d,%d)/%ux%u" % (self.left, self.top, self.width, self.height)
+        return '(%d,%d)/%ux%u' % (self.left, self.top, self.width, self.height)
 
     def isEmpty(self):
         """Check if the rectangle has a zero width or height"""
@@ -387,7 +387,7 @@ class KMSTest(object):
 
     def atomic_plane_disable(self, plane, sync=True):
         req = AtomicRequest(self)
-        req.add(plane, { "FB_ID": 0, 'CRTC_ID': 0 })
+        req.add(plane, { 'FB_ID': 0, 'CRTC_ID': 0 })
 
         if sync:
             return req.commit_sync()
@@ -397,7 +397,7 @@ class KMSTest(object):
     def atomic_planes_disable(self, sync=True):
         req = AtomicRequest(self)
         for plane in self.card.planes:
-            req.add(plane, { "FB_ID": 0, 'CRTC_ID': 0 })
+            req.add(plane, { 'FB_ID': 0, 'CRTC_ID': 0 })
 
         if sync:
             return req.commit_sync()
@@ -462,32 +462,32 @@ class KMSTest(object):
     def start(self, name):
         """Start a test."""
         self.test_name = name
-        self.logger.log("Testing %s" % name)
-        sys.stdout.write("Testing %s: " % name)
+        self.logger.log('Testing %s' % name)
+        sys.stdout.write('Testing %s: ' % name)
         sys.stdout.flush()
 
     def progress(self, current, maximum):
-        sys.stdout.write("\rTesting %s: %u/%u" % (self.test_name, current, maximum))
+        sys.stdout.write('\rTesting %s: %u/%u' % (self.test_name, current, maximum))
         sys.stdout.flush()
 
     def fail(self, reason):
         """Complete a test with failure."""
-        self.logger.log("Test failed. Reason: %s" % reason)
+        self.logger.log('Test failed. Reason: %s' % reason)
         self.logger.flush()
-        sys.stdout.write("\rTesting %s: FAIL\n" % self.test_name)
+        sys.stdout.write('\rTesting %s: FAIL\n' % self.test_name)
         sys.stdout.flush()
 
     def skip(self, reason):
         """Complete a test with skip."""
-        self.logger.log("Test skipped. Reason: %s" % reason)
+        self.logger.log('Test skipped. Reason: %s' % reason)
         self.logger.flush()
-        sys.stdout.write("SKIP\n")
+        sys.stdout.write('SKIP\n')
         sys.stdout.flush()
 
     def success(self):
         """Complete a test with success."""
-        self.logger.log("Test completed successfully")
+        self.logger.log('Test completed successfully')
         self.logger.flush()
-        sys.stdout.write("\rTesting %s: SUCCESS\n" % self.test_name)
+        sys.stdout.write('\rTesting %s: SUCCESS\n' % self.test_name)
         sys.stdout.flush()
 
-- 
Regards,

Laurent Pinchart

