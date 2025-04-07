Return-Path: <linux-renesas-soc+bounces-15503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1233DA7E76B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8694C188C4FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051492139C6;
	Mon,  7 Apr 2025 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOhWP7ER"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFA420FA9D;
	Mon,  7 Apr 2025 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044740; cv=none; b=B2ncfL21V5gEP0BsJ7C01Gq816zqqVR8cqxYP7cf+xuOZV8pWrGelT90yHlEuOyNe6vv8HdFkMznvn+IghrxXhy44vIrxrFglRDTeTUFnQIxC51aI1OJ5Z70x53svltrXkJtg7XWoKdlC9/hYz2LSQ+wzcqGzkO5Xl1RWWRuysM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044740; c=relaxed/simple;
	bh=y1ssDW805hD1ymCg9MqTgsf7SgsYfu2J/040iWIq5X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8yVW9yoqnPCN15vvqnMJ9vc72c6tcaz7bp5VuaM/nMzeJSBADft10ruNCUgswBoc6KgW2p794vmPFQRNRAP3BQVJQvUH77t9DTTnXmwwsfkDXc7e2GvXc/XvSqbdnj5+LJFneEaK4nnkigXfCx+toHxO6+CitS73Hx9/Q9AR5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOhWP7ER; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913b539aabso2694213f8f.2;
        Mon, 07 Apr 2025 09:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744044737; x=1744649537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4RGDTaHfqw+GeGX9NhwRoLTw/SVHtjJ8B6EHuQFvtzc=;
        b=HOhWP7EROzSDM5sOvnrSJuksd4nvu1+R30dk/67p0IwPU07WZLoHHgc2a9RuiMZ46R
         32QbXq1nFOaz9C6qUndNQPzlzd2a2dP9xgncA09J2hsyy7VdKyczMnfEQxd+F/LA0hgG
         YftwU9i0UMGg8RL237/6M0Q5t1QOVWxYhmhRE7Wgkfjq3bNjJN0Z/ef9cXJp50SaaxoI
         WXuW/l5ziBUYCJvrq1P3YEqDVrxBNygYO6Vlo8WlcVaiijGZffrKv3q6rX9HSzh7TST0
         13xrpCejbOgbHyQcUHyUpAi3hhltjzc3wxJxOK5WwVJQWP7M9L4bAepGW5KFzSeMhda9
         vJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744044737; x=1744649537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4RGDTaHfqw+GeGX9NhwRoLTw/SVHtjJ8B6EHuQFvtzc=;
        b=daEoaTNLDwKWzpNFq75YIO3IZRn6X53o7f/YZyM0+yhB0EQlec/ivZgef1iB9egvzM
         b93nGSVyMVUEYqgjhm6ccDVEKO7eg9U3KhTwJbzEXL4oQWzzy9Ph79qFMIbOR6G6WZS7
         ZBlMikYDq/0ISU5TYqum2DirDIHVp2NzTBn1hm3vysPcPmkRODeWfUDfsAkqMr1H3dSv
         duS8xCpfGnEUNSVfhaf6ZqTymSOQSpa4sh/icYhwDaHOOZv0huoHpyvdhpQfwYGRXArq
         d4bLd8/bnMAgkG/6o4MXMCnHsSS/p7yecQ96/Yjav+YXEecbjRxCAJBhqPumTkPPdP+h
         xMPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Kkr018FCz7SYe5AH6usjEczj6QRNPl9jpp0bdJVmPqD6lrR4yj7iNPhCpaBKZlTjrjMjgak1X0ZQ@vger.kernel.org, AJvYcCWAdQZop/kcgpkr5hdizFOGEvwxLGPUHTVWJOZ3NT3kyRzbDdX5yR9xp29QSFlV0ZEG+jjZANWwfJ9V@vger.kernel.org, AJvYcCXbj3y3u3CmGANNWF7RXf+/cCHtmqHmsabqVJ5QMvblMl49YAhhCStOg38tPOwfD8/RBegnOx7zlgvfBXQu@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ/ANlPO4/65x+ej99BrO4jmSawRo1406pp6gafBOCyCESGwFU
	UIDa3VjUjwMI/t1/k/UjeJps2qECw54alvqVdmsqisRjkz5bJi7f
