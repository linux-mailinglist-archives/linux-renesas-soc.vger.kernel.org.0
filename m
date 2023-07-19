Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75C3759906
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jul 2023 17:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbjGSPAa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jul 2023 11:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231463AbjGSPA0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2023 11:00:26 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1321722
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jul 2023 08:00:20 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
        by xavier.telenet-ops.be with bizsmtp
        id P30G2A00J2xuRWb0130G4L; Wed, 19 Jul 2023 17:00:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8es-001tPh-CQ;
        Wed, 19 Jul 2023 17:00:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qM8f2-001AtO-DY;
        Wed, 19 Jul 2023 17:00:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 08/13] of: unittest: Add separators to of_unittest_overlay_high_level()
Date:   Wed, 19 Jul 2023 17:00:08 +0200
Message-Id: <8587a39c7b8a6aad59d1d38f767f57a0bc0a29e0.1689776064.git.geert+renesas@glider.be>
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

It is hard to see the start and end of each individual test in
of_unittest_overlay_high_level().  Add visual cues in the form of
separator comments, like was done in of_unittest_overlay_notify().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/of/unittest.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 86e109cc5a5385ba..4e3d8f72f979918f 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3608,6 +3608,8 @@ static __init void of_unittest_overlay_high_level(void)
 
 	/* now do the normal overlay usage test */
 
+	/* ---  overlay  --- */
+
 	EXPECT_BEGIN(KERN_ERR,
 		     "OF: overlay: WARNING: memory leak will occur if overlay removed, property: /testcase-data-2/substation@100/status");
 	EXPECT_BEGIN(KERN_ERR,
@@ -3658,6 +3660,8 @@ static __init void of_unittest_overlay_high_level(void)
 
 	unittest(ret, "Adding overlay 'overlay' failed\n");
 
+	/* ---  overlay_bad_add_dup_node  --- */
+
 	EXPECT_BEGIN(KERN_ERR,
 		     "OF: overlay: ERROR: multiple fragments add and/or delete node /testcase-data-2/substation@100/motor-1/controller");
 	EXPECT_BEGIN(KERN_ERR,
@@ -3679,6 +3683,8 @@ static __init void of_unittest_overlay_high_level(void)
 	EXPECT_END(KERN_ERR,
 		   "OF: overlay: ERROR: multiple fragments add and/or delete node /testcase-data-2/substation@100/motor-1/controller");
 
+	/* ---  overlay_bad_add_dup_prop  --- */
+
 	EXPECT_BEGIN(KERN_ERR,
 		     "OF: overlay: ERROR: multiple fragments add and/or delete node /testcase-data-2/substation@100/motor-1/electric");
 	EXPECT_BEGIN(KERN_ERR,
@@ -3704,9 +3710,13 @@ static __init void of_unittest_overlay_high_level(void)
 	EXPECT_END(KERN_ERR,
 		   "OF: overlay: ERROR: multiple fragments add and/or delete node /testcase-data-2/substation@100/motor-1/electric");
 
+	/* ---  overlay_bad_phandle  --- */
+
 	unittest(overlay_data_apply("overlay_bad_phandle", NULL),
 		 "Adding overlay 'overlay_bad_phandle' failed\n");
 
+	/* ---  overlay_bad_symbol  --- */
+
 	EXPECT_BEGIN(KERN_ERR,
 		     "OF: changeset: remove_property failed @/testcase-data-2/substation@100/hvac-medium-2/name");
 	EXPECT_BEGIN(KERN_ERR,
-- 
2.34.1

