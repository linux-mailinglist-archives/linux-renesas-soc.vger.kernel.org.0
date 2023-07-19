Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 901C4759913
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 17:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbjGSPAe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 11:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbjGSPA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 11:00:27 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3ED1726
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 08:00:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
        by xavier.telenet-ops.be with bizsmtp
        id P30G2A00L2xuRWb0130G4M; Wed, 19 Jul 2023 17:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8es-001tPp-Dr;
        Wed, 19 Jul 2023 17:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8f2-001AtY-Ez;
        Wed, 19 Jul 2023 17:00:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 10/13] of: unittest-data: Convert remaining overlay DTS files to sugar syntax
Date:   Wed, 19 Jul 2023 17:00:10 +0200
Message-Id: <ed9d329a3157fc784a4fb54120df0a55b4826cdc.1689776064.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689776064.git.geert+renesas@glider.be>
References: <cover.1689776064.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Overlay syntactic sugar for generating target-path fragments is
supported by the version of dtc supplied with the kernel since commit
50aafd60898a8b3e ("scripts/dtc: Update to upstream version
v1.4.6-21-g84e414b0b5bc").  Hence convert the remaining unittest overlay
devicetree source files to sugar syntax, improving readability.

This completes the work started in commit db2f3762d609318e ("of: convert
unittest overlay devicetree source to sugar syntax").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/unittest-data/overlay_0.dtso  | 11 +++--------
 drivers/of/unittest-data/overlay_1.dtso  | 11 +++--------
 drivers/of/unittest-data/overlay_12.dtso | 11 +++--------
 drivers/of/unittest-data/overlay_13.dtso | 11 +++--------
 4 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/drivers/of/unittest-data/overlay_0.dtso b/drivers/of/unittest-data/overlay_0.dtso
index ac0f9e0fe65f80f3..bb46582e0485318f 100644
--- a/drivers/of/unittest-data/overlay_0.dtso
+++ b/drivers/of/unittest-data/overlay_0.dtso
@@ -2,13 +2,8 @@
 /dts-v1/;
 /plugin/;
 
-/ {
-	/* overlay_0 - enable using absolute target path */
+/* overlay_0 - enable using absolute target path */
 
-	fragment@0 {
-		target-path = "/testcase-data/overlay-node/test-bus/test-unittest0";
-		__overlay__ {
-			status = "okay";
-		};
-	};
+&{/testcase-data/overlay-node/test-bus/test-unittest0} {
+	status = "okay";
 };
diff --git a/drivers/of/unittest-data/overlay_1.dtso b/drivers/of/unittest-data/overlay_1.dtso
index e92a626e29483a32..9c0fc8ffa4a1d3d8 100644
--- a/drivers/of/unittest-data/overlay_1.dtso
+++ b/drivers/of/unittest-data/overlay_1.dtso
@@ -2,13 +2,8 @@
 /dts-v1/;
 /plugin/;
 
-/ {
-	/* overlay_1 - disable using absolute target path */
+/* overlay_1 - disable using absolute target path */
 
-	fragment@0 {
-		target-path = "/testcase-data/overlay-node/test-bus/test-unittest1";
-		__overlay__ {
-			status = "disabled";
-		};
-	};
+&{/testcase-data/overlay-node/test-bus/test-unittest1} {
+	status = "disabled";
 };
diff --git a/drivers/of/unittest-data/overlay_12.dtso b/drivers/of/unittest-data/overlay_12.dtso
index ca3441e2cbec94ce..8d5087793eb42688 100644
--- a/drivers/of/unittest-data/overlay_12.dtso
+++ b/drivers/of/unittest-data/overlay_12.dtso
@@ -2,13 +2,8 @@
 /dts-v1/;
 /plugin/;
 
-/ {
-	/* overlay_12 - enable using absolute target path (i2c) */
+/* overlay_12 - enable using absolute target path (i2c) */
 
-	fragment@0 {
-		target-path = "/testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest12";
-		__overlay__ {
-			status = "okay";
-		};
-	};
+&{/testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest12} {
+	status = "okay";
 };
diff --git a/drivers/of/unittest-data/overlay_13.dtso b/drivers/of/unittest-data/overlay_13.dtso
index 3c30dec6389436df..da200ae94f459ade 100644
--- a/drivers/of/unittest-data/overlay_13.dtso
+++ b/drivers/of/unittest-data/overlay_13.dtso
@@ -2,13 +2,8 @@
 /dts-v1/;
 /plugin/;
 
-/ {
-	/* overlay_13 - disable using absolute target path (i2c) */
+/* overlay_13 - disable using absolute target path (i2c) */
 
-	fragment@0 {
-		target-path = "/testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest13";
-		__overlay__ {
-			status = "disabled";
-		};
-	};
+&{/testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest13} {
+	status = "disabled";
 };
-- 
2.34.1

