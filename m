Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3CA783DCB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 12:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbjHVKWo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 06:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233676AbjHVKWo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 06:22:44 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EEC51B0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Aug 2023 03:22:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c9ff:e2bc:6893:f4e3])
        by michel.telenet-ops.be with bizsmtp
        id caNd2A00M2hAXNh06aNd1a; Tue, 22 Aug 2023 12:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qYOWq-001Oc2-WC;
        Tue, 22 Aug 2023 12:22:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qYOWz-00H0ho-Hi;
        Tue, 22 Aug 2023 12:22:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Peng Fan <peng.fan@nxp.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of: unittest: Run overlay apply/revert sequence three times
Date:   Tue, 22 Aug 2023 12:22:34 +0200
Message-Id: <a9fb4eb560c58d11a7f167bc78a137b46e76cf15.1692699743.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Run the test for the overlay apply/revert sequence three times, to
test if there are unbalanced of_node_put() calls causing reference
counts to become negative.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a reproducer for the issue fixed by commit 7882541ca06d51a6
("of/platform: increase refcount of fwnode") in dt/linus.
---
 drivers/of/unittest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 9af5337c76f62162..67e32977341a6f0c 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -3035,6 +3035,7 @@ static void __init of_unittest_overlay_notify(void)
 static void __init of_unittest_overlay(void)
 {
 	struct device_node *bus_np = NULL;
+	unsigned int i;
 
 	if (platform_driver_register(&unittest_driver)) {
 		unittest(0, "could not register unittest driver\n");
@@ -3072,7 +3073,8 @@ static void __init of_unittest_overlay(void)
 	of_unittest_overlay_2();
 	of_unittest_overlay_3();
 	of_unittest_overlay_4();
-	of_unittest_overlay_5();
+	for (i = 0; i < 3; i++)
+		of_unittest_overlay_5();
 	of_unittest_overlay_6();
 	of_unittest_overlay_8();
 
-- 
2.34.1

