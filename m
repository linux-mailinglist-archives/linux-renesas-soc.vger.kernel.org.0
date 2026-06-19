Return-Path: <linux-renesas-soc+bounces-34252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ikk/EkZyNWppwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:45:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B54206A71DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="M/A9d1wu";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F15D5311D3BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5283BFAF7;
	Fri, 19 Jun 2026 16:40:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B0F3BFE42
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 16:40:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887239; cv=none; b=IBU75GEIdZuY9FfdsBTnuNf+PqJy2FE8rXvsbnEM+sGIZ/rVrct7eBCd5LqeS70V+YQkJ+Hzy5QizQQkoRZrxatTs2Ewi9fo9nzI/5f8x0cgK9rF97ZLr13G0twGAL0EAR7XtYH8wsMl12CVS5vTXrGgEJFDtHkYQpDPaR6d2N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887239; c=relaxed/simple;
	bh=2w1Xxi9sBH6FLa7KdnuZdXiZJUJnv3i7wSZBQNO3/aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C3+AHobP5ma1ACRJ6xnr4Hj/4V433ARgQwAsIASOANQ04j6ZOANVnSjMHHzgZQsWgGJcdowx7a6ZZNOXyDHpj/tE9wNVbsewkp6dHk33UD15pdkrM46ee2HhBMokxICoWH/Kcj5pD1+ddTEE5FjkcyYRH0M7C91NOzRm+wUoWuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/A9d1wu; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46019b190b6so1807989f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 09:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887235; x=1782492035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79oNhBfri5tfdb/3IkQ+JvdN63dBYLB0KMrUXVuy5Yk=;
        b=M/A9d1wu6oMvpXsvTxtt1UUIWqMnU0tEn7yl/21QY6wjhbXct8ltWUYLx4uC/4jfZS
         R6gc91OfQWqJ+jjpFBCqrSBIHGMAQN0+OR89eMqUf/ZOnbFikRbbhkxDAmSgxPMUl0Eb
         AuhwtJSjgRNrFb1Rrb7gGEix/GgaYTqaXdQmniV+RlKQLrVxId3vI1Qwa+sJxS9fMGXq
         ReY2EmiFijeVe7ry3mP8D2k8TGKovZhUlUQFcbp6nGOPEKC7rQye/MKxQaKAcKwHf2XJ
         8/qkbVX1SAXVK0D++Wj6bvWpZPe2IwiHeg6dbTfcWFnVpzclVgOmkKkFn6FT/6OcKE1F
         rDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887235; x=1782492035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79oNhBfri5tfdb/3IkQ+JvdN63dBYLB0KMrUXVuy5Yk=;
        b=eui53NZpEBXVb8gDsQWS5lB+ATSM8f3DEFzSByDntXMHbpsSwZpzjo+xJojL/4+o3p
         cMYBwrwfU2xqrhac2pxPtmoMcwVXOEaZmwG9Gf2N/j5p+YKcJefE0oE/Kb7oOMCxZTCf
         1tQvenVczY6V6LoxTF2nWnVjJgG/zJyMux96HfX0zxqrqDDC/UNKXrjD3QfxXKijukLt
         FIFzpfPgojUB8qXrCeQLJzZbw1lxWEvdNCY5JjlVh0xwDWOFT1B5czuOj4LGd+4wieh0
         Iq1sTi3HZMw8+S8kYuUDiWaE2ajQmNk+6x+LyJh9MhW/6n/bepEzpUr1uAShh6zXEZUM
         TySw==
X-Forwarded-Encrypted: i=1; AFNElJ8jmub1aE7got6Wr14MmGnEfk8/jUwt1cfXnTMlGuHsi5KKdFfPMpsWl/rbegWnXHZN+kYyzvRW6nHsWyQCkGpdqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwslQHefpRwFQhWeLCalQHEH/6mBZqCSXsA7TNNJDGL82nyK7u2
	dI0VnHcd9xGk6yUiOjyCBAp/dgYEghpHhmv2l5DruXNSA4PhwEf9WfQ+
