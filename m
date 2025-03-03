Return-Path: <linux-renesas-soc+bounces-13891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CACA4BD97
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 12:11:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 198FB3B7F2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 11:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C87F1F2BA1;
	Mon,  3 Mar 2025 11:04:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207141F0E28;
	Mon,  3 Mar 2025 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999891; cv=none; b=KUf6MQx5vCBZH2uYFn9p05k/iXAjC8x3jrvPdyLYXXcva7Su+46zabjqNiUA1E4iWZeKCtMLvNbxAExucy0oGgSpXrCdpCoqShWCntioeP8m53auJ1gCsGNxxeGl+A32ZWyFZiFjq1gIJbhrnF1RbPrICombt8DxA2KWlkJJcUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999891; c=relaxed/simple;
	bh=YTEC9C2lxx6vdWNDbHY2an1d4VqQrA4e6lN8v9ExKxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDNJ7qzCQWlSu37NdNk7VYmaRYZMG9tpK6ZbFs6DRrj10n4+0KepNv9e/wFvw+okAZqZNddluCg/EvCWKpuI7VqNf3ZY3f2Kd2DdV7ROHFiEA6b13Nob7qFdqyUMj6Qfr0WeRd1Qmc86KF1xisc9r0vGRisx1mt3Oi15+MbRmQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: KTvHfodVRQeHmR3qyGn9dQ==
X-CSE-MsgGUID: uxae/2MbSn6yzSIsLlmWbw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Mar 2025 20:04:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.114])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9A7DB400C742;
	Mon,  3 Mar 2025 20:04:39 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/4] clk: renesas: rzv2h-cpg: Add support for coupled clock
Date: Mon,  3 Mar 2025 11:04:19 +0000
Message-ID: <20250303110433.76576-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
References: <20250303110433.76576-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spi and spix2 clk share same bit for clock gating. Add support
for coupled clock with checking the monitor bit for both the clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 83 ++++++++++++++++++++++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h | 19 ++++++--
 2 files changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 469d29549e8e..19fe225d48ed 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -111,6 +111,8 @@ struct pll_clk {
  * @on_bit: ON/MON bit
  * @mon_index: monitor register offset
  * @mon_bit: montor bit
+ * @enabled: soft state of the clock, if it is coupled with another clock
+ * @sibling: pointer to the other coupled clock
  */
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
@@ -121,6 +123,8 @@ struct mod_clock {
 	u8 on_bit;
 	s8 mon_index;
 	u8 mon_bit;
+	bool enabled;
+	struct mod_clock *sibling;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
@@ -573,11 +577,56 @@ static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
 
 static int rzv2h_mod_clock_enable(struct clk_hw *hw)
 {
-	return rzv2h_mod_clock_endisable(hw, true);
+	struct mod_clock *clock = to_mod_clock(hw);
+	int ret;
+
+	if (clock->sibling) {
+		struct rzv2h_cpg_priv *priv = clock->priv;
+		unsigned long flags;
+		bool enabled;
+
+		spin_lock_irqsave(&priv->rmw_lock, flags);
+		enabled = clock->sibling->enabled;
+		clock->enabled = true;
+		spin_unlock_irqrestore(&priv->rmw_lock, flags);
+		if (enabled) {
+			ret = rzv2h_mod_clock_is_enabled(&clock->hw);
+			if (!ret) {
+				dev_err(priv->dev, "Failed CLK_MON_ON 0x%x/%pC\n",
+					GET_CLK_MON_OFFSET(clock->mon_index), hw->clk);
+				ret = -ETIMEDOUT;
+			} else {
+				ret = 0;
+			}
+
+			return ret;
+		}
+	}
+
+	ret = rzv2h_mod_clock_endisable(hw, true);
+	if (ret)
+		clock->enabled = false;
+
+	return ret;
 }
 
 static void rzv2h_mod_clock_disable(struct clk_hw *hw)
 {
+	struct mod_clock *clock = to_mod_clock(hw);
+
+	if (clock->sibling) {
+		struct rzv2h_cpg_priv *priv = clock->priv;
+		unsigned long flags;
+		bool enabled;
+
+		spin_lock_irqsave(&priv->rmw_lock, flags);
+		enabled = clock->sibling->enabled;
+		clock->enabled = false;
+		spin_unlock_irqrestore(&priv->rmw_lock, flags);
+		if (enabled)
+			return;
+	}
+
 	rzv2h_mod_clock_endisable(hw, false);
 }
 
@@ -587,6 +636,28 @@ static const struct clk_ops rzv2h_mod_clock_ops = {
 	.is_enabled = rzv2h_mod_clock_is_enabled,
 };
 
+static struct mod_clock
+*rzv2h_mod_clock_get_sibling(struct mod_clock *clock,
+			     struct rzv2h_cpg_priv *priv)
+{
+	struct clk_hw *hw;
+	unsigned int i;
+
+	for (i = 0; i < priv->num_mod_clks; i++) {
+		struct mod_clock *clk;
+
+		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
+			continue;
+
+		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
+		clk = to_mod_clock(hw);
+		if (clock->on_index == clk->on_index && clock->on_bit == clk->on_bit)
+			return clk;
+	}
+
+	return NULL;
+}
+
 static void __init
 rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 			   struct rzv2h_cpg_priv *priv)
@@ -642,6 +713,16 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	}
 
 	priv->clks[id] = clock->hw.clk;
