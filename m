Return-Path: <linux-renesas-soc+bounces-34214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eABjHEY3NGoqRwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 20:21:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 099CF6A21E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 20:21:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mOfynGVh;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34214-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3C8930A81A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 18:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0FA370AE1;
	Thu, 18 Jun 2026 18:20:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2EC367B9F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 18:19:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781806800; cv=none; b=sAcCCSIgBoZWrYtNWrfD1cLRXGNQRgz1+N275+FzImggaXtm3rBrLC68NWbFTZ4/5ejJprxS6qvXzryj421Sqj1HRLUAX93qSt4gXu64j24st8agfFk0jBjnNe5x8gcwgMAHsJ5RxLsziPkn+i0p+xPqxXawb/GHyc3a4eW82wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781806800; c=relaxed/simple;
	bh=1b2oxbsjTwiPKYPOqLSADHUiDXwH6v59WxBO3nikucE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9cxz79F9fjettRsC6YxayGCJ90irxZn+5iuqSGKJ4i1ZXY1SMlIhCKlr+cQPTLXJ9ZT82XDGjyZC5a26Z53vcVxU6JkK8+hbpX+hG/M/1RPBGAoZVyg+KvNwjjblKXx3v0bjwlIlz2Kh72xeT2p0QbcHxxTarr9AW+JYrsreE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOfynGVh; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso12866445e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781806795; x=1782411595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9gCPRaGwbqVrTlAOrWL3rxO7f4G7fUT3yWTbsLCIAA=;
        b=mOfynGVh07/lIVZGsEHAqyQ7DHqR5Vd50QenQdabLEP67pQWbf1USHxGQKFXBkQwkh
         WlRA3fC/CktZjNyXHp3tSpCpnJ7Zp7P1m7UaTOJ4JZOf7YbchqMWWBUOZwo9ac9FJmxi
         VCsvj64MN1gro/7+SV96YT1pMUZRoKA79oqkHlZwptonMoyTFUdPiajX0OpZpJ5wO3D2
         /N9WrhAF6MNXtPOKsdvuo0wVxzApYNABREOwqW9C63XnZft2MRcjJXwbDuDxSIiAhTRT
         snM3doi0IVKm0YlChtZAx59BJV0ZVhQVFGrHoI1Gy377BnjOyw8+lS3MIVHppvYgV8W+
         fwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781806795; x=1782411595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9gCPRaGwbqVrTlAOrWL3rxO7f4G7fUT3yWTbsLCIAA=;
        b=ZyC4KzP0LN0HqC69BJ/5oL1t3C/IeBlj0KMi6z53AWYezzDNoW+vIl/jAtzgpMA+u1
         XMChV7pxIA9Q6Z79u8TWSKVYz+pyBNzlowIseibF3psfSpCwO81Qn16iuBLu7gJyMaFE
         xkDbYQhR4MWmy4MMPsYVGPPWuyIoV8QrGzrJjCf19wtQfBwDgjOC1NbJEycwMVNAfdO+
         BtAXJM+eRqwSPkViXYEqAS0KpmmFLpllGQvk7x9c2bDhOPI22Ct0tNd2afFBPARePlc8
         vgo3zG5VSkQe/hoKsrhs2HmjWjYsJdqSY+v6zQHsSJ7Y8cAd1oj0KECZw8bUTTIi9Lhc
         cpuA==
X-Forwarded-Encrypted: i=1; AFNElJ9xqDD+htIXNL2ur2O1c6R9mWKYDFirGqSMGQC4l+GTe00JZM63Eenb8qUt+5kwAU2TphR/1cs+7vKwk1l2DPUekQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb6sH6JjSSgci985/pUeSwtM08YgvOCgx2I9NizRJaKcMewcAT
	pD8dTndLgDA2K+7QyBi1Ak7Erx3AcU44zfS5jdIyI2JWQBWTMOP6PKMB
X-Gm-Gg: AfdE7cnQbVGaRMUIPzOrxZ8U/5++SxbjNaw/uEHy4nJ6LLuAeuZBnhWSL5MNfe1bQOT
	bfDFO8beZ7oP5dhpbZBfKXdCBBxRF4v0JAjjZddF/Z6pRW9kqR+iaOi/O7G2HqGnNM9E41+ThfW
	VFasBoSJE0np+HjPIVLBF6xtGEbstuSodNfcC474q3AIZ7US8kTG0D/Vo1PTq+5Ym4hq94OXr4t
	knH/BesHJvDxLamGj6UfMp4ufjbgVwlCHIFaoLq9iiI+i45aQHdtkyBTj8Hv3i4uaAv10yhebLm
	fGxns724RV2V11a8xwvtlOQqaitTgxOceo0ADsgYTuhgDBdgaVDjuQdRQ/y4VoLWzihtbqO8mtZ
	62u67rVRXTXfG+VTpHkVRaHkSoTs4AQXNL50RVlVxxwMXdCATE/oLlXYDFzKUxrDJUtkQZiBvc9
	H24DUqU+jE7LNL9p6weB5utsX/o+jPCW/SWPoeyn4Qz1CYEd/0wMa8yBCDOTwUb05XrskLcCTRw
	7TvkRSAf1PhOf4+kjU6Xszt4KI=
