Return-Path: <linux-renesas-soc+bounces-34006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pw1BL6DZL2qhHwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:53:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 216256857F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:53:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="p92lPY/G";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34006-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D3E7308B94D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 10:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D505344040;
	Mon, 15 Jun 2026 10:48:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C64233F8A5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:48:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520537; cv=none; b=Nvl7BWnmkoyzgvR4f+PaOW2rJkXPo6w5HgRJoPoAN9KO6EU5vpVBW3KI2+lxu698q33RmQ9DLcBGXSUuU97aRJUJWZDPuFVmjhiku4qr1SKcpj86pHb9bUzlCv5vXJwoh8i3oz3MIWIdBi7amA1dqCLRN/RFngjvv8j4NsQX/zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520537; c=relaxed/simple;
	bh=nhskWoArCL6Jq837M0EwxYWmBiJco0mE/rlqa5UCWgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pGjULZf+vzJ1u/FECzTQE1WbKx/pJ/G1MfRjm33p3SHxaEi34U5nWVju1ska/FNC0sdIlc0v5Jz0HZv8GM6Z7yq1lSElty+HSh2QDhcXs3lia+O5+uskJkrqjyzbb0FY2v0G0Dr41xWniNgzZaJJw3lR7TPEFu9nLBAngB84GLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p92lPY/G; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef82204c6so1630425f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520533; x=1782125333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cIRHt3yOSyLuKsYEC8ijAby7Kn6d1Ww4OwPuxoI7SQ=;
        b=p92lPY/GR9IaU0yonoq3PhxmjpGVa9ik5C/9ZYzujfnOQlbGZ9TNga3B+ePOamNy6g
         z8W9UD9AkxFmgdpeUqq9dtwCezYliVmBpylEs6zs0weILX/JeOnlErd4dtCHwLd4KjYf
         Lc7PpBdVhIdl8ozrNkDQLlDiQJ6pfvWrKfO+HQoj2hEFZBBMJ6EZpD4KQiBYbbOUb7kr
         Se5sEahouQVv2g+gL/Wc/kZt08sRR+VU4bWNSIbE3E9x25SYryizDGfV8ziVVJ8bwPIm
         x4XgGO73PO/Te1aFHJ1pfEHlRyzU4ShGz+s4teeaM2hZ9sTYp01eKEXgfau5MacYXUg9
         i6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520533; x=1782125333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/cIRHt3yOSyLuKsYEC8ijAby7Kn6d1Ww4OwPuxoI7SQ=;
        b=WUXafP7opkORCakgrmINQ6jI4sUBWVMp+8RCd703uAqlNyZXZjQOiW2K3GsvICo0go
         vrqH9RN3ng3+Bf4g9yjkW4Oj/z/Pk7OZ0F8DKxngSmrcR/XezLntN+z6ntJ5usShvT5R
         yvaPmXAW5Z2OVtQUEpbFQ03xUSXMF8LD4RF4DNOB49bCDlkOPR2Ymyp+lpecxnQrYNcu
         hvu2OGrx0IcUYbsMch7HbnSyqdNLPwx4NOI3TZvCZFIjdBS8UiIysSmMVlYv52VwFB8I
         cJ7dZahLzVwIcfLAD4AW77QQYL8g/U2S152nCf3bSTHkEnUr8xPCvXLfjXWCoEoBRDaV
         CEjw==
X-Forwarded-Encrypted: i=1; AFNElJ/BKLLowFYqhgkkRXTKjKYNEqmV8cjcaAv2NuZUNeCGVh8fplbLDWOY3SEcmHq0/0O3EN20EUH4uU14B/ckA3pgLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3cAZ9+p9RcDPjjDQM7d50/kzV3eX5UMva3DkyQ0hDw2RHgxE/
	DANeUB/BB9F504ZrrzCmWiMrx609j5ocIJE/rugs2ZLNy9hsG0yfBQbZ
