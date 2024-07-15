Return-Path: <linux-renesas-soc+bounces-7348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C83931532
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 14:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 737A91C21508
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 12:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A89191F74;
	Mon, 15 Jul 2024 12:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWuDXTB4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A7C18E744;
	Mon, 15 Jul 2024 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721048166; cv=none; b=AifbmcotgBzn/9bEJ+pMRksOrQP74/D0rP27LMyWor0hIHXC/byk9wy0gNvEojHdcPzJFV4CeA7D+c3EHsuPRlMgNRgYfYam+DDfj6ZyTpvNsy8SqQdJV4MPlMv7kmHbJGv2K1rAcbhIRtcSxWID/D1V46PO2S+9/xRVTP47s+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721048166; c=relaxed/simple;
	bh=A/l42zZAKrhgHuTBX0Jss7bliyDtNdQb1LvISdGWmhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xfs2W+09rOE0kTltcQAw++2GrSn4l0j2xq1FfTebAg3olExLG2EYufW5ySaerrQlnjQ4GOYDKOUp/7l/fKDMGaxCtRSe3eXxDTGo3tLzVAILftIfIp4wQN3bgTtGPxvVjo8COkQiUaaQmIOSspz2sHNcpgKguXimfm3GOGTAiDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWuDXTB4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-427b1d4da32so3999345e9.0;
        Mon, 15 Jul 2024 05:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721048162; x=1721652962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z00WbKNgmkrRYDtqCUITJTBhEWl0+WHnz2pSKuGDVP4=;
        b=IWuDXTB4Al+BRv5TjbGZ8M8mdQW2KFDO9xaKmp5MdzxylFs4HJHMZ/vO9oWWGQt1WB
         bEPRDwk6GPcr02aF+fnRRJJAfOtk0Aur4LULyBYem8/2o/b2hynimfxH9cgr0bVrvOU0
         +vlpIKJe+0t7gInSgdHEipZnahve3yVHNabCDgX72Car8S55kqEtxGkDk/BLq/XUnGHJ
         vPFgs3bTzZVeCIgTBQdOZAe+CiyOFxph1wwlGozoyGWMEjabVbwykOVvMsgTiQlG0Leq
         y4Y+6fyvEtfjnyfXhZJBJ1RkZsTDG9eGI95eCN0gle3SUji0BXEjNst3xP4es1G48RCc
         lxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721048162; x=1721652962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z00WbKNgmkrRYDtqCUITJTBhEWl0+WHnz2pSKuGDVP4=;
        b=M7WNon6k3eaLRAN9HBHfPfLX7P20OM1dXdmV3eYXb11tFkE0xVeu8tEkfuutgi50VZ
         SWxcORQFVRWq86Y+Ybb+sKqwwcG/PGkVDz5aoDA0B0N0NV7iv2YfYmTzXyRzFFcsE7+/
         VXSLmTWeQl5dLjwYWMEXzEmzh1V3cazs6PtIgfiGmNnrLZA7Xx3Lxme1OEB78eD16iFp
         6XubmCVMnSCUX5Y2LgVF2w0BDquShPTXhSAiSuRovJD07bPfsah3qExZ1sszft6o4cAS
         a+6pP+0lry3xBuUQJNmQck5veb/J3pAr8jgpbFMXR4KkdtEYLV5C1rVj5/tz4vscHXSb
         NyLA==
X-Forwarded-Encrypted: i=1; AJvYcCW5XY3Sz9IlFTJ0fyXH3HEuimcHj3ibSAV3q86/jy1A06q02fZuqAMradXHBN/zS6NsPSCqxnvq8OLaAf4ZMDygfKN6XQB6TnGWIj7QKgR2aFLMiwt/H2rVK193nfsTzdP/3HOuT+uvRS8q2Qg6UlcHl7sYoiTFuX1BOdoU+eNFm/7nRWKvyJr5eLU=
X-Gm-Message-State: AOJu0Yw+dBYHAxROl1tU3Kyb3s6JfDDEhLWmTnWExbBhdK8Cmi0y1oom
	u7Icis+2Q6vqyJ+bR+DocAs3nEvc4IoI2uH4IKPNfHPg8I5w6HyV
X-Google-Smtp-Source: AGHT+IFmiuqjVuKUGvQC75DaCb7hW3CaYe2aGIJ/XIcwOO7+g7o6YKakb+scLxf4BqyjjvxQFaConA==
X-Received: by 2002:a05:600c:2248:b0:426:6eb6:1374 with SMTP id 5b1f17b1804b1-4279d9a9c18mr79603525e9.0.1721048161656;
        Mon, 15 Jul 2024 05:56:01 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e81f0dsm86091355e9.12.2024.07.15.05.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:56:01 -0700 (PDT)
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
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/3] clk: renesas: Add RZ/V2H(P) CPG driver
Date: Mon, 15 Jul 2024 13:54:38 +0100
Message-Id: <20240715125438.553688-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index fc3ff7a65aac..286a6ece8f80 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -661,6 +661,10 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
+	{
+		.compatible = "renesas,r9a09g057-cpg",
+		.data = &r9a09g057_cpg_info,
+	},
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 33631c101541..d3ad98123b29 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -148,4 +148,6 @@ struct rzv2h_cpg_info {
 	unsigned int num_resets;
 };
 
+extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
+
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.34.1


