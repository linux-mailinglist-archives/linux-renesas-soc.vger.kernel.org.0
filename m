Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAEBA4775F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 01:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbfFPXmQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 Jun 2019 19:42:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42252 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfFPXmP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Jun 2019 19:42:15 -0400
Received: from pendragon.bb.dnainternet.fi (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A1F42AF;
        Mon, 17 Jun 2019 01:42:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560728533;
        bh=YMkiG+EpEa2A3PGxePbCvv91O2TY0+3+zkwyeOJDa8o=;
        h=From:To:Cc:Subject:Date:From;
        b=WYW4+q7I4fDvoVsxQZVUdjZFL2lbLmPKdx9wlsaM1GoaYgOdq/NqsHpOUj/tgl+Ra
         he078z6mVyedTw2WbUVDsQR9+tPh4bA3cwBDX3s89s6Ddj6bTM2HNeyaqpKJC4wJO1
         KswC0xax+b4OLnf8u/Hg8kgVVDmbRVzK7OLMSHNo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-tests] [PATCH] tests: Add a plane formats test
Date:   Mon, 17 Jun 2019 02:41:53 +0300
Message-Id: <20190616234153.26423-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a new test script that tests all formats supported by planes.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-formats.py | 63 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100755 tests/kms-test-formats.py

diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
new file mode 100755
index 000000000000..ae89bb542485
--- /dev/null
+++ b/tests/kms-test-formats.py
@@ -0,0 +1,63 @@
+#!/usr/bin/python3
+
+import kmstest
+import pykms
+import time
+
+class FormatsTest(kmstest.KMSTest):
+    """Test all available plane formats."""
+
+    def main(self):
+        self.start("plane formats")
+
+        # Find a CRTC with a connected connector and at least one plane
+        for connector in self.card.connectors:
+            if not connector.connected():
+                self.skip("unconnected connector")
+                continue
+
+            try:
+                mode = connector.get_default_mode()
+            except ValueError:
+                continue
+
+            crtcs = connector.get_possible_crtcs()
+            for crtc in crtcs:
+                if crtc.primary_plane:
+                    break
+            else:
+                crtc = None
+
+            if crtc:
+                break
+
+        else:
+            self.skip("no CRTC available with connector")
+            return
+
+        self.logger.log("Testing connector %s, CRTC %u, mode %s" % \
+              (connector.fullname, crtc.id, mode.name))
+
+        for format in crtc.primary_plane.formats:
+            self.logger.log("Testing format %s" % format)
+
+            # Create a frame buffer
+            try:
+                fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, format)
+            except ValueError:
+                continue
+
+            pykms.draw_test_pattern(fb)
+
+            # Set the mode with a primary plane
+            ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
+            if ret < 0:
+                self.fail("atomic mode set failed with %d" % ret)
+                continue
+
+            self.run(3)
+
+        self.atomic_crtc_disable(crtc)
+        self.success()
+
+FormatsTest().execute()
-- 
Regards,

Laurent Pinchart

