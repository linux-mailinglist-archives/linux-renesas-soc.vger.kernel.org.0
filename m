Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8357667CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 10:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234983AbjG1Ix2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 04:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234202AbjG1Iwl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 04:52:41 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429514EC5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 01:50:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by xavier.telenet-ops.be with bizsmtp
        id SYqi2A00e0d1nm801Yqigc; Fri, 28 Jul 2023 10:50:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJB7-002lSP-Fr;
        Fri, 28 Jul 2023 10:50:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJBK-00Ajsy-Jg;
        Fri, 28 Jul 2023 10:50:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 07/13] of: unittest: Cleanup partially-applied overlays
Date:   Fri, 28 Jul 2023 10:50:33 +0200
Message-Id: <594a6a8934e5569bf96d317a6a3c0a9129a2ae20.1690533838.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690533838.git.geert+renesas@glider.be>
References: <cover.1690533838.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When of_overlay_fdt_apply() fails, the changeset may be partially
applied, and the caller is still expected to call of_overlay_remove() to
clean up this partial state.  However, overlay_17 is the only test that
takes care of cleaning up after an (expected) failure.

Instead of adding cleanup code to each individual test, extend
overlay_info with the optional expected return value of
of_overlay_remove(), and handle cleanup in the overlay_data_apply()
helper.  While at it, simplify the end marker in the overlay_info table.

Update the expected error output for errors during the newly cleanup.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/of/unittest.c | 130 +++++++++++++++++++++++++++---------------
 1 file changed, 83 insertions(+), 47 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index b23a44de091bd044..f9c09d5787362601 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2964,12 +2964,6 @@ static void __init of_unittest_overlay_notify(void)
 
 	unittest(ovcs_id, "ovcs_id not created for overlay_17\n");
 
