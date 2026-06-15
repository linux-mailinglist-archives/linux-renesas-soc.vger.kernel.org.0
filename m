Return-Path: <linux-renesas-soc+bounces-34005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pd4vLJ3ZL2qfHwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:53:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 516626857EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:53:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cQEpHAgk;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0D0B3088E0A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 10:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18946343D91;
	Mon, 15 Jun 2026 10:48:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9047337BA3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:48:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520537; cv=none; b=Nk31g4HZTcgdvZfbY1IIBhywiJLR5BKwHKYt7RQind+gs7FS8iUDu3nUzS/Is9p6TTWggnXn048PALqBFuDTQHsLOM15BkGBl5IGuKmniCjCtFWRPiazqCOpNaOFH42UHqXv0l30sAz0ovoC9eu1XjKuDl2EuLHNbf4ay9bXJSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520537; c=relaxed/simple;
	bh=SfQsjwn+g98C3gn9jOL7YpL+Z/fx0xN3NUXb2H+4Ts4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDn3gzX3el6gMzLqEB/Ft+9MVJSLWXzNpxGTaexCYuFREZA+xEtuxX8N5B8O903RAebbDCdZfMw2LU03k04m4FRJN7eDiwGIEMF9/EHW3iEX4lS6dxmab88Z6pskmHlOMksv3F/otFS+ZUN7JZXqxNIIrFj/SDBwQ4+I5kHyJDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQEpHAgk; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso2179935f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 03:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520532; x=1782125332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdIK8s+WtNqNrGEGNne4N0B01lxpEOPFZOhN6p09RWQ=;
        b=cQEpHAgkgHMe/8TbouHIaaBaTvCKNoBgrh6dKpSojJCBeP5vA8jFok4UweXXzwVfTO
         YZZ9aivpAE/23xrWTqtc0pe6a8gEzXSsk2VLTZamEGq8/tgp2TjBU4DSRSmpnSiqjMhT
         nqxfwMIlfIOGJM+cp41vKirBgRLPaDHavK1FVbrFl1ryya/jvP/bNU8NBtl/OcX2pFrf
         8W5beOV8RDzBiTo0fD9ZbseBCJdtW2pCKHH6aleGdZq6zdJCetItpMnMDPvbZIeY0mOV
         kBEZAJHwVy9TNooBn+6nu2w+UgpkVzmaMaXlTHXwDD2k5y852YtJbIIpOvyxr6MiIvCz
         66ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520532; x=1782125332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CdIK8s+WtNqNrGEGNne4N0B01lxpEOPFZOhN6p09RWQ=;
        b=nL6fzyfrh+d2HQ3R0uMx9TDqIpYiZgPuCwLaosEzDucxKulxChSckagFcKiHr2H2r7
         0sjzQcVgwEuc0S8uWVSpxtP/gCVLINyMEh7Iy8BgHC9ZgwE1N8AFnf6OogsFbajYhGRC
         oE+Ej9QULyrDegsMGP/+cYAiuuNsDAwklV6FEFWwbUm5W/rtQkPTmwfk9v3uv48gWqOG
         /7D/mSAvqqXH3DpkNPNlXNR+PsdIZgnbh9Dxn1ZiCeoQgVFBfICODYluj/KGvN+yrH0h
         zFrhvqejeaWAtUTx/kbVlZMZLHh3pZLwL/87ZqC7ynT1DBzmjt7aWD5gT75hYAJT8qE4
         eVPA==
X-Forwarded-Encrypted: i=1; AFNElJ9aUjPsW8PRPOFyTt0CpzCSo8oom8hI7CdjLDCkVAOeVHlynvphzkzWZhpuKfuQ82JbHm2Kc99aGzdi5ZTGGCAVBw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+eh/r1FZIL8kSx2jMdnuIvbrg42jfn+p/bpl4DVgE881OvuAG
	TKmEvLzAtYt1WiMiU2jKV6HhkqHUU89974I3Igc2/tJcJiM6QMxXqd/t
