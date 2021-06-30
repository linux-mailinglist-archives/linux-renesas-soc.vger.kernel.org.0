Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083D73B7E1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 09:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233030AbhF3Hd1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 03:33:27 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:28915 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232785AbhF3Hd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 03:33:26 -0400
X-IronPort-AV: E=Sophos;i="5.83,311,1616425200"; 
   d="scan'208";a="85976002"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jun 2021 16:30:50 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0C41741DBA50;
        Wed, 30 Jun 2021 16:30:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 04/11] drivers: clk: renesas: r9a07g044-cpg: Add USB clocks/resets
Date:   Wed, 30 Jun 2021 08:30:06 +0100
Message-Id: <20210630073013.22415-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock/reset entries for USB PHY control, USB2.0 host and device.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->V3:
 * Added reset entries.
v1->v2:
 * Reworked on clock/reset definitions
---
 drivers/clk/renesas/r9a07g044-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 5d81e59f5cfe..d8d72fe4c513 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -96,6 +96,14 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x52c, 0),
 	DEF_MOD("dmac_pclk",	R9A07G044_DMAC_PCLK, CLK_P1_DIV2,
 				0x52c, 1),
+	DEF_MOD("usb0_host",	R9A07G044_USB_U2H0_HCLK, R9A07G044_CLK_P1,
+				0x578, 0),
+	DEF_MOD("usb1_host",	R9A07G044_USB_U2H1_HCLK, R9A07G044_CLK_P1,
+				0x578, 1),
+	DEF_MOD("usb0_device",	R9A07G044_USB_U2P_EXR_CPUCLK, R9A07G044_CLK_P1,
+				0x578, 2),
+	DEF_MOD("usb_pclk",	R9A07G044_USB_PCLK, R9A07G044_CLK_P1,
+				0x578, 3),
 	DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
 				0x580, 0),
 	DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
@@ -124,6 +132,10 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
 	DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
 	DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A07G044_USB_U2H0_HRESETN, 0x878, 0),
+	DEF_RST(R9A07G044_USB_U2H1_HRESETN, 0x878, 1),
+	DEF_RST(R9A07G044_USB_U2P_EXL_SYSRST, 0x878, 2),
+	DEF_RST(R9A07G044_USB_PRESETN, 0x878, 3),
 	DEF_RST(R9A07G044_I2C0_MRST, 0x880, 0),
 	DEF_RST(R9A07G044_I2C1_MRST, 0x880, 1),
 	DEF_RST(R9A07G044_I2C2_MRST, 0x880, 2),
-- 
2.17.1

