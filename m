Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5AE1CE089
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2020 18:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbgEKQeN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 May 2020 12:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729862AbgEKQeM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 May 2020 12:34:12 -0400
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07D8C061A0E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2020 09:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589214850;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=hbrqknp06hHC2yN/4tJ+lPcOR/9UMabiIYaIJlb7+Fs=;
        b=T5NasMOyG89vwFPoQF5et5vCdy3p5WK54ZNssVqxWKWG4BfaYTKp+IYbjfgr1DqzPE
        RzcqRC2zJQ2jJVxikf+zYMA3qiRscuqvkkBUhwqkDuZOYg82xfSVcSgfDp0Je69+2vja
        VscCljijDmQnXDpHVL9enyl3m9QyW/khojP4x6ppv8YDz+tGBHLa3/id9IQr5STlocqV
        B8m++XHvc9H6x5ibRCQOsTkTuhmzIePy/Mp9hFnBH0WhRhTzV2ExEbC87hRb1lxLH+pk
        WQdUfbsFSODCHdO+j6Lj/7elKPY1zHCjhWjAGR4gbEFormcbpoTuKJEHIL66uRYji+dr
        YkEg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR92REa5ElWg=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id Z0acdaw4BGY8DFr
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 11 May 2020 18:34:08 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, magnus.damm@gmail.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 1/3] clk: renesas: cpg-mssr: add support for never-disable clocks
Date:   Mon, 11 May 2020 18:33:56 +0200
Message-Id: <1589214838-18075-2-git-send-email-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589214838-18075-1-git-send-email-uli+renesas@fpond.eu>
References: <1589214838-18075-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This adds facilities to mark clocks as never to be turned off. The primary
application is the RWDT clock, which needs to remain on throughout the boot
process if enabled by the bootloader.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 10 ++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.h |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 8f6dff3..e234156 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -152,11 +152,13 @@ static struct cpg_mssr_priv *cpg_mssr_priv;
  * @hw: handle between common and hardware-specific interfaces
  * @index: MSTP clock number
  * @priv: CPG/MSSR private data
+ * @never_disable: clock shall never be disabled
  */
 struct mstp_clock {
 	struct clk_hw hw;
 	u32 index;
 	struct cpg_mssr_priv *priv;
+	bool never_disable;
 };
 
 #define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
@@ -175,6 +177,9 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 
 	dev_dbg(dev, "MSTP %u%02u/%pC %s\n", reg, bit, hw->clk,
 		enable ? "ON" : "OFF");
+	if (!enable && clock->never_disable)
+		return 0;
+
 	spin_lock_irqsave(&priv->rmw_lock, flags);
 
 	if (priv->stbyctrl) {
@@ -423,6 +428,11 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 			init.flags |= CLK_IS_CRITICAL;
 			break;
 		}
+	for (i = 0; i < info->num_never_disable_mod_clks; i++)
+		if (id == info->never_disable_mod_clks[i]) {
+			clock->never_disable = true;
+			break;
+		}
 
 	parent_name = __clk_get_name(parent);
 	init.parent_names = &parent_name;
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 55a18ef..654d3a789 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -105,6 +105,11 @@ struct device_node;
      * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
      *                 should not be disabled without a knowledgeable driver
      * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+     * @never_disable_mod_clks: Array with Module Clock IDs of clocks that
+     *                          should not be disabled even if they seem to
+     *                          be unused
+     * @num_never_disable_mod_clks: Number of entries in
+     *                              never_disable_mod_clks[]
      *
      * @core_pm_clks: Array with IDs of Core Clocks that are suitable for Power
      *                Management, in addition to Module Clocks
@@ -141,6 +146,10 @@ struct cpg_mssr_info {
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
 
+	/* Module Clocks that should not be disabled even if unused */
+	const unsigned int *never_disable_mod_clks;
+	unsigned int num_never_disable_mod_clks;
+
 	/* Core Clocks suitable for PM, in addition to the Module Clocks */
 	const unsigned int *core_pm_clks;
 	unsigned int num_core_pm_clks;
-- 
2.7.4

