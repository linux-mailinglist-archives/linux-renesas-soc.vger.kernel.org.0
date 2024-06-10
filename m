Return-Path: <linux-renesas-soc+bounces-6031-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E343902C7E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 01:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B32BB1C215A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2024 23:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1446153BE2;
	Mon, 10 Jun 2024 23:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwIXcRMw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D07152E17;
	Mon, 10 Jun 2024 23:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718062357; cv=none; b=nZcJOWW+FcQHcFo5yc7XDz+Gedfl4+hb5jQ6h/7mjzWm9dPD3Vjqs7ajjZ7jT+lhN4B51DO5523DmnMQ2j9Ojtd+sGmWr42veOjndGMefgtwdEG/PARB+7clQHhtgZGHydaIVDKIHeuugGrIvgzCb36xf1wPMnlX2+kprSJI/gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718062357; c=relaxed/simple;
	bh=6/QglN+PpX0GwefFXH5L3Ad08rT5zeJAewTh+Os6rwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BsbnmtX3nFSssPVrMRhTddPScm+I4OVbAMAFF14v7hpOzP77pWB62Gh/uHSLLc7mTo8qmzdoYQ/A2ALCVXVJv5ZxBkj4XGErqd/bvttuO/98YZrfP5A0CIiSesPHrgf4u68lL38yvMVJ3xyJrGJ4QW+RKRLCozV8xPbsZtYHOls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwIXcRMw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-35f1c209893so2452031f8f.2;
        Mon, 10 Jun 2024 16:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718062354; x=1718667154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkJdZia3seAvpp6RZyYxApnMca2ZfrG8TVH3E3OcF1M=;
        b=EwIXcRMwpluo+wSAxm55Hsm00adUKoXtL0u+vapEpQ/3+KGCBYsk52Sb29Sv1ixAl0
         KgaIEks+TamDnVDx65gls5fZZgeWxMlS+dD3ddSLhQz+yUf+77yjbQ3HoZHpZwhK8lsN
         voTq5g+li+FzpWReFHATZ1LLSHW3BNSkwfyvqrXCLXHRUjMfvMNe3wZ3shspChdayUnF
         HykgqHQhhvYIRJDtaIJx3LzXVniuK6SK2xjPufBsaDUrfAo+H+4FuLtnL48SBcR09W8c
         +0z+/kW4TCOCGILHWpu0m78QGbbKUgZqpvyGZyzLeOmp8osNuKbadyNti23bwM+yH5rD
         pDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718062354; x=1718667154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkJdZia3seAvpp6RZyYxApnMca2ZfrG8TVH3E3OcF1M=;
        b=MYGX+RdsbaO11OBNmdM3k4zEkIHWI7+OP3gNC7juKZNFIkopQCQnktXbnvKmym6Hsc
         ppFsU/gJUKTSOin6XDGcqt0CXu4el8yBvQDIxz7qDY0BJQX8D14OtDypTAEddGR0nm/q
         W+DBqWQeEeU164anai/tENFvYKv51+gMvotYzlLHzANFysQhlWe9z2HSjj41hB4xVYt5
         9SyHLJeB+Zw/RMWpgNBaphfrDFaN7NfL3NcgDIttYKZfFXDEfdOWd7hWVa3DO5FAPtm2
         0v7okR/DZIUkvpGTKPPuQ3uxKrmwOmlMTrarqohXSf+QJE6dbqhfkfSuWGLU4c9XzJs5
         MG+A==
X-Forwarded-Encrypted: i=1; AJvYcCUFmoxIih8D8AxqkVZmxat7gJgM/1tZQ+C0cQRjkMgpW8j7f9pP0QS9aIWCQCAiFN4H8PwY+FKV05P+UTjhX5TFVBs9WVOIAhK7hTL4tyLO++NPhzzbnp9bBNf3+w7ekWkps9YfvtUhH483tkQJgMoMKAmwe1hDZ7AYH4cUwv4j3FKI7w==
X-Gm-Message-State: AOJu0Yy/mQS9rQlqzjwrmy9FUkc5DJAPCMgeMO3CvSJlHw0knUbgihjW
	mUBaLYRC2It8f9r083NVx/PGW8jpkMh5MqqnEM3D548MBrwiFYl+dJ2mIYJp