X-Gm-Gg: AfdE7cnL/e9iqMrsdGUc2E71IL9pS3BhbifLRQ8RmLr6xsTeSQ9MkovrLktZn2hdYBr
	vKID8c8KQvdZCkVGjMjR78QqOk5782yj/7LqkOkql0NiJm/sWSQC+PnSQleK2oowGA4mx+KaeFj
	94rIls40OJXl2Ilu8mCaFNx3UiiWj4IltT0ajrjKBJIOF5p1KJyIQVAKiFFmpiG7hDrKQzGSYHr
	QEPUdS2wP+bD8u9w3nt6iH5UT1V5IfS1x3/+pvxHtS/t92SaGvM8ly0cFSP6CUmkuIH7iI5e2hJ
	jB72oLyKqeytmfJFbHqp2bDAiirOtDGvKyyTfhvXrW4jfiZ09g+xV4XvRDU6FNeOzJojc6Wh7Fa
	zGI4U3CCf4sCBogKcR0ehnOMQ8rnXk1qL5OQJaPzXRz+/iEPrD+lbWj1cADDmQiUnxg+3OHSCWb
	igQqf0OIK5h0P3RLtdZ1bLjFReoO08wAZLZ9D8jg==
X-Received: by 2002:a05:600c:3e87:b0:492:46c2:f5b4 with SMTP id 5b1f17b1804b1-49246c2f68fmr25946235e9.32.1781887235236;
        Fri, 19 Jun 2026 09:40:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:34 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/6] clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
Date: Fri, 19 Jun 2026 17:40:22 +0100
Message-ID: <20260619164030.380098-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34252-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,p.mr:url,vger.kernel.org:from_smtp,p.pr:url,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B54206A71DD

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a new fractional PLL clock type (CLK_TYPE_G3L_PLLDSI) for the RZ/G3L
SoC's PLL7, which drives the DSI interface and requires a dedicated
parameter calculation and programming sequence distinct from other PLLs in
the RZ/G2L family.

PLL7 output frequency is determined by the formula:

  Ffdco = (NIR + NFR / 4096) * (Fosc / MR)
  Ffout = Ffdco / (1 << PR)

where:
  - Fosc = 24 MHz (oscillator input)
  - PR in [0, 4]   (post divider, power-of-two)
  - MR in [1, 12]  (input pre-divider)
  - NIR in [56, 375], NFR in [0, 4095] (integer and fractional parts)

The FDCO must fall within one of two valid ranges: 900–2000 MHz
(rangesel=0) or 2000–3000 MHz (rangesel=1).

The parameter search in rzg3l_dsi_get_pll_parameters_values() iterates
over all valid (MR, PR) combinations, filtering by the required FPFD range
of 8–16 MHz, then delegates to rzg3l_dsi_compute_pll_parameters() to find
the NIR/NFR pair that best approximates the requested rate. An exact match
returns immediately; otherwise the combination with the smallest absolute
frequency error is used.

Computed parameters are cached in pll7_dsi_params within pll_clk to
avoid redundant recalculation in determine_rate() when the requested
rate has not changed.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 227 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h |   5 +
 2 files changed, 232 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a60b1d99458e..83c9f393c832 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -67,6 +67,10 @@
 #define CPG_PLL_MON_OFFSET(x)		(CPG_PLL_STBY_OFFSET(x) + 0xc)
 #define CPG_PLL_MON_LOCK		BIT(4)
 #define CPG_PLL_MON_RESETB		BIT(0)
+#define CPG_PLL_CLK1_VAL(p, m, ni, nf, sel)	(FIELD_PREP(GENMASK(28, 26), p)  | \
+						 FIELD_PREP(GENMASK(25, 22), m)  | \
+						 FIELD_PREP(GENMASK(21, 13), ni) | \
+						 FIELD_PREP(GENMASK(12, 1), nf)  | (sel))
 
 #define RZG3L_SDIV_DIV_DSI_A_WEN	BIT(16)
 #define RZG3L_SDIV_DIV_DSI_B_WEN	BIT(20)
@@ -96,6 +100,26 @@
 #define PLL5_HSCLK_MIN		10000000
 #define PLL5_HSCLK_MAX		187500000
 
