Return-Path: <linux-renesas-soc+bounces-33746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JzP8Ff3zJ2r26AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:07:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EA45165F4C6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 13:07:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FCghCd+l;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6447630CC685
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 11:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3F83FCB09;
	Tue,  9 Jun 2026 10:59:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F153FE650
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 10:59:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002779; cv=none; b=qq2hcim+N18NOThAeZxpVzgnwjsNWTVUIb4reWxW8zxWGqv6EoN2EGgCHB5jA7QCimjKkL+mhK8YUqG6wSjVOCz8+d7O1BHhAoPRn4JsgmwkQbdUSUzYfEQ/rI3iFPBdtb7/m2cWNJIb0cv6zBgGV+1ri6dSA0FYA2RSKFhJrmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002779; c=relaxed/simple;
	bh=R9DIIQ1qLxF8W794z9jlN5sGRZrlOa4iNeyrroAHCUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVftDoW2GQGynxEuqrNDtk8Rvde35cBw7kydGH/woxqhTVe6J5Pw8zAP6YEtgnELA/tc/OBjKbdL8uR0IcI94b9WQxyc2VHJvbVz/r5eEgS6kFCjixXro03h70Ov6EIHR69Xz7vXsXyHBHezvPxsYWqVCy8AUnuHycBeLq2+R/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCghCd+l; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso41695725e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 03:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781002775; x=1781607575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu/3p2N53nRfdoRyXkgiVNzw/DhaQXtjUEE28Cccb0o=;
        b=FCghCd+lLYizzNs0vgAG0FYrgWRFif8m5NvlDk9OMfnicC2IgQvyZ6xpU/r3cMwGs6
         s/okitSillqkP9vm1BDOYxzjsv050Vh6LYNIfAPi1QT2opAsWFUYwkNoe1ghf5vxV3fr
         7mycRW6jKm6Dqw71T4y4n52EcM2LTYqccpTjsBE2R1HdSIXNulAW4XNZ2nxrDofeeRm3
         zVZayPnptdm4U00Z6O8RbmuHjx6oQXCZQ47XRq/QUc/k5ivBrWRGAD+ThKGqjd6jTUHS
         UcZBS8JNVMNt4+8ZEc5/qahHLTjfke8C1eM5qT0jGiBRoN0IOM1r1ahR6vZ2JTvuoC9v
         yqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781002775; x=1781607575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vu/3p2N53nRfdoRyXkgiVNzw/DhaQXtjUEE28Cccb0o=;
        b=Fru2Dr8i88JIh5nbHhViG2Vo97adro8BuuIoduECPSQxO1KRybD0+DnksplNqAJYHH
         pr/Gub0Ks+0ZJwi4VOGs04aUJmFhc2dLbP+5BS771gGwunZdEHQheR2Al6r7CGwbnvdY
         mHujootDhwFBibRd0Sh+kXwVP/Ygri2BQPi7BYk3Lq9BaRhldxcAfiK90w4d6he9LLar
         iVaDpqsrFrnjIRvNfpnW4vNwuuSxvvsLHsPhlEzxOSqPIlbWJfBpUp+PoJGWAbgQZ8QH
         qIiKr3DiGV28wMXLgqqp/zWumPzc1gl6XuhLD5ZKiNPf7Yy77wlAtHb5AektMO0au92d
         E+KA==
X-Forwarded-Encrypted: i=1; AFNElJ83AqZThTK23aJzJEbxRcRP0r5UnMwR2ZGME4OnjF3jU7bi3HBvgeNp64qT4iUHn0IYU23U+aj5x9lmoExtkwO4hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgfNco2GYBb0b/+lOgPO/6DJrBZ/UIJBks5+/YvTzISq0fKZKo
	K0G6ttGc5u4D+TWwCdK4VsJorkOH93m5LpHUSSj86I1ytGuuBAO35AuZ
X-Gm-Gg: Acq92OF4sEXG6qIMvEISy0v9aXpaKKb+rniBFhVi5/Jpnczn75ty45x+fOK7xZ3Vodi
	W3fh5lK+JPiYT+znIdW+v83tjLFQkHgK7QoxKhDQL5cLpfMvS2i46+BKAUz5FacHRC8enCqAdJz
	pZXbPgd2njbDFLCjrxlU7uuWXPuZoYRpLi8KEYWNWQRHjJuFDgeLhzt9k+PRXwEkixEyviCuZZV
	eQBcYCywdG5xlWKfpHbAYlD/tbHKB0peE/11lwC6b+2ezpWfr9XbMZaK5VfDBREtNAPm4USeFVY
	mri4hU3NmFX9VZNHaCMKAf0a31mXloagsSlVm9doGLK28DoClgAM8nC7eoR2Vs0OcHb/m21zkFi
	f//bax4MI9Sl07DsCXn+JE89Vf37c1dWo5uekRjxtr4qvB8N0+fw94HiaVq/KYTc4ZAO8h+/vVO
	dnFopQXdt+1R04Tbrf9joBNIZwd+UExsp/0/npihoc5T7a5sTWaEzhBngLRkRLQiwP2CWk489IB
	4ZPR0AxoVSCN48wzAxQpmrB7gaED61qSbIYYLgoXccVDuT2l1KPJqxDYw==
X-Received: by 2002:a05:600c:3e0d:b0:490:4663:691b with SMTP id 5b1f17b1804b1-490c256049emr325377445e9.7.1781002774919;
        Tue, 09 Jun 2026 03:59:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b2d:6009:3bbe:fb84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3d663csm524250635e9.11.2026.06.09.03.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 03:59:34 -0700 (PDT)
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
Subject: [PATCH v2 4/5] clk: renesas: rzv2h-cpg: Extract PLL calculation math into a library
Date: Tue,  9 Jun 2026 11:59:23 +0100
Message-ID: <20260609105924.962573-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33746-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA45165F4C6

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
v1->v2:
- New patch
---
 drivers/clk/renesas/Kconfig         |   4 +
 drivers/clk/renesas/Makefile        |   1 +
 drivers/clk/renesas/rzv2h-cpg-lib.c | 216 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 186 +-----------------------
 include/linux/clk/renesas.h         |  23 +++
 5 files changed, 250 insertions(+), 180 deletions(-)
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
index 000000000000..98e789df5d7f
--- /dev/null
+++ b/drivers/clk/renesas/rzv2h-cpg-lib.c
@@ -0,0 +1,216 @@
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


