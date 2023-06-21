Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B26B737D8C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jun 2023 10:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjFUINK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Jun 2023 04:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjFUINJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Jun 2023 04:13:09 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84809FE
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jun 2023 01:13:07 -0700 (PDT)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC0E82DB9;
        Wed, 21 Jun 2023 10:12:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687335151;
        bh=6czCva9tkW+hPKR0RFzzEshdsOvxmVPRwRk7F/pGx/c=;
        h=From:To:Cc:Subject:Date:From;
        b=Sq6gHD7J8FZC3pydmzZ3QcJTmPyoVQfkHsV8t0WtVA9rscqz4vza22RebQD2dWbwY
         kkzNr9dPDi0wo7sGEi4D2eRltvw/44S4ZZ1mIX2pKB92GLHFS+PYHCWPx9PcnrpwAV
         1IhFKPKtadqqxB4Qen9JQkIbStvc2XJd/psPE/T4=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] test: Add CLU (3D LUT) test
Date:   Wed, 21 Jun 2023 10:12:50 +0200
Message-Id: <20230621081250.8098-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
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

Add a test to demonstrate usage of the CMM CLU 3-D LUT.

Program a blac&white 3-D LUT in the CLU and output a black&white
pattern.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 tests/kms-test-clu.py | 102 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100755 tests/kms-test-clu.py

diff --git a/tests/kms-test-clu.py b/tests/kms-test-clu.py
new file mode 100755
index 000000000000..3df647b00339
--- /dev/null
+++ b/tests/kms-test-clu.py
@@ -0,0 +1,102 @@
+#!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2023 Renesas Electronics Corporation
+
+import kmstest
+import pykms
+
+import numpy as np
+
+class CluTest(kmstest.KMSTest):
+    """ Test the CMM color management unit 3-D LUT (CLU) capabilities by
+    programming a black&white 3-D LUT and display a pattern """
+
+    clu_table = np.ndarray((17, 17, 17, 4), np.uint16)
+
+    def handle_page_flip(self, frame, time):
+        self.logger.log('Page flip complete')
+
+    def main(self):
+
+        # Program the black&white 3-D LUT: convert the [r, g, b] color
+        # components in YUV format and use the luma value only
+        for r in range(17):
+            for g in range(17):
+                for b in range(17):
+                    # Compute the luma value by applying a color conversion
+                    # matrix; also multiply each color component by 0xff as the
+                    # CLU divides the [0, 255] scale in 17 intervals: each CLU
+                    # increment is a 0xff increment in the color value
+                    y =  r * 0xff * 0.299 + + g * 0xff * 0.587 + b * 0xff * 0.114
+
+                    # Re-scale the luma value in 16 bits, as that's the
+                    # format used by DRM/KMS to represent colors (see
+                    # struct drm_color_lut)
+                    val = y * 0xffff / 0xff
+
+                    # Program r, g, b with the re-scaled luma value to get a
+                    # black&white output
+                    self.clu_table[r][g][b][0] = val
+                    self.clu_table[r][g][b][1] = val
+                    self.clu_table[r][g][b][2] = val
+
+        for connector in self.output_connectors():
+            self.start(f'atomic mode set on connector {connector.fullname}')
+
+            # Skip disconnected connectors
+            if not connector.connected():
+                self.skip('unconnected connector')
+                continue
+
+            # Find a CRTC suitable for the connector
+            crtc = connector.get_current_crtc()
+            if not crtc:
+                crtcs = connector.get_possible_crtcs()
+                if len(crtcs) == 0:
+                    pass
+
+                crtc = crtcs[0]
+
+            # Get the default mode for the connector
+            try:
+                mode = connector.get_default_mode()
+            except ValueError:
+                self.skip('no mode available')
+                continue
+
+            self.logger.log(f'Testing connector {connector.fullname} '
+                            f'on CRTC {crtc.id} with mode {mode.name}')
+
+            # Create a frame buffer and draw the usual (color) pattern
+            fb = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+            pykms.draw_test_pattern(fb)
+
+            # Perform a mode set
+            ret = self.atomic_crtc_mode_set(crtc, connector, mode, fb)
+            if ret < 0:
+                self.fail(f'atomic mode set failed with {ret}')
+                continue
+
+            # Configure the CLU by setting the LUT3D property
+            clu_blob = pykms.Blob(self.card, self.clu_table.flatten())
+            req = kmstest.AtomicRequest(self)
+            req.add(crtc.primary_plane, 'FB_ID', fb.id)
+            req.add(connector, 'CRTC_ID', crtc.id)
+            req.add(crtc, { 'ACTIVE': 1 , 'LUT3D': clu_blob.id })
+            ret = req.commit_sync(True)
+            if ret < 0:
+                self.fail(f'failed to set 3D LUT: {ret}')
+                continue
+
+            self.logger.log('Atomic mode set complete')
+            self.run(5)
+            self.atomic_crtc_disable(crtc)
+
+            if self.flips == 0:
+                self.fail('Page flip not registered')
+            else:
+                self.success()
+
+
+if __name__ == '__main__':
+    CluTest().execute()
--
2.40.1