X-Gm-Gg: Acq92OGtpEK7tdkWa/HGYq4l0ltqJVysGUnBuyNBXLlKamVyHLSc4YpMNJ/oqcgfyha
	cT3EI7xS+cN3NrWy7Rz+4kFsKhMf18/i32t4161AidMZLiyZxp67O+3EiSepNIxppitMfqDHA34
	eyjkDMktXjQf9SrkZBeVHrZHFUaGOvq3okdoHivlCXFF/HX19FiMOPER1TfcthSJqSOv8CYWIn8
	G1HmL8H3xw7IRY5roYPMReLU44SLFf4apWYhSGn+qCK9Vmh284wJgfdGK8CCCR2onsy2UqHI/oo
	xbQ/xoV+RGrWZSH8oAyQ9ZMxVPEhNVXfbp4MPBXf+EYEiAF09/1fVcpYIi2cJOmk6qAxNvUw5dE
	ZFupjjr7PWnPAGNzgjOjWmN85DRTvK1w3Z/gG4CK7CFXIes1xSxptZXT5PlLzYhxbptHpf1nfPO
	CZaHfWRPxMjRsoFw5wbnbdTUwk3fiGk7YcsMdHYiXkXR//vwYneptk9zeq40ta3yTrDtVeJM0O2
	o/mXQXs37qVvyU0Dxm4MLB21vDtNMr5uIg/
