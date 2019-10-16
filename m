Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D285CD94F7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 17:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbfJPPHQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 11:07:16 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:43862 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbfJPPHQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 11:07:16 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id EF7D2100s05gfCL01F7DDQ; Wed, 16 Oct 2019 17:07:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKktN-0003un-Q2; Wed, 16 Oct 2019 17:07:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKktN-0007tW-Nb; Wed, 16 Oct 2019 17:07:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a77965: Remove superfluous semicolon
Date:   Wed, 16 Oct 2019 17:07:11 +0200
Message-Id: <20191016150711.30305-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no need to terminate a function with a semicolon.  Remove it.

Reported-by: Biju Das <biju.das@bp.renesas.com>
Fixes: 7ce36da900c0a2ff ("clk: renesas: cpg-mssr: Add support for R-Car M3-N")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.5.

 drivers/clk/renesas/r8a77965-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index b4e8c5b7d515635d..b3af4da2ca74b15d 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -323,7 +323,7 @@ static int __init r8a77965_cpg_mssr_init(struct device *dev)
 	}
 
 	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
-};
+}
 
 const struct cpg_mssr_info r8a77965_cpg_mssr_info __initconst = {
 	/* Core Clocks */
-- 
2.17.1

