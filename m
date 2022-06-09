Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 975115458B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jun 2022 01:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242061AbiFIXk7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jun 2022 19:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236565AbiFIXk6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 19:40:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5017D20C269
        for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jun 2022 16:40:57 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A74CE1216;
        Fri, 10 Jun 2022 01:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1654818044;
        bh=4yMpGEuYbH9R1/430vPFqmXftGTmhfQQapp04NxJgp0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gp2up5DVN6dSQNSHmQ66akXQEJaACExVNmeO3K9uZKMZRpqQkoaGyPPZOlOQo70JA
         7IY46uO5tg3IfGraHi/vKCxNffVSUgDYTRglBDJ4cOmeodtcDsEIErDgtWPBHvH0ec
         0b72kLhQlpltMcefxZjXKeSCg5ZX67DWM8kyNuHk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 07/10] tests: Add plane alpha test
Date:   Fri, 10 Jun 2022 02:40:28 +0300
Message-Id: <20220609234031.14803-8-laurent.pinchart@ideasonboard.com>
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

Add a test that enables multiple planes with different alpha values.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-plane-alpha.py | 97 +++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100755 tests/kms-test-plane-alpha.py

diff --git a/tests/kms-test-plane-alpha.py b/tests/kms-test-plane-alpha.py
new file mode 100755
index 000000000000..8802bfeae40c
--- /dev/null
+++ b/tests/kms-test-plane-alpha.py
@@ -0,0 +1,97 @@
+#!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Renesas Electronics Corporation
+
+import kmstest
+import pykms
+
+class PlaneAlphaTest(kmstest.KMSTest):
+    """Test composition with multiple planes and alpha channels."""
+
+    def handle_page_flip(self, frame, time):
+        self.logger.log('Page flip complete')
+
+    def find_pipeline(self):
+        # Find a CRTC that has multiple planes with a connected connector
+        for connector in self.output_connectors():
+            # Skip disconnected connectors
+            if not connector.connected():
+                continue
+
+            # Add the connector to the map
+            for crtc in connector.get_possible_crtcs():
+                planes = []
+                for plane in self.card.planes:
+                    if plane.supports_crtc(crtc) and plane != crtc.primary_plane:
+                        planes.append(plane)
+
+                if len(planes):
+                    return crtc, connector, planes
+
+        return None, None, None
+
+    def main(self):
+        self.start('composition with alpha control')
+
+        crtc, connector, planes = self.find_pipeline()
+        if crtc is None:
+            self.skip('no suitable pipeline')
+            return
+
+        # Get the default mode
+        try:
+            mode = connector.get_default_mode()
+        except KeyError:
+            self.skip('no mode available')
+            return
+
+        self.logger.log(f'Testing connector {connector.fullname}, CRTC {crtc.id}, '
+                        f'mode {mode.name} with {len(planes)} planes '
+                        f'(P: {crtc.primary_plane.id}, O: {[plane.id for plane in planes]})')
+
+        # Create a frame buffer
+        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+        pykms.draw_test_pattern(fb)
+
+        # Set the mode with a primary plane
+        ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
+        if ret < 0:
+            self.fail(f'atomic mode set failed with {ret}')
+            return
+
+        req = kmstest.AtomicRequest(self)
+        req.add(crtc.primary_plane, 'alpha', '50%')
+        ret = req.commit_sync(True)
+        if ret < 0:
+            self.fail(f'failed to set alpha for primary plane: {ret}')
+            return
+
+        self.run(3)
+
+        # Add all other planes one by one
+        alpha = 20
+        offset = 100
+        for plane in planes:
+            source = kmstest.Rect(0, 0, fb.width, fb.height)
+            destination = kmstest.Rect(offset, offset, fb.width, fb.height)
+            ret = self.atomic_plane_set(plane, crtc, source, destination, fb, alpha=f'{alpha}%')
+            if ret < 0:
+                self.fail(f'atomic plane set failed with {ret}')
+                break
+
+            self.logger.log(f'Adding plane {plane.id}')
+            self.run(1)
+
+            if self.flips == 0:
+                self.fail('No page flip registered')
+                break
+
+            alpha = min(alpha + 20, 100)
+            offset += 50
+
+        else:
+            self.success()
+
+        self.atomic_crtc_disable(crtc)
+
+PlaneAlphaTest().execute()
-- 
Regards,

Laurent Pinchart