+#define RZG3L_OSC_CLK			(24 * MEGA)
+#define RZG3L_PLL7_FDCO_RANGE_0_MIN	(900 * MEGA)
+#define RZG3L_PLL7_FDCO_RANGE_0_MAX	(2000 * MEGA)
+#define RZG3L_PLL7_FDCO_RANGE_1_MIN	(2000 * MEGA)
+#define RZG3L_PLL7_FDCO_RANGE_1_MAX	(3000ULL * MEGA)
+#define RZG3L_PLL7_PR_MIN		(0)
+#define RZG3L_PLL7_PR_MAX		(4)
+#define RZG3L_PLL7_MR_MIN		(0)
+#define RZG3L_PLL7_MR_MAX		(11)
+#define RZG3L_PLL7_NIR_MIN		(55)
+#define RZG3L_PLL7_NIR_MAX		(374)
+#define RZG3L_PLL7_NFR_MIN		(0)
+#define RZG3L_PLL7_NFR_MAX		(4095)
+#define RZG3L_PLL7_NR_MIN		(56250)	 /* Multiplied value 56.25 * 1000 */
+#define RZG3L_PLL7_NR_MAX		(375000) /* Multiplied value 375 * 1000 */
+#define RZG3L_PLL7_MULT_MIN		(293)	 /* Multiplied value 0.293 * 1000 */
+#define RZG3L_PLL7_MULT_MAX		(375000) /* Multiplied value 375 * 1000 */
+#define RZG3L_PLL7_FSTD_DIV_MR_MIN	(8 * MEGA)
+#define RZG3L_PLL7_FSTD_DIV_MR_MAX	(16 * MEGA)
+
 /**
  * struct clk_hw_data - clock hardware data
  * @hw: clock hw
@@ -1202,6 +1226,15 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
 	return clk_hw->clk;
 }
 
+/* RZ/G3L PLL7 parameters */
+struct rzg3l_plldsi_parameters {
+	s64 error_millihz;
+	u64 freq_millihz;
+	u16 nir, nfr;
+	u8 rangesel;
+	u8 pr, mr;
+};
+
 struct pll_clk {
 	struct clk_hw hw;
 	unsigned long default_rate;
@@ -1209,6 +1242,7 @@ struct pll_clk {
 	unsigned int type;
 	void __iomem *base;
 	struct rzg2l_cpg_priv *priv;
+	struct rzg3l_plldsi_parameters pll7_dsi_params;
 };
 
 #define to_pll(_hw)	container_of(_hw, struct pll_clk, hw)
@@ -1368,6 +1402,196 @@ static const struct clk_ops rzg3l_cpg_pll_ops = {
 	.recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
 };
 
+static inline bool
+rzg3l_dsi_compute_pll_parameters(struct rzg3l_plldsi_parameters *pars,
+				 struct rzg3l_plldsi_parameters *p,
+				 struct rzg3l_plldsi_parameters *best,
+				 u64 freq_millihz, u32 fpfd, u32 pr)
+{
+	for (p->nir = RZG3L_PLL7_NIR_MIN; p->nir <= RZG3L_PLL7_NIR_MAX; p->nir++) {
+		u64 output_nir, output_nfr_range;
+		s64 nfr, output_nfr;
+		u64 fdco, output;
+		u64 nr_div_mr_pr;
+
+		/*
+		 * The frequency generated by the PLL is calculated as follows:
+		 *
+		 * With:
+		 * Freq = Ffout = Ffdco / pr
+		 * input frequency(fstd) = 24MHz
+		 * fpfd = fstd / mr
+		 * nr = nir + nfr / 4096
+		 * Ffdco = nr * fpfd
+		 * Ffdco = (nir + (nfr / 4096)) * fpfd
+		 *
+		 * Freq can also be rewritten as:
+		 * Freq = Ffdco / pr
+		 *      = (nir * fpfd) / pr + ((nfr / 4096) * fpfd) / pr
+		 *      = output_nir + output_nfr
+		 *
+		 * Every parameter has been determined at this point, but nfr.
+		 * Considering that:
+		 * 0 <= nfr <= 4095
+		 * Then:
+		 * 0 <= (nfr / 4096) < 1
+		 * Therefore:
+		 * 0 <= output_nfr < fpfd / pr
+		 */
+
+		/* Compute output nir component (in mHz) */
+		output_nir = DIV_ROUND_CLOSEST_ULL((p->nir + 1) * 1ULL * fpfd * MILLI, pr);
+		/* Compute range for output nfr (in mHz) */
+		output_nfr_range = DIV_ROUND_CLOSEST_ULL(fpfd * 1ULL * MILLI, pr);
+		/* No point in continuing if we can't achieve the desired frequency */
+		if (freq_millihz < output_nir  || freq_millihz >= (output_nir + output_nfr_range))
+			continue;
+
+		/*
+		 * Compute the nfr component
+		 *
+		 * Since:
+		 * Freq = output_nir + output_nfr
+		 * Then:
+		 * output_nfr = Freq - output_nir
+		 *            = ((nfr / 4096) * fpfd) / pr
+		 * Therefore:
+		 * nfr = (output_nfr * 4096 * pr) / fpfd
+		 */
+		output_nfr = freq_millihz - output_nir;
+		nfr = div64_s64(output_nfr * 4096ULL * pr, fpfd);
+		nfr = DIV_S64_ROUND_CLOSEST(nfr, 1000);
+
+		/* Validate nfr value within allowed limits */
+		if (nfr < RZG3L_PLL7_NFR_MIN || nfr > RZG3L_PLL7_NFR_MAX)
+			continue;
+
+		p->nfr = nfr;
+
+		/* Compute (Ffdco * 4096) */
+		fdco = (((p->nir + 1) * 4096ULL) + p->nfr) * fpfd;
+		if (fdco < (RZG3L_PLL7_FDCO_RANGE_0_MIN * 4096ULL) ||
+		    fdco > (RZG3L_PLL7_FDCO_RANGE_1_MAX * 4096ULL))
+			continue;
+
+		if (fdco <= (RZG3L_PLL7_FDCO_RANGE_0_MAX * 4096ULL))
+			p->rangesel = 0;
+		else
+			p->rangesel = 1;
+
+		/* compute the nr and magnify by 1000 */
+		output = mul_u32_u32((p->nir + 1), 4096);
+		output += p->nfr;
+		output *= 1000;
+		nr_div_mr_pr = output / 4096;
+		if (nr_div_mr_pr < RZG3L_PLL7_NR_MIN || nr_div_mr_pr > RZG3L_PLL7_NR_MAX)
+			continue;
+
+		/* compute the magnified multipier = nr(magnified)/(mr *pr)  */
+		nr_div_mr_pr /= (p->mr + 1) * pr;
+		if (nr_div_mr_pr < RZG3L_PLL7_MULT_MIN || nr_div_mr_pr > RZG3L_PLL7_MULT_MAX)
+			continue;
+
+		output *= RZG3L_OSC_CLK;
+		output /= (p->mr + 1) * pr * 4096;
+
+		p->error_millihz = freq_millihz - output;
+		p->freq_millihz = output;
+
+		/* If an exact match is found, return immediately */
+		if (p->error_millihz == 0) {
+			*pars = *p;
+			return true;
+		}
+
+		/* Update best match if error is smaller */
+		if (abs(p->error_millihz) < abs(best->error_millihz))
+			*best = *p;
+	}
+
+	return false;
+}
+
+static bool
+rzg3l_dsi_get_pll_parameters_values(struct rzg3l_plldsi_parameters *pars,
+				    u64 freq_millihz)
+{
+	struct rzg3l_plldsi_parameters p, best;
+
+	/* Initialize best error to maximum possible value */
+	best.error_millihz = S64_MAX;
+	p.error_millihz = S64_MAX;
+	for (p.mr = RZG3L_PLL7_MR_MIN; p.mr <= RZG3L_PLL7_MR_MAX; p.mr++) {
+		u32 fpfd = RZG3L_OSC_CLK / (p.mr + 1);
+
+		if (fpfd > RZG3L_PLL7_FSTD_DIV_MR_MAX || fpfd < RZG3L_PLL7_FSTD_DIV_MR_MIN)
+			continue;
+
+		for (p.pr = RZG3L_PLL7_PR_MIN; p.pr <= RZG3L_PLL7_PR_MAX; p.pr++)
+			if (rzg3l_dsi_compute_pll_parameters(pars, &p, &best,
+							     freq_millihz, fpfd, 1 << p.pr))
+				return true;
+	}
+
+	/* If no valid parameters were found, return false */
+	if (best.error_millihz == S64_MAX)
+		return false;
+
+	*pars = best;
+	return true;
+}
+
+static int rzg3l_cpg_plldsi_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg2l_cpg_priv *priv = pll_clk->priv;
+	struct rzg3l_plldsi_parameters *pll7_dsi_params = &pll_clk->pll7_dsi_params;
+	u64 rate_millihz;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (rate_millihz == pll7_dsi_params->error_millihz + pll7_dsi_params->freq_millihz)
+		goto exit_determine_rate;
+
+	if (!rzg3l_dsi_get_pll_parameters_values(pll7_dsi_params, rate_millihz)) {
+		dev_err(priv->dev, "failed %s for req->rate: %lu\n", __func__, req->rate);
+		return -EINVAL;
+	}
+
+exit_determine_rate:
+	req->rate = DIV_ROUND_CLOSEST_ULL(pll7_dsi_params->freq_millihz, MILLI);
+	return 0;
+}
+
+static int rzg3l_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct pll_clk *pll_clk = to_pll(hw);
+	struct rzg3l_plldsi_parameters *dsi_dividers = &pll_clk->pll7_dsi_params;
+	u32 val;
+
+	/* Put PLL into standby mode */
+	rzg3l_cpg_pll_clk_endisable(hw, false);
+
+	/* Output clock setting 1 */
+	val = CPG_PLL_CLK1_VAL(dsi_dividers->pr, dsi_dividers->mr,
+			       dsi_dividers->nir, dsi_dividers->nfr,
+			       dsi_dividers->rangesel);
+	writel(val, pll_clk->base + CPG_PLL_CLK1_OFFSET(pll_clk->conf));
+
+	/* Put PLL to normal mode */
+	rzg3l_cpg_pll_clk_endisable(hw, true);
+
+	return 0;
+};
+
+static const struct clk_ops rzg3l_cpg_plldsi_ops = {
+	.recalc_rate = rzg3s_cpg_pll_clk_recalc_rate,
+	.determine_rate = rzg3l_cpg_plldsi_determine_rate,
+	.set_rate = rzg3l_cpg_plldsi_set_rate,
+	.is_enabled = rzg3l_cpg_pll_clk_is_enabled,
+	.enable = rzg3l_cpg_pll_clk_enable,
+};
+
 static struct clk
 *rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
 			       void *data)
