Return-Path: <linux-renesas-soc+bounces-30001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GUVA3EmvWmr6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C112D9091
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B254C30168B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505BE39A803;
	Fri, 20 Mar 2026 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlOMzbgT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E4397E60
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003803; cv=none; b=YV/jxkovDE+008HTgN+pwY/pzoGPAflGXqcEPdh8khrLBBjhZj5I+FKUbyK6XpzaPSJqv9MUo8r2EpLvSLtTcNXkstN8qAwDcjLsokVxfQr6/0y2YJAPx/EjRcAw1ULu3YSnOVmNxrBCJ4I3TA9dGjD12ZpHJXX2QAM0ht40koQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003803; c=relaxed/simple;
	bh=Mi7Angt6+b61A+Y1eUX46lVAMC9hj9cjD8JZmytjgik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jllLLtRzEsPhQedFPYIOkbt4VNMyVHnXPAivt3T5we8P/3wG75mb1UdmqwurDXVCoZv9/Y5EjTji37zjltwJgs3ry2Z0RjUkhvJ/xqJQCiHpZkMR8VIl9mVZcBx60TDHCqlSXzb/X2yFV6X94rdIYx88JtTZCT7BEFWFUsQRXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlOMzbgT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9b190easo1388646f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 03:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003796; x=1774608596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu1ZwV7q3g9N7RM1SjBRgvddWM/MjicPQoKWZJBEQyU=;
        b=mlOMzbgTsbvVHcfrgYeCh/+JHoAK8OPXcZpGj08ahAoe23POVeSwFnwXLRSqLG49PV
         C+hzgHsmX4wj6An1dRjv/rZ4WQ9oEj8EepvKru7Vv8cyFJpaJ83extgmo41bZ6KPAQWT
         dVs6pe740mVx8uAhRA+mZIqDIwn3pKQ14e8pAcfYUNv3smLfrPLo1HSACbElKfbDuytP
         aOo1EEYwDfyLEXnXSvE1iwsIfCdJydJlD2X/t9ZU/KMmvh8LJmn965rGKrm8ZLCzqjZJ
         /iUFHdiWScd6Z71bhBPtlWOPckWVqcQEA8luW+z6p0Q7VY4mKdkj77vspgh3afc2P5YK
         XHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003796; x=1774608596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zu1ZwV7q3g9N7RM1SjBRgvddWM/MjicPQoKWZJBEQyU=;
        b=tOxVHQnMMRos3foRp5cjJn0dpl3hMHHZnwKKEyK5d9RtNAC8dbVI9Gzy5OMswgMFmi
         cUZJa1c0z2D9Y+g+4Hr21BIrpBc3mBS7QO3JboZOXFj2yvOORs0eeX2hOP7dkvRmhHUJ
         rIW3dl4f1VHTz/FjOobsmTBk1mdpIAI0LhZCQGHSQIzdrhvAjJ8SJbnkEZNz1OWDFs30
         UZcF/H23HPIaSjrnCZ4QUU8fLJW7yzp3YxDJ7+0sazSR2d/Svmyy+T0Ot5De1PjfKdH7
         1tidFyP9FdUmBJfhRbt0UKMlP2ihmiYUyUzkZDS2rUkkxvopWOzmVSVW9Xigh/LfIK/z
         vziw==
X-Forwarded-Encrypted: i=1; AJvYcCWq7rQk7G6j01MJWc7ryfyW+b/1FkMG015nPaTeFxXrsG68QzEiCCKDP+dgq8lm+8jOaNWV/4Gv2Qj+ddwiSJheow==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiVjH1QPT1vifZ1ibBnrXI+Tdrk8QliHfNdKzYNv55a2x7Czqo
	r6wT6VWIZqUYZHpH0d9F1h3hFaEI6UsXCNLmWCBqQtcAXvuN/tz3Vv1F