X-Received: by 2002:a05:600c:2b17:b0:490:ab8b:1bb3 with SMTP id 5b1f17b1804b1-4923f5791d1mr8910245e9.18.1781806795483;
        Thu, 18 Jun 2026 11:19:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3bf7:d534:a488:f67d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-465090c42e1sm869435f8f.11.2026.06.18.11.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 11:19:55 -0700 (PDT)
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
Subject: [PATCH v4 4/5] clk: renesas: Extract RZ/V2H PLL calculation helpers into shared library
Date: Thu, 18 Jun 2026 19:19:48 +0100
Message-ID: <20260618181949.3036280-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260618181949.3036280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34214-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 099CF6A21E6

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the RZ/V2H PLL and divider parameter calculation helpers from
rzv2h-cpg.c into a new reusable library.

Introduce the CLK_RZV2H_CPG_LIB Kconfig symbol and add
rzv2h-cpg-lib.c to host the PLL parameter search algorithms currently
implemented by rzv2h_get_pll_pars() and rzv2h_get_pll_divs_pars().
Export the helpers as rzv2h_cpg_get_pll_pars() and
rzv2h_cpg_get_pll_divs_pars() for use by other drivers.

Update the public clock header to expose the new interfaces and provide
compatibility aliases for the existing helper names, avoiding build
breakage for current users while allowing future conversions to the new
API.

This prepares for reuse of the PLL and divider calculation logic by
other Renesas clock drivers, including upcoming RZ/T2H and RZ/N2H CPG
support, without duplicating the implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Added macros for rzv2h_get_pll_pars and rzv2h_get_pll_divs_pars

v2->v3:
- Added export.h include in rzv2h-cpg-lib.c.

v1->v2:
- New patch
---
 drivers/clk/renesas/Kconfig         |   4 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/rzv2h-cpg-lib.c | 217 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 203 --------------------------
 include/linux/clk/renesas.h         |  29 ++--
 5 files changed, 238 insertions(+), 216 deletions(-)
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
index fff89f2bdc0b..738dfafc6d9c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -220,209 +220,6 @@ struct rzv2h_plldsi_div_clk {
 
 #define RZV2H_MAX_DIV_TABLES		(16)
 
-/**
- * rzv2h_get_pll_pars - Finds the best combination of PLL parameters
- * for a given frequency.
- *
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
- */
-bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
-			struct rzv2h_pll_pars *pars, u64 freq_millihz)
-{
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
-}
-EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_pars, "RZV2H_CPG");
-
-/*
- * rzv2h_get_pll_divs_pars - Finds the best combination of PLL parameters
- * and divider value for a given frequency.
- *
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
- */
-bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
-			     struct rzv2h_pll_div_pars *pars,
-			     const u8 *table, u8 table_size, u64 freq_millihz)
-{
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
-}
-EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
-
 /**
  * struct rzv2h_plldsi_mux_clk - PLL DSI MUX clock
  *
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 798bb0b54bab..c9495558cd5c 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -189,28 +189,31 @@ struct rzv2h_pll_div_pars {
 		.k = { .min = -32768, .max = 32767 },			\
 	}								\
 
-#ifdef CONFIG_CLK_RZV2H
-bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
-			struct rzv2h_pll_pars *pars, u64 freq_millihz);
+#ifdef CONFIG_CLK_RZV2H_CPG_LIB
+bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+			    struct rzv2h_pll_pars *pars, u64 freq_millihz);
 
-bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
-			     struct rzv2h_pll_div_pars *pars,
-			     const u8 *table, u8 table_size, u64 freq_millihz);
+bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+				 struct rzv2h_pll_div_pars *pars,
+				 const u8 *table, u8 table_size, u64 freq_millihz);
 #else
-static inline bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
-				      struct rzv2h_pll_pars *pars,
-				      u64 freq_millihz)
+static inline bool rzv2h_cpg_get_pll_pars(const struct rzv2h_pll_limits *limits,
+					  struct rzv2h_pll_pars *pars,
+					  u64 freq_millihz)
 {
 	return false;
 }
 
-static inline bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
-					   struct rzv2h_pll_div_pars *pars,
-					   const u8 *table, u8 table_size,
-					   u64 freq_millihz)
+static inline bool rzv2h_cpg_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
+					       struct rzv2h_pll_div_pars *pars,
+					       const u8 *table, u8 table_size,
+					       u64 freq_millihz)
 {
 	return false;
 }
 #endif
 
+#define rzv2h_get_pll_pars	rzv2h_cpg_get_pll_pars
+#define rzv2h_get_pll_divs_pars	rzv2h_cpg_get_pll_divs_pars
+
 #endif
-- 
2.54.0