+	if (mod->is_coupled) {
+		struct mod_clock *sibling;
+
+		clock->enabled = rzv2h_mod_clock_is_enabled(&clock->hw);
+		sibling = rzv2h_mod_clock_get_sibling(clock, priv);
+		if (sibling) {
+			clock->sibling = sibling;
+			sibling->sibling = clock;
+		}
+	}
 
 	/*
 	 * Ensure the module clocks and MSTOP bits are synchronized when they are
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index b0e32e0c9ffd..4a568fef905d 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -162,6 +162,7 @@ enum clk_types {
  * @on_bit: ON bit
  * @mon_index: monitor register index
  * @mon_bit: monitor bit
+ * @is_coupled: flag to indicate coupled clock
  */
 struct rzv2h_mod_clk {
 	const char *name;
@@ -173,9 +174,11 @@ struct rzv2h_mod_clk {
 	u8 on_bit;
 	s8 mon_index;
 	u8 mon_bit;
+	bool is_coupled;
 };
 
-#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, _onbit, _monindex, _monbit) \
+#define DEF_MOD_BASE(_name, _mstop, _parent, _critical, _no_pm, _onindex, \
+		     _onbit, _monindex, _monbit, _iscoupled) \
 	{ \
 		.name = (_name), \
 		.mstop_data = (_mstop), \
@@ -186,16 +189,24 @@ struct rzv2h_mod_clk {
 		.on_bit = (_onbit), \
 		.mon_index = (_monindex), \
 		.mon_bit = (_monbit), \
+		.is_coupled = (_iscoupled), \
 	}
 
 #define DEF_MOD(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, \
+		     _monindex, _monbit, false)
 
 #define DEF_MOD_CRITICAL(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, true, false, _onindex, _onbit, \
+		     _monindex, _monbit, false)
 
 #define DEF_MOD_NO_PM(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
-	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, _monindex, _monbit)
+	DEF_MOD_BASE(_name, _mstop, _parent, false, true, _onindex, _onbit, \
+		     _monindex, _monbit, false)
+
+#define DEF_COUPLED(_name, _parent, _onindex, _onbit, _monindex, _monbit, _mstop) \
+	DEF_MOD_BASE(_name, _mstop, _parent, false, false, _onindex, _onbit, \
+		     _monindex, _monbit, true)
 
 /**
  * struct rzv2h_reset - Reset definitions
-- 
2.43.0