X-Gm-Gg: ATEYQzwWkPC4DXXlEmwbzD/RLDi0vCmpg6TKMS9X2GgpCCxRYXxz0kYrhrZyYPJtkb8
	Ga1ShJDcppM7b0GG1NOKeRUKcvYTfqEB5n1HFEwANe8C0zyepov3Y9DoyZs1f2YoKDbsuCejPA0
	w3cqOf4YzRNXax0g/x2YZFnDO23VxCQuF+r872LUn6GpLklFoYqEq0sqD46eFQUDov6zsCefdfH
	mNJVyNd/wqJPm3BWSRfa8JidLScBhiN31KAR99dG7sf+rANQhkg+p2jZz0bIYwKoEzcGsSwIV2W
	6OSDDE4Zm/C/zmTHirLP09asSdjvoPVliNsft3+RlqaDciTembJ3n5CHAE91GWqzjuWH/jrrhvz
	TlwKSdVIjz1KMQQR7MegbrphPWqQZyBpAfRnk+fONI4a56xQUNNbPiHw+79VZk8eJ5h51kmmOoT
	vXsisMlZzVhEOYQD4hCm5fUT4yoyVzi+0=
X-Received: by 2002:a05:6000:381:b0:43b:4212:2ee8 with SMTP id ffacd0b85a97d-43b64257171mr4873656f8f.24.1774003795838;
        Fri, 20 Mar 2026 03:49:55 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:55 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 06/10] clk: renesas: Add support for RZ/G3L SoC
Date: Fri, 20 Mar 2026 10:49:40 +0000
Message-ID: <20260320104950.42220-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30001-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.806];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: E8C112D9091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The clock structure for RZ/G3L is almost identical to that of the RZ/G3S
SoC with more IP blocks such as LCDC, CRU, LVDS, and GPU.

Add minimal clock and reset entries required to boot the system on Renesas
RZ/G3L SMARC EVK and bind it with the RZ/G2L CPG core driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * Replaced r9a08g046_critical_resets->r9a08g046_crit_resets
v5->v6:
 * No change 
v4->v5:
 * No change
v3->v4:
 * Updated commit description
 * Updated LAST_DT_CORE_CLK with R9A08G046_USB_SCLK
 * Fixed typo 2->8 in dtable_4_128[].
 * Added critical reset table r9a08g046_critical_resets[]
 * Updated num_resets
 * Added crit_resets and num_crit_resets to r9a08g046_cpg_info.
v2->v3:
 * No change.
v1->v2:
 * Added CLK_ETH{0,1}_TXC_TX_CLK_IN and CLK_ETH{0,1}_RXC_RX_CLK_IN clocks.
 * Dropped R9A08G046_IA55_PCLK from critical clock list.
---
 drivers/clk/renesas/Kconfig         |   7 +-
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a08g046-cpg.c | 153 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |   6 ++
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 5 files changed, 167 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/renesas/r9a08g046-cpg.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 6a5a04664990..0203ecbb3882 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -39,6 +39,7 @@ config CLK_RENESAS
 	select CLK_R9A07G044 if ARCH_R9A07G044
 	select CLK_R9A07G054 if ARCH_R9A07G054
 	select CLK_R9A08G045 if ARCH_R9A08G045
+	select CLK_R9A08G046 if ARCH_R9A08G046
 	select CLK_R9A09G011 if ARCH_R9A09G011
 	select CLK_R9A09G047 if ARCH_R9A09G047
 	select CLK_R9A09G056 if ARCH_R9A09G056
@@ -194,6 +195,10 @@ config CLK_R9A08G045
 	bool "RZ/G3S clock support" if COMPILE_TEST
 	select CLK_RZG2L
 
+config CLK_R9A08G046
+	bool "RZ/G3L clock support" if COMPILE_TEST
+	select CLK_RZG2L
+
 config CLK_R9A09G011
 	bool "RZ/V2M clock support" if COMPILE_TEST
 	select CLK_RZG2L
@@ -250,7 +255,7 @@ config CLK_RCAR_USB2_CLOCK_SEL
 	  This is a driver for R-Car USB2 clock selector
 
 config CLK_RZG2L
-	bool "RZ/{G2L,G2UL,G3S,V2L} family clock support" if COMPILE_TEST
+	bool "RZ/{G2{L,UL},G3{S,L},V2L} family clock support" if COMPILE_TEST
 	select RESET_CONTROLLER
 
 config CLK_RZV2H
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index d28eb276a153..bd2bed91ab29 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -36,6 +36,7 @@ obj-$(CONFIG_CLK_R9A07G043)		+= r9a07g043-cpg.o
 obj-$(CONFIG_CLK_R9A07G044)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A07G054)		+= r9a07g044-cpg.o
 obj-$(CONFIG_CLK_R9A08G045)		+= r9a08g045-cpg.o
