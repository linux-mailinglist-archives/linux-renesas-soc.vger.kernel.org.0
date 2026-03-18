Return-Path: <linux-renesas-soc+bounces-29734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAGiG6NlumklWAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:43:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028B2B8485
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DC833019C89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A8F3921CE;
	Wed, 18 Mar 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcf40oJ6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47EA38CFE9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823328; cv=none; b=u7JUXobRJTznXKFLNDAittS/TA6s/5kFMK27bAZS+qxopCgKIc2aoYQT72gGneVg72vEwbB/ekguLQMGVJ8KNsf9GMOpaa5pXNTe7vcSxKqKTltF855qsV3OJJQ1TRPegD2VkpMF8UypVhRI+sXsGQ2Ge+HcpMF5Udb9WWKgw3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823328; c=relaxed/simple;
	bh=IoYcwLlvpD+lYiqMrhx/N2SyBmiRvYzMVE1SkNl0qG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1fBr0HEYUzd7SwR+QgI16yaScp7w4n0LKg/RSBqaT7k+QIPeKLljPMjUs/V4K7IwDbD31AEXlNYbKt1rTGnJBe6v4b+q4f0RLhCGfVKIVPswUOb9L8M4wpMYiBxCpSTQBgepret4fOYWELmAM/C7+viF82vQSeWKbS8BOD24Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcf40oJ6; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b45bb7548so358670f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 01:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823320; x=1774428120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Am8bmvllyBnF0DbQkgpCmJ3LGHpFz/K5cFAfA0uaUCo=;
        b=bcf40oJ6IdCcgsYHsnoN+QozcLxDxCgmO2clU891kOduzFjea8UoMiZ7c+FiyO4iTq
         bmwYSlmD8JIZc36Q62ak49FztkIMWCaGGmByM3Ocx6GPylhmTaP9Lv7fT7b/sCTcGTaJ
         AaT5CA4cJhVUYWmgbNunhsGKR7HGmiwXqxxpnMltuLc3jdp0HxbLsFyrrXO98BrrGyMw
         4opRS0neD3b7XS3V8AbpMd7p49No48l84gooa1PseqLI69lBMUlhlcrN+8HUjPtUeqfZ
         8+AJ1RvxFSEd7W4rHvI4RWsD5fTYYE9RfN5k9NIbDOw2mlmiUnTZ4JYMfmDKYFn3aMsB
         vYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823320; x=1774428120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Am8bmvllyBnF0DbQkgpCmJ3LGHpFz/K5cFAfA0uaUCo=;
        b=W9zBCoyWdqb3CnF1XkXPcOCCM7LLo8C5o07KQ556AYq5XiGR2nhD5RDXliqfYhvhls
         3Ke2SxWDTG4i0tv8ZcussETqGSXgc9SzVhLbvKauZVZojLsK8hql/B15PgI/6PylB9Ei
         2IgQEVaL1iNqa41RlQzz80c8rKspbI675lgqUv4oMWFzV3nzengeBLZug/q02REusE//
         TZnGRz37eyxBZpjy6yRu2VJMBiM13YeucOcQlVFt2GF4nDu85xcMVrlIDZhooQ8Ex5qE
         HnkZBWBIN7SG8ADCUXutFvM2J9h0AN46aPMuB4jbqR1la0xg7riJlshZmTHUJc6XXa8g
         EtVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo96jnImb2ip/3ruOMCi9ZsT9NoffqaK2pgzi/n8DXUdgmsx9xmdE510rd9J7C7y85vyOyzleK/atsz89f6tkoFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKjb+ynxp7Srlto5j6hzYlVQgtvbzmjFGoJXEJyNIYDjGVDYW
	HZhfsRpkoTJoQvNSz+/ab5qvrHr8YbpSknndRM6D0/Qcdx89TFl+ZM19
X-Gm-Gg: ATEYQzwCE2hVC1CmhOWdC+YT7IG6mOcHX6YkQ+zSe3cGqZvpyZddqIBomLXUPNhsQr8
	S5U26CXWpvJh1vakDd072009jKyrNhhfEVEtyl7f/KlVD9xI11l/pvcXmVYC5LD8loQlcfnfozJ
	y4NUtep7QTzsvM6G0H5DEr2A0VDVAsqUgKrtY+x2PXNp/Ol05fP7px1zRThU6WTLES2xJOuXQM6
	oc4x3IHwfbjIum2NGSt7ilgTwbw7GrxrJXdSfV1bv7lpKQquKZJItVSQUNlxbSc5Yj82p3Sqxua
	uxkWzVT6DtOvpglY4p/sa/suj00jxJDbODY23sgmePSGFXwE0O6DZQ0OwgV1MV2ojOwWoE2wJec
	QPvm3/uYE2UNI83msHrDeuh3/Gzy7g5SoRi3If+bdLSng9iHmAWbyJ6LIgut/1HXJAV/dKIBEgH
	dajvPKcL2Q8e64JeInjDyCxOcAlyK4u6bb8VZg3SXQZ5TMnLREuiQIUoHOom0=
X-Received: by 2002:a05:6000:40dd:b0:439:c510:f97a with SMTP id ffacd0b85a97d-43b527cc57fmr3927088f8f.48.1773823319444;
        Wed, 18 Mar 2026 01:41:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:41:59 -0700 (PDT)
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
Subject: [PATCH v5 5/9] clk: renesas: Add support for RZ/G3L SoC
Date: Wed, 18 Mar 2026 08:41:40 +0000
Message-ID: <20260318084151.122674-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29734-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 3028B2B8485
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The clock structure for RZ/G3L is almost identical to that of the RZ/G3S
SoC with more IP blocks such as LCDC, CRU, LVDS, and GPU.

Add minimal clock and reset entries required to boot the system on Renesas
RZ/G3L SMARC EVK and bind it with the RZ/G2L CPG core driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index 000000000000..38a5204ab904
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
+static const unsigned int r9a08g046_critical_resets[] = {
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
+	.crit_resets = r9a08g046_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a08g046_critical_resets),
+
+	.has_clk_mon_regs = true,
+};
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c2d31b93f62b..3baadb14567d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -2167,6 +2167,12 @@ static const struct of_device_id rzg2l_cpg_match[] = {
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


