Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 238787EAFC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Nov 2023 13:23:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbjKNMXG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Nov 2023 07:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjKNMXF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 07:23:05 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E2DB1D1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 04:23:01 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.03,302,1694703600"; 
   d="scan'208";a="186728998"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 14 Nov 2023 21:23:00 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A49F9400B9E1;
        Tue, 14 Nov 2023 21:23:00 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] clk: renesas: r8a779g0: Add PCIe clocks
Date:   Tue, 14 Nov 2023 21:22:52 +0900
Message-Id: <20231114122252.2266799-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the PCIe module clocks, which are used by the PCIe modules on the
Renesas R-Car V4H (R8A779G0) SoC. Note that the following descriptions
in the hardware manual Rev.0.81 are incorrect about the PCIe module
clocks:

9.2.1.7 Software Reset Register 6 (SRCR6)
9.2.1.12 Software Reset Register 11 (SRCR11)
9.2.3.7 Module Stop Control Register 6 (MSTPCR6)

Instead of that, please refer to the Figure 104.3[ab].

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
index 7cc580d67362..31c67f429778 100644
--- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
@@ -192,6 +192,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
 	DEF_MOD("msi3",		621,	R8A779G0_CLK_MSO),
 	DEF_MOD("msi4",		622,	R8A779G0_CLK_MSO),
 	DEF_MOD("msi5",		623,	R8A779G0_CLK_MSO),
+	DEF_MOD("pciec0",	624,	R8A779G0_CLK_S0D2_HSC),
+	DEF_MOD("pscie1",	625,	R8A779G0_CLK_S0D2_HSC),
 	DEF_MOD("pwm",		628,	R8A779G0_CLK_SASYNCPERD4),
 	DEF_MOD("rpc-if",	629,	R8A779G0_CLK_RPCD2),
 	DEF_MOD("scif0",	702,	R8A779G0_CLK_SASYNCPERD4),
-- 
2.25.1