X-Gm-Gg: Acq92OED+KUare6QcsarW1os8Ajc3Udm/mR9yKoRGJbTbcNEHMlQGzOd/GNVhfCSz1u
	lRyUOdRiC8DWy9d/Um6z3/ycCYKba/jH0dhnI0ROpp6MI9DosFfK7fZRW3h9hmyV722FZ6YY1zS
	M3MTArDmLhHiYO2MfVb5eCGyX1lyeU2UItS6xDtsT1IHKhJaDpZ5t9UIP//F7GWfPgzI0Yl8A4g
	MRuEnqn3JqrUnJXDxhZo2L6gmcdRApEhChcWZXFHwaIGxzuLecDEm/VyVUho8//XklJgToLgio9
	4v+v+0Aog1Y+1/FmyIR+UEqxYP0vpnsmPvJYF2v8S0/pqAreu9Fwc7Y0dfmbp9+K/da66KwAoQV
	EwydlRWZ/hLzOPXeti5ueyFx0gG9L5W0doGOsdrZnmQcYFBzU8LKiP6I900ZIQK3KU1z/WrD5iQ
	HN46B8PNVa7YQMFy8rEwPZDgrcplXhRa5GqgYQUQ05DkuNjcjHhKSHuvoDN19vUESORyVkSV/bG
	0TiM+i8bz7o5Fw6GLK5Nm4nIf1VbLW8NSk4fMgbmo0y20k=
X-Received: by 2002:a05:6000:26c5:b0:45e:8547:f21e with SMTP id ffacd0b85a97d-4606dbb0f07mr19960457f8f.36.1781520532731;
        Mon, 15 Jun 2026 03:48:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H display pipeline
