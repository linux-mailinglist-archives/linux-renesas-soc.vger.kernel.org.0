Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973E1170994
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 21:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbgBZU2i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 15:28:38 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:19658 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727405AbgBZU2h (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 15:28:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582748914;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Ar14T0cI+vMa2Hcz/ITihl5NSuBdbM4UoBxcIxBPN6k=;
        b=ebkPo9KKQukDuc0FNJ+5azY15YPQCLZacaSG3eNML2kInZGv7syR32k2uFmNQfa9bq
        G4iU3oIk9twCwmm2gHvuZ5ejyxiN0ibYp5/7QGy0eK1Mj2BJb5q/YmIOIOstj1M9o1IC
        GPdO3j2U5Stg5t2JXWyOt/6mLhqp9Efu1xdCJE19Bniq3wCYK92dGtjiGIhJoE240AQY
        FAj9p5oTzeFxERWqKBcpqbikq4VWQOHTNmZ9+hTIqZwEz2vQ94820KLDJ5zpRpxEui09
        NCE6b6Wfy2Zm3AxWgKPpKbKIDWTK+2YAe62vR8lh/2guDGszl16No1JUl2+PLneHckJe
        fsmA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GNcd21/dZ4="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id L09b9cw1QKSNWNz
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 26 Feb 2020 21:28:23 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org,
        fabrizio.castro@bp.renesas.com,
        ramesh.shanmugasundaram@bp.renesas.com, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 01/11] clk: renesas: cpg-mssr: add support for ignore-unused clocks
Date:   Wed, 26 Feb 2020 21:28:07 +0100
Message-Id: <1582748897-17374-2-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
References: <1582748897-17374-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This adds facilities to mark clocks as "ignore used", i.e. never to be
turned off. The primary application is the RWDT clock, which needs to
remain on throughout the boot process if enabled by the bootloader.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 7 +++++++
 drivers/clk/renesas/renesas-cpg-mssr.h | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index a2663fb..31115c7 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -423,6 +423,13 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 			init.flags |= CLK_IS_CRITICAL;
 			break;
 		}
+	for (i = 0; i < info->num_used_mod_clks; i++)
+		if (id == info->used_mod_clks[i]) {
+			dev_dbg(dev, "MSTP %s setting CLK_IGNORE_UNUSED\n",
+				mod->name);
+			init.flags |= CLK_IGNORE_UNUSED;
+			break;
+		}
 
 	parent_name = __clk_get_name(parent);
 	init.parent_names = &parent_name;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 3b852ba..c76335c 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -105,6 +105,9 @@ struct device_node;
      * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
      *                 should not be disabled without a knowledgeable driver
      * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+     * @used_mod_clks: Array with Module Clock IDs of clocks that should not
+     *                 be disabled even if they seem to be unused
+     * @num_used_mod_clks: Number of entries in used_mod_clks[]
      *
      * @core_pm_clks: Array with IDs of Core Clocks that are suitable for Power
      *                Management, in addition to Module Clocks
@@ -141,6 +144,10 @@ struct cpg_mssr_info {
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
 
+	/* Module Clocks that should not be disabled even if unused */
+	const unsigned int *used_mod_clks;
+	unsigned int num_used_mod_clks;
+
 	/* Core Clocks suitable for PM, in addition to the Module Clocks */
 	const unsigned int *core_pm_clks;
 	unsigned int num_core_pm_clks;
-- 
2.7.4