-	if (ovcs_id) {
-		ret = of_overlay_remove(&ovcs_id);
-		unittest(!ret,
-			"overlay_17 of_overlay_remove(), ret = %d\n", ret);
-	}
-
 	/* ---  overlay 18  --- */
 
 	unittest(overlay_data_apply("overlay_18", &ovcs_id),
@@ -3257,17 +3251,19 @@ static void __init of_unittest_lifecycle(void)
 	extern uint8_t __dtbo_##overlay_name##_begin[]; \
 	extern uint8_t __dtbo_##overlay_name##_end[]
 
-#define OVERLAY_INFO(overlay_name, expected) \
-{	.dtbo_begin       = __dtbo_##overlay_name##_begin, \
-	.dtbo_end         = __dtbo_##overlay_name##_end, \
-	.expected_result = expected, \
-	.name            = #overlay_name, \
+#define OVERLAY_INFO(overlay_name, expected, expected_remove) \
+{	.dtbo_begin		= __dtbo_##overlay_name##_begin, \
+	.dtbo_end		= __dtbo_##overlay_name##_end, \
+	.expected_result	= expected, \
+	.expected_result_remove	= expected_remove, \
+	.name			= #overlay_name, \
 }
 
 struct overlay_info {
 	uint8_t		*dtbo_begin;
 	uint8_t		*dtbo_end;
 	int		expected_result;
+	int		expected_result_remove;	/* if apply failed */
 	int		ovcs_id;
 	char		*name;
 };
@@ -3307,40 +3303,40 @@ OVERLAY_INFO_EXTERN(overlay_bad_symbol);
 
 /* entries found by name */
 static struct overlay_info overlays[] = {
-	OVERLAY_INFO(overlay_base, -9999),
-	OVERLAY_INFO(overlay, 0),
-	OVERLAY_INFO(overlay_0, 0),
-	OVERLAY_INFO(overlay_1, 0),
-	OVERLAY_INFO(overlay_2, 0),
-	OVERLAY_INFO(overlay_3, 0),
-	OVERLAY_INFO(overlay_4, 0),
-	OVERLAY_INFO(overlay_5, 0),
-	OVERLAY_INFO(overlay_6, 0),
-	OVERLAY_INFO(overlay_7, 0),
-	OVERLAY_INFO(overlay_8, 0),
-	OVERLAY_INFO(overlay_9, 0),
-	OVERLAY_INFO(overlay_10, 0),
-	OVERLAY_INFO(overlay_11, 0),
-	OVERLAY_INFO(overlay_12, 0),
-	OVERLAY_INFO(overlay_13, 0),
-	OVERLAY_INFO(overlay_15, 0),
-	OVERLAY_INFO(overlay_16, -EBUSY),
-	OVERLAY_INFO(overlay_17, -EEXIST),
-	OVERLAY_INFO(overlay_18, 0),
-	OVERLAY_INFO(overlay_19, 0),
-	OVERLAY_INFO(overlay_20, 0),
-	OVERLAY_INFO(overlay_gpio_01, 0),
-	OVERLAY_INFO(overlay_gpio_02a, 0),
-	OVERLAY_INFO(overlay_gpio_02b, 0),
-	OVERLAY_INFO(overlay_gpio_03, 0),
-	OVERLAY_INFO(overlay_gpio_04a, 0),
-	OVERLAY_INFO(overlay_gpio_04b, 0),
-	OVERLAY_INFO(overlay_bad_add_dup_node, -EINVAL),
-	OVERLAY_INFO(overlay_bad_add_dup_prop, -EINVAL),
-	OVERLAY_INFO(overlay_bad_phandle, -EINVAL),
-	OVERLAY_INFO(overlay_bad_symbol, -EINVAL),
+	OVERLAY_INFO(overlay_base, -9999, 0),
+	OVERLAY_INFO(overlay, 0, 0),
+	OVERLAY_INFO(overlay_0, 0, 0),
+	OVERLAY_INFO(overlay_1, 0, 0),
+	OVERLAY_INFO(overlay_2, 0, 0),
+	OVERLAY_INFO(overlay_3, 0, 0),
+	OVERLAY_INFO(overlay_4, 0, 0),
+	OVERLAY_INFO(overlay_5, 0, 0),
+	OVERLAY_INFO(overlay_6, 0, 0),
+	OVERLAY_INFO(overlay_7, 0, 0),
+	OVERLAY_INFO(overlay_8, 0, 0),
+	OVERLAY_INFO(overlay_9, 0, 0),
+	OVERLAY_INFO(overlay_10, 0, 0),
+	OVERLAY_INFO(overlay_11, 0, 0),
+	OVERLAY_INFO(overlay_12, 0, 0),
+	OVERLAY_INFO(overlay_13, 0, 0),
+	OVERLAY_INFO(overlay_15, 0, 0),
+	OVERLAY_INFO(overlay_16, -EBUSY, 0),
+	OVERLAY_INFO(overlay_17, -EEXIST, 0),
+	OVERLAY_INFO(overlay_18, 0, 0),
+	OVERLAY_INFO(overlay_19, 0, 0),
+	OVERLAY_INFO(overlay_20, 0, 0),
+	OVERLAY_INFO(overlay_gpio_01, 0, 0),
+	OVERLAY_INFO(overlay_gpio_02a, 0, 0),
+	OVERLAY_INFO(overlay_gpio_02b, 0, 0),
+	OVERLAY_INFO(overlay_gpio_03, 0, 0),
+	OVERLAY_INFO(overlay_gpio_04a, 0, 0),
+	OVERLAY_INFO(overlay_gpio_04b, 0, 0),
+	OVERLAY_INFO(overlay_bad_add_dup_node, -EINVAL, -ENODEV),
+	OVERLAY_INFO(overlay_bad_add_dup_prop, -EINVAL, -ENODEV),
+	OVERLAY_INFO(overlay_bad_phandle, -EINVAL, 0),
+	OVERLAY_INFO(overlay_bad_symbol, -EINVAL, -ENODEV),
 	/* end marker */
-	{.dtbo_begin = NULL, .dtbo_end = NULL, .expected_result = 0, .name = NULL}
+	{ }
 };
 
 static struct device_node *overlay_base_root;
@@ -3435,8 +3431,9 @@ void __init unittest_unflatten_overlay_base(void)
 static int __init overlay_data_apply(const char *overlay_name, int *ovcs_id)
 {
 	struct overlay_info *info;
+	int passed = 1;
 	int found = 0;
-	int ret;
+	int ret, ret2;
 	u32 size;
 
 	for (info = overlays; info && info->name; info++) {
@@ -3463,11 +3460,24 @@ static int __init overlay_data_apply(const char *overlay_name, int *ovcs_id)
 	pr_debug("%s applied\n", overlay_name);
 
 out:
-	if (ret != info->expected_result)
+	if (ret != info->expected_result) {
 		pr_err("of_overlay_fdt_apply() expected %d, ret=%d, %s\n",
 		       info->expected_result, ret, overlay_name);
+		passed = 0;
+	}
+
+	if (ret < 0) {
+		/* changeset may be partially applied */
+		ret2 = of_overlay_remove(&info->ovcs_id);
+		if (ret2 != info->expected_result_remove) {
+			pr_err("of_overlay_remove() expected %d, ret=%d, %s\n",
+			       info->expected_result_remove, ret2,
+			       overlay_name);
+			passed = 0;
+		}
+	}
 
-	return (ret == info->expected_result);
+	return passed;
 }
 
 /*
@@ -3660,10 +3670,18 @@ static __init void of_unittest_overlay_high_level(void)
 		     "OF: overlay: ERROR: multiple fragments add and/or delete node /testcase-data-2/substation@100/motor-1/controller");
 	EXPECT_BEGIN(KERN_ERR,
 		     "OF: overlay: ERROR: multiple fragments add, update, and/or delete property /testcase-data-2/substation@100/motor-1/controller/name");
+	EXPECT_BEGIN(KERN_ERR,
+		     "OF: changeset: remove_property failed @/testcase-data-2/substation@100/motor-1/controller/name");
+	EXPECT_BEGIN(KERN_ERR,
+		     "OF: Error reverting changeset (-19)");
 
 	unittest(overlay_data_apply("overlay_bad_add_dup_node", NULL),
 		 "Adding overlay 'overlay_bad_add_dup_node' failed\n");
 
+	EXPECT_END(KERN_ERR,
+		   "OF: Error reverting changeset (-19)");
+	EXPECT_END(KERN_ERR,
+		   "OF: changeset: remove_property failed @/testcase-data-2/substation@100/motor-1/controller/name");
 	EXPECT_END(KERN_ERR,
 		   "OF: overlay: ERROR: multiple fragments add, update, and/or delete property /testcase-data-2/substation@100/motor-1/controller/name");
 	EXPECT_END(KERN_ERR,
@@ -3675,10 +3693,18 @@ static __init void of_unittest_overlay_high_level(void)
 		     "OF: overlay: ERROR: multiple fragments add, update, and/or delete property /testcase-data-2/substation@100/motor-1/electric/rpm_avail");
 	EXPECT_BEGIN(KERN_ERR,
 		     "OF: overlay: ERROR: multiple fragments add, update, and/or delete property /testcase-data-2/substation@100/motor-1/electric/name");
+	EXPECT_BEGIN(KERN_ERR,
+		     "OF: changeset: remove_property failed @/testcase-data-2/substation@100/motor-1/electric/name");
+	EXPECT_BEGIN(KERN_ERR,
+		     "OF: Error reverting changeset (-19)");
 
 	unittest(overlay_data_apply("overlay_bad_add_dup_prop", NULL),
 		 "Adding overlay 'overlay_bad_add_dup_prop' failed\n");
 
+	EXPECT_END(KERN_ERR,
+		   "OF: Error reverting changeset (-19)");
+	EXPECT_END(KERN_ERR,
+		   "OF: changeset: remove_property failed @/testcase-data-2/substation@100/motor-1/electric/name");
 	EXPECT_END(KERN_ERR,
 		   "OF: overlay: ERROR: multiple fragments add, update, and/or delete property /testcase-data-2/substation@100/motor-1/electric/name");
 	EXPECT_END(KERN_ERR,
@@ -3689,9 +3715,19 @@ static __init void of_unittest_overlay_high_level(void)
 	unittest(overlay_data_apply("overlay_bad_phandle", NULL),
 		 "Adding overlay 'overlay_bad_phandle' failed\n");
 
+	EXPECT_BEGIN(KERN_ERR,
+		     "OF: changeset: remove_property failed @/testcase-data-2/substation@100/hvac-medium-2/name");
+	EXPECT_BEGIN(KERN_ERR,
+		     "OF: resolver: overlay phandle fixup failed: -22");
+
 	unittest(overlay_data_apply("overlay_bad_symbol", NULL),
 		 "Adding overlay 'overlay_bad_symbol' failed\n");
 
+	EXPECT_END(KERN_ERR,
+		   "OF: resolver: overlay phandle fixup failed: -22");
+	EXPECT_END(KERN_ERR,
+		   "OF: changeset: remove_property failed @/testcase-data-2/substation@100/hvac-medium-2/name");
+
 	return;
 
 err_unlock:
-- 
2.34.1