X-Received: by 2002:a05:6000:2dc2:b0:43d:7dcf:ae26 with SMTP id ffacd0b85a97d-4606dba1c98mr17939819f8f.34.1781520531883;
        Mon, 15 Jun 2026 03:48:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:51 -0700 (PDT)
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
Subject: [PATCH v3 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation math into a library
Date: Mon, 15 Jun 2026 11:48:44 +0100
Message-ID: <20260615104845.4122868-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-34005-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 516626857EB

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the common PLL and divider parameter calculation logic from the
core rzv2h-cpg driver into a standalone library file.

Introduce the CLK_RZV2H_CPG_LIB Kconfig configuration symbol and create
rzv2h-cpg-lib.c to house rzv2h_cpg_get_pll_pars() and
rzv2h_cpg_get_pll_divs_pars().

Keep rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars() in the original
driver as wrappers that call into the new library helper endpoints.
These wrappers are maintained for this cycle because they are actively
referenced by the DSI driver; they will be safely removed in a subsequent
cycle once the DSI driver is updated to use the new APIs from the library,
preventing cross-subsystem build breakages.

This restructuring allows other Renesas SoC clock drivers, such as the
upcoming RZ/T2H and RZ/N2H platforms that utilize similar LCDC clock
divider mathematical logic, to share the iterative calculation helper
infrastructure without duplication.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Added export.h include in rzv2h-cpg-lib.c.

v1->v2:
- New patch
---
 drivers/clk/renesas/Kconfig         |   4 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/rzv2h-cpg-lib.c | 217 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 186 +-----------------------
 include/linux/clk/renesas.h         |  23 +++
 5 files changed, 251 insertions(+), 180 deletions(-)
 create mode 100644 drivers/clk/renesas/rzv2h-cpg-lib.c

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 0203ecbb3882..7659550b8566 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -260,8 +260,12 @@ config CLK_RZG2L
 
 config CLK_RZV2H
 	bool "RZ/{G3E,V2H(P)} family clock support" if COMPILE_TEST
+	select CLK_RZV2H_CPG_LIB
 	select RESET_CONTROLLER
 
+config CLK_RZV2H_CPG_LIB
+	bool "RZV2H CPG library functions" if COMPILE_TEST
+
 config CLK_RENESAS_VBATTB
 	tristate "Renesas VBATTB clock controller"
 	depends on ARCH_RZG2L || COMPILE_TEST
diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
index bd2bed91ab29..ac790e56034b 100644
--- a/drivers/clk/renesas/Makefile
+++ b/drivers/clk/renesas/Makefile
@@ -52,6 +52,7 @@ obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+= rcar-gen3-cpg.o
 obj-$(CONFIG_CLK_RCAR_GEN4_CPG)		+= rcar-gen4-cpg.o
 obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+= rcar-usb2-clock-sel.o
 obj-$(CONFIG_CLK_RZG2L)			+= rzg2l-cpg.o
+obj-$(CONFIG_CLK_RZV2H_CPG_LIB)		+= rzv2h-cpg-lib.o
 obj-$(CONFIG_CLK_RZV2H)			+= rzv2h-cpg.o
 
 # Generic
diff --git a/drivers/clk/renesas/rzv2h-cpg-lib.c b/drivers/clk/renesas/rzv2h-cpg-lib.c
new file mode 100644
index 000000000000..124239c7327e
--- /dev/null
+++ b/drivers/clk/renesas/rzv2h-cpg-lib.c
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZV2H CPG Library. This library provides common functions to calculate
+ * PLL parameters for the RZV2H SoC.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ */
+
+#include <linux/clk/renesas.h>
+#include <linux/export.h>
+#include <linux/math.h>
+#include <linux/types.h>
+#include <linux/units.h>
+
+/**
+ * rzv2h_cpg_get_pll_pars - Finds the best combination of PLL parameters
+ * for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters
+ * @pars: Pointer to the structure where the best calculated PLL parameters values
+ * will be stored
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) to achieve
+ * the desired frequency.
+ * There is no direct formula to calculate the PLL parameters, as it's an open
+ * system of equations, therefore this function uses an iterative approach to
+ * determine the best solution. The best solution is one that minimizes the error
+ * (desired frequency - actual frequency).
+ *
+ * Return: true if a valid set of parameters values is found, false otherwise.
+ */
+bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			    struct rzv2h_pll_pars *pars, u64 freq_millihz)
+{
+	unsigned long input_fref = limits->input_fref ?: (24 * MEGA);
+	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
+	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
+	struct rzv2h_pll_pars p, best;
+
+	if (freq_millihz > fout_max_millihz ||
+	    freq_millihz < fout_min_millihz)
+		return false;
+
+	/* Initialize best error to maximum possible value */
+	best.error_millihz = S64_MAX;
+
+	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
+		u32 fref = input_fref / p.p;
+		u16 divider;
+
+		for (divider = 1 << limits->s.min, p.s = limits->s.min;
+			p.s <= limits->s.max; p.s++, divider <<= 1) {
+			for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
+				u64 output_m, output_k_range;
+				s64 pll_k, output_k;
+				u64 fvco, output;
+
+				/*
+				 * The frequency generated by the PLL + divider
+				 * is calculated as follows:
+				 *
+				 * With:
+				 * Freq = Ffout = Ffvco / 2^(pll_s)
+				 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
+				 * Ffref = 24MHz / pll_p
+				 *
+				 * Freq can also be rewritten as:
+				 * Freq = Ffvco / 2^(pll_s)
+				 *      = ((pll_m + (pll_k / 65536)) * Ffref) / 2^(pll_s)
+				 *      = (pll_m * Ffref) / 2^(pll_s) + ((pll_k / 65536) * Ffref) / 2^(pll_s)
+				 *      = output_m + output_k
+				 *
+				 * Every parameter has been determined at this
+				 * point, but pll_k.
+				 *
+				 * Considering that:
+				 * limits->k.min <= pll_k <= limits->k.max
+				 * Then:
+				 * -0.5 <= (pll_k / 65536) < 0.5
+				 * Therefore:
+				 * -Ffref / (2 * 2^(pll_s)) <= output_k < Ffref / (2 * 2^(pll_s))
+				 */
+
+				/* Compute output M component (in mHz) */
+				output_m = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(p.m, fref) * MILLI,
+								 divider);
+				/* Compute range for output K (in mHz) */
+				output_k_range = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fref, MILLI),
+								       2 * divider);
+				/*
+				 * No point in continuing if we can't achieve
+				 * the desired frequency
+				 */
+				if (freq_millihz <  (output_m - output_k_range) ||
+				    freq_millihz >= (output_m + output_k_range)) {
+					continue;
+				}
+
+				/*
+				 * Compute the K component
+				 *
+				 * Since:
+				 * Freq = output_m + output_k
+				 * Then:
+				 * output_k = Freq - output_m
+				 *          = ((pll_k / 65536) * Ffref) / 2^(pll_s)
+				 * Therefore:
+				 * pll_k = (output_k * 65536 * 2^(pll_s)) / Ffref
+				 */
+				output_k = freq_millihz - output_m;
+				pll_k = div_s64(output_k * 65536ULL * divider,
+						fref);
+				pll_k = DIV_S64_ROUND_CLOSEST(pll_k, MILLI);
+
+				/* Validate K value within allowed limits */
+				if (pll_k < limits->k.min ||
+				    pll_k > limits->k.max)
+					continue;
+
+				p.k = pll_k;
+
+				/* Compute (Ffvco * 65536) */
+				fvco = mul_u32_u32(p.m * 65536 + p.k, fref);
+				if (fvco < mul_u32_u32(limits->fvco.min, 65536) ||
+				    fvco > mul_u32_u32(limits->fvco.max, 65536))
+					continue;
+
+				/* PLL_M component of (output * 65536 * PLL_P) */
+				output = mul_u32_u32(p.m * 65536, input_fref);
+				/* PLL_K component of (output * 65536 * PLL_P) */
+				output += p.k * input_fref;
+				/* Make it in mHz */
+				output *= MILLI;
+				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
+
+				/* Check output frequency against limits */
+				if (output < fout_min_millihz ||
+				    output > fout_max_millihz)
+					continue;
+
+				p.error_millihz = freq_millihz - output;
+				p.freq_millihz = output;
+
+				/* If an exact match is found, return immediately */
+				if (p.error_millihz == 0) {
+					*pars = p;
+					return true;
+				}
+
+				/* Update best match if error is smaller */
+				if (abs(best.error_millihz) > abs(p.error_millihz))
+					best = p;
+			}
+		}
+	}
+
+	/* If no valid parameters were found, return false */
+	if (best.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_get_pll_pars, "RZV2H_CPG");
+
+/*
+ * rzv2h_cpg_get_pll_divs_pars - Finds the best combination of PLL parameters
+ * and divider value for a given frequency.
+ *
+ * @limits: Pointer to the structure containing the limits for the PLL parameters
+ * @pars: Pointer to the structure where the best calculated PLL parameters and
+ * divider values will be stored
+ * @table: Pointer to the array of valid divider values
+ * @table_size: Size of the divider values array
+ * @freq_millihz: Target output frequency in millihertz
+ *
+ * This function calculates the best set of PLL parameters (M, K, P, S) and divider
+ * value to achieve the desired frequency. See rzv2h_cpg_get_pll_pars() for more
+ * details on how the PLL parameters are calculated.
+ *
+ * freq_millihz is the desired frequency generated by the PLL followed by a
+ * a gear.
+ */
+bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+				 struct rzv2h_pll_div_pars *pars,
+				 const u8 *table, u8 table_size, u64 freq_millihz)
+{
+	struct rzv2h_pll_div_pars p, best;
+
+	best.div.error_millihz = S64_MAX;
+	p.div.error_millihz = S64_MAX;
+	for (unsigned int i = 0; i < table_size; i++) {
+		if (!rzv2h_cpg_get_pll_pars(limits, &p.pll, freq_millihz * table[i]))
+			continue;
+
+		p.div.divider_value = table[i];
+		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
+		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
+
+		if (p.div.error_millihz == 0) {
+			*pars = p;
+			return true;
+		}
+
+		if (abs(best.div.error_millihz) > abs(p.div.error_millihz))
+			best = p;
+	}
+
+	if (best.div.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+EXPORT_SYMBOL_NS_GPL(rzv2h_cpg_get_pll_divs_pars, "RZV2H_CPG");
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index fff89f2bdc0b..c2f018e27521 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -224,151 +224,13 @@ struct rzv2h_plldsi_div_clk {
  * rzv2h_get_pll_pars - Finds the best combination of PLL parameters
  * for a given frequency.
  *
- * @limits: Pointer to the structure containing the limits for the PLL parameters
- * @pars: Pointer to the structure where the best calculated PLL parameters values
- * will be stored
- * @freq_millihz: Target output frequency in millihertz
- *
- * This function calculates the best set of PLL parameters (M, K, P, S) to achieve
- * the desired frequency.
- * There is no direct formula to calculate the PLL parameters, as it's an open
- * system of equations, therefore this function uses an iterative approach to
- * determine the best solution. The best solution is one that minimizes the error
- * (desired frequency - actual frequency).
- *
- * Return: true if a valid set of parameters values is found, false otherwise.
+ * Refer to rzv2h_cpg_get_pll_pars() for more details on how the PLL
+ * parameters are calculated.
  */
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz)
 {
-	unsigned long input_fref = limits->input_fref ?: (24 * MEGA);
-	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
-	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
-	struct rzv2h_pll_pars p, best;
-
-	if (freq_millihz > fout_max_millihz ||
-	    freq_millihz < fout_min_millihz)
-		return false;
-
-	/* Initialize best error to maximum possible value */
-	best.error_millihz = S64_MAX;
-
-	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
-		u32 fref = input_fref / p.p;
-		u16 divider;
-
-		for (divider = 1 << limits->s.min, p.s = limits->s.min;
-			p.s <= limits->s.max; p.s++, divider <<= 1) {
-			for (p.m = limits->m.min; p.m <= limits->m.max; p.m++) {
-				u64 output_m, output_k_range;
-				s64 pll_k, output_k;
-				u64 fvco, output;
-
-				/*
-				 * The frequency generated by the PLL + divider
-				 * is calculated as follows:
-				 *
-				 * With:
-				 * Freq = Ffout = Ffvco / 2^(pll_s)
-				 * Ffvco = (pll_m + (pll_k / 65536)) * Ffref
-				 * Ffref = 24MHz / pll_p
-				 *
-				 * Freq can also be rewritten as:
-				 * Freq = Ffvco / 2^(pll_s)
-				 *      = ((pll_m + (pll_k / 65536)) * Ffref) / 2^(pll_s)
-				 *      = (pll_m * Ffref) / 2^(pll_s) + ((pll_k / 65536) * Ffref) / 2^(pll_s)
-				 *      = output_m + output_k
-				 *
-				 * Every parameter has been determined at this
-				 * point, but pll_k.
-				 *
-				 * Considering that:
-				 * limits->k.min <= pll_k <= limits->k.max
-				 * Then:
-				 * -0.5 <= (pll_k / 65536) < 0.5
-				 * Therefore:
-				 * -Ffref / (2 * 2^(pll_s)) <= output_k < Ffref / (2 * 2^(pll_s))
-				 */
-
-				/* Compute output M component (in mHz) */
-				output_m = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(p.m, fref) * MILLI,
-								 divider);
-				/* Compute range for output K (in mHz) */
-				output_k_range = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(fref, MILLI),
-								       2 * divider);
-				/*
-				 * No point in continuing if we can't achieve
-				 * the desired frequency
-				 */
-				if (freq_millihz <  (output_m - output_k_range) ||
-				    freq_millihz >= (output_m + output_k_range)) {
-					continue;
-				}
-
-				/*
-				 * Compute the K component
-				 *
-				 * Since:
-				 * Freq = output_m + output_k
-				 * Then:
-				 * output_k = Freq - output_m
-				 *          = ((pll_k / 65536) * Ffref) / 2^(pll_s)
-				 * Therefore:
-				 * pll_k = (output_k * 65536 * 2^(pll_s)) / Ffref
-				 */
-				output_k = freq_millihz - output_m;
-				pll_k = div_s64(output_k * 65536ULL * divider,
-						fref);
-				pll_k = DIV_S64_ROUND_CLOSEST(pll_k, MILLI);
-
-				/* Validate K value within allowed limits */
-				if (pll_k < limits->k.min ||
-				    pll_k > limits->k.max)
-					continue;
-
-				p.k = pll_k;
-
-				/* Compute (Ffvco * 65536) */
-				fvco = mul_u32_u32(p.m * 65536 + p.k, fref);
-				if (fvco < mul_u32_u32(limits->fvco.min, 65536) ||
-				    fvco > mul_u32_u32(limits->fvco.max, 65536))
-					continue;
-
-				/* PLL_M component of (output * 65536 * PLL_P) */
-				output = mul_u32_u32(p.m * 65536, input_fref);
-				/* PLL_K component of (output * 65536 * PLL_P) */
-				output += p.k * input_fref;
-				/* Make it in mHz */
-				output *= MILLI;
-				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
-
-				/* Check output frequency against limits */
-				if (output < fout_min_millihz ||
-				    output > fout_max_millihz)
-					continue;
-
-				p.error_millihz = freq_millihz - output;
-				p.freq_millihz = output;
-
-				/* If an exact match is found, return immediately */
-				if (p.error_millihz == 0) {
-					*pars = p;
-					return true;
-				}
-
-				/* Update best match if error is smaller */
-				if (abs(best.error_millihz) > abs(p.error_millihz))
-					best = p;
-			}
-		}
-	}
-
-	/* If no valid parameters were found, return false */
-	if (best.error_millihz == S64_MAX)
-		return false;
-
-	*pars = best;
-	return true;
+	return rzv2h_cpg_get_pll_pars(limits, pars, freq_millihz);
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_pars, "RZV2H_CPG");
 
