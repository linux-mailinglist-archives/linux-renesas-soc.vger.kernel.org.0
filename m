Return-Path: <linux-renesas-soc+bounces-27800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLzrLQTPgWl1JwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:33:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C0D7BC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75D3930472AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 10:32:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0228D33ADB5;
	Tue,  3 Feb 2026 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHPjp2MF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B018319859
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114641; cv=none; b=Y+sA2Z2KtRSwZ3CRLyKIBcB8OcbEUnor+sxenBmOxe9IIyik36XPSosSL5j7P3VUs+IJvUfPyezagmOs5gPBMHmhMd76RgC//T0XQsmfNxrRlmEmyQJ1d5L3PS+IFqc/292jrPrBiOPg1KI7aCkA89cMGMSYm4t9Uy2/9iE4GSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114641; c=relaxed/simple;
	bh=nqmViFdlK42egAFk21RI6YJ93SMnNNtye7DqWuUewbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diIf1wkslFMabFlKoLJ3eOI0wSiAwYh0PNSIE+Odtbgrh/WpYJnvJUNq41utVg9u+H0pvOQuH+N3eacssUzRCyKDWGtVExJpKXDOIRoajv/hRPRBWBXM8NCqEdnsG6ZLU3mc1yWtLx5bljBWHLZzZLsjYfJKr8z5qiZZMA29EcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHPjp2MF; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-435f177a8f7so4270652f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 02:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770114637; x=1770719437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fmzs8IPde+eTGNnjrRCkZOQdZ8/wWeNdZ8L5PAnUMI4=;
        b=HHPjp2MFhO9BsOd9LGb/TnpzxV7eJFB+nOHY0HIiSsRjAcn7DwN7UbAQtxcDgZUw1Z
         bCq76Sd49AGv0e5Qudsa6VCnJLwv/w8zHQ1i6ZT+C3ZHAdPFMZwxLuTrylFl5/kfvWCx
         qUHDbQPgr/bQCiNAQoZfCdIzUpyT0n1UxdD4QvBTBSSy+hhusDaDl+etpGCOW5MDoX9M
         fbLOKuQJ+o2TbdIrU+xfriaUDjkR0rAKobFNRddJsQ0HwtO9CxFGvD+epP8FOK5I1eCa
         wYa2tevjq3kiR6/MoqMJyGfDXBaUoHdYQ8vZWlgfwVEsZo7WORMIe+bjuYkpKVZsbaRV
         Faew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114637; x=1770719437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fmzs8IPde+eTGNnjrRCkZOQdZ8/wWeNdZ8L5PAnUMI4=;
        b=fap3HF0oqf6gUFLUUuxca3R6tmwJ/6j4ZtqonMJNpLQ7IwxymoMSIx8C4lk8zI6Ujt
         TPY1woNb31ydjZKRTu8Tfh5bweNsDnHuKGc0eB1xC5xCLu/qFPL9pJI9Naj5R1R14P45
         sf7/XVSkX/LLVQ640P4qDt02KW1EsjmPz6Jg3M/5Z+gTFTsjNQDvKXKV2/G1B9tqt28l
         phSiTriCllCIyn5X/VHM9xvJr5NLUjCT/PqyvGlFw0L3KDQl8XxjXfidvmZpGz9MNsOT
         Gixy+rqegEop0HnBKDjNQfQZZnm6YlX1HUNZtAGbopy9+4qe9a8f5lKQoIBIUEGQURXK
         /Hfw==
X-Forwarded-Encrypted: i=1; AJvYcCVe1Lj5efutcw5cQAogHjPmpPGKThdDB43LO/rlPXdBc7QyZUuUlKUgtezgOW9qP25Eyte3VdVZp2rkG7zjAg5xRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7XrbxoWjgHuWktUvBJaSfAkjN74KvDIKXVGBwLQXM5kvyO0zW
	jycjK3J1uDZJsVjv4zL8luVlmIQApH20JegaC77hRpILKgMJXCMdnrlX
X-Gm-Gg: AZuq6aIS+jl5je1sQCWRYsTORkFXZ3ABWpG89nalCWqdwaZ5+acCVKGCoPeR7Lr+Rba
	FIlEgt6pT7xPGzp881Ote0Z5V+fE6SoYavmN4Z8uPEbFhNx+sEoKufLYAV2dlTmYWq3rUYtAHHk
	yLi8VMhFGgtUIDb/SKwMo/GBxbeaStCQWGoZzyxhQzyct8vcXIAmunDR0AD89rsLZWqJ93wXhTK
	H7lUzrgnqAmbspkvmLdk2UIhSomnhwXsD7vZPTLJwCZDU2VRZUi6KHAfEz7X30lofOwzyEDRWMt
	2XWNu528+FdaHtjLauR/cVGuJe39CS/hqPohOQB3BW6TZN5nTy9tEJlUZ5lz6rtaCvlfslZUVjr
	ABXmHU0J0XYK4c0sjWI3mUDemPrk5yeY4/x02eRZDxYR3Wmq9INciET5t3W3Pj4J0d3JDnzwtz9
	TsJ7S93MgvpRuBxrn9CQ==
X-Received: by 2002:a5d:64e6:0:b0:435:9223:bfd6 with SMTP id ffacd0b85a97d-435f3a7bc25mr24116805f8f.25.1770114637295;
        Tue, 03 Feb 2026 02:30:37 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm53160961f8f.35.2026.02.03.02.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:30:37 -0800 (PST)
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
Subject: [PATCH v3 06/10] clk: renesas: Add support for RZ/G3L SoC
Date: Tue,  3 Feb 2026 10:30:14 +0000
Message-ID: <20260203103031.247435-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27800-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 593C0D7BC5
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

The clock structure for RZ/G3L is almost identical to RZ/G3S SoC with more
IP blocks such as LCDC, CRU, LVDS and GPU.

Add minimal clock and reset entries required to boot the system on Renesas
RZ/G3L SMARC EVK and binds it with the RZ/G2L CPG core driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Added CLK_ETH{0,1}_TXC_TX_CLK_IN and CLK_ETH{0,1}_RXC_RX_CLK_IN clocks.
 * Dropped R9A08G046_IA55_PCLK from critical clock list.
---
 drivers/clk/renesas/Kconfig         |   7 +-
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/r9a08g046-cpg.c | 144 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |   6 ++
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 5 files changed, 158 insertions(+), 1 deletion(-)
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
index 000000000000..d77934872cf4
--- /dev/null
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -0,0 +1,144 @@
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
+	LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,
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
+	{ 1, 2 },
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
+	.num_resets = R9A08G046_LVDS_RESET_N + 1, /* Last reset ID + 1 */
+
+	.has_clk_mon_regs = true,
+};
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c0584bab58a3..f4deb5d3b837 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2093,6 +2093,12 @@ static const struct of_device_id rzg2l_cpg_match[] = {
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
index 55e815be16c8..1db413bb433d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -309,6 +309,7 @@ extern const struct rzg2l_cpg_info r9a07g043_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g044_cpg_info;
 extern const struct rzg2l_cpg_info r9a07g054_cpg_info;
 extern const struct rzg2l_cpg_info r9a08g045_cpg_info;
+extern const struct rzg2l_cpg_info r9a08g046_cpg_info;
 extern const struct rzg2l_cpg_info r9a09g011_cpg_info;
 
 int rzg2l_cpg_sd_clk_mux_notifier(struct notifier_block *nb, unsigned long event, void *data);
-- 
2.43.0


