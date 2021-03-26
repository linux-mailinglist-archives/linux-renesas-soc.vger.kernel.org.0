Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3CB334A6BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Mar 2021 13:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhCZMC5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Mar 2021 08:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhCZMCW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Mar 2021 08:02:22 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C4EC0613B7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Mar 2021 05:02:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by michel.telenet-ops.be with bizsmtp
        id l02F2400m53vE1T0602FZs; Fri, 26 Mar 2021 13:02:15 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAN-00AXLT-AP; Fri, 26 Mar 2021 13:02:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlAM-006cQO-9g; Fri, 26 Mar 2021 13:02:14 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/7] clk: renesas: rcar-gen3: Make cpg_z_clk.mask u32
Date:   Fri, 26 Mar 2021 13:00:55 +0100
Message-Id: <20210326120100.1577596-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326120100.1577596-1-geert+renesas@glider.be>
References: <20210326120100.1577596-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

cpg_z_clk.mask contains a mask for a 32-bit register.
Hence its size can be reduced from unsigned long to u32.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 5edc85ab04b4430f..e5edf1b908411643 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -50,8 +50,8 @@ struct cpg_z_clk {
 	struct clk_hw hw;
 	void __iomem *reg;
 	void __iomem *kick_reg;
-	unsigned long mask;
 	unsigned int fixed_div;
+	u32 mask;
 };
 
 #define to_z_clk(_hw)	container_of(_hw, struct cpg_z_clk, hw)
-- 
2.25.1

