Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEFA6E8270
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Apr 2023 22:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjDSUP1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Apr 2023 16:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbjDSUP0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Apr 2023 16:15:26 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F04DD
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Apr 2023 13:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=kuj7KDPlCuMlEeDlYKHWTEt8c/7
        6r6LpQY864v0esxo=; b=uCqIKs/TEhXbvu4ihkcD/fFgCsx7OXU7eJ80s7h/lXS
        fUxU+Vp6QkWQpBxesyNAJZvJ7QSVrxyiXsxd8k5+ipiEt6zptzJFDXguBVX+dAED
        O8R4FIlvFV4ZR7vy50yhv8aj0SHI8/H36MJbK9woxzvWDVzbZdfyVh3giP8TXwOI
        =
Received: (qmail 3803799 invoked from network); 19 Apr 2023 22:15:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Apr 2023 22:15:20 +0200
X-UD-Smtp-Session: l3s3148p1@IzYhFbb5ltMgAQnoAFlLAOz8KxVtMRMb
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U
Date:   Wed, 19 Apr 2023 22:15:11 +0200
Message-Id: <20230419201511.31648-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

V3U firmware misses to enable WDT resets. Because there won't be any
updates to the firmware anymore, enable that in Linux.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/soc/renesas/rcar-rst.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index e1c7e91f5a86..98fd97da6cd4 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -12,6 +12,7 @@
 
 #define WDTRSTCR_RESET		0xA55A0002
 #define WDTRSTCR		0x0054
+#define GEN4_WDTRSTCR		0x0010
 
 #define CR7BAR			0x0070
 #define CR7BAREN		BIT(4)
@@ -27,6 +28,12 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
 	return 0;
 }
 
+static int rcar_rst_v3u_enable_wdt_reset(void __iomem *base)
+{
+	iowrite32(WDTRSTCR_RESET, base + GEN4_WDTRSTCR);
+	return 0;
+}
+
 /*
  * Most of the R-Car Gen3 SoCs have an ARM Realtime Core.
  * Firmware boot address has to be set in CR7BAR before
@@ -66,6 +73,12 @@ static const struct rst_config rcar_rst_gen3 __initconst = {
 	.set_rproc_boot_addr = rcar_rst_set_gen3_rproc_boot_addr,
 };
 
+/* V3U firmware doesn't enable WDT reset and there won't be updates anymore */
+static const struct rst_config rcar_rst_v3u __initconst = {
+	.modemr = 0x00,		/* MODEMR0 and it has CPG related bits */
+	.configure = rcar_rst_v3u_enable_wdt_reset,
+};
+
 static const struct rst_config rcar_rst_gen4 __initconst = {
 	.modemr = 0x00,		/* MODEMR0 and it has CPG related bits */
 };
@@ -101,7 +114,7 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	{ .compatible = "renesas,r8a77990-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen3 },
 	/* R-Car Gen4 */
-	{ .compatible = "renesas,r8a779a0-rst", .data = &rcar_rst_gen4 },
+	{ .compatible = "renesas,r8a779a0-rst", .data = &rcar_rst_v3u },
 	{ .compatible = "renesas,r8a779f0-rst", .data = &rcar_rst_gen4 },
 	{ .compatible = "renesas,r8a779g0-rst", .data = &rcar_rst_gen4 },
 	{ /* sentinel */ }
-- 
2.35.1

