Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A69DD759910
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 17:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbjGSPAd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 11:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbjGSPA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 11:00:27 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC37F1724
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 08:00:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
        by andre.telenet-ops.be with bizsmtp
        id P30G2A00K2xuRWb0130GGS; Wed, 19 Jul 2023 17:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8es-001tPl-D7;
        Wed, 19 Jul 2023 17:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8f2-001AtT-EH;
        Wed, 19 Jul 2023 17:00:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 09/13] of: overlay: unittest: Add test for unresolved symbol
Date:   Wed, 19 Jul 2023 17:00:09 +0200
Message-Id: <c5362f332e773f4a1a1e1cf8f333aee467508b38.1689776064.git.geert+renesas@glider.be>
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

Add a test to exercise the error paths when trying to apply an overlay
with an unresolved symbol and cleaning up the resulting partial state.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/unittest-data/Makefile               |  3 ++-
 .../unittest-data/overlay_bad_unresolved.dtso   |  7 +++++++
 drivers/of/unittest.c                           | 17 +++++++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 drivers/of/unittest-data/overlay_bad_unresolved.dtso

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index ea5f4da68e23acd0..f79daa1d45713958 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -32,7 +32,8 @@ obj-$(CONFIG_OF_OVERLAY) += overlay.dtbo.o \
 			    overlay_gpio_02b.dtbo.o \
 			    overlay_gpio_03.dtbo.o \
 			    overlay_gpio_04a.dtbo.o \
-			    overlay_gpio_04b.dtbo.o
+			    overlay_gpio_04b.dtbo.o \
+			    overlay_bad_unresolved.dtbo.o
 
 # enable creation of __symbols__ node
 DTC_FLAGS_overlay += -@
diff --git a/drivers/of/unittest-data/overlay_bad_unresolved.dtso b/drivers/of/unittest-data/overlay_bad_unresolved.dtso
new file mode 100644
index 0000000000000000..3b75a53ae8a492bd
--- /dev/null
+++ b/drivers/of/unittest-data/overlay_bad_unresolved.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&this_label_does_not_exist {
+	status = "ok";
+};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 4e3d8f72f979918f..8b6f746abfec8985 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3292,6 +3292,7 @@ OVERLAY_INFO_EXTERN(overlay_bad_add_dup_node);
 OVERLAY_INFO_EXTERN(overlay_bad_add_dup_prop);
 OVERLAY_INFO_EXTERN(overlay_bad_phandle);
 OVERLAY_INFO_EXTERN(overlay_bad_symbol);
+OVERLAY_INFO_EXTERN(overlay_bad_unresolved);
 
 /* entries found by name */
 static struct overlay_info overlays[] = {
@@ -3327,6 +3328,7 @@ static struct overlay_info overlays[] = {
 	OVERLAY_INFO(overlay_bad_add_dup_prop, -EINVAL, -ENODEV),
 	OVERLAY_INFO(overlay_bad_phandle, -EINVAL, 0),
 	OVERLAY_INFO(overlay_bad_symbol, -EINVAL, -ENODEV),
+	OVERLAY_INFO(overlay_bad_unresolved, -EINVAL, 0),
 	/* end marker */
 	{ }
 };
@@ -3730,6 +3732,21 @@ static __init void of_unittest_overlay_high_level(void)
 	EXPECT_END(KERN_ERR,
 		   "OF: changeset: remove_property failed @/testcase-data-2/substation@100/hvac-medium-2/name");
 
+	/* ---  overlay_bad_unresolved  --- */
+
+	EXPECT_BEGIN(KERN_ERR,
+		     "OF: resolver: node label 'this_label_does_not_exist' not found in live devicetree symbols table");
+	EXPECT_BEGIN(KERN_ERR,
+		     "OF: resolver: overlay phandle fixup failed: -22");
+
+	unittest(overlay_data_apply("overlay_bad_unresolved", NULL),
+		 "Adding overlay 'overlay_bad_unresolved' failed\n");
+
+	EXPECT_END(KERN_ERR,
+		   "OF: resolver: overlay phandle fixup failed: -22");
+	EXPECT_END(KERN_ERR,
+		   "OF: resolver: node label 'this_label_does_not_exist' not found in live devicetree symbols table");
+
 	return;
 
 err_unlock:
-- 
2.34.1

