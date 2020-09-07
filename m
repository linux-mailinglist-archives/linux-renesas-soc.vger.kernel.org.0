Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E7F25F648
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 11:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbgIGJUW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 05:20:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:52715 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728382AbgIGJUO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 05:20:14 -0400
X-IronPort-AV: E=Sophos;i="5.76,401,1592838000"; 
   d="scan'208";a="56565801"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Sep 2020 18:20:09 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1B0FE40065CD;
        Mon,  7 Sep 2020 18:20:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 11/14] soc: renesas: rcar-rst: Add support for R-Car V3U
Date:   Mon,  7 Sep 2020 18:19:47 +0900
Message-Id: <1599470390-29719-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for R-Car V3U (R8A779A0) to the R-Car RST driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/soc/renesas/rcar-rst.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index a932015..8a1e402 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -37,6 +37,10 @@ static const struct rst_config rcar_rst_gen3 __initconst = {
 	.modemr = 0x60,
 };
 
+static const struct rst_config rcar_rst_r8a779a0 __initconst = {
+	.modemr = 0x00,		/* MODEMR0 and it has CPG related bits */
+};
+
 static const struct of_device_id rcar_rst_matches[] __initconst = {
 	/* RZ/G1 is handled like R-Car Gen2 */
 	{ .compatible = "renesas,r8a7742-rst", .data = &rcar_rst_gen2 },
@@ -67,6 +71,8 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
 	{ .compatible = "renesas,r8a77980-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77990-rst", .data = &rcar_rst_gen3 },
 	{ .compatible = "renesas,r8a77995-rst", .data = &rcar_rst_gen3 },
+	/* R-Car V3U */
+	{ .compatible = "renesas,r8a779a0-rst", .data = &rcar_rst_r8a779a0 },
 	{ /* sentinel */ }
 };
 
-- 
2.7.4

