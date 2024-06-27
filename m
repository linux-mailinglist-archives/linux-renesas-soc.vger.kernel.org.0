Return-Path: <linux-renesas-soc+bounces-6842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832A91AC60
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 18:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D39BB25BA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2024 16:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CDBB19A281;
	Thu, 27 Jun 2024 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVb12VqS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81608199EAA;
	Thu, 27 Jun 2024 16:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719504856; cv=none; b=BVNOc0r4koPmb0f1pn6gUBmKJhTGehBfNmwsjXZQuPbKpRLDmLex/tpgvEywrtRokwz+cAFPzBFC3LotrsGZfjcyFgghAy9mqNY00lrN7w7DdHFWT+ufCziG2dCX6EOM+NNtFpTlH7m/j9vpe4yWlMgJAZEizMKOgnuCrZsYdV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719504856; c=relaxed/simple;
	bh=VmosaxgaS0o8LoFf3WLqjfjuVvyq+aacDXrIWp5C9yE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PQyauNXnIoe66qhXCGDlwkNm6d6KgqkTU0SbHHW4h5VextWpM6ixK1aWDOcEfibopl4BCvABoBWyGfuw4lNw5m5fu6yPIiRcznbXigtUw4pGXNP40ijyjckMl1q7Rm8wdi3JgXlugcd88jTAom8nFWMpLS9kXyvJMeeto7tzFGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVb12VqS; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so112202181fa.2;
        Thu, 27 Jun 2024 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719504853; x=1720109653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtzEFPqxvnj/6dq6Oj8GZmky1NmT3+KaFgmIR1T+jb8=;
        b=CVb12VqSFvlewu9lGYbqBST94tO9RzSBt62f9H0H+RQRl6X5peq7xYfiYAm/bZ/EfP
         kD8viYxA62EmbaIu5maudh9w0DouMhUb1tgj+YiJtCRui1gL/smCHgCWF7+enPppMJJ+
         VxXMlTpHaLNasoGzZPLUmXugtdeAvAANfqs55y+IAD0Ozmpx6x3rieQb1UlYeZ2H2FoT
         Zo4dYEx8PUXWsDtzlcoRzXhx6JUBd9PcyVev2yzpglNJnfiLa025AT/69Q8nUNsoz37i
         I1pCQsLPf/FqGFe/LsQfTiWvluiPkq3PJyXW1B/A9TVxBWj8Usco6QK0i4kTWuvjgotU
         2jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719504853; x=1720109653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtzEFPqxvnj/6dq6Oj8GZmky1NmT3+KaFgmIR1T+jb8=;
        b=Iel7Q/rmbPNl4Je68U5fuf9slY7O3h+1dgevEvvXD115eVw+H2b0PoXo/+g6WFDZ/P
         Yb8hFnqu9OOWp/aGJmWtC8QUGuHpE0dVGYphwQhXsKbc2t4hLbVoe6qgKyYgwp5SjT1B
         k6z8hWOuhnfihcHiRk2os0T2QT2Ne6cYlNgWV+4LInFIS1aZSXg+pXvVJ75vBd2Na3wU
         LgniCmS8W5ArQ7ho0e2z+8zdHpLKYzau+BU9wFegMwlWs4HIWZ4oKhIKlosqrA0+eyBb
         VVw813L6oGQwuMztXQbbZ8HHgT+gZctUTnfg83X/OkYnygruq7UeKNfC5tj4Xxr8xaWx
         PYNw==
X-Forwarded-Encrypted: i=1; AJvYcCUC6tF/pkHXeIwPOuyq3h4A+Kn4IAMRAB2XGEWwcl6cN9prSKjkvGF9vIEMEnc53tbG2/YWVGK0rkGFXlCUSFCU0HXheblzVxNh7D8zSGMEprBW2vUsqStM29oIC1DYJM2wormC0EZsKJxFVDtI9saHqpAxDwMtnHkjC4gj+46ivHmqQYIHaSLG7r4=
X-Gm-Message-State: AOJu0YyZ5NdwmhZVYSG3a7llpYcUQll84uIk/QrGzIB9GZErCp4r7FZV
	+9ki1j4Xtjbz4g2WiFxzrFmESfd5MLOM/o9WU13crICfvAOlg1O6
