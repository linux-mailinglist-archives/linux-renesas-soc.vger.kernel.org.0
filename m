Return-Path: <linux-renesas-soc+bounces-31843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEykFad182mt4AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:30:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EAF4A4CCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 17:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 715CC301545E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 15:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318D42D9ECD;
	Thu, 30 Apr 2026 15:20:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E98221721;
	Thu, 30 Apr 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562428; cv=none; b=qGAEQx/t8WyHGnW7PESUTRliqirczQidBofqjJk9dqZSYQkEKqW7M2IjxQiOEOyCYEGV12D5Lp4PMCPsDUn7/JeAnMHP3wGrqnxCE6Ev51hDqwEAUESRtX/2nTklHH8hncGpELD108zerfmHGv9Zh1lbgOW0sY1UOALTZs5cHWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562428; c=relaxed/simple;
	bh=UXdgL7Io2m47hjEgzyGGcAaNUDvLFCqeVjmlOvOayeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aR+4KYZeyQZ3sZr/A8A+hAEK9NzqSpQwCJC5zjqR/5eOW1Krkj8YUJKRWTz1IMqXkXhUfaWBj2IwDs0/bX8RUhCxzsMB91gapCAFlKDYJFdziPhJDIdxNnoV7UN31SzxA4ur2F0yUG91jW425llzJSYMRGOcbm27PnKFKA0QIUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7695EC2BCB9;
	Thu, 30 Apr 2026 15:20:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] clk: renesas: rzg2l: Refactor rzg3l_cpg_pll_clk_endisable()
Date: Thu, 30 Apr 2026 17:20:18 +0200
Message-ID: <9cda94b9b37c562a305f4dd6091fd71246764fd2.1777562043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777562043.git.geert+renesas@glider.be>
References: <cover.1777562043.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F1EAF4A4CCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31843-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.303];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Reduce duplication by introducing mon_mask.
Eliminate an else branch by moving common parts into variable
pre-initializations.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
No change in generated code.
---
 drivers/clk/renesas/rzg2l-cpg.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f98b6eb4f501c676..426e93dc7a9891bf 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1197,27 +1197,25 @@ static int rzg3l_cpg_pll_clk_endisable(struct clk_hw *hw, bool enable)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
 	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	u32 mon_mask = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
+	u32 val = RZG3L_PLL_STBY_RESETB_WEN;
 	u32 stby_offset, mon_offset;
-	u32 val, mon_val;
+	u32 mon_val = 0;
 	int ret;
 
 	stby_offset = RZG3L_PLL_STBY_OFFSET(pll_clk->conf);
 	mon_offset = RZG3L_PLL_MON_OFFSET(pll_clk->conf);
 
 	if (enable) {
-		val = RZG3L_PLL_STBY_RESETB_WEN | RZG3L_PLL_STBY_RESETB;
-		mon_val = RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK;
-	} else {
-		val = RZG3L_PLL_STBY_RESETB_WEN;
-		mon_val = 0;
+		val |= RZG3L_PLL_STBY_RESETB;
+		mon_val = mon_mask;
 	}
 
 	writel(val, priv->base + stby_offset);
 
 	/* ensure PLL is in normal/standby mode */
-	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val, mon_val ==
-					(val & (RZG3L_PLL_MON_RESETB | RZG3L_PLL_MON_LOCK)),
-					10, 100);
+	ret = readl_poll_timeout_atomic(priv->base + mon_offset, val,
+					mon_val == (val & mon_mask), 10, 100);
 	if (ret)
 		dev_err(priv->dev, "Failed to %s PLL 0x%x/%pC\n", enable ?
 			"enable" : "disable", stby_offset, hw->clk);
-- 
2.43.0


