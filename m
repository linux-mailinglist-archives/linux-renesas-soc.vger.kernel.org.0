Return-Path: <linux-renesas-soc+bounces-34251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0yMVHSpyNWpewgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:45:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0AC6A71C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:45:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LyR189cA;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D794931117EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26503C09E2;
	Fri, 19 Jun 2026 16:40:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C233BAD81
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 16:40:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887237; cv=none; b=O08remLqZnDhV1tIByLLZBmKKSZPTJ2kXf92yuDqnWFLgHP8n6bH1Vd0KfDHzWuZlji8fdoOjXRRaOiwDcRvkEANFy/ea/hH/AMRGfAfYHspZZlJ9aw+uZWnAeoIUrJ8blXOEDKGOeCAiTZkQ/rJPrjgguxxrbmPwfepMnHNGlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887237; c=relaxed/simple;
	bh=tzHXJNSUA4oXE/JI+C8CWyxTTWTRKAu4ciL6cK9VHgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBKBkxBSULw9kWGmpD4q5klaae3nQBErW39+jex81xMCXzoS1pocDkIqf2TRGG/vi5nlyOlD4kdnM20vPTli1ka84C4AdDjb0qQIvH2RVjJp7AeHrXX5BD4hnDoRfDJ/KqKHnjTR694NQl65shKEBxk1yXeZkh86vdV7d0Hrr5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyR189cA; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49222b6e871so19578505e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887234; x=1782492034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Y/ztSfBKRXyewnzGPkwER5TG21hOZ1QT6hHM+tMxzw=;
        b=LyR189cAaaWY32SNpfn3MW6u4CkWICKD6OS2u8U5oAG3HbgjxQkhErvsD9gMBp/20b
         O709FMprIo1742wqImcBkQZ7ymbgrOqQY0ICxAT0NQ+e1sU90Ec8n8alQ3KiLUe7tiPM
         0HdG33BewOKiU0TtICxIySe2o5DJFAHaaeLjMJzBjK6b1yzVCU9etTLmXWuIvVkhHfDs
         uJ+WdjAiDyt8EAhLyothgLhO/DU5rDUFbuyGzmH6rfDuMytrWAuMW1bHezTbEGwnpJ01
         0UzKEYwmqFcu3J/xxxzHOCgsSCF1CDVEtECOAis4Q/JyWMol2qKQrzOqRATEUmZSF1A+
         FCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887234; x=1782492034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Y/ztSfBKRXyewnzGPkwER5TG21hOZ1QT6hHM+tMxzw=;
        b=mGIUezV/B1ukyBzRbc0mU9Yp+epQf2XyhAhPkSrf5Svh/Huxd3ObSYmzFLKIfO3ECZ
         N4G8MqMB+oODwByEKjU/J5Y9E1iNrxoHfRVS26AJq47ASmnWlvIt0JEHeLOcEoVAl8qf
         gZmUz8RPwi5rEHid14lY7Bhkg8nKjkiZmbiWIGOQOQfoy/RdP+k+5kcO30HxuOv8dz3s
         EPM6HWFfN7G532iMmr+VUE7jjumZi4Zoa6o0NZPhSCxjN42xxEdFamFPks/zx4kSF5gU
         SuTs4ZP2xQ3+PIdcnAtB0e7nK2dcrprbyjQxCyg9s3F9r91aiV4wg4AUU2O2Obm6LtWx
         1Vug==
X-Forwarded-Encrypted: i=1; AFNElJ/7PRPINb4bNOXv5C3c34xZrgcA5Rn/ukGApvHPLIrJ2/hui99hL8/WW6WOk5Jgz8miEYC6BfTXFsWOZJmsle44Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjQYXBTSP23PWakuOIPwkFXsEv89UKv5qm/gLLtbkYogJjjg1N
	rbNF0Of6sW5TM6qCP1SzLsa/SvV21RsJ14CfiuogE4B7pviLCmG8U4OO
