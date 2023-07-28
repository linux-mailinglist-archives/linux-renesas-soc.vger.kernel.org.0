Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 722D57667C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 10:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbjG1IxZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 04:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235175AbjG1Iwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 04:52:35 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C63C5263
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 01:50:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by xavier.telenet-ops.be with bizsmtp
        id SYqi2A00d0d1nm801Yqiga; Fri, 28 Jul 2023 10:50:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJB7-002lSL-F5;
        Fri, 28 Jul 2023 10:50:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJBK-00Ajsu-Is;
        Fri, 28 Jul 2023 10:50:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 06/13] of: unittest: Merge of_unittest_apply{,_revert}_overlay_check()
Date:   Fri, 28 Jul 2023 10:50:32 +0200
Message-Id: <4bafe338655beab6b244047e737c0c2aa60b613d.1690533838.git.geert+renesas@glider.be>
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

of_unittest_apply_overlay_check() and the first part of
of_unittest_apply_revert_overlay_check() are identical.
Reduce code duplication by replacing them by two wrappers around a
common helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Merge differently, as requested by Rob.
---
 drivers/of/unittest.c | 45 +++++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 42abfcd0cdffa4af..b23a44de091bd044 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2101,8 +2101,7 @@ static int __init of_unittest_apply_overlay(int overlay_nr, int *ovcs_id)
 	return 0;
 }
 
-/* apply an overlay while checking before and after states */
-static int __init of_unittest_apply_overlay_check(int overlay_nr,
+static int __init __of_unittest_apply_overlay_check(int overlay_nr,
 		int unittest_nr, int before, int after,
 		enum overlay_type ovtype)
 {
@@ -2134,6 +2133,19 @@ static int __init of_unittest_apply_overlay_check(int overlay_nr,
 		return -EINVAL;
 	}
 
+	return ovcs_id;
+}
+
+/* apply an overlay while checking before and after states */
+static int __init of_unittest_apply_overlay_check(int overlay_nr,
+		int unittest_nr, int before, int after,
+		enum overlay_type ovtype)
+{
+	int ovcs_id = __of_unittest_apply_overlay_check(overlay_nr,
+				unittest_nr, before, after, ovtype);
+	if (ovcs_id < 0)
+		return ovcs_id;
+
 	return 0;
 }
 
@@ -2144,31 +2156,10 @@ static int __init of_unittest_apply_revert_overlay_check(int overlay_nr,
 {
 	int ret, ovcs_id, save_ovcs_id;
 
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
+	ovcs_id = __of_unittest_apply_overlay_check(overlay_nr, unittest_nr,
+						    before, after, ovtype);
+	if (ovcs_id < 0)
+		return ovcs_id;
 
 	/* remove the overlay */
 	save_ovcs_id = ovcs_id;
-- 
2.34.1