X-Google-Smtp-Source: AGHT+IEaXWzhWXBL7SXPzl6/eOhxaLpTsPTDQeEdBcSZhfYpKiG+KBCJNjVyqcJnMlumfjdCZDLCJg==
X-Received: by 2002:a2e:9ecd:0:b0:2ec:51b5:27be with SMTP id 38308e7fff4ca-2ec5b2d4619mr112186951fa.12.1719504850705;
        Thu, 27 Jun 2024 09:14:10 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:9638:4c3:829:6df3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8424677sm72372435e9.35.2024.06.27.09.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 09:14:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/3] clk: renesas: Add RZ/V2H(P) CPG driver
Date: Thu, 27 Jun 2024 17:13:15 +0100
Message-Id: <20240627161315.98143-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add RZ/V2H(P) CPG driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Added CLK_PLLDTY
- Added core clocks sys_0_pclk and iotop_0_shclk
- Dropped r9a09g057_crit_mod_clks

v1->v2
- Updated commit description
- Dropped pll_clk1/clk2_offset
- Made r9a09g057_mod_clks/r9a09g057_resets as static const
- Now using register indexes
---
 drivers/clk/renesas/Kconfig         |  5 ++
 drivers/clk/renesas/Makefile        |  1 +
 drivers/clk/renesas/r9a09g057-cpg.c | 79 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     |  4 ++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 +
 5 files changed, 91 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a09g057-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index f078ccb635bb..76791a1c50ac 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -40,6 +40,7 @@ config CLK_RENESAS
 	select CLK_R9A07G054 if ARCH_R9A07G054
 	select CLK_R9A08G045 if ARCH_R9A08G045
 	select CLK_R9A09G011 if ARCH_R9A09G011
+	select CLK_R9A09G057 if ARCH_R9A09G057
 	select CLK_SH73A0 if ARCH_SH73A0
 
 if CLK_RENESAS
@@ -193,6 +194,10 @@ config CLK_R9A09G011
 	bool "RZ/V2M clock support" if COMPILE_TEST
 	select CLK_RZG2L
 
+config CLK_R9A09G057
+       bool "RZ/V2H(P) clock support" if COMPILE_TEST
+       select CLK_RZV2H
+
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSTP
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index d81a62e78345..23d2e26051c8 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
+obj-$(CONFIG_CLK_R9A09G057)		+= r9a09g057-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
new file mode 100644
index 000000000000..8b2be17901b2
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) CPG driver
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
+
+#include "rzv2h-cpg.h"
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A09G057_IOTOP_0_SHCLK,
+
+	/* External Input Clocks */
+	CLK_AUDIO_EXTAL,
+	CLK_RTXIN,
+	CLK_QEXTAL,
+
+	/* PLL Clocks */
+	CLK_PLLCM33,
+	CLK_PLLDTY,
+	CLK_PLLCA55,
+
+	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV16,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("audio_extal", CLK_AUDIO_EXTAL),
+	DEF_INPUT("rtxin", CLK_RTXIN),
+	DEF_INPUT("qextal", CLK_QEXTAL),
+
+	/* PLL Clocks */
+	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
+	DEF_FIXED(".plldty", CLK_PLLDTY, CLK_QEXTAL, 200, 3),
+	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+
+	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+};
+
+static const struct rzv2h_mod_clk r9a09g057_mod_clks[] = {
+	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15),
+};
+
+static const struct rzv2h_reset r9a09g057_resets[] = {
+	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+};
+
+const struct rzv2h_cpg_info r9a09g057_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a09g057_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a09g057_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Module Clocks */
+	.mod_clks = r9a09g057_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a09g057_mod_clks),
+	.num_hw_mod_clks = 25 * 16,
+
+	/* Resets */
+	.resets = r9a09g057_resets,
+	.num_resets = ARRAY_SIZE(r9a09g057_resets),
+};
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 058d79673ae6..6d5427d82412 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -643,6 +643,10 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
+	{
+		.compatible = "renesas,r9a09g057-cpg",
+		.data = &r9a09g057_cpg_info,
+	},
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 2358782388c4..17a3c02528d6 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -156,4 +156,6 @@ struct rzv2h_cpg_info {
 	unsigned int num_resets;
 };
 
+extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
+
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.34.1


