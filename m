Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208FF564BF3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jul 2022 04:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbiGDC4o (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 Jul 2022 22:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbiGDC4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 22:56:43 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABE6655E
        for <linux-renesas-soc@vger.kernel.org>; Sun,  3 Jul 2022 19:56:42 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s206so7748809pgs.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 03 Jul 2022 19:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hhR2OO41kJju+oN9PmVAaqGCxDEVm8pAIS3QISH9Qcc=;
        b=7y+40b1BBrE8AngAXmEtMgHHaDCG8MxnJQUxd9OtilOhbsNnX8VCK+a2pMAOhVK555
         jNBYVuS4+WCntB8HzmsyPmOumN3NmFgGwyKjOeXdeNwhhYC3Se134mp8n+baMm8kDhZj
         yUddCWlTtgxjX6mkiE6LIDpXyKy5tttdaZa5uLUMeLmVFDylsfxnmaSQd5alGSODh78l
         VydHp/KJder9zbvQj7vmNKjfgsRKNVtSNmoD9p4BIFZ4UUsmBZ5hkqVh/V8c1cqrlvOs
         RWhnO9R+Ch1ZgHMZveySCHIEKT+rVXN5CF/22HMsz+quoGFQB2ZIfKRsUjpdy+pqKBpI
         HJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hhR2OO41kJju+oN9PmVAaqGCxDEVm8pAIS3QISH9Qcc=;
        b=Pc03UMpr0suc25QveQIayIS4RE50bOjP2tbLQNKkECCBLe75iEoGee+v2MjJYy4oBq
         RDC3C0XTzv9bEPPtvsOiYXWG7yuDUvEPwUi7PY7k5pIjM18IzBgbemltzorxJLXZylNc
         oLo+SwP2VxUFuY7PjSu+/2qWTsvKeLbOw4uHCy4tusWFukCmu9igYWlsZTP7Ohn2C328
         xaSYM3L1/nkItVOsnnpngxyWsVPD083T3plyjvXe8kTuOJE7pZYrE5Di8YyE1RBkOt39
         sqO1Uyz9EG2f0rFD2TyvNHzhBM/I73kuFiOKytwS+AhoMC1aNxbnHfispVWbdJ7ITSQN
         O6MQ==
X-Gm-Message-State: AJIora/XOuKhYd/SMym9tSasgRw5eew79TCw44v4YbYQMlSFEjTpsNmG
        s+wkhZbi0Q7DUrgUJJZ9cU90ytFOo1bF0pKs
X-Google-Smtp-Source: AGRyM1tOrLfUKGsyt5h4BKnuCBj42rY/kr35AODivlkEh99N8oIX2w14CgEOIPsIJUQljJlIQ6DYzA==
X-Received: by 2002:a62:fb02:0:b0:528:6697:eaaf with SMTP id x2-20020a62fb02000000b005286697eaafmr3765399pfm.75.1656903401492;
        Sun, 03 Jul 2022 19:56:41 -0700 (PDT)
Received: from taki-u2.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902f78a00b0016b80d2fac8sm14283887pln.248.2022.07.03.19.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 19:56:41 -0700 (PDT)
From:   Takanari Hayama <taki@igel.co.jp>
To:     linux-renesas-soc@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com
Subject: [PATCH 3/3] tests: Add pixel blend mode test
Date:   Mon,  4 Jul 2022 11:56:32 +0900
Message-Id: <20220704025632.3911253-4-taki@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220704025632.3911253-1-taki@igel.co.jp>
References: <20220704025632.3911253-1-taki@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a test that blends a plane with different pixel blend modes.

Signed-off-by: Takanari Hayama <taki@igel.co.jp>
---
 tests/kms-test-plane-blendmode.py | 100 ++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100755 tests/kms-test-plane-blendmode.py

diff --git a/tests/kms-test-plane-blendmode.py b/tests/kms-test-plane-blendmode.py
new file mode 100755
index 000000000000..a9c009b74a8c
--- /dev/null
+++ b/tests/kms-test-plane-blendmode.py
@@ -0,0 +1,100 @@
+#!/usr/bin/python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# SPDX-FileCopyrightText: 2022 Renesas Electronics Corporation
+
+import kmstest
+import pykms
+
+class PlaneBlendModeTest(kmstest.KMSTest):
+    """Test composition in different blend modes."""
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
+        self.start('composition with blend modes')
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
+        # Create a primary plane
+        primary = pykms.DumbFramebuffer(self.card, mode.hdisplay, mode.vdisplay, 'XR24')
+        pykms.draw_test_pattern(primary)
+        #pykms.draw_rect(primary, 0, 0, mode.hdisplay, mode.vdisplay, pykms.RGB(0, 0, 255))
+
+        # Set the mode with a primary plane
+        ret = self.atomic_crtc_mode_set(crtc, connector, mode, primary)
+        if ret < 0:
+            self.fail(f'atomic mode set failed with {ret}')
+            return
+
+	# Create a overlay plane (half of the screen size)
+        fb = pykms.DumbFramebuffer(self.card, mode.hdisplay // 2, mode.vdisplay, 'AR24')
+        self.logger.log(f'Create fb: {fb} ({fb.width}x{fb.height})')
+        width = mode.hdisplay // 4
+        height = mode.vdisplay // 5
+        for n in range(0, 5):
+            v = 255 - 63 * n
+            pykms.draw_rect(fb, 0, height * n, width, height, pykms.RGB(v, 255, 255, 255))
+            pykms.draw_rect(fb, width, height * n, width, height, pykms.RGB(v, v, v, v))
+
+        self.run(3)
+
+        # Add all other planes one by one
+        source = kmstest.Rect(0, 0, fb.width, fb.height)
+        destination = kmstest.Rect(fb.width, 0, fb.width, fb.height)
+        alpha = '50%'
+        for blendmode in ('Pre-multiplied', 'Coverage', 'None'):
+            pykms.draw_text(fb, 10, 10, f'alpha={alpha}, mode={blendmode}          ', pykms.white)
+            ret = self.atomic_plane_set(planes[1], crtc, source, destination, fb, alpha=alpha, blendmode=blendmode)
+            if ret < 0:
+                self.fail(f'atomic plane set failed with {ret}')
+                break
+
+            self.logger.log(f'Adding plane {planes[1].id} with blendmode {blendmode}')
+            self.run(1)
+
+            if self.flips == 0:
+                self.fail('No page flip registered')
+                break
+
+            self.run(3)
+
+        else:
+            self.success()
+
+        self.atomic_crtc_disable(crtc)
+
+PlaneBlendModeTest().execute()
-- 
2.25.1

