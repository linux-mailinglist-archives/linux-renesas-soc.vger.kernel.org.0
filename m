Return-Path: <linux-renesas-soc+bounces-13826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F064FA4A43E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 21:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6CF1161BC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 20:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431FF23F38E;
	Fri, 28 Feb 2025 20:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgOj5A7+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBFE23F364;
	Fri, 28 Feb 2025 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740774432; cv=none; b=HMZF9JzBJAVrWDuxAcnfUsuLOLnvyoo8wK6jK9adDqI9rB0syjB853DfjoCe5pA+LNh2//BrNA7VdTLscSTF1hVOe9VJ6qvkJGbqrvMPv/emShD0ae1Bf6NRleVdsRC1Us1EOrxG137co8jnHscPuCxJF837Uo/91fuB/4SGfJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740774432; c=relaxed/simple;
	bh=u244GH3K6bLoAmg0ISgZGpzQRAI9q8z7ZbmLLcez4/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kbbzMeKuW32PFzxNLrzO4tFDNIJvlahRAxm5qm3oxB+H6OSiTb7rx9pqRrP411ELLJqY9raz4NtEgIfE72OPCG97p1AtCcaZFm/DpCwDSsJ0NGbMtJ1pwdwC7al8kp+YLcqiFRkk/HW+udCsb2DgD1y6meyD7zvWYuenFmA1p7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgOj5A7+; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-390f69f8083so315602f8f.0;
        Fri, 28 Feb 2025 12:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740774429; x=1741379229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bh4z2Tbrom4Bcmmd+CnzmV+yItpCRs6lHd8gp3czo88=;
        b=dgOj5A7+8NfsnBd+nVyp7BRF8SOIaq5NZtUQ4F6r0ue8O+ect/StRTQaLW6onm0Dze
         risFq0be+vgp1Kahys8eJ1bvrWdRWHl01t4VIEmVaXRelEOOxRCFq7p5/KOzkvF1QUUT
         GAkdFfshkfsJo7urjqCmX4raKjt7GLcI3eq3b30XoPUq9W+sdPHpDBNEuil/GOVG+bQI
         wlRDrTpvvPdSMcP4Y+OeZsZGY7LTQb/vYAGQ/Gnga70WYPQN2tItqUhPwfXE5UGtzb88
         tGdPuse4Umvyloz2N76Twy4TlVbfrUjW7ocJ5JW9X9izYmux50UT0+DyX/lMlmjkzLIK
         YNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740774429; x=1741379229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bh4z2Tbrom4Bcmmd+CnzmV+yItpCRs6lHd8gp3czo88=;
        b=HJpcg00W/Udx/NfwC/bb2MimDkdnfcW01HQA6YVQFqUT5FokdV0zLjXFkFXK3dxjxt
         +Gno3guczmMxgWC+JPkvV2Aef+RGijqwryX08yUp+hjgkGl+36EEV3wWSxMQ/7l+nJGt
         ksQTp0RjRYxbqorJHUb/AXKSEiWFJQpGjGZifFL0ZogHj/rHt7wAQ5o1zEMIADQEZLvM
         Pch7EdVe6y24dCKmSMVptbt/VWww2KMRVAg7SZuJC7BqLhfupnayD8lapy5tQqkI+8CD
         ez07nFrSC/vlEybD48tVwf3kzDj62pZ/fzM3qVuClsjCGDpu+MGpxm8vqUT/m5zhLg61
         BcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMVq8jQpJTDjzd9eX5zGZQxn+p1OEedRjQJhIhBd4zFXPaQ6DXhQH0DU2SlCYUAhWTYRvIPT0tuQc=@vger.kernel.org, AJvYcCXUan90U41Fj7eblCr3xwQNHIIDGFJNx++O8RAY2jSF3FEubDysqjJE+SSLncca3nQY6RtTbKnZI9jWdle9@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqTYQaUTH15GZL4IpCxNuPuPFflCq3mMZW6acvuubKgR19t17
	5pr0grB2xhiVEtxEne3WsyMhcswoI4ou822NmMg57LuCEGUlivi6
X-Gm-Gg: ASbGncsY/dTv8ri43wqdq0gSiI6/UroSirhjvF3tdQCfdWZJMG19nnedViq8VbRH4GM
	GEIQaUY2vjXIfLwFDJrkP8j3u4uEtPEkv1imb3UI7hisjmR84zBUVU5j2msUFsA2/yAt6CmvD+n
	0ur1aRE4QIyxLKvVnCsC9Os8K4n5q5YwX1H5ofqkth7rrFwc/gXn+AoeRpcFqfuWpOzTnI6rC7h
	bbvAh+WVbyBt3nEZi4mSN7jbxLFw1YVwhegSTtYQ5V8ezWk0oMFYKj4HBVwsGXqPREETuKXlSAP
	ZRtQnWoNFGUaL3nnbwrjS34L4uu5hV7o00ac4RzXuUmm3XcnOPDPxQ==
X-Google-Smtp-Source: AGHT+IEF7YJS8XC/JYu8NNIU/CZ5y6lxszSo6/rZG6ILF63eC/9HDCFhg7Wq+rlVF+0ma5wW5lhFVA==
X-Received: by 2002:a05:6000:270c:b0:390:eda7:1d5d with SMTP id ffacd0b85a97d-390eda71ef9mr3080286f8f.28.1740774427251;
        Fri, 28 Feb 2025 12:27:07 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:459a:3857:be17:b16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6739sm6152099f8f.22.2025.02.28.12.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:27:06 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] clk: renesas: rzv2h-cpg: Add support for static mux clocks
Date: Fri, 28 Feb 2025 20:26:54 +0000
Message-ID: <20250228202655.491035-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index d7230a7e285c..6cda865c94fb 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -403,6 +403,24 @@ rzv2h_cpg_ddiv_clk_register(const struct cpg_core_clk *core,
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
@@ -487,6 +505,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
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
index 3d3d4839d6d5..0ac2db805614 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -33,6 +33,26 @@ struct ddiv {
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
+		.offset = _offset, \
+		.shift = _shift, \
+		.width = _width, \
+	})
+
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV3		(0x40C)
@@ -73,8 +93,12 @@ struct cpg_core_clk {
 	union {
 		unsigned int conf;
 		struct ddiv ddiv;
+		struct smuxed smux;
 	} cfg;
 	const struct clk_div_table *dtable;
+	const char * const *parent_names;
+	unsigned int num_parents;
+	u8 mux_flags;
 	u32 flag;
 };
 
@@ -84,6 +108,7 @@ enum clk_types {
 	CLK_TYPE_FF,		/* Fixed Factor Clock */
 	CLK_TYPE_PLL,
 	CLK_TYPE_DDIV,		/* Dynamic Switching Divider */
+	CLK_TYPE_SMUX,		/* Static Mux */
 };
 
 /* BIT(31) indicates if CLK1/2 are accessible or not */
@@ -105,6 +130,13 @@ enum clk_types {
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
2.43.0