X-Gm-Gg: AfdE7cn/nxjxtf2/WsHRz0LTZ9HGhNmNtix2a9vO/TGVGKVkgHXBE3LpLEKzVbhGzfA
	2y/jyuJQp2mJEZURyjzYTTXlS4sNo5QJsMXqS1kwPMks49kuAgp9DO95PTlWH75AA1bamymHExg
	6WCsOsfbz7htuzMGBIxiAbZQJPY7nVqdlmEJKFqpPX7B/hOUNYBAtGmLklyZLRjf9eyYL1PaN69
	5Xpy0Mg5wgneSB+Z1k98TFjKzjkKUay6wk00dUQ0EUB2bLzMCkgBrYt9UKRdpi7WeUzLJ8vWJA9
	HGCIcUCxxxasMUp2vnBNYiBUen+I+09o6Ry20vB4K9SLAGHw2MD2Er7+5DjcQk04zxT1U/6fTFj
	E1oHvu5CEWBSM/znOZrgh8kF4aVC7WhdFN3o/H3+k3ZkFeH+afvho1BtlTX3FILiLHuZZ1M8zRP
	+JXHCgW7aGg77oac6Zi9yS2vjTrb9AjyJ1rRXXrA==
X-Received: by 2002:a05:6000:4902:b0:463:a7e3:9f71 with SMTP id ffacd0b85a97d-4656dd09554mr5283437f8f.15.1781887234324;
        Fri, 19 Jun 2026 09:40:34 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/6] clk: renesas: rzg2l: Add DSI divider clock support for RZ/G3L
Date: Fri, 19 Jun 2026 17:40:21 +0100
Message-ID: <20260619164030.380098-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34251-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,init.name:url,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F0AC6A71C7

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a new DSI divider clock type (CLK_TYPE_G3L_PLLDSI_DIV) for the RZ/G3L
SoC, which requires a different divider implementation than the existing
RZ/G2L DSI divider clock.

The RZ/G3L DSI divider uses two cascaded dividers, DIV_DSI_A and
DIV_DSI_B, where the effective divider is:

  rate = parent_rate / ((1 << div_a) * (div_b + 1))

DIV_DSI_A is a power-of-two divider with values in the range [0, 5],
and DIV_DSI_B is a linear divider with values in the range [1, 16].

Introduce the g3l_dsi_div_hw_data structure, rzg3l_cpg_dsi_div_ops, and
rzg3l_cpg_dsi_div_clk_register() to implement the new clock type, and add
the DEF_G3L_PLLDSI_DIV() macro for use in clock table definitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 134 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |   5 ++
 2 files changed, 139 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 51c9e19e1575..a60b1d99458e 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -68,6 +68,9 @@
 #define CPG_PLL_MON_LOCK		BIT(4)
 #define CPG_PLL_MON_RESETB		BIT(0)
 
+#define RZG3L_SDIV_DIV_DSI_A_WEN	BIT(16)
+#define RZG3L_SDIV_DIV_DSI_B_WEN	BIT(20)
+
 #define CLK_ON_R(reg)		(reg)
 #define CLK_MON_R(reg)		(0x180 + (reg))
 #define CLK_RST_R(reg)		(reg)
