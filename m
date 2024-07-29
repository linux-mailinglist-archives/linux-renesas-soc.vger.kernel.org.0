Return-Path: <linux-renesas-soc+bounces-7609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E193FF7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 22:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C5C71F2101C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 20:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34F7518E750;
	Mon, 29 Jul 2024 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMxoi5h0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFD718D4C8;
	Mon, 29 Jul 2024 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722284915; cv=none; b=eCYzGEmcQfBCIF7pXwJYxKrufGavgJWCvWuEkx764WboLlG7VCqIU/Sc7GOdEMeh/PSoBt5iCvPLwW/EKTX3I7AX6SBBLIAryDLBNg/pGijaS7XGeZ3R9VLDbcBdu1WOrLs0lXQmELHXCmd8x1kl65oNEjOzBhhbE5btUAkp1oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722284915; c=relaxed/simple;
	bh=cF4aFcy0SvXNNNhLQlTYToc9MBbA4gE1pLcWsdHKoPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oOE01Xu2d77qxYBR4cTt67ARaNZphgW+X6ZU5mMWDQeRnRndk+eQxp+HtdYvFoKfTwo9wWmvBj1cpnevGlkwrlJHbrzn9KxVur2CihQQ/hGs82ys5z+lr8U5WH3eOQ6HL87nVKm+lcnRgOKMkYOz/bPMZau/VhX+y1lbpaZf8d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMxoi5h0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so26311515e9.2;
        Mon, 29 Jul 2024 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722284911; x=1722889711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plfEDRpMuhRong+wPM9OUJEVupuquO7naYjdA+F1/zs=;
        b=jMxoi5h08AviRUnNS9+Ifo54YHMNhBS2WCH0GgPOWWZA41gjnnfcmm+2J456eWDrXZ
         hIiqsv+eJ3z4fPayILV7EfYPmdKqSV8RBTXBFi0isUeRVg8rfzfCwLnwuqI4MsvW/PPP
         BxRuU/95WrfXLZ2mGaqX/LRXd8M+GaUDCcgHQ9Fdnnd5TyqaEofy69BrwlTmfd1Qs+9j
         ZWMfMkUbRUy9WhIbJ5RLo6g6QbQph258H4DirQQCZbnpQA2pVE5ocVi54raqECq1/LcK
         3VXEATVlwg06qb2L7I+KS6vAFN31HhLzpcoKZ2AABEyp+GP/qS9w73hQdQZRX+Qd3Wv4
         ngwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722284911; x=1722889711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plfEDRpMuhRong+wPM9OUJEVupuquO7naYjdA+F1/zs=;
        b=K0h4tI/bLbvSDDr+pxqLkOhlXaVWOhbP7IunbuvmxxJKWea8x9JC5zoSurqFytiHQw
         FiBvrHiEL43fn9eeDSPs90i/ZW2V+f1hA0293joQqPhlf8HgS9lgM6i1uROBqTMtw3LT
         A2xaS7WD9v8K58Bs1bZ/r9Kaqua9LBFrZ2Pi7QOLCgSNr20JaF46PF5ac6kgICNgSzCv
         OZk26ASQKC7B76NNdniwDQysKHDsDINH2f0ijz36F+i74HkdSOadliCBadfiUnOtaGSR
         jo62ls3iJshD6N1WdCZgs7NIP1tI0OZk9ekunf0iEr4kfWzkTNLbXexlKkRFSSmdt9bS
         34rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBya3qxcguxvxslu6bz4yfEFjHa8DzHaoQkDdEL070LvZCfN73VWlZc99BXTLtHdAbUU6i3o2Wtl9gPWlhqaDy+xt+9SO5c6O8LihWtCntyXnIYo7Ed+CS/lD9a9mo57W9UJswXfzSGRPG5jbhwZQf4WWEyO0w6GpMrtdT7JQvWf+9eQ==
X-Gm-Message-State: AOJu0Yzzu3gR/G/rVW5yLcQXu4MOAivzVE2/zBQ4RqZbgOWlpEJPdqb6
	pc7PeJMCpXnhXvcYa3EsJejyMbuGeKkhyVVqCq0WjBXo/vgrMiCK
X-Google-Smtp-Source: AGHT+IH3lHntMgM3gGqJ7u/yaGZvb0ul2183EVNLjHdkRXzzKUj5b7V7cBmKXNvPVk/PXsrn6TUdTQ==
X-Received: by 2002:a05:600c:5124:b0:425:81bd:e5ee with SMTP id 5b1f17b1804b1-42811d9f01bmr75131275e9.16.1722284911201;
        Mon, 29 Jul 2024 13:28:31 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:91c0:6bc7:8f80:c05e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280f484cdesm125478115e9.44.2024.07.29.13.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:28:30 -0700 (PDT)
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
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/3] clk: renesas: Add RZ/V2H(P) CPG driver
Date: Mon, 29 Jul 2024 21:26:45 +0100
Message-Id: <20240729202645.263525-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5
- Included RB tag from Geert

v3->v4
- Added a comment for core clocks
- Made r9a09g057_mod_clks as __initconst
- Made r9a09g057_resets as __initconst
- Made r9a09g057_cpg_info as __initconst

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
 drivers/clk/renesas/r9a09g057-cpg.c | 80 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     |  4 ++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 +
 5 files changed, 92 insertions(+)
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
index 000000000000..9722b810e027
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -0,0 +1,80 @@
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
+	/* Core Clocks */
+	DEF_FIXED("sys_0_pclk", R9A09G057_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
+	DEF_FIXED("iotop_0_shclk", R9A09G057_IOTOP_0_SHCLK, CLK_PLLCM33_DIV16, 1, 1),
+};
+
+static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
+	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15),
+};
+
+static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
+	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+};
+
+const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
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
index 23430bce7ab4..412a8015933e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -665,6 +665,10 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
+	{
+		.compatible = "renesas,r9a09g057-cpg",
+		.data = &r9a09g057_cpg_info,
+	},
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index ab6beaa50296..6df59e041701 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -146,4 +146,6 @@ struct rzv2h_cpg_info {
 	unsigned int num_resets;
 };
 
+extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
+
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.34.1