Date: Mon, 15 Jun 2026 11:48:45 +0100
Message-ID: <20260615104845.4122868-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34006-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,init.name:url,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 216256857F1

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the clock definitions and PLL logic required to supply the LCDC
(VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H display
subsystem depends on a dedicated PLL (PLL3) and a set of new derived
clocks.

Introduce a new PLL clock type and implement rate recalculation,
programming and locking sequences for PLL3 using the RZ/T2H specific
divider and VCO limits. Add the corresponding muxes and divider entries,
expose the LCDC core clock, and register the LCDC module clock using the
correct PCLK parent.

This enables the RZ/T2H clock driver to generate the display pipeline
clocking tree needed by the DU and VSP-based composition engines, allowing
upcoming display support to be integrated without duplicating CPG logic.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- In r9a09g077_cpg_lcdc_div_determine_rate() made use of 
  clk_hw_get_parent_by_index() to ensure we retrieve pll3 as the parent.

v1->v2:
- Switched to use the new library
- Kconfig now selects CLK_RZV2H_CPG_LIB
- Renamed CPG_PLLEN to CPG_PLL_EN_EN
- Renamed LCDCDIV to LCDC_CLKD
- Changed ctr0/1 in r9a09g077_cpg_pll3_clk_recalc_rate() to use u32
---
 drivers/clk/renesas/Kconfig         |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c | 373 +++++++++++++++++++++++++++-
 2 files changed, 374 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 7659550b8566..5c0238e878b7 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -218,10 +218,12 @@ config CLK_R9A09G057
 config CLK_R9A09G077
 	bool "RZ/T2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
+	select CLK_RZV2H_CPG_LIB
 
 config CLK_R9A09G087
 	bool "RZ/N2H clock support" if COMPILE_TEST
 	select CLK_RENESAS_CPG_MSSR
+	select CLK_RZV2H_CPG_LIB
 
 config CLK_SH73A0
 	bool "SH-Mobile AG5 clock support" if COMPILE_TEST
diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index f777601a23b9..873c41ae5606 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -8,16 +8,23 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/math.h>
+#include <linux/module.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
 #include <dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h>
 #include "renesas-cpg-mssr.h"
 
+MODULE_IMPORT_NS("RZV2H_CPG");
+
 #define RZT2H_REG_BLOCK_SHIFT	11
 #define RZT2H_REG_OFFSET_MASK	GENMASK(10, 0)
 #define RZT2H_REG_CONF(block, offset)	(((block) << RZT2H_REG_BLOCK_SHIFT) | \
@@ -66,11 +73,26 @@
 #define DIVSCI2ASYNC	CONF_PACK(SCKCR3, 10, 2)
 #define DIVSCI3ASYNC	CONF_PACK(SCKCR3, 12, 2)
 #define DIVSCI4ASYNC	CONF_PACK(SCKCR3, 14, 2)
+#define LCDCDIVSEL	CONF_PACK(SCKCR3, 20, 4)
+
+#define PLL3EN		FIELD_PREP_CONST(OFFSET_MASK, (0xc0))
+
+#define CPG_PLL_EN_EN		BIT(0)
+#define CPG_PLL3_VCO_CTR0(x)	((x) + 0x4)
+#define CPG_PLL3_VCO_CTR0_PDIV	GENMASK(21, 16)
+#define CPG_PLL3_VCO_CTR0_MDIV	GENMASK(9, 0)
+#define CPG_PLL3_VCO_CTR1(x)	((x) + 0x8)
+#define CPG_PLL3_VCO_CTR1_KDIV	GENMASK(31, 16)
+#define CPG_PLL3_VCO_CTR1_SDIV	GENMASK(2, 0)
+#define CPG_PLL_MON(x)		((x) - 0x10)
+#define CPG_PLL_MON_LOCK	BIT(0)
 
 enum rzt2h_clk_types {
 	CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,	/* Clock with divider */
 	CLK_TYPE_RZT2H_MUX,			/* Clock with clock source selector */
 	CLK_TYPE_RZT2H_FSELXSPI,		/* Clock with FSELXSPIn source selector */
+	CLK_TYPE_RZT2H_PLL3,			/* PLL3 Clock */
+	CLK_TYPE_RZT2H_LCDCDIV,			/* LCDC divider clock */
 };
 
 #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
@@ -83,10 +105,51 @@ enum rzt2h_clk_types {
 #define DEF_DIV_FSELXSPI(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_FSELXSPI, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, .flag = 0)
+#define DEF_PLL3(_name, _id, _parent, _conf) \
+	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_PLL3, .conf = _conf, \
+		 .parent = _parent)
+#define DEF_DIV_LCDC(_name, _id, _parent, _conf, _dtable) \
+	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_LCDCDIV, .conf = _conf, \
+		 .parent = _parent, .dtable = _dtable, .flag = CLK_SET_RATE_PARENT)
+
+struct pll_clk {
+	void __iomem *reg;
+	const struct rzv2h_pll_limits *limits;
+	struct device *dev;
+	struct rzv2h_pll_pars pll_parameters;
+	struct clk_hw hw;
+	unsigned long cur_rate;
+};
+
+#define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
+
+struct r9a09g077_lcdc_div_clk {
+	const struct clk_div_table *dtable;
+	void __iomem *reg;
+	struct device *dev;
+	struct clk_hw hw;
+	u32 conf;
+	u8 divider;
+};
+
+#define to_lcdc_div_clk(_hw) \
+	container_of(_hw, struct r9a09g077_lcdc_div_clk, hw)
+
+#define RZT2H_MAX_LCDC_DIV_TABLES	16
+
+static const struct rzv2h_pll_limits r9a09g077_cpg_pll3_limits = {
+	.input_fref = 48 * MEGA,
+	.fout = { .min = 25 * MEGA, .max = 430 * MEGA },
+	.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },
+	.m = { .min = 0x40, .max = 0x3ff },
+	.p = { .min = 0x2, .max = 0x8 },
+	.s = { .min = 0x0, .max = 0x6 },
+	.k = { .min = -32768, .max = 32767 },
+};
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_PCLKCAN,
+	LAST_DT_CORE_CLK = R9A09G077_LCDC_CLKD,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -96,10 +159,12 @@ enum clk_ids {
 	CLK_PLL0,
 	CLK_PLL1,
 	CLK_PLL2,
+	CLK_PLL3,
 	CLK_PLL4,
 	CLK_SEL_CLK_PLL0,
 	CLK_SEL_CLK_PLL1,
 	CLK_SEL_CLK_PLL2,
+	CLK_SEL_CLK_PLL3,
 	CLK_SEL_CLK_PLL4,
 	CLK_PLL4D1,
 	CLK_PLL4D1_DIV3,
@@ -107,6 +172,7 @@ enum clk_ids {
 	CLK_PLL4D3,
 	CLK_PLL4D3_DIV10,
 	CLK_PLL4D3_DIV20,
+	CLK_PLL4D50,
 	CLK_SCI0ASYNC,
 	CLK_SCI1ASYNC,
 	CLK_SCI2ASYNC,
@@ -119,6 +185,7 @@ enum clk_ids {
 	CLK_SPI3ASYNC,
 	CLK_DIVSELXSPI0_SCKCR,
 	CLK_DIVSELXSPI1_SCKCR,
+	CLK_LCDDIVSEL,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -130,6 +197,26 @@ static const struct clk_div_table dtable_1_2[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_32[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{8, 18},
+	{9, 20},
+	{10, 22},
+	{11, 24},
+	{12, 26},
+	{13, 28},
+	{14, 30},
+	{15, 32},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_6_8_16_32_64[] = {
 	{6, 64},
 	{5, 32},
@@ -152,6 +239,7 @@ static const struct clk_div_table dtable_24_25_30_32[] = {
 static const char * const sel_clk_pll0[] = { ".loco", ".pll0" };
 static const char * const sel_clk_pll1[] = { ".loco", ".pll1" };
 static const char * const sel_clk_pll2[] = { ".loco", ".pll2" };
+static const char * const sel_clk_pll3[] = { ".loco", ".pll3" };
 static const char * const sel_clk_pll4[] = { ".loco", ".pll4" };
 static const char * const sel_clk_pll4d1_div3_div4[] = { ".pll4d1_div3", ".pll4d1_div4" };
 static const char * const sel_clk_pll4d3_div10_div20[] = { ".pll4d3_div10", ".pll4d3_div20" };
@@ -173,10 +261,14 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 		sel_clk_pll1, ARRAY_SIZE(sel_clk_pll1), CLK_MUX_READ_ONLY),
 	DEF_MUX(".sel_clk_pll2", CLK_SEL_CLK_PLL2, SEL_PLL,
 		sel_clk_pll2, ARRAY_SIZE(sel_clk_pll2), CLK_MUX_READ_ONLY),
+	DEF_MUX(".sel_clk_pll3", CLK_SEL_CLK_PLL3, SEL_PLL,
+		sel_clk_pll3, ARRAY_SIZE(sel_clk_pll3), CLK_MUX_READ_ONLY),
 	DEF_MUX(".sel_clk_pll4", CLK_SEL_CLK_PLL4, SEL_PLL,
 		sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), CLK_MUX_READ_ONLY),
 
 	DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
+	DEF_FIXED(".pll4d50", CLK_PLL4D50, CLK_SEL_CLK_PLL4, 50, 1),
+	DEF_PLL3(".pll3", CLK_PLL3, CLK_PLL4D50, PLL3EN),
 	DEF_FIXED(".pll4d1_div3", CLK_PLL4D1_DIV3, CLK_PLL4D1, 3, 1),
 	DEF_FIXED(".pll4d1_div4", CLK_PLL4D1_DIV4, CLK_PLL4D1, 4, 1),
 	DEF_FIXED(".pll4d3", CLK_PLL4D3, CLK_SEL_CLK_PLL4, 3, 1),
@@ -229,6 +321,7 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 	DEF_FIXED("PCLKL", R9A09G077_CLK_PCLKL, CLK_SEL_CLK_PLL1, 16, 1),
 	DEF_FIXED("PCLKAH", R9A09G077_CLK_PCLKAH, CLK_PLL4D1, 6, 1),
 	DEF_FIXED("PCLKAM", R9A09G077_CLK_PCLKAM, CLK_PLL4D1, 12, 1),
+	DEF_FIXED("PCLKAL", R9A09G077_CLK_PCLKAL, CLK_PLL4D1, 24, 1),
 	DEF_FIXED("SDHI_CLKHS", R9A09G077_SDHI_CLKHS, CLK_SEL_CLK_PLL2, 1, 1),
 	DEF_FIXED("USB_CLK", R9A09G077_USB_CLK, CLK_PLL4D1, 48, 1),
 	DEF_FIXED("ETCLKA", R9A09G077_ETCLKA, CLK_SEL_CLK_PLL1, 5, 1),
@@ -242,6 +335,8 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 			 FSELXSPI1, dtable_6_8_16_32_64),
 	DEF_MUX("PCLKCAN", R9A09G077_PCLKCAN, FSELCANFD,
 		sel_clk_pll4d3_div10_div20, ARRAY_SIZE(sel_clk_pll4d3_div10_div20), 0),
+	DEF_DIV_LCDC("LCDC_CLKD", R9A09G077_LCDC_CLKD, CLK_SEL_CLK_PLL3, LCDCDIVSEL,
+		     dtable_2_32),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
@@ -272,6 +367,7 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci5fck", 600, CLK_SCI5ASYNC),
 	DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
 	DEF_MOD("spi3", 602, CLK_SPI3ASYNC),
+	DEF_MOD("lcdc", 1204, R9A09G077_CLK_PCLKAL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
 };
@@ -481,6 +577,276 @@ r9a09g077_cpg_fselxspi_div_clk_register(struct device *dev,
 	return hw->clk;
 }
 
+static unsigned long r9a09g077_cpg_pll3_clk_recalc_rate(struct clk_hw *hw,
+							unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	u32 ctr0, ctr1;
+	u8 pdiv, sdiv;
+	u64 rate;
+	u16 mdiv;
+	s16 kdiv;
+
+	ctr0 = readl(CPG_PLL3_VCO_CTR0(pll_clk->reg));
+	ctr1 = readl(CPG_PLL3_VCO_CTR1(pll_clk->reg));
+
+	pdiv = FIELD_GET(CPG_PLL3_VCO_CTR0_PDIV, ctr0);
+	mdiv = FIELD_GET(CPG_PLL3_VCO_CTR0_MDIV, ctr0);
+	kdiv = (s16)FIELD_GET(CPG_PLL3_VCO_CTR1_KDIV, ctr1);
+	sdiv = FIELD_GET(CPG_PLL3_VCO_CTR1_SDIV, ctr1);
+
+	rate = mul_u64_u32_shr(parent_rate, (mdiv << 16) + kdiv, 16 + sdiv);
+
+	return DIV_ROUND_CLOSEST_ULL(rate, pdiv);
+}
+
+static int r9a09g077_cpg_pll3_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	u64 rate_millihz;
+
+	if (req->rate == pll_clk->cur_rate)
+		return 0;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (!rzv2h_cpg_get_pll_pars(pll_clk->limits, &pll_clk->pll_parameters,
+				    rate_millihz)) {
+		dev_dbg(pll_clk->dev,
+			"failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+	req->rate = DIV_ROUND_CLOSEST_ULL(pll_clk->pll_parameters.freq_millihz, MILLI);
+	pll_clk->cur_rate = req->rate;
+
+	return 0;
+}
+
+static int r9a09g077_cpg_pll3_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzv2h_pll_pars *params = &pll_clk->pll_parameters;
+	void __iomem *offset = pll_clk->reg;
+	u32 val;
+	int ret;
+
+	/* Put PLL into standby mode */
+	writel(0, offset);
+	ret = readl_poll_timeout_atomic(CPG_PLL_MON(offset),
+					val, !(val & CPG_PLL_MON_LOCK),
+					100, 2000);
+	if (ret) {
+		dev_err(pll_clk->dev, "Failed to put PLL into standby mode");
+		return ret;
+	}
+
+	/* Output clock setting 1 */
+	val = readl(CPG_PLL3_VCO_CTR0(offset));
+	FIELD_MODIFY(CPG_PLL3_VCO_CTR0_MDIV, &val, params->m);
+	FIELD_MODIFY(CPG_PLL3_VCO_CTR0_PDIV, &val, params->p);
+	writel(val, CPG_PLL3_VCO_CTR0(offset));
+
+	/* Output clock setting 2 */
+	val = readl(CPG_PLL3_VCO_CTR1(offset));
+	FIELD_MODIFY(CPG_PLL3_VCO_CTR1_KDIV, &val, params->k);
+	FIELD_MODIFY(CPG_PLL3_VCO_CTR1_SDIV, &val, params->s);
+	writel(val, CPG_PLL3_VCO_CTR1(offset));
+
+	writel(CPG_PLL_EN_EN, offset);
+
+	/* PLL normal mode transition, output clock stability check */
+	ret = readl_poll_timeout_atomic(CPG_PLL_MON(offset),
+					val, (val & CPG_PLL_MON_LOCK),
+					100, 2000);
+	if (ret) {
+		writel(0, offset);
+		dev_err(pll_clk->dev, "Failed to put PLL into normal mode");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct clk_ops r9a09g077_cpg_pll3_ops = {
+	.recalc_rate = r9a09g077_cpg_pll3_clk_recalc_rate,
+	.determine_rate = r9a09g077_cpg_pll3_determine_rate,
+	.set_rate = r9a09g077_cpg_pll3_set_rate,
+};
+
+static struct clk * __init
+r9a09g077_cpg_pll3_clk_register(struct device *dev,
+				const struct cpg_core_clk *core,
+				void __iomem *addr,
+				struct cpg_mssr_pub *pub,
+				const struct rzv2h_pll_limits *limits)
+{
+	struct clk_init_data init = {};
+	const struct clk *parent;
+	const char *parent_name;
+	struct pll_clk *pll_clk;
+	int ret;
+
+	parent = pub->clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
+	if (!pll_clk)
+		return ERR_PTR(-ENOMEM);
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &r9a09g077_cpg_pll3_ops;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	pll_clk->dev = dev;
+	pll_clk->hw.init = &init;
+	pll_clk->reg = addr;
+	pll_clk->limits = limits;
+
+	ret = devm_clk_hw_register(dev, &pll_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pll_clk->hw.clk;
+}
+
+static int r9a09g077_cpg_lcdc_div_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct r9a09g077_lcdc_div_clk *dsi_div = to_lcdc_div_clk(hw);
+	struct clk_hw *mux_hw = clk_hw_get_parent(hw);
+	u8 table[RZT2H_MAX_LCDC_DIV_TABLES] = { 0 };
+	struct rzv2h_pll_div_pars dsi_params;
+	const struct clk_div_table *div;
+	struct pll_clk *pll_clk;
+	unsigned int i = 0;
+	u64 freq_millihz;
+
+	/* index 1 is always .pll3 in sel_clk_pll3[] */
+	pll_clk = to_pll(clk_hw_get_parent_by_index(mux_hw, 1));
+
+	for (div = dsi_div->dtable; div->div; div++) {
+		if (i >= RZT2H_MAX_LCDC_DIV_TABLES)
+			return -EINVAL;
+		table[i++] = div->div;
+	}
+
+	freq_millihz = mul_u32_u32(req->rate, MILLI);
+
+	if (!rzv2h_cpg_get_pll_divs_pars(pll_clk->limits, &dsi_params, table,
+					 i, freq_millihz)) {
+		dev_err(dsi_div->dev,
+			"LCDC divider failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params.div.freq_millihz, MILLI);
+	req->best_parent_rate = req->rate * dsi_params.div.divider_value;
+	dsi_div->divider = dsi_params.div.divider_value;
+	pll_clk->cur_rate = req->best_parent_rate;
+	pll_clk->pll_parameters = dsi_params.pll;
+
+	return 0;
+}
+
+static int r9a09g077_cpg_lcdc_div_set_rate(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate)
+{
+	struct r9a09g077_lcdc_div_clk *dsi_div = to_lcdc_div_clk(hw);
+	const struct clk_div_table *clkt;
+	bool divider_found = false;
+	u32 val, shift;
+
+	for (clkt = dsi_div->dtable; clkt->div; clkt++) {
+		if (clkt->div == dsi_div->divider) {
+			divider_found = true;
+			break;
+		}
+	}
+
+	if (!divider_found)
+		return -EINVAL;
+
+	shift = GET_SHIFT(dsi_div->conf);
+	val = readl(dsi_div->reg);
+	val &= ~(clk_div_mask(GET_WIDTH(dsi_div->conf)) << shift);
+	val |= clkt->val << shift;
+	writel(val, dsi_div->reg);
+
+	return 0;
+}
+
+static unsigned long
+r9a09g077_cpg_lcdc_div_recalc_rate(struct clk_hw *hw,
+				   unsigned long parent_rate)
+{
+	struct r9a09g077_lcdc_div_clk *dsi_div = to_lcdc_div_clk(hw);
+	u32 div;
+
+	div = readl(dsi_div->reg);
+	div >>= GET_SHIFT(dsi_div->conf);
+	div &= clk_div_mask(GET_WIDTH(dsi_div->conf));
+	div = dsi_div->dtable[div].div;
+
+	return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
+}
+
+static const struct clk_ops r9a09g077_cpg_lcdc_div_ops = {
+	.recalc_rate = r9a09g077_cpg_lcdc_div_recalc_rate,
+	.determine_rate = r9a09g077_cpg_lcdc_div_determine_rate,
+	.set_rate = r9a09g077_cpg_lcdc_div_set_rate,
+};
+
+static struct clk * __init
+r9a09g077_cpg_lcdc_div_clk_register(struct device *dev,
+				    const struct cpg_core_clk *core,
+				    void __iomem *addr,
+				    struct cpg_mssr_pub *pub)
+{
+	struct r9a09g077_lcdc_div_clk *clk_hw_data;
+	struct clk_init_data init = {};
+	struct clk **clks = pub->clks;
+	const struct clk *parent;
+	const char *parent_name;
+	struct clk_hw *hw;
+	int ret;
+
+	parent = clks[core->parent];
+	if (IS_ERR(parent))
+		return ERR_CAST(parent);
+
+	clk_hw_data = devm_kzalloc(dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->dtable = core->dtable;
+	clk_hw_data->reg = addr;
+	clk_hw_data->conf = core->conf;
+	clk_hw_data->dev = dev;
+	clk_hw_data->divider = 32; /* Initialize divider for LCDC */
+
+	parent_name = __clk_get_name(parent);
+	init.name = core->name;
+	init.ops = &r9a09g077_cpg_lcdc_div_ops;
+	init.flags = core->flag;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	hw = &clk_hw_data->hw;
+	hw->init = &init;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return hw->clk;
+}
+
 static struct clk * __init
 r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
 			   const struct cpg_mssr_info *info,
@@ -497,6 +863,11 @@ r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
 		return r9a09g077_cpg_mux_clk_register(dev, core, addr, pub);
 	case CLK_TYPE_RZT2H_FSELXSPI:
 		return r9a09g077_cpg_fselxspi_div_clk_register(dev, core, addr, pub);
+	case CLK_TYPE_RZT2H_PLL3:
+		return r9a09g077_cpg_pll3_clk_register(dev, core, pub->base1 + offset,
+						       pub, &r9a09g077_cpg_pll3_limits);
+	case CLK_TYPE_RZT2H_LCDCDIV:
+		return r9a09g077_cpg_lcdc_div_clk_register(dev, core, addr, pub);
 	default:
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.54.0


