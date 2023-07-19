Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60AF77598FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 17:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbjGSPA2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 11:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231415AbjGSPAY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 11:00:24 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE2AE1984
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 08:00:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
        by albert.telenet-ops.be with bizsmtp
        id P30G2A00F2xuRWb0630Grh; Wed, 19 Jul 2023 17:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8es-001tPV-B9;
        Wed, 19 Jul 2023 17:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8f2-001AtC-C7;
        Wed, 19 Jul 2023 17:00:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/13] of: unittest: Merge of_unittest_apply{,_revert}_overlay_check()
Date:   Wed, 19 Jul 2023 17:00:06 +0200
Message-Id: <b733ee0b398ace191a787cce965829f2777fc49e.1689776064.git.geert+renesas@glider.be>
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

of_unittest_apply_overlay_check() and the first part of
of_unittest_apply_revert_overlay_check() are identical.
Reduce code duplication by replacing them by two wrappers around a
common helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/unittest.c | 61 ++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 39 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 42abfcd0cdffa4af..4c21c8ce99b9d8ff 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2101,46 +2101,10 @@ static int __init of_unittest_apply_overlay(int overlay_nr, int *ovcs_id)
 	return 0;
 }
 
-/* apply an overlay while checking before and after states */
-static int __init of_unittest_apply_overlay_check(int overlay_nr,
-		int unittest_nr, int before, int after,
-		enum overlay_type ovtype)
-{
-	int ret, ovcs_id;
-
-	/* unittest device must be in before state */
-	if (of_unittest_device_exists(unittest_nr, ovtype) != before) {
-		unittest(0, "%s with device @\"%s\" %s\n",
-				overlay_name_from_nr(overlay_nr),
-				unittest_path(unittest_nr, ovtype),
-				!before ? "enabled" : "disabled");
-		return -EINVAL;
-	}
-
-	/* apply the overlay */
-	ovcs_id = 0;
-	ret = of_unittest_apply_overlay(overlay_nr, &ovcs_id);
-	if (ret != 0) {
-		/* of_unittest_apply_overlay already called unittest() */
-		return ret;
-	}
-
-	/* unittest device must be in after state */
-	if (of_unittest_device_exists(unittest_nr, ovtype) != after) {
-		unittest(0, "%s with device @\"%s\" %s\n",
-				overlay_name_from_nr(overlay_nr),
-				unittest_path(unittest_nr, ovtype),
-				!after ? "enabled" : "disabled");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-/* apply an overlay and then revert it while checking before, after states */
-static int __init of_unittest_apply_revert_overlay_check(int overlay_nr,
+/* apply an overlay and optionally revert it while checking states */
+static int __init __of_unittest_apply_revert_overlay_check(int overlay_nr,
 		int unittest_nr, int before, int after,
-		enum overlay_type ovtype)
+		enum overlay_type ovtype, bool revert)
 {
 	int ret, ovcs_id, save_ovcs_id;
 
@@ -2170,6 +2134,9 @@ static int __init of_unittest_apply_revert_overlay_check(int overlay_nr,
 		return -EINVAL;
 	}
 
+	if (!revert)
+		return 0;
+
 	/* remove the overlay */
 	save_ovcs_id = ovcs_id;
 	ret = of_overlay_remove(&ovcs_id);
@@ -2193,6 +2160,22 @@ static int __init of_unittest_apply_revert_overlay_check(int overlay_nr,
 	return 0;
 }
 
+/* apply an overlay while checking before and after states */
+static inline int __init of_unittest_apply_overlay_check(int overlay_nr,
+	int unittest_nr, int before, int after, enum overlay_type ovtype)
+{
+	return __of_unittest_apply_revert_overlay_check(overlay_nr,
+				unittest_nr, before, after, ovtype, false);
+}
+
+/* apply an overlay and then revert it while checking before, after states */
+static int __init of_unittest_apply_revert_overlay_check(int overlay_nr,
+	int unittest_nr, int before, int after, enum overlay_type ovtype)
+{
+	return __of_unittest_apply_revert_overlay_check(overlay_nr,
+				unittest_nr, before, after, ovtype, true);
+}
+
 /* test activation of device */
 static void __init of_unittest_overlay_0(void)
 {
-- 
2.34.1

