Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B49452BF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhKPHpy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:45:54 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:39793 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231389AbhKPHpq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:46 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100433343"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:38 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 68EBF40083D3;
        Tue, 16 Nov 2021 16:42:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 11/16] soc: renesas: rcar-rst: Add support for R-Car S4-8
Date:   Tue, 16 Nov 2021 16:41:25 +0900
Message-Id: <20211116074130.107554-12-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car S4-8 (R8A779F0) to the R-Car RST driver.
The register map of R-Car S4-8 is the same as R-Car V3U so that
renames "V3U" and "r8a779a0" with "Gen4".

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/rcar-rst.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 24c7466de9f2..c9f2232a1b42 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -12,7 +12,7 @@
 
 #define WDTRSTCR_RESET		0xA55A0002
 #define WDTRSTCR		0x0054
-#define V3U_WDTRSTCR		0x0010
+#define GEN4_WDTRSTCR		0x0010
 
 #define CR7BAR			0x0070
 #define CR7BAREN		BIT(4)
@@ -28,9 +28,9 @@ static int rcar_rst_enable_wdt_reset(void __iomem *base)
 	return 0;
 }
 
-static int v3u_rst_enable_wdt_reset(void __iomem *base)
+static int rcar_rst_gen4_enable_wdt_reset(void __iomem *base)
 {
-	iowrite32(WDTRSTCR_RESET, base + V3U_WDTRSTCR);
+	iowrite32(WDTRSTCR_RESET, base + GEN4_WDTRSTCR);
 	return 0;
 }
 
@@ -73,9 +73,9 @@ static const struct rst_config rcar_rst_gen3 __initconst = {
 	.set_rproc_boot_addr = rcar_rst_set_gen3_rproc_boot_addr,
 };
 
-static const struct rst_config rcar_rst_r8a779a0 __initconst = {
+static const struct rst_config rcar_rst_gen4 __initconst = {
 	.modemr = 0x00,		/* MODEMR0 and it has CPG related bits */
-	.configure = v3u_rst_enable_wdt_reset,
+	.configure = rcar_rst_gen4_enable_wdt_reset,
 };
 
 static const struct of_device_id rcar_rst_matches[] __initconst = {
@@ -109,7 +109,9 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	{ .compatible = "renesas,r8a77990-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen3 },
 	/* R-Car V3U */
-	{ .compatible = "renesas,r8a779a0-rst", .data = &rcar_rst_r8a779a0 },
+	{ .compatible = "renesas,r8a779a0-rst", .data = &rcar_rst_gen4 },
+	/* R-Car Gen4 */
+	{ .compatible = "renesas,r8a779f0-rst", .data = &rcar_rst_gen4 },
 	{ /* sentinel */ }
 };
 
-- 
2.25.1

