Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9EE4B8F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 14:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfFSMoG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 08:44:06 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:48262 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbfFSMoG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:44:06 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id Sck22000e3XaVaC06ck3wV; Wed, 19 Jun 2019 14:44:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdZwY-00041U-SG; Wed, 19 Jun 2019 14:44:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hdZwY-0003G4-QL; Wed, 19 Jun 2019 14:44:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Use [] to denote a flexible array member
Date:   Wed, 19 Jun 2019 14:44:01 +0200
Message-Id: <20190619124401.12478-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Flexible array members should be denoted using [] instead of [0], else
gcc will not warn when they are no longer at the end of the structure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.3.

 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 7c241ff3ae2f0153..52bbb9ce3807db31 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -450,7 +450,7 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 struct cpg_mssr_clk_domain {
 	struct generic_pm_domain genpd;
 	unsigned int num_core_pm_clks;
-	unsigned int core_pm_clks[0];
+	unsigned int core_pm_clks[];
 };
 
 static struct cpg_mssr_clk_domain *cpg_mssr_clk_domain;
-- 
2.17.1