@@ -376,50 +238,14 @@ EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_pars, "RZV2H_CPG");
  * rzv2h_get_pll_divs_pars - Finds the best combination of PLL parameters
  * and divider value for a given frequency.
  *
- * @limits: Pointer to the structure containing the limits for the PLL parameters
- * @pars: Pointer to the structure where the best calculated PLL parameters and
- * divider values will be stored
- * @table: Pointer to the array of valid divider values
- * @table_size: Size of the divider values array
- * @freq_millihz: Target output frequency in millihertz
- *
- * This function calculates the best set of PLL parameters (M, K, P, S) and divider
- * value to achieve the desired frequency. See rzv2h_get_pll_pars() for more details
- * on how the PLL parameters are calculated.
- *
- * freq_millihz is the desired frequency generated by the PLL followed by a
- * a gear.
+ * Refer to rzv2h_cpg_get_pll_divs_pars() for more details on how the PLL
+ * parameters and divider value are calculated.
  */
 bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 			     struct rzv2h_pll_div_pars *pars,
 			     const u8 *table, u8 table_size, u64 freq_millihz)
 {
-	struct rzv2h_pll_div_pars p, best;
-
-	best.div.error_millihz = S64_MAX;
-	p.div.error_millihz = S64_MAX;
-	for (unsigned int i = 0; i < table_size; i++) {
-		if (!rzv2h_get_pll_pars(limits, &p.pll, freq_millihz * table[i]))
-			continue;
-
-		p.div.divider_value = table[i];
-		p.div.freq_millihz = DIV_U64_ROUND_CLOSEST(p.pll.freq_millihz, table[i]);
-		p.div.error_millihz = freq_millihz - p.div.freq_millihz;
-
-		if (p.div.error_millihz == 0) {
-			*pars = p;
-			return true;
-		}
-
-		if (abs(best.div.error_millihz) > abs(p.div.error_millihz))
-			best = p;
-	}
-
-	if (best.div.error_millihz == S64_MAX)
-		return false;
-
-	*pars = best;
-	return true;
+	return rzv2h_cpg_get_pll_divs_pars(limits, pars, table, table_size, freq_millihz);
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
 
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 2aeff01150c3..98d9ab38e027 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -213,4 +213,27 @@ static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits
 }
 #endif
 
+#ifdef CONFIG_CLK_RZV2H_CPG_LIB
+bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			    struct rzv2h_pll_pars *pars, u64 freq_millihz);
+
+bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+				 struct rzv2h_pll_div_pars *pars,
+				 const u8 *table, u8 table_size, u64 freq_millihz);
+#else
+static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+					  struct rzv2h_pll_pars *pars,
+					  u64 freq_millihz)
+{
+	return false;
+}
+
+static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+					       struct rzv2h_pll_div_pars *pars,
+					       const u8 *table, u8 table_size,
+					       u64 freq_millihz)
+{
+	return false;
+}
+#endif
 #endif
-- 
2.54.0


