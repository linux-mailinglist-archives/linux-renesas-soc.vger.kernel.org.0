Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1004D75990E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 17:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbjGSPAc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 11:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbjGSPA1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 11:00:27 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB6D41711
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 08:00:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
        by andre.telenet-ops.be with bizsmtp
        id P30G2A00H2xuRWb0130GGQ; Wed, 19 Jul 2023 17:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8es-001tPQ-AJ;
        Wed, 19 Jul 2023 17:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8f2-001At8-BS;
        Wed, 19 Jul 2023 17:00:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/13] of: unittest: Improve messages and comments in apply/revert checks
Date:   Wed, 19 Jul 2023 17:00:05 +0200
Message-Id: <2ef32b3aab6db0943d59f45793caceee9e4ac234.1689776064.git.geert+renesas@glider.be>
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

Miscellaneous improvements for the apply and apply/revert checks,
making them more similar:
  - Fix inverted comment for before state check,
  - Add more comments to improve symmetry,
  - Fix grammar s/must be to set to/must be in/,
  - Avoid saying "create" in messages, as the actual operation depends
    on the value of the before/after parameters.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

