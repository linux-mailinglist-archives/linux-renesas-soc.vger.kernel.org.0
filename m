Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7737729FBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jun 2023 18:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242132AbjFIQLY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Jun 2023 12:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242145AbjFIQLT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2023 12:11:19 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B005135AA
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jun 2023 09:10:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
        by baptiste.telenet-ops.be with bizsmtp
        id 74Aw2A00512zQ4r014Aw0J; Fri, 09 Jun 2023 18:10:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7eh7-008M0b-Bi;
        Fri, 09 Jun 2023 18:10:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7ehU-00GDYH-CN;
        Fri, 09 Jun 2023 18:10:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/3] staging: board: Remove KZM9D board staging code
Date:   Fri,  9 Jun 2023 18:10:50 +0200
Message-Id: <ac93c6e1c09decbd7dfd3b78cc6cee88e0c6fd67.1686325857.git.geert+renesas@glider.be>
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

With the EMMA Mobile USB Gadget staging driver removed, there is no
longer any use for the EMEV2 KZM9D board staging code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/staging/board/Makefile |  1 -
 drivers/staging/board/kzm9d.c  | 26 --------------------------
 2 files changed, 27 deletions(-)
 delete mode 100644 drivers/staging/board/kzm9d.c

diff --git a/drivers/staging/board/Makefile b/drivers/staging/board/Makefile
index ed7839752e129abb..5db091b5ca01596a 100644
--- a/drivers/staging/board/Makefile
+++ b/drivers/staging/board/Makefile
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-y	:= board.o
-obj-$(CONFIG_ARCH_EMEV2)	+= kzm9d.o
 obj-$(CONFIG_ARCH_R8A7740)	+= armadillo800eva.o
diff --git a/drivers/staging/board/kzm9d.c b/drivers/staging/board/kzm9d.c
deleted file mode 100644
index d449a837414e6934..0000000000000000
--- a/drivers/staging/board/kzm9d.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Staging board support for KZM9D. Enable not-yet-DT-capable devices here. */
-
-#include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include "board.h"
-
-static struct resource usbs1_res[] __initdata = {
-	DEFINE_RES_MEM(0xe2800000, 0x2000),
-	DEFINE_RES_IRQ(159),
-};
-
-static void __init kzm9d_init(void)
-{
-	board_staging_gic_setup_xlate("arm,pl390", 32);
-
-	if (!board_staging_dt_node_available(usbs1_res,
-					     ARRAY_SIZE(usbs1_res))) {
-		board_staging_gic_fixup_resources(usbs1_res,
-						  ARRAY_SIZE(usbs1_res));
-		platform_device_register_simple("emxx_udc", -1, usbs1_res,
-						ARRAY_SIZE(usbs1_res));
-	}
-}
-
-board_staging("renesas,kzm9d", kzm9d_init);
-- 
2.34.1

