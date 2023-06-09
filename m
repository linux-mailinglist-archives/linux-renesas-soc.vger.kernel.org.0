Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61F56729FBB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 18:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjFIQLX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 12:11:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242151AbjFIQLT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 12:11:19 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DEA23C1F
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 09:10:59 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
        by albert.telenet-ops.be with bizsmtp
        id 74Aw2A00412zQ4r064AwgJ; Fri, 09 Jun 2023 18:10:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7eh7-008M0d-CQ;
        Fri, 09 Jun 2023 18:10:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7ehU-00GDYL-Cz;
        Fri, 09 Jun 2023 18:10:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 3/3] clk: renesas: emev2: Remove obsolete clkdev registration
Date:   Fri,  9 Jun 2023 18:10:51 +0200
Message-Id: <f54a30d7a9e2aa075d462db701a60b0b59c6ad0b.1686325857.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686325857.git.geert+renesas@glider.be>
References: <cover.1686325857.git.geert+renesas@glider.be>
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

EMMA Mobile EV2 is a multi-platform/CCF-only platform, registering all
devices from DT, so we can remove the registration of clkdevs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-emev2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/clk-emev2.c b/drivers/clk/renesas/clk-emev2.c
index 7807b30a5bbb5901..37c6f9be5e5b46e8 100644
--- a/drivers/clk/renesas/clk-emev2.c
+++ b/drivers/clk/renesas/clk-emev2.c
@@ -6,7 +6,6 @@
  * Copyright (C) 2012 Magnus Damm
  */
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -74,7 +73,6 @@ static void __init emev2_smu_clkdiv_init(struct device_node *np)
 	clk = clk_register_divider(NULL, np->name, parent_name, 0,
 				   smu_base + reg[0], reg[1], 8, 0, &lock);
 	of_clk_add_provider(np, of_clk_src_simple_get, clk);
-	clk_register_clkdev(clk, np->full_name, NULL);
 	pr_debug("## %s %pOFn %p\n", __func__, np, clk);
 }
 CLK_OF_DECLARE(emev2_smu_clkdiv, "renesas,emev2-smu-clkdiv",
@@ -92,7 +90,6 @@ static void __init emev2_smu_gclk_init(struct device_node *np)
 	clk = clk_register_gate(NULL, np->name, parent_name, 0,
 				smu_base + reg[0], reg[1], 0, &lock);
 	of_clk_add_provider(np, of_clk_src_simple_get, clk);
-	clk_register_clkdev(clk, np->full_name, NULL);
 	pr_debug("## %s %pOFn %p\n", __func__, np, clk);
 }
 CLK_OF_DECLARE(emev2_smu_gclk, "renesas,emev2-smu-gclk", emev2_smu_gclk_init);
-- 
2.34.1