X-Gm-Gg: ASbGnctKLLYsqWPMATJG34byWH9Sb6l8ObIfK1dD6mdTT5nNfHf6jsiYKcgwM4Ex4GC
	TbJS1TyMnLbw2zxX7JrbYdH5xRCbtzA5CMSmxK8/g73ucJ4PIfO/1h0yKlKAPITnNH+xF6UJtpb
	OG0HMBqdKtb/iMeA1VM8xnbkMcl5O0SM9/HZTryEQzYvxNQcun6WvbJFcHit34erh2irpjj9L/I
	DmIh80wDmOEHQp2mrkJBm3+SoXqwOpRBSKBTzKTZPwp8eSVWL6qkgwluXA5FkyaS6FoWB2nYyGq
	YSMdQ5ceTw8bgLnBAtDxmm8T2zcXx9FzOzaWmiPtdlsSpxo/Sv95Nc3DncjeF77fuuTleA==
X-Google-Smtp-Source: AGHT+IHQBeA9vj0XPx0p+LWVx4eXKcWEDzInfGlXpAIIkouzU/1Xq17FJcdB26PWP3zxtBmj2dXalw==
X-Received: by 2002:a5d:64e9:0:b0:39c:1257:c7a3 with SMTP id ffacd0b85a97d-39cba93d9eamr12100936f8f.59.1744044737253;
        Mon, 07 Apr 2025 09:52:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16ba978sm139272305e9.23.2025.04.07.09.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:52:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/9] clk: renesas: rzv2h-cpg: Add support for static mux clocks
Date: Mon,  7 Apr 2025 17:51:54 +0100
Message-ID: <20250407165202.197570-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for `CLK_TYPE_SMUX` to register static muxed clocks on the
Renesas RZ/V2H(P) SoC. Extend `cpg_core_clk` to include parent names,
mux flags, and a new `smuxed` struct. Update clock registration to
handle static mux clocks.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 21 +++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index b8bed0c1d918..4cda36d7f0a7 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -399,6 +399,24 @@ rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
 	return div->hw.clk;
 }
 
+static struct clk * __init
+rzv2h_cpg_mux_clk_register(const struct cpg_core_clk *core,
+			   struct rzv2h_cpg_priv *priv)
+{
+	struct smuxed mux = core->cfg.smux;
+	const struct clk_hw *clk_hw;
+
+	clk_hw = devm_clk_hw_register_mux(priv->dev, core->name,
+					  core->parent_names, core->num_parents,
+					  core->flag, priv->base + mux.offset,
+					  mux.shift, mux.width,
+					  core->mux_flags, &priv->rmw_lock);
+	if (IS_ERR(clk_hw))
+		return ERR_CAST(clk_hw);
+
+	return clk_hw->clk;
+}
+
 static struct clk
 *rzv2h_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -483,6 +501,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_DDIV:
 		clk = rzv2h_cpg_ddiv_clk_register(core, priv);
 		break;
+	case CLK_TYPE_SMUX:
+		clk = rzv2h_cpg_mux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 59f72fbed133..03e602d70f69 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -53,6 +53,26 @@ struct ddiv {
 		.monbit = _monbit \
 	})
 
+/**
+ * struct smuxed - Structure for static muxed clocks
+ *
+ * @offset: register offset
+ * @shift: position of the divider field
+ * @width: width of the divider field
+ */
+struct smuxed {
+	unsigned int offset:11;
+	unsigned int shift:4;
+	unsigned int width:4;
+};
+
+#define SMUX_PACK(_offset, _shift, _width) \
+	((struct smuxed){ \
+		.offset = (_offset), \
+		.shift = (_shift), \
+		.width = (_width), \
+	})
+
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV3		(0x40C)
@@ -96,8 +116,12 @@ struct cpg_core_clk {
 		unsigned int conf;
 		struct ddiv ddiv;
 		struct pll pll;
+		struct smuxed smux;
 	} cfg;
 	const struct clk_div_table *dtable;
+	const char * const *parent_names;
+	unsigned int num_parents;
+	u8 mux_flags;
 	u32 flag;
 };
 
@@ -107,6 +131,7 @@ enum clk_types {
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_PLL,
 	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
+	CLK_TYPE_SMUX,		/* Static Mux */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -125,6 +150,13 @@ enum clk_types {
 		.parent = _parent, \
 		.dtable = _dtable, \
 		.flag = CLK_DIVIDER_HIWORD_MASK)
+#define DEF_SMUX(_name, _id, _smux_packed, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_SMUX, \
+		 .cfg.smux = _smux_packed, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .flag = CLK_SET_RATE_PARENT, \
+		 .mux_flags = CLK_MUX_HIWORD_MASK)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
-- 
2.49.0


