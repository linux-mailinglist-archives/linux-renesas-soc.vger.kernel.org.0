Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9E397667D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 10:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234202AbjG1Ix2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 04:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235145AbjG1Iwd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 04:52:33 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5A65267
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 01:50:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by michel.telenet-ops.be with bizsmtp
        id SYqi2A00R0d1nm806YqiDM; Fri, 28 Jul 2023 10:50:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJB7-002lSU-Gv;
        Fri, 28 Jul 2023 10:50:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJBK-00AjtC-Kz;
        Fri, 28 Jul 2023 10:50:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 09/13] of: overlay: unittest: Add test for unresolved symbol
Date:   Fri, 28 Jul 2023 10:50:35 +0200
Message-Id: <580394587976975770c84411896fce9fbbcf25fa.1690533838.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690533838.git.geert+renesas@glider.be>
References: <cover.1690533838.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a test to exercise the error paths when trying to apply an overlay
with an unresolved symbol and cleaning up the resulting partial state.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
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
index f0e97cfb31573696..fb668d55308ca48e 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3300,6 +3300,7 @@ OVERLAY_INFO_EXTERN(overlay_bad_add_dup_node);
 OVERLAY_INFO_EXTERN(overlay_bad_add_dup_prop);
 OVERLAY_INFO_EXTERN(overlay_bad_phandle);
 OVERLAY_INFO_EXTERN(overlay_bad_symbol);
+OVERLAY_INFO_EXTERN(overlay_bad_unresolved);
 
 /* entries found by name */
 static struct overlay_info overlays[] = {
@@ -3335,6 +3336,7 @@ static struct overlay_info overlays[] = {
 	OVERLAY_INFO(overlay_bad_add_dup_prop, -EINVAL, -ENODEV),
 	OVERLAY_INFO(overlay_bad_phandle, -EINVAL, 0),
 	OVERLAY_INFO(overlay_bad_symbol, -EINVAL, -ENODEV),
+	OVERLAY_INFO(overlay_bad_unresolved, -EINVAL, 0),
 	/* end marker */
 	{ }
 };
@@ -3738,6 +3740,21 @@ static __init void of_unittest_overlay_high_level(void)
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

