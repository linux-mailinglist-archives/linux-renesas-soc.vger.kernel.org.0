Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E256223F42D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 23:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbgHGVUo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 17:20:44 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:48418 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbgHGVUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 17:20:43 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C2BB54E;
        Fri,  7 Aug 2020 23:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596835240;
        bh=N8IJt/J0da4yZPXqs3hnlzsc5M3Eeqm5Cq8V3ZEy+eE=;
        h=From:To:Cc:Subject:Date:From;
        b=ld890zqcowa05ooWOVCaG1A6pnE86hooFGhG7vfL5ltOC9rCpCm63hy1iHsjebndG
         nRSdXUNQkiXZzwExdiCtC+Yj1tMXeH6eynukpQ+forZV+gOO0GkVomacfeWmaG+c8X
         HgB2+xRiyG9HeiGUHIR2zVWJqQLRUxWnRhPV3iA0=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH] tests: planeposition: Test disabling and enabling off-screen planes
Date:   Sat,  8 Aug 2020 00:20:21 +0300
Message-Id: <20200807212021.24189-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a test to enable an off-screen plane, in addition to the existing
tests that move enabled planes on screen. This new test crashes the DU
driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-planeposition.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms-test-planeposition.py b/tests/kms-test-planeposition.py
index a7cc11113aa9..0381896f1da8 100755
--- a/tests/kms-test-planeposition.py
+++ b/tests/kms-test-planeposition.py
@@ -103,6 +103,23 @@ class PlanePositionTest(kmstest.KMSTest):
             self.logger.log("Moved overlay plane to %d,%d" % offset)
             time.sleep(3)
 
+        # Disable and re-enable the plane when it is off-screen. The device is
+        # still expected to handle this gracefully.
+        ret = self.atomic_plane_disable(planes[1])
+        if ret < 0:
+            self.fail("off-screen atomic plane disable failed")
+            return
+
+        width = fb.width - 100
+        height = fb.height - 100
+        source = kmstest.Rect(0, 0, width, height)
+        destination = kmstest.Rect(mode.hdisplay, 50, width, height)
+
+        ret = self.atomic_plane_set(planes[1], crtc, source, destination, fb, sync=True)
+        if ret < 0:
+            self.fail("off-scrren atomic plane enable failed")
+            return
+
         self.atomic_crtc_disable(crtc)
         self.success()
 
-- 
Regards,

Laurent Pinchart

