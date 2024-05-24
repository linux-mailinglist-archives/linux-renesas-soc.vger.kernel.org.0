Return-Path: <linux-renesas-soc+bounces-5464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A37F8CE262
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 10:30:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CB071C21869
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2024 08:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB54412A146;
	Fri, 24 May 2024 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wd0DSOo7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD71129A70;
	Fri, 24 May 2024 08:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716539370; cv=none; b=fgktxeygx9If/3qgT7JzIE6tM3Kaq/AC3MYjerjNRJ8R/MfbL80jxpsuBgwshV4wMktomYqVRwcxpxTEvRissv6EqomODQwNFETRNQr2baP9PAZZ/DUn/frg5tt8mU6RgJZYVZmGK9/fsrG/2knNPqLwS9SM8cR2hlAR+IJDeG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716539370; c=relaxed/simple;
	bh=zuzikGzxL79PI8H01tVH7pCA9yX1leq/YZXEhgv9a1c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UJHV5z/t7mp1SeAwsIIhZBTCsSxKhH1DUZuJQA7g2g2HLg/WXMqioZQCmt42B54DzZnmprcwPqyGwum9oxBfyShxpR40JAFReAWdM+slvB1fmLEkqOWF6N3LmkfQVy3B8IOGFjfk/BXm8LCJbxZRl8/V0NEj0IXQwaAsR1xz1sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wd0DSOo7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f449ed4b89so4241165ad.0;
        Fri, 24 May 2024 01:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716539368; x=1717144168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBhmbn2tkLhgr82HNxoYZXXdSeWRscuTlKTolPvWaGY=;
        b=Wd0DSOo7x9+Fy1qxhQ/ugoLaTowEMBXQPhCSuUXQxXjnK2Rl6MIRklaC8KNDZYZ9DL
         oiqtwQKRafehyV8cf9Zv0Fk6amWLWUK85QpqB3gpTHR6u/GvkC4WtY7LLCNOf401hzbt
         OLeezm4dfKtDawxBkO/vpiMwwx/JtfJqZqgLzYfD+/U35g5toWex4zneXZjs41OF3Q//
         cp1Uh4ZElJMsaoEONqS96dba8opLDAccPZvOQCqlp6DUqpFq8iZR3g4PU7jQNBT+yb4M
         3QMTkFI5ZK6nh9viitLSY2megmJ3G9dvkiEy3Mn8kvoofMKTr5d9NxjwGh62mEn5xQZ9
         /uOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716539368; x=1717144168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBhmbn2tkLhgr82HNxoYZXXdSeWRscuTlKTolPvWaGY=;
        b=qg2PugIEtZ9/Zc0dXFyluC9kPOxPiVGKYft5bQoBzw/Pv0dRwpR6wVLjnA8goQkzeE
         360r/IfgDpB3fXw92ap5ySSbfUVAC0DrTBafExtAocyfrVQVBJYENAIgRp3bpGLD1In0
         MOz6NxDCMeik4GKtm5JWUYQYCDFC2qGLCcsz3wPyB6a3kN3A929yyDkw1snkDOEJb3mF
         wsanf2jL+cqYuEHUBq3F58FO3mrtSqNWE3jpDC1l3EkIBhMj4N93XxinjKBP3CB7Fq2v
         h7OO5pugNE+Iqt+aHAL9R50vlcgyxZTqPSmyMhx42k05vip8+aPNQAmPBG73NBxblvH1
         KZuA==
X-Forwarded-Encrypted: i=1; AJvYcCVpVZm8V4k6CynPCMvD0zQbPdrR7zOpHRqnQjwrJA6R2fYWoLitXoC4UO2p/qLz0DBfFY9GygBuZoj9YyICuXpXTI39kWCv3dqHcMCZnv7PKsuYbcxlUJYkMzSCbgMN8q6c+CUt3BfHphSaL7Mw3dPQSIlpyVXx+PqxUWODIlOxRB/rRQ==
X-Gm-Message-State: AOJu0YxlTB8kd3Ue94YKwfbUGn3Qfp1zfnyTEuzqbeCNW8ml1EVvBmIY
	0aP+XlF97/SWfVhNoBxonIOlUn/dwyEKJcliUGgPBDNDycdzuLKY
X-Google-Smtp-Source: AGHT+IFG+JeQiaXwMC8wpvY9Yy6uUbE0AIriumU7VpBgLFLGIuWTXxZxDEZozgCHk9JgTtOJl36VwA==
X-Received: by 2002:a17:903:1111:b0:1f2:fe12:b7be with SMTP id d9443c01a7336-1f339f602b9mr60645205ad.32.1716539368522;
        Fri, 24 May 2024 01:29:28 -0700 (PDT)
