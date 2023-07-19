Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E99759912
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 17:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbjGSPAd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 11:00:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbjGSPA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 11:00:27 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7731718
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 08:00:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
        by andre.telenet-ops.be with bizsmtp
        id P30G2A00J2xuRWb0130GGR; Wed, 19 Jul 2023 17:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8es-001tPe-Bp;
        Wed, 19 Jul 2023 17:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8f2-001AtG-Cv;
        Wed, 19 Jul 2023 17:00:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 07/13] of: unittest: Cleanup partially-applied overlays
Date:   Wed, 19 Jul 2023 17:00:07 +0200
Message-Id: <9437c9905030145a045ed764fd95351a1420dd77.1689776064.git.geert+renesas@glider.be>
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
 drivers/of/unittest.c | 130 +++++++++++++++++++++++++++---------------
 1 file changed, 83 insertions(+), 47 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 4c21c8ce99b9d8ff..86e109cc5a5385ba 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2956,12 +2956,6 @@ static void __init of_unittest_overlay_notify(void)
 
 	unittest(ovcs_id, "ovcs_id not created for overlay_17\n");
 
-	if (ovcs_id) {
-		ret = of_overlay_remove(&ovcs_id);
-		unittest(!ret,
-			"overlay_17 of_overlay_remove(), ret = %d\n", ret);
-	}
-
 	/* ---  overlay 18  --- */
 
 	unittest(overlay_data_apply("overlay_18", &ovcs_id),
@@ -3249,17 +3243,19 @@ static void __init of_unittest_lifecycle(void)
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
@@ -3299,40 +3295,40 @@ OVERLAY_INFO_EXTERN(overlay_bad_symbol);
 
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
@@ -3427,8 +3423,9 @@ void __init unittest_unflatten_overlay_base(void)
 static int __init overlay_data_apply(const char *overlay_name, int *ovcs_id)
 {
 	struct overlay_info *info;
+	int passed = 1;
 	int found = 0;
-	int ret;
+	int ret, ret2;
 	u32 size;
 
 	for (info = overlays; info && info->name; info++) {
@@ -3455,11 +3452,24 @@ static int __init overlay_data_apply(const char *overlay_name, int *ovcs_id)
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
@@ -3652,10 +3662,18 @@ static __init void of_unittest_overlay_high_level(void)
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
@@ -3667,10 +3685,18 @@ static __init void of_unittest_overlay_high_level(void)
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
@@ -3681,9 +3707,19 @@ static __init void of_unittest_overlay_high_level(void)
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

