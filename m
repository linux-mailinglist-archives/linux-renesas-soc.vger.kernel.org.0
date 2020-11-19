Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4282B92D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Nov 2020 13:55:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgKSMvB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Nov 2020 07:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgKSMvB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 07:51:01 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB44C0613D4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 04:51:00 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id uCqx230034C55Sk01CqxKH; Thu, 19 Nov 2020 13:50:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfjOq-003poU-SC; Thu, 19 Nov 2020 13:50:56 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfjOq-00H3hJ-7X; Thu, 19 Nov 2020 13:50:56 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, linux-renesas-soc@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: sh73a0: Stop using __raw_*() I/O accessors
Date:   Thu, 19 Nov 2020 13:50:53 +0100
Message-Id: <20201119125053.4065746-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no reason to keep on using the __raw_{read,write}l() I/O
accessors in Renesas ARM driver code.  Switch to using the plain
{read,write}l() I/O accessors, to have a chance that this works on
big-endian.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v5.11.

 drivers/clk/renesas/clk-sh73a0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/clk-sh73a0.c b/drivers/clk/renesas/clk-sh73a0.c
index 5f25a70bc61c4046..4146c1d717b96f93 100644
--- a/drivers/clk/renesas/clk-sh73a0.c
+++ b/drivers/clk/renesas/clk-sh73a0.c
@@ -121,7 +121,7 @@ sh73a0_cpg_register_clock(struct device_node *np, struct sh73a0_cpg *cpg,
 			(phy_no ? CPG_DSI1PHYCR : CPG_DSI0PHYCR);
 
 		parent_name = phy_no ? "dsi1pck" : "dsi0pck";
-		mult = __raw_readl(dsi_reg);
+		mult = readl(dsi_reg);
 		if (!(mult & 0x8000))
 			mult = 1;
 		else
-- 
2.25.1

