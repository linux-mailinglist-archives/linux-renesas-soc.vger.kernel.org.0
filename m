Return-Path: <linux-renesas-soc+bounces-33747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SpPjHfzzJ2r16AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:07:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDFE65F4C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:07:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SuRrv1Zb;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33747-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC2AE305D20A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B233FADF6;
	Tue,  9 Jun 2026 10:59:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82663FE661
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 10:59:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002780; cv=none; b=UZtqOYcfwhfVGWGbSXrST3Feh4imfXhs0sQM6Fm64QxAbxXCk5t+Nh2Rm8JeIyHHJ7mZFW83gi82GtU1azx54QIVTHaa1PGL59tmt+j0Qi7GD0EzBnQN3NT3gyI+Xl8Lv/Fwiu5a46ikSPa3roBWpCTH40RJCv0rId31isA6FNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002780; c=relaxed/simple;
	bh=HgihmDlKr2QK/mcPnPCL8YjKGQ/ZiI8kjepFcybdaIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBBFoAEmPrK+U0N6lWZhiN8kscoOjWcHIDCDtskJy4AHplIbHwwXSp6SGEaWy2YqSLXRoJ51BOHhThK0zmNHEF6rK0+PGR9elB1guX8ODM7eb+ac99oPF3F1zyix9/ffBQtXrQorIHx+JZgblAvGl9+r0vQIR8ozuLKHx/eXUZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuRrv1Zb; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cdae130cso13307015e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002776; x=1781607576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmgiihUZ6uoCNDtqz9w4h1EIfJ0KMoxHrsdIwToPLvM=;
        b=SuRrv1ZbESdpB7MkrZaYu28s6Qa4repjIx6ydmsGKOuZ+gRZ5Cyl3FwbMLI7IhkYkE
         SozjV/QY2WlGNiUYswC2VWpPuPzFpMHCRmX3ZO4Smcm3295BUPiHoZRw60Hl4GWqRajR
         c4SSeahCtiitVj3YCyb7F14mafqokwxvJEPDkTIp4RbNVEHr7+hstbXVpPAHHlGAJgM/
         DcB+aHxNmtUWEGaMK1SqLFdxch4KFYBXrSo8/n6JNufbPB+EB0+zkGI0+pQ+S+0tIBnA
         PDMi4nUgpuzXGR2Ll8rstAiG7utkreV6W4PtbaSegoaPz74DZthaPXiW6EOTILSgOwpw
         NWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002776; x=1781607576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PmgiihUZ6uoCNDtqz9w4h1EIfJ0KMoxHrsdIwToPLvM=;
        b=sKCqug9zSbYxkDqDXJh9yD0NLpbyu4Wkc1aXZRvT54r0/K3q4LYjptchND1WJ07/QJ
         PCt8PPZz7ZdN8IEM61EGoOJ7w8oQFOfoQUI1a6LgIyBdLFZwjR66itxQ7/0YRDEGdilT
         2tMlggmEYvjomkRh1UeVhick/+uQ1RzZzN0Ipwrv/OMYNfub3xs+UnGeJWCo38JwHTUA
         t4u+SL8NRa31bZIii3cfL2R08d1K2r24F1saM78HyQRg7nDhO7+d1BZ4gLPJBa4vvhHY
         wD4Ir0yjouK/fILNr4dwFgBn1YH4viklJ1RsmQC2Lrjp16zC6N+HkINo4y5u4BwaVXDj
         6uLA==
X-Forwarded-Encrypted: i=1; AFNElJ8HbJ04pPvrnNG23CNbUgeRmTnHZ6J6FyXTFMzIb0xO/CEL5PvxEZApku25CUYovyWhifYzkmtzZgaaxSmzu71ovA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx12pBi2DYlNiCu7nynHWta3sGK8cj8c8euSCR0J1m8BCu1jPGc
	yzGB+LODY2CcWpQDqMJnrkaa8csQViloqTAlvPuGr3L2bWFxG7PRt6pY
X-Gm-Gg: Acq92OHrnMPETzavFC6keo7eLFCMVSdQuqdDJFsHiysH+NUcyz63FHSf8o/Y1y0e7Cg
	s7zO0MZaJk9YbkVSE1mqA1p50iDk85RCC0kGwdYA2CldWlFeC4IXQPzKjpMb1akFE1DVnegYQCe
	D88ZyonoE17vsrDStPhhWnDVN87YShVWL9JumCh5Gs4MpupFRe76VvHa8Rz92lJBDXRwCdQ4Ol5
	1pFPRFH7wMlbrD3fGdR4ts3ry0L+8BopWafFHXirKxONMqEw546RPEHxLvwLBqGB1ONZZNZ2GX6
	NYh3nAiyicmba3oI0aeIFzzn8ZmB9pYlrfRwnTufM98Qs0whpFt4YshhhJhBY3S9J1UVRcQlFYf
	sEKvtVbdfCIKdWc0SKSRRG85Z5gnXPVJFIEJc5l74rzGDUejSpGR8btsTf2s+9RRt2B4MvO3NgA
	AgK/10YVtYiMFajqE9AkbetW0e3SVlnKNTMQ46rasl7HtRqz++VhbQnotGQE/u5DzP9Xnkt5sdu
	XIJtIG0N5+EQVpT2DvWBlZCkLKE2HY6E+DUhHZwS8R5gCAD8Hp7Ty2Bsw==
X-Received: by 2002:a05:600c:5248:b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-490c2522657mr319373935e9.0.1781002775725;
        Tue, 09 Jun 2026 03:59:35 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:35 -0700 (PDT)
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
Subject: [PATCH v2 5/5] clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H display pipeline
Date: Tue,  9 Jun 2026 11:59:24 +0100
Message-ID: <20260609105924.962573-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260609105924.962573-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33747-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,init.name:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DDFE65F4C1

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
v1->v2:
- Switched to use the new library
- Kconfig now selects CLK_RZV2H_CPG_LIB
- Renamed CPG_PLLEN to CPG_PLL_EN_EN
- Renamed LCDCDIV to LCDC_CLKD
- Changed ctr0/1 in r9a09g077_cpg_pll3_clk_recalc_rate() to use u32
---
 drivers/clk/renesas/Kconfig         |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c | 369 +++++++++++++++++++++++++++-
 2 files changed, 370 insertions(+), 1 deletion(-)

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
index f777601a23b9..975578efd4cf 100644
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
@@ -481,6 +577,272 @@ r9a09g077_cpg_fselxspi_div_clk_register(struct device *dev,
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
+	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(clk_hw_get_parent(hw)));
+	u8 table[RZT2H_MAX_LCDC_DIV_TABLES] = { 0 };
+	struct rzv2h_pll_div_pars dsi_params;
+	const struct clk_div_table *div;
+	unsigned int i = 0;
+	u64 freq_millihz;
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
+	struct clk **clks = pub->clks;
+	struct clk_init_data init;
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
@@ -497,6 +859,11 @@ r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
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


