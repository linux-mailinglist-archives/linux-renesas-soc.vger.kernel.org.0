Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D991FBBBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2020 18:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730786AbgFPQ3k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jun 2020 12:29:40 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:27423 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729167AbgFPQ3j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 12:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592324977;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5rLze8ETBM66W9eUWsBWbpRpC1OnX9lhrFGmWOBpeY8=;
        b=BPX2NBTLqBFt0zn3h+xmE6WkrjVt1s4Uk8KbAxJTx9tmGCdr7fo6PkxzwsFDCrcXxG
        Ijdjckfv2kRA9X+Vvnu8vDFPqZeIrkHKgNKsi/64gy3Sp2r2wxWkRc32jNW9dwH23ZGO
        VCwxsiwb/m4btnj7uWWytRgpkRR05lkfqn/c07lPs5Lcqbbbv9s/swgf6TBkr0mlKzdb
        vFOOFQEcEEWLDzxVEMQUrMCeGosZW1kuDZloEzWx5ns4co+/xa6ujlepIL9wxayzOZPw
        kybGksqPfodlhojOHRelPcw1/20SVqqAENED9//P2O9Y3pNy4pn2ZPKTHwp/aCbcpU+b
        75xw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8WdEaEuFwQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id a0ab6bw5GGQbFwS
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 16 Jun 2020 18:26:37 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, wsa@the-dreams.de, geert@linux-m68k.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v4 1/3] clk: renesas: cpg-mssr: mark clocks as critical only if on at boot
Date:   Tue, 16 Jun 2020 18:26:24 +0200
Message-Id: <20200616162626.27944-2-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616162626.27944-1-uli+renesas@fpond.eu>
References: <20200616162626.27944-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This allows us to add the RWDT clock to the list of critical clocks without
keeping it enabled needlessly if not used.

Changing the semantics of crit_mod_clks in this way is safe for the current
user (INTC-AP) because it is never off at boot time.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index dcb6e2706d37..4648a829db66 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -416,14 +416,6 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	init.name = mod->name;
 	init.ops = &cpg_mstp_clock_ops;
 	init.flags = CLK_SET_RATE_PARENT;
-	for (i = 0; i < info->num_crit_mod_clks; i++)
-		if (id == info->crit_mod_clks[i]) {
-			dev_dbg(dev, "MSTP %s setting CLK_IS_CRITICAL\n",
-				mod->name);
-			init.flags |= CLK_IS_CRITICAL;
-			break;
-		}
-
 	parent_name = __clk_get_name(parent);
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -432,6 +424,15 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	clock->priv = priv;
 	clock->hw.init = &init;
 
+	for (i = 0; i < info->num_crit_mod_clks; i++)
+		if (id == info->crit_mod_clks[i] &&
+		    cpg_mstp_clock_is_enabled(&clock->hw)) {
+			dev_dbg(dev, "MSTP %s setting CLK_IS_CRITICAL\n",
+				mod->name);
+			init.flags |= CLK_IS_CRITICAL;
+			break;
+		}
+
 	clk = clk_register(NULL, &clock->hw);
 	if (IS_ERR(clk))
 		goto fail;
-- 
2.20.1

