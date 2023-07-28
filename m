Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9157D7667DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jul 2023 10:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235026AbjG1Ixd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jul 2023 04:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235151AbjG1Iwe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jul 2023 04:52:34 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4269D4EC2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jul 2023 01:50:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
        by xavier.telenet-ops.be with bizsmtp
        id SYqi2A00c0d1nm801YqigZ; Fri, 28 Jul 2023 10:50:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJB7-002lSC-EH;
        Fri, 28 Jul 2023 10:50:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qPJBK-00Ajsq-IG;
        Fri, 28 Jul 2023 10:50:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 05/13] of: unittest: Improve messages and comments in apply/revert checks
Date:   Fri, 28 Jul 2023 10:50:31 +0200
Message-Id: <326ecfe0889c53d2cfff31b3bf950d0b70be225f.1690533838.git.geert+renesas@glider.be>
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

Miscellaneous improvements for the apply and apply/revert checks,
making them more similar:
  - Fix inverted comment for before state check,
  - Add more comments to improve symmetry,
  - Fix grammar s/must be to set to/must be in/,
  - Avoid saying "create" in messages, as the actual operation depends
    on the value of the before/after parameters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/of/unittest.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index bb7e2ec05da59070..42abfcd0cdffa4af 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2108,7 +2108,7 @@ static int __init of_unittest_apply_overlay_check(int overlay_nr,
 {
 	int ret, ovcs_id;
 
-	/* unittest device must not be in before state */
+	/* unittest device must be in before state */
 	if (of_unittest_device_exists(unittest_nr, ovtype) != before) {
 		unittest(0, "%s with device @\"%s\" %s\n",
 				overlay_name_from_nr(overlay_nr),
@@ -2117,6 +2117,7 @@ static int __init of_unittest_apply_overlay_check(int overlay_nr,
 		return -EINVAL;
 	}
 
+	/* apply the overlay */
 	ovcs_id = 0;
 	ret = of_unittest_apply_overlay(overlay_nr, &ovcs_id);
 	if (ret != 0) {
@@ -2124,9 +2125,9 @@ static int __init of_unittest_apply_overlay_check(int overlay_nr,
 		return ret;
 	}
 
-	/* unittest device must be to set to after state */
+	/* unittest device must be in after state */
 	if (of_unittest_device_exists(unittest_nr, ovtype) != after) {
-		unittest(0, "%s failed to create @\"%s\" %s\n",
+		unittest(0, "%s with device @\"%s\" %s\n",
 				overlay_name_from_nr(overlay_nr),
 				unittest_path(unittest_nr, ovtype),
 				!after ? "enabled" : "disabled");
@@ -2162,13 +2163,14 @@ static int __init of_unittest_apply_revert_overlay_check(int overlay_nr,
 
 	/* unittest device must be in after state */
 	if (of_unittest_device_exists(unittest_nr, ovtype) != after) {
-		unittest(0, "%s failed to create @\"%s\" %s\n",
+		unittest(0, "%s with device @\"%s\" %s\n",
 				overlay_name_from_nr(overlay_nr),
 				unittest_path(unittest_nr, ovtype),
 				!after ? "enabled" : "disabled");
 		return -EINVAL;
 	}
 
+	/* remove the overlay */
 	save_ovcs_id = ovcs_id;
 	ret = of_overlay_remove(&ovcs_id);
 	if (ret != 0) {
-- 
2.34.1

