Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523D1585F78
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Jul 2022 17:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236334AbiGaPUo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 31 Jul 2022 11:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236805AbiGaPUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Jul 2022 11:20:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D48630C
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Jul 2022 08:20:42 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84D5C415;
        Sun, 31 Jul 2022 17:20:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659280840;
        bh=SCansLg4IFK/Xr/uTK3tz3Ye2NHxHbag80ujgoJT+Go=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TSPmOoX6Q1AePKB9wKF7Z7Gek//axhOhZvRfRE35cf7Z0FUIuDhShOAcPYuAbWIYz
         6iVrNR3uCqONFlbnX2KBWgaU0GgEib7YZwW+0xBODxEZxMF67bzzgCkgRVs2d88gdl
         hqNTYL5TH36kO2ZLfs42gC/JXUBFpsDkDjHMNUrk=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [kms-test] [PATCH 6/7] tests: Only call execute() if the test is run directly
Date:   Sun, 31 Jul 2022 18:20:23 +0300
Message-Id: <20220731152024.24090-7-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220731152024.24090-1-laurent.pinchart@ideasonboard.com>
References: <20220731152024.24090-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Only run a test automatically if the Python test script is executed
directly. This will allow importing tests as modules in a test runner.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 tests/kms-test-allplanes.py      | 4 +++-
 tests/kms-test-brxalloc.py       | 4 +++-
 tests/kms-test-connectors.py     | 3 ++-
 tests/kms-test-crc.py            | 4 +++-
 tests/kms-test-formats.py        | 4 +++-
 tests/kms-test-legacy-modeset.py | 4 +++-
 tests/kms-test-modes.py          | 4 +++-
 tests/kms-test-modeset.py        | 4 +++-
 tests/kms-test-pageflip.py       | 4 +++-
 tests/kms-test-plane-alpha.py    | 4 +++-
 tests/kms-test-plane-position.py | 4 +++-
 tests/kms-test-plane-zpos.py     | 4 +++-
 tests/kms-test-routing.py        | 3 ++-
 13 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/tests/kms-test-allplanes.py b/tests/kms-test-allplanes.py
index 96ac4f19f538..6a6f7e72ca52 100755
--- a/tests/kms-test-allplanes.py
+++ b/tests/kms-test-allplanes.py
@@ -85,4 +85,6 @@ class AllPlanesTest(kmstest.KMSTest):
 
             self.atomic_crtc_disable(crtc)
 
-AllPlanesTest().execute()
+
+if __name__ == '__main__':
+    AllPlanesTest().execute()
diff --git a/tests/kms-test-brxalloc.py b/tests/kms-test-brxalloc.py
index c80d2e33c846..3ccd6995b449 100755
--- a/tests/kms-test-brxalloc.py
+++ b/tests/kms-test-brxalloc.py
@@ -128,4 +128,6 @@ class BRxAllocTest(kmstest.KMSTest):
         self.atomic_crtc_disable(outputs[0].crtc)
         self.atomic_crtc_disable(outputs[1].crtc)
 
-BRxAllocTest().execute()
+
+if __name__ == '__main__':
+    BRxAllocTest().execute()
diff --git a/tests/kms-test-connectors.py b/tests/kms-test-connectors.py
index d2ca636eb2a0..fdbe8bdf6e97 100755
--- a/tests/kms-test-connectors.py
+++ b/tests/kms-test-connectors.py
@@ -27,4 +27,5 @@ class ConnectorsTest(kmstest.KMSTest):
 
             self.success()
 
-ConnectorsTest().execute()
+if __name__ == '__main__':
+    ConnectorsTest().execute()
diff --git a/tests/kms-test-crc.py b/tests/kms-test-crc.py
index 01f9606f2de9..b1af65d5256d 100755
--- a/tests/kms-test-crc.py
+++ b/tests/kms-test-crc.py
@@ -230,4 +230,6 @@ class CRCTest(kmstest.KMSTest):
 
             self.atomic_crtc_disable(crtc)
 
-CRCTest().execute()
+
+if __name__ == '__main__':
+    CRCTest().execute()
diff --git a/tests/kms-test-formats.py b/tests/kms-test-formats.py
index 5c3bfd441a38..afc5454d0b5d 100755
--- a/tests/kms-test-formats.py
+++ b/tests/kms-test-formats.py
@@ -75,4 +75,6 @@ class FormatsTest(kmstest.KMSTest):
         else:
             self.success()
 