X-Google-Smtp-Source: AGHT+IEo8zhPKmKZ0sunFuThY1cOsq+xmpiNsQqispZfpHsuk9fF25WH7+fxVx5foSiFkcIqbTHFYg==
X-Received: by 2002:adf:ec4b:0:b0:35f:1aac:156f with SMTP id ffacd0b85a97d-35f1aac193amr4600157f8f.13.1718062354268;
        Mon, 10 Jun 2024 16:32:34 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:74ea:e666:238d:5e76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1efe9a74sm5447698f8f.104.2024.06.10.16.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 16:32:33 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 4/4] clk: renesas: Add RZ/V2H(P) CPG driver
Date: Tue, 11 Jun 2024 00:32:21 +0100
Message-Id: <20240610233221.242749-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2
- Updated commit description
- Dropped pll_clk1/clk2_offset
- Made r9a09g057_mod_clks/r9a09g057_resets as static const
- Now using register indexes
---
 drivers/clk/renesas/Kconfig         |  5 ++
 drivers/clk/renesas/Makefile        |  1 +
 drivers/clk/renesas/r9a09g057-cpg.c | 77 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     |  4 ++
 drivers/clk/renesas/rzv2h-cpg.h     |  2 +
 5 files changed, 89 insertions(+)
 create mode 100644 drivers/clk/renesas/r9a09g057-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 330c8bc03777..3f3f84eb357b 100644
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
index 000000000000..d47b4365b2de
--- /dev/null
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -0,0 +1,77 @@
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
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A09G057_IOTOP_0_SHCLK,
+
+	/* External Input Clocks */
+	CLK_QEXTAL,
+
+	/* Internal Core Clocks */
+	CLK_PLLCM33,
+	CLK_PLLCM33_DIV16,
+	CLK_PLLCA55,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("qextal", CLK_QEXTAL),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33", CLK_PLLCM33, CLK_QEXTAL, 200, 3),
+	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+
+	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLL_CONF(0x64)),
+};
+
+static const struct rzv2h_mod_clk r9a09g057_mod_clks[] = {
+	DEF_MOD("scif_0_clk_pck", CLK_PLLCM33_DIV16, 8, 15, 4, 15),
+};
+
+static const struct rzv2h_reset r9a09g057_resets[] = {
+	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
+};
+
+static const unsigned int r9a09g057_crit_mod_clks[] __initconst = {
+	MOD_CLK_BASE + 5,		/* ICU_0_PCLK_I */
+	MOD_CLK_BASE + 19,		/* GIC_0_GICCLK */
+};
+
+const struct rzv2h_cpg_info r9a09g057_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a09g057_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a09g057_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r9a09g057_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r9a09g057_crit_mod_clks),
+
+	/* Module Clocks */
+	.mod_clks = r9a09g057_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a09g057_mod_clks),
+	.num_hw_mod_clks = 25 * 16,
+
+	/* Resets */
+	.resets = r9a09g057_resets,
+	.num_resets = ARRAY_SIZE(r9a09g057_resets),
+	.num_hw_resets = 18 * 16,
+};
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index f3c9f562234b..7882cfb36998 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -652,6 +652,10 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
+	{
+		.compatible = "renesas,r9a09g057-cpg",
+		.data = &r9a09g057_cpg_info,
+	},
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index d2791a3a23a0..2a4411618b8a 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -159,4 +159,6 @@ struct rzv2h_cpg_info {
 	unsigned int num_crit_mod_clks;
 };
 
+extern const struct rzv2h_cpg_info r9a09g057_cpg_info;
+
 #endif	/* __RENESAS_RZV2H_CPG_H__ */
-- 
2.34.1


