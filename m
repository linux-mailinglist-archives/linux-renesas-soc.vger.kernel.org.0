Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9D0115104
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 14:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfLFNc6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 08:32:58 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:60070 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfLFNc6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 08:32:58 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id adYw210015USYZQ01dYwqB; Fri, 06 Dec 2019 14:32:56 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1idDj5-0006IU-U6; Fri, 06 Dec 2019 14:32:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1idDj5-0006Cb-SP; Fri, 06 Dec 2019 14:32:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rcar-gen2: Change multipliers and dividers to u8
Date:   Fri,  6 Dec 2019 14:32:54 +0100
Message-Id: <20191206133254.23800-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All multipliers and dividers are small.
Storing them in u8 instead of unsigned int reduces kernel size for a
generic kernel by ca. 0.5 KiB.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.6.

 drivers/clk/renesas/rcar-gen2-cpg.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen2-cpg.h b/drivers/clk/renesas/rcar-gen2-cpg.h
index db2f57ef2f9984e4..bdcd4a38d48d01bd 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.h
+++ b/drivers/clk/renesas/rcar-gen2-cpg.h
@@ -24,10 +24,10 @@ enum rcar_gen2_clk_types {
 };
 
 struct rcar_gen2_cpg_pll_config {
-	unsigned int extal_div;
-	unsigned int pll1_mult;
-	unsigned int pll3_mult;
-	unsigned int pll0_mult;		/* leave as zero if PLL0CR exists */
+	u8 extal_div;
+	u8 pll1_mult;
+	u8 pll3_mult;
+	u8 pll0_mult;		/* leave as zero if PLL0CR exists */
 };
 
 struct clk *rcar_gen2_cpg_clk_register(struct device *dev,
-- 
2.17.1