Received: from prasmi.. ([2401:4900:1c07:bfcd:61e0:7fa9:84b8:25fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9c6ea3sm8420325ad.277.2024.05.24.01.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 01:29:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] clk: renesas: Add RZ/V2H(P) CPG helper driver
Date: Fri, 24 May 2024 09:28:00 +0100
Message-Id: <20240524082800.333991-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add RZ/V2H(P) CPG helper driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/Makefile        |   2 +-
 drivers/clk/renesas/r9a09g057-cpg.c | 112 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     |   4 +
 drivers/clk/renesas/rzv2h-cpg.h     |   2 +
 4 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r9a09g057-cpg.c

diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index 79cc7c4d77c6..df0ba8bb5e6f 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -37,7 +37,7 @@ obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
-obj-$(CONFIG_CLK_R9A09G057)		+= rzv2h-cpg.o
+obj-$(CONFIG_CLK_R9A09G057)		+= rzv2h-cpg.o r9a09g057-cpg.o
 obj-$(CONFIG_CLK_SH73A0)		+= clk-sh73a0.o
 
 # Family
diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
new file mode 100644
index 000000000000..21f8be90107c
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -0,0 +1,112 @@
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
+#include <dt-bindings/clock/r9a09g057-cpg.h>
+
+#include "rzv2h-cpg.h"
+
+enum pll_clk {
+	PLLCM33,
+	PLLCLN,
+	PLLDTY,
+	PLLCA55,
+	PLLVDO,
+	PLLETH,
+	PLLDSI,
+	PLLDDR0,
+	PLLDDR1,
+	PLLGPU,
+	PLLDRP,
+};
+
+static int pll_clk1_offset[] = { -EINVAL, -EINVAL, -EINVAL, 0x64, -EINVAL,
+			       -EINVAL, 0xC4, -EINVAL, -EINVAL, 0x124, 0x144 };
+static int pll_clk2_offset[] = { -EINVAL, -EINVAL, -EINVAL, 0x68, -EINVAL,
+			       -EINVAL, 0xC8, -EINVAL, -EINVAL, 0x128, 0x148 };
+
+enum clk_ids {
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_XINMAINCLK,
+	/* Internal Core Clocks */
+	CLK_PLLCM33,
+	CLK_PLLCM33_DIV16,
+
+	CLK_PLLCA55,
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal", CLK_EXTAL),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".main", CLK_XINMAINCLK, CLK_EXTAL, 1, 1),
+	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_EXTAL, 200, 3),
+	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+
+	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_EXTAL, PLLCA55),
+};
+
+static int rzv2h_pll_get_clk1_offset(int clk)
+{
+	if (clk < 0 || clk >= ARRAY_SIZE(pll_clk1_offset))
+		return -EINVAL;
+
+	return pll_clk1_offset[clk];
+}
+
+static int rzv2h_pll_get_clk2_offset(int clk)
+{
+	if (clk < 0 || clk >= ARRAY_SIZE(pll_clk2_offset))
+		return -EINVAL;
+
+	return pll_clk2_offset[clk];
+}
+
+static struct rzv2h_mod_clk r9a09g057_mod_clks[] = {
+	DEF_MOD("scif_0_clk_pck",		R9A09G057_SCIF_0_CLK_PCK, CLK_PLLCM33_DIV16,
+						0x620, 15, 0x810, 15),
+};
+
+static struct rzv2h_reset r9a09g057_resets[] = {
+	DEF_RST(R9A09G057_SCIF_0_RST_SYSTEM_N,		0x924,	5, 0xA10, 6),
+};
+
+static const unsigned int r9a09g057_crit_mod_clks[] __initconst = {
+	MOD_CLK_BASE + R9A09G057_ICU_0_PCLK_I,
+	MOD_CLK_BASE + R9A09G057_GIC_0_GICCLK,
+};
+
+const struct rzv2h_cpg_info r9a09g057_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a09g057_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a09g057_core_clks),
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r9a09g057_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r9a09g057_crit_mod_clks),
+
+	/* Module Clocks */
+	.mod_clks = r9a09g057_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a09g057_mod_clks),
+	.num_hw_mod_clks = R9A09G057_TZCDDR_1_CLK400DG_ACP_ACLK4 + 1,
+
+	/* Resets */
+	.resets = r9a09g057_resets,
+	.num_resets = R9A09G057_DRPAI_0_ARESETN + 1, /* Last reset ID + 1 */
+
+	.pll_get_clk1_offset = &rzv2h_pll_get_clk1_offset,
+	.pll_get_clk2_offset = &rzv2h_pll_get_clk2_offset,
+};
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index eb6b7ab86675..93866833ff21 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -653,6 +653,10 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
+	{
+		.compatible = "renesas,r9a09g057-cpg",
+		.data = &r9a09g057_cpg_info,
+	},
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 689c123d01c5..b764079d448d 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -146,4 +146,6 @@ struct rzv2h_cpg_info {
 	int (*pll_get_clk2_offset)(int clk);
 };
 
+extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
+
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.34.1