-FormatsTest().execute()
+
+if __name__ == '__main__':
+    FormatsTest().execute()
diff --git a/tests/kms-test-legacy-modeset.py b/tests/kms-test-legacy-modeset.py
index 06eceade19c4..4082093ab985 100755
--- a/tests/kms-test-legacy-modeset.py
+++ b/tests/kms-test-legacy-modeset.py
@@ -59,4 +59,6 @@ class LegacyModeSetTest(kmstest.KMSTest):
 
             self.success()
 
-LegacyModeSetTest().execute()
+
+if __name__ == '__main__':
+    LegacyModeSetTest().execute()
diff --git a/tests/kms-test-modes.py b/tests/kms-test-modes.py
index 14463add7802..d857dd6e6f05 100755
--- a/tests/kms-test-modes.py
+++ b/tests/kms-test-modes.py
@@ -65,4 +65,6 @@ class ModesTest(kmstest.KMSTest):
             else:
                 self.success()
 
-ModesTest().execute()
+
+if __name__ == '__main__':
+    ModesTest().execute()
diff --git a/tests/kms-test-modeset.py b/tests/kms-test-modeset.py
index e8b3d9ac37f9..fd0c4acb91de 100755
--- a/tests/kms-test-modeset.py
+++ b/tests/kms-test-modeset.py
@@ -58,4 +58,6 @@ class ModeSetTest(kmstest.KMSTest):
             else:
                 self.success()
 
-ModeSetTest().execute()
+
+if __name__ == '__main__':
+    ModeSetTest().execute()
diff --git a/tests/kms-test-pageflip.py b/tests/kms-test-pageflip.py
index 14bea0a877a3..1bb1214080ff 100755
--- a/tests/kms-test-pageflip.py
+++ b/tests/kms-test-pageflip.py
@@ -118,4 +118,6 @@ class PageFlipTest(kmstest.KMSTest):
                             f'({self.flips}/{frames} frames in {interval} s)')
             self.success()
 
-PageFlipTest().execute()
+
+if __name__ == '__main__':
+    PageFlipTest().execute()
diff --git a/tests/kms-test-plane-alpha.py b/tests/kms-test-plane-alpha.py
index 8802bfeae40c..894e4ab8baaa 100755
--- a/tests/kms-test-plane-alpha.py
+++ b/tests/kms-test-plane-alpha.py
@@ -94,4 +94,6 @@ class PlaneAlphaTest(kmstest.KMSTest):
 
         self.atomic_crtc_disable(crtc)
 
-PlaneAlphaTest().execute()
+
+if __name__ == '__main__':
+    PlaneAlphaTest().execute()
diff --git a/tests/kms-test-plane-position.py b/tests/kms-test-plane-position.py
index aceb849950a1..5dfcfaaba05e 100755
--- a/tests/kms-test-plane-position.py
+++ b/tests/kms-test-plane-position.py
@@ -123,4 +123,6 @@ class PlanePositionTest(kmstest.KMSTest):
         self.atomic_crtc_disable(crtc)
         self.success()
 
-PlanePositionTest().execute()
+
+if __name__ == '__main__':
+    PlanePositionTest().execute()
diff --git a/tests/kms-test-plane-zpos.py b/tests/kms-test-plane-zpos.py
index 052eea542ec0..d27008823827 100755
--- a/tests/kms-test-plane-zpos.py
+++ b/tests/kms-test-plane-zpos.py
@@ -99,4 +99,6 @@ class PlaneZPosTest(kmstest.KMSTest):
 
         self.atomic_crtc_disable(crtc)
 
-PlaneZPosTest().execute()
+
+if __name__ == '__main__':
+    PlaneZPosTest().execute()
diff --git a/tests/kms-test-routing.py b/tests/kms-test-routing.py
index 68aff9c11cff..ccf61d83488d 100755
--- a/tests/kms-test-routing.py
+++ b/tests/kms-test-routing.py
@@ -141,4 +141,5 @@ class RoutingTest(kmstest.KMSTest):
         return allocated
 
 
-RoutingTest().execute()
+if __name__ == '__main__':
+    RoutingTest().execute()
-- 
Regards,

Laurent Pinchart

