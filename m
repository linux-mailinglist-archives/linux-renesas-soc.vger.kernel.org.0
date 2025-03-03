Return-Path: <linux-renesas-soc+bounces-13893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95883A4BD75
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 12:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01333175013
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 11:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE3A1F30BB;
	Mon,  3 Mar 2025 11:04:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC253FFD;
	Mon,  3 Mar 2025 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999892; cv=none; b=kh761QbP/Woq32KgpvqA6dL+ZqqOLTCycJYT+/qzVkokiB8ZhT+6t/1KSxY8D6jTcT0to4joXRPLrt4CNDU1GgAOP65H0ErP8BOlZzk+n5KpQrbw4MDGe/449ONdnFM1rCAHz/OrBsr6GriJfrU++9WKRi/mFZGrTroHOEMLP8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999892; c=relaxed/simple;
	bh=Th/LN0GZJEXOiYGsQhrigkVAWivgLdHq4P7FSbuCiwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVS3HFp5UJYsEQkI0IvfRWajDn4vA9rcCTwhKt3ywcaw1ptf+tI/jebB8NHZX+sldglPZpfM/ECvm8ySWQIf0LrWQsJVtXLBOqcbRGrCydSgmc8WmXR/n1Be3RG3/9UfvvoFriTFJwJ0UWp2HXshvMptnMdsZ+FZJtwCxAaaEzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: luFxIBJ3Sq6Sx7LXgkDy2Q==
X-CSE-MsgGUID: PWHJKa2eQM2+ihYHiuKLBA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Mar 2025 20:04:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.114])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8979A400CF09;
	Mon,  3 Mar 2025 20:04:42 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/4] clk: renesas: rzv2h-cpg: Add support for static dividers
Date: Mon,  3 Mar 2025 11:04:20 +0000
Message-ID: <20250303110433.76576-3-biju.das.jz@bp.renesas.com>
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

Add support for static dividers that does not need rmw operation.
This will avoid unnecessary memory allocation and using associated
legacy APIs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 29 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |  7 +++++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 19fe225d48ed..42a517e11d42 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -349,6 +349,32 @@ rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
 	return div->hw.clk;
 }
 
+static struct clk * __init
+rzv2h_cpg_sdiv_clk_register(const struct cpg_core_clk *core, struct rzv2h_cpg_priv *priv)
+{
+	struct ddiv cfg_ddiv = core->cfg.ddiv;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_hw *clk_hw;
+
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	parent_name = __clk_get_name(parent);
+	clk_hw = clk_hw_register_divider_table(priv->dev, core->name,
+					       parent_name, 0,
+					       priv->base + cfg_ddiv.offset,
+					       cfg_ddiv.shift, cfg_ddiv.width,
+					       core->flag, core->dtable,
+					       &priv->rmw_lock);
+
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+}
+
 static struct clk * __init
 rzv2h_cpg_mux_clk_register(const struct cpg_core_clk *core,
 			   struct rzv2h_cpg_priv *priv)
@@ -451,6 +477,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_DDIV:
 		clk = rzv2h_cpg_ddiv_clk_register(core, priv);
 		break;
+	case CLK_TYPE_SDIV:
+		clk = rzv2h_cpg_sdiv_clk_register(core, priv);
+		break;
 	case CLK_TYPE_SMUX:
 		clk = rzv2h_cpg_mux_clk_register(core, priv);
 		break;
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 4a568fef905d..1905e3a4afad 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -115,6 +115,7 @@ enum clk_types {
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_PLL,
 	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
+	CLK_TYPE_SDIV,		/* Static Switching Divider */
 	CLK_TYPE_SMUX,		/* Static Mux */
 };
 
@@ -142,6 +143,12 @@ enum clk_types {
 		.flag = CLK_DIVIDER_HIWORD_MASK)
 #define DEF_CSDIV(_name, _id, _parent, _ddiv_packed, _dtable) \
 	DEF_DDIV(_name, _id, _parent, _ddiv_packed, _dtable)
+#define DEF_SDIV(_name, _id, _parent, _ddiv_packed, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_SDIV, \
+		.cfg.ddiv = _ddiv_packed, \
+		.parent = _parent, \
+		.dtable = _dtable, \
+		.flag = CLK_DIVIDER_HIWORD_MASK)
 #define DEF_SMUX(_name, _id, _smux_packed, _parent_names) \
 	DEF_TYPE(_name, _id, CLK_TYPE_SMUX, \
 		 .cfg.smux = _smux_packed, \
-- 
2.43.0


