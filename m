Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0832B50DD44
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 11:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbiDYJ4g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 05:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240518AbiDYJ4Y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 05:56:24 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 951A6403DF;
        Mon, 25 Apr 2022 02:53:00 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="119075179"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Apr 2022 18:52:59 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CD64441D0C94;
        Mon, 25 Apr 2022 18:52:56 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/6] clk: renesas: r9a07g043: Add USB clocks/resets
Date:   Mon, 25 Apr 2022 10:52:41 +0100
Message-Id: <20220425095244.156720-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425095244.156720-1-biju.das.jz@bp.renesas.com>
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add clock/reset entries for USB PHY control, USB2.0 host and device.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index d54bccf7b61b..ea826f000d8d 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -160,6 +160,14 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x570, 6),
 	DEF_MOD("ssi3_sfr",	R9A07G043_SSI3_PCLK_SFR, R9A07G043_CLK_P0,
 				0x570, 7),
+	DEF_MOD("usb0_host",	R9A07G043_USB_U2H0_HCLK, R9A07G043_CLK_P1,
+				0x578, 0),
+	DEF_MOD("usb1_host",	R9A07G043_USB_U2H1_HCLK, R9A07G043_CLK_P1,
+				0x578, 1),
+	DEF_MOD("usb0_func",	R9A07G043_USB_U2P_EXR_CPUCLK, R9A07G043_CLK_P1,
+				0x578, 2),
+	DEF_MOD("usb_pclk",	R9A07G043_USB_PCLK, R9A07G043_CLK_P1,
+				0x578, 3),
 	DEF_COUPLED("eth0_axi",	R9A07G043_ETH0_CLK_AXI, R9A07G043_CLK_M0,
 				0x57c, 0),
 	DEF_COUPLED("eth0_chi",	R9A07G043_ETH0_CLK_CHI, R9A07G043_CLK_ZT,
@@ -206,6 +214,10 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A07G043_SSI2_RST_M2_REG, 0x870, 2),
 	DEF_RST(R9A07G043_SSI3_RST_M2_REG, 0x870, 3),
+	DEF_RST(R9A07G043_USB_U2H0_HRESETN, 0x878, 0),
+	DEF_RST(R9A07G043_USB_U2H1_HRESETN, 0x878, 1),
+	DEF_RST(R9A07G043_USB_U2P_EXL_SYSRST, 0x878, 2),
+	DEF_RST(R9A07G043_USB_PRESETN, 0x878, 3),
 	DEF_RST(R9A07G043_ETH0_RST_HW_N, 0x87c, 0),
 	DEF_RST(R9A07G043_ETH1_RST_HW_N, 0x87c, 1),
 	DEF_RST(R9A07G043_I2C0_MRST, 0x880, 0),
-- 
2.25.1

