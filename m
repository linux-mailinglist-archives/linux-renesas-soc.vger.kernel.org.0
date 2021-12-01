Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE7E4648C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 08:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347852AbhLAHg6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 02:36:58 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:27177 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1347726AbhLAHgq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 02:36:46 -0500
X-IronPort-AV: E=Sophos;i="5.87,278,1631545200"; 
   d="scan'208";a="102003014"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2021 16:33:18 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D102D41FE2BC;
        Wed,  1 Dec 2021 16:33:17 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 10/14] soc: renesas: rcar-rst: Add support for R-Car S4-8
Date:   Wed,  1 Dec 2021 16:33:04 +0900
Message-Id: <20211201073308.1003945-11-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
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
 drivers/soc/renesas/rcar-rst.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/rcar-rst.c b/drivers/soc/renesas/rcar-rst.c
index 1ad54e0c32e1..3f333b96e2b8 100644
--- a/drivers/soc/renesas/rcar-rst.c
+++ b/drivers/soc/renesas/rcar-rst.c
@@ -66,7 +66,7 @@ static const struct rst_config rcar_rst_gen3 __initconst = {
 	.set_rproc_boot_addr = rcar_rst_set_gen3_rproc_boot_addr,
 };
 
-static const struct rst_config rcar_rst_r8a779a0 __initconst = {
+static const struct rst_config rcar_rst_gen4 __initconst = {
 	.modemr = 0x00,		/* MODEMR0 and it has CPG related bits */
 };
 
@@ -101,7 +101,9 @@ static const struct of_device_id rcar_rst_matches[] __initconst = {
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