@@ -834,6 +837,134 @@ rzg2l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+struct g3l_dsi_div_hw_data {
+	struct clk_hw hw;
+	struct rzg2l_cpg_priv *priv;
+	unsigned long rate;
+	u32 off;
+	u8 div_a;
+	u8 div_b;
+};
+
+#define to_g3l_dsi_div_hw_data(_hw)	container_of(_hw, struct g3l_dsi_div_hw_data, hw)
+
+static unsigned long rzg3l_cpg_dsi_div_recalc_rate(struct clk_hw *hw,
+						   unsigned long parent_rate)
+{
+	struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+	int div_a, div_b, val;
+
+	val = readl(priv->base + dsi_div->off);
+	div_a = FIELD_GET(GENMASK(2, 0), val);
+	div_b = FIELD_GET(GENMASK(7, 4), val);
+
+	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, (1 << div_a) * (div_b + 1));
+}
+
+static int rzg3l_cpg_dsi_div_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+	u32 divider = dsi_div_ab_desired;
+	bool divider_found = false;
+	unsigned int div_a, div_b;
+
+	if (dsi_div_target) {
+		/* Calculate the DIV_DSI_A and DIV_DSI_B */
+		for (div_a = 5; div_a >= 0 && !divider_found; div_a--) {
+			for (div_b = 0; div_b < 16; div_b++) {
+				divider = (1 << div_a) * (div_b + 1);
+				if (divider == dsi_div_ab_desired) {
+					dsi_div->div_a = div_a;
+					dsi_div->div_b = div_b;
+					divider_found = true;
+					break;
+				}
+			}
+		}
+	} else {
+		dsi_div->div_b = 0;
+		/* Calculate the DIV_DSI_A */
+		for (div_a = 5; div_a >= 0 && !divider_found; div_a--) {
+			divider = (1 << div_a);
+			if (divider == dsi_div_ab_desired) {
+				dsi_div->div_a = div_a;
+				divider_found = true;
+				break;
+			}
+		}
+	}
+
+	if (!divider_found) {
+		dev_err(priv->dev, "failed dsi div for: %u\n", divider);
+		return -EINVAL;
+	}
+
+	req->best_parent_rate = req->rate * divider;
+
+	return 0;
+}
+
+static int rzg3l_cpg_dsi_div_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate)
+{
+	struct g3l_dsi_div_hw_data *dsi_div = to_g3l_dsi_div_hw_data(hw);
+	struct rzg2l_cpg_priv *priv = dsi_div->priv;
+
+	writel(RZG3L_SDIV_DIV_DSI_A_WEN | RZG3L_SDIV_DIV_DSI_B_WEN |
+	       (dsi_div->div_a << 0) | (dsi_div->div_b << 4),
+	       priv->base + dsi_div->off);
+
+	return 0;
+}
+
+static const struct clk_ops rzg3l_cpg_dsi_div_ops = {
+	.recalc_rate = rzg3l_cpg_dsi_div_recalc_rate,
+	.determine_rate = rzg3l_cpg_dsi_div_determine_rate,
+	.set_rate = rzg3l_cpg_dsi_div_set_rate,
+};
+
+static struct clk * __init
+rzg3l_cpg_dsi_div_clk_register(const struct cpg_core_clk *core,
+			       struct rzg2l_cpg_priv *priv)
+{
+	struct g3l_dsi_div_hw_data *clk_hw_data;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	int ret;
+
+	parent = priv->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+	clk_hw_data->off = core->conf;
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &rzg3l_cpg_dsi_div_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	clk_hw = &clk_hw_data->hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 struct pll5_mux_hw_data {
 	struct clk_hw hw;
 	u32 conf;
@@ -1347,6 +1478,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_DSI_DIV:
 		clk = rzg2l_cpg_dsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_G3L_DSI_DIV:
+		clk = rzg3l_cpg_dsi_div_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index bd6169f62538..24642a089b6c 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -142,6 +142,8 @@ enum clk_types {
 	/* Clock for DSI divider */
 	CLK_TYPE_DSI_DIV,
 
+	/* Clock for G3L DSI divider */
+	CLK_TYPE_G3L_DSI_DIV,
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -201,6 +203,9 @@ enum clk_types {
 		 .num_parents = ARRAY_SIZE(_parent_names))
 #define DEF_DSI_DIV(_name, _id, _parent, _flag) \
 	DEF_TYPE(_name, _id, CLK_TYPE_DSI_DIV, .parent = _parent, .flag = _flag)
+#define DEF_G3L_DSI_DIV(_name, _id, _parent, _conf) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_DSI_DIV, .parent = _parent, .conf = _conf, \
+		 .flag = CLK_SET_RATE_PARENT)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.43.0