+obj-$(CONFIG_CLK_R9A08G046)		+= r9a08g046-cpg.o
 obj-$(CONFIG_CLK_R9A09G011)		+= r9a09g011-cpg.o
 obj-$(CONFIG_CLK_R9A09G047)		+= r9a09g047-cpg.o
 obj-$(CONFIG_CLK_R9A09G056)		+= r9a09g056-cpg.o
diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
new file mode 100644
index 000000000000..6c77afdd34ea
--- /dev/null
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/G3L CPG driver
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+
+#include <dt-bindings/clock/r9a08g046-cpg.h>
+
+#include "rzg2l-cpg.h"
+
+/* RZ/G3L Specific registers. */
+#define G3L_CPG_PL2_DDIV		(0x204)
+#define G3L_CPG_PL3_DDIV		(0x208)
+#define G3L_CLKDIVSTATUS		(0x280)
+
+/* RZ/G3L Specific division configuration.  */
+#define G3L_DIVPL2A		DDIV_PACK(G3L_CPG_PL2_DDIV, 0, 2)
+#define G3L_DIVPL2B		DDIV_PACK(G3L_CPG_PL2_DDIV, 4, 2)
+#define G3L_DIVPL3A		DDIV_PACK(G3L_CPG_PL3_DDIV, 0, 2)
+
+/* RZ/G3L Clock status configuration. */
+#define G3L_DIVPL2A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 4, 1)
+#define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
+#define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
+
+enum clk_ids {
+	/* Core Clock Outputs exported to DT */
+	LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,
+
+	/* External Input Clocks */
+	CLK_EXTAL,
+	CLK_ETH0_TXC_TX_CLK_IN,
+	CLK_ETH0_RXC_RX_CLK_IN,
+	CLK_ETH1_TXC_TX_CLK_IN,
+	CLK_ETH1_RXC_RX_CLK_IN,
+
+	/* Internal Core Clocks */
+	CLK_PLL2,
+	CLK_PLL2_DIV2,
+	CLK_PLL3,
+	CLK_PLL3_DIV2,
+
+	/* Module Clocks */
+	MOD_CLK_BASE,
+};
+
+/* Divider tables */
+static const struct clk_div_table dtable_4_128[] = {
+	{ 0, 4 },
+	{ 1, 8 },
+	{ 2, 16 },
+	{ 3, 128 },
+	{ 0, 0 },
+};
+
+static const struct clk_div_table dtable_8_256[] = {
+	{ 0, 8 },
+	{ 1, 16 },
+	{ 2, 32 },
+	{ 3, 256 },
+	{ 0, 0 },
+};
+
+static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
+	/* External Clock Inputs */
+	DEF_INPUT("extal", CLK_EXTAL),
+	DEF_INPUT("eth0_txc_tx_clk", CLK_ETH0_TXC_TX_CLK_IN),
+	DEF_INPUT("eth0_rxc_rx_clk", CLK_ETH0_RXC_RX_CLK_IN),
+	DEF_INPUT("eth1_txc_tx_clk", CLK_ETH1_TXC_TX_CLK_IN),
+	DEF_INPUT("eth1_rxc_rx_clk", CLK_ETH1_RXC_RX_CLK_IN),
+
+	/* Internal Core Clocks */
+	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
+	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
+	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
+
+	/* Core output clk */
+	DEF_G3S_DIV("P0", R9A08G046_CLK_P0, CLK_PLL2_DIV2, G3L_DIVPL2B, G3L_DIVPL2B_STS,
+		    dtable_8_256, 0, 0, 0, NULL),
+	DEF_G3S_DIV("P1", R9A08G046_CLK_P1, CLK_PLL3_DIV2, G3L_DIVPL3A, G3L_DIVPL3A_STS,
+		    dtable_4_128, 0, 0, 0, NULL),
+	DEF_G3S_DIV("P3", R9A08G046_CLK_P3, CLK_PLL2_DIV2, G3L_DIVPL2A, G3L_DIVPL2A_STS,
+		    dtable_4_128, 0, 0, 0, NULL),
+};
+
+static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
+	DEF_MOD("gic_gicclk",		R9A08G046_GIC600_GICCLK, R9A08G046_CLK_P1, 0x514, 0,
+					MSTOP(BUS_PERI_COM, BIT(12))),
+	DEF_MOD("ia55_pclk",		R9A08G046_IA55_PCLK, R9A08G046_CLK_P0, 0x518, 0,
+					MSTOP(BUS_PERI_CPU, BIT(13))),
+	DEF_MOD("ia55_clk",		R9A08G046_IA55_CLK, R9A08G046_CLK_P1, 0x518, 1,
+					MSTOP(BUS_PERI_CPU, BIT(13))),
+	DEF_MOD("dmac_aclk",		R9A08G046_DMAC_ACLK, R9A08G046_CLK_P3, 0x52c, 0,
+					MSTOP(BUS_REG1, BIT(2))),
+	DEF_MOD("dmac_pclk",		R9A08G046_DMAC_PCLK, R9A08G046_CLK_P3, 0x52c, 1,
+					MSTOP(BUS_REG1, BIT(3))),
+	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
+					MSTOP(BUS_MCPU2, BIT(1))),
+};
+
+static const struct rzg2l_reset r9a08g046_resets[] = {
+	DEF_RST(R9A08G046_GIC600_GICRESET_N, 0x814, 0),
+	DEF_RST(R9A08G046_GIC600_DBG_GICRESET_N, 0x814, 1),
+	DEF_RST(R9A08G046_IA55_RESETN, 0x818, 0),
+	DEF_RST(R9A08G046_DMAC_ARESETN, 0x82c, 0),
+	DEF_RST(R9A08G046_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
+};
+
+static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
+	MOD_CLK_BASE + R9A08G046_GIC600_GICCLK,
+	MOD_CLK_BASE + R9A08G046_IA55_CLK,
+	MOD_CLK_BASE + R9A08G046_DMAC_ACLK,
+};
+
+static const unsigned int r9a08g046_crit_resets[] = {
+	R9A08G046_DMAC_ARESETN,
+	R9A08G046_DMAC_RST_ASYNC,
+};
+
+const struct rzg2l_cpg_info r9a08g046_cpg_info = {
+	/* Core Clocks */
+	.core_clks = r9a08g046_core_clks,
+	.num_core_clks = ARRAY_SIZE(r9a08g046_core_clks),
+	.last_dt_core_clk = LAST_DT_CORE_CLK,
+	.num_total_core_clks = MOD_CLK_BASE,
+
+	/* Critical Module Clocks */
+	.crit_mod_clks = r9a08g046_crit_mod_clks,
+	.num_crit_mod_clks = ARRAY_SIZE(r9a08g046_crit_mod_clks),
+
+	/* Module Clocks */
+	.mod_clks = r9a08g046_mod_clks,
+	.num_mod_clks = ARRAY_SIZE(r9a08g046_mod_clks),
+	.num_hw_mod_clks = R9A08G046_BSC_X_BCK_BSC + 1,
+
+	/* Resets */
+	.resets = r9a08g046_resets,
+	.num_resets = R9A08G046_BSC_X_PRESET_BSC + 1, /* Last reset ID + 1 */
+
+	/* Critical Resets */
+	.crit_resets = r9a08g046_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a08g046_crit_resets),
+
+	.has_clk_mon_regs = true,
+};
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 038b3f8e85a1..a510a4d32924 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2144,6 +2144,12 @@ static const struct of_device_id rzg2l_cpg_match[] = {
 		.data = &r9a08g045_cpg_info,
 	},
 #endif
+#ifdef CONFIG_CLK_R9A08G046
+	{
+		.compatible = "renesas,r9a08g046-cpg",
+		.data = &r9a08g046_cpg_info,
+	},
+#endif
 #ifdef CONFIG_CLK_R9A09G011
 	{
 		.compatible = "renesas,r9a09g011-cpg",
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index af0a003d93f7..10baf9e71a6e 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -316,6 +316,7 @@ extern const struct rzg2l_cpg_info r9a07g043_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g054_cpg_info;
 extern const struct rzg2l_cpg_info r9a08g045_cpg_info;
+extern const struct rzg2l_cpg_info r9a08g046_cpg_info;
 extern const struct rzg2l_cpg_info r9a09g011_cpg_info;
 
 int rzg2l_cpg_sd_clk_mux_notifier(struct notifier_block *nb, unsigned long event, void *data);
-- 
2.43.0