@@ -1481,6 +1705,9 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_G3L_DSI_DIV:
 		clk = rzg3l_cpg_dsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_G3L_PLLDSI:
+		clk = rzg2l_cpg_pll_clk_register(core, priv, &rzg3l_cpg_plldsi_ops);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 24642a089b6c..41e8f389c566 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -142,6 +142,9 @@ enum clk_types {
 	/* Clock for DSI divider */
 	CLK_TYPE_DSI_DIV,
 
+	/* Clock for G3L DSI PLL */
+	CLK_TYPE_G3L_PLLDSI,
+
 	/* Clock for G3L DSI divider */
 	CLK_TYPE_G3L_DSI_DIV,
 };
@@ -206,6 +209,8 @@ enum clk_types {
 #define DEF_G3L_DSI_DIV(_name, _id, _parent, _conf) \
 	DEF_TYPE(_name, _id, CLK_TYPE_G3L_DSI_DIV, .parent = _parent, .conf = _conf, \
 		 .flag = CLK_SET_RATE_PARENT)
+#define DEF_G3L_PLLDSI(_name, _id, _parent, _conf) \
+	DEF_TYPE(_name, _id, CLK_TYPE_G3L_PLLDSI, .parent = _parent, .conf = _conf)
 
 /**
  * struct rzg2l_mod_clk - Module Clocks definitions
-- 
2.43.0


