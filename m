Return-Path: <linux-renesas-soc+bounces-32407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MK62KfssAmq/ogEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:24:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D451514D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 622E1304A4F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 19:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9782E4D2EE3;
	Mon, 11 May 2026 19:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRH+i/eW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896524D2ECA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 19:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527156; cv=none; b=Ad8AAfM5z2/uM3i52UVSp1R8TLp5+8+6zpsL/bq25ZafD5G83/ee9z3xqxnJzEqfy2uPjGPAoWvuhoz9z9QeRiABSBoIvt1Lxg5+MpdZTH34GACW6e63TTpbzMHhjbQglUqmnlBgQ20pfGv9s0/rXjb/06qkjbZwwQXggBU0yqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527156; c=relaxed/simple;
	bh=RSQEM4AEfXDIroL3bz9Dy4plRs5cUm5ilJwgG0nOjgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPu+SO3zcQigU8SoejRz+znrjPgqUDVr5WbyrXTsLKJbOG7zZ03Ig/Jjj+jcw+RH5y5t8O2Tc/ibMQi1qmBCMZK/QnYJ8j6LV84CRTBRgZQC8ONLEFul9/EfMEolMpgQcwkY/f3ZFJ0eyd23m1fxRKjsKL4G3uwz0isdacfy0Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRH+i/eW; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso54862935e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527153; x=1779131953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ert1gXzfFNzUas1j1dDUmLT9J2s7SsBhHdLE/z6vbiA=;
        b=kRH+i/eWUXKVzJLuLKKiuAIpv0BcY4tnRryeVOw6+v4n+uOI757mrirkENlYxOozHz
         VfPoBAVHpnj5FI/JkiblmozWIrt+96gkcEuN30WAJV4oEeEyWvTq++/CDaaYPgq6aanW
         o4AnKi9vwWPurxXozHF22F8/7uukXc0g27EQSImk7KPSfEv25BMeFp3Qq1dOROEYurX8
         PI8bei4h+7yjcD/n3zFIDpjyyIN18z3PEj0FmbvKrjbXWEBC9kHmSqdkEM8XDqRSiHJp
         1n/3sKBWtDRiB1WDzlWBvPtIQNxBdNpCjhjZZh5mVKbNOh5NwFAx9RxMV3N2HA+H3tJ3
         rgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527153; x=1779131953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ert1gXzfFNzUas1j1dDUmLT9J2s7SsBhHdLE/z6vbiA=;
        b=rt+/Zx+mmYvdpui2VAPqzEJ0m/2vswfmQgOo4gVPUwnoe3waQCH0NckHQ+4tc5XMeA
         cOeWRjpg+cdLSVWl69PURZpCWvRcCy/olAM95ORA1EODv7w8HPEYTAXtpiQ4hSmmEeX3
         /87WZAbdQpZ2BePZCxb0kvCTqXHrrAGFGp84TTBF19+cst0WYkBCZw2lktxKg3LyY7KH
         vNaLkJN1TcmFdVxqFZ1R9Si/cyKrtWBv57Z+FYZrUfMfDvCciQvRSNxRilISUBb3nVmn
         PLoVxIMDSNZGvS4hEEaiFdAqzL63i/gAng78a95KEYhwzufkyJNENrIvp/2PBj22ZzEI
         JdAg==
X-Gm-Message-State: AOJu0YysOQKTtcL0h5CcWqfye7MYKxmjrIcCm0doh2SHVzi+6MoL4XY9
	R+899xDKkw+VF2kO0pFuqowr2j4OpkMVvRoyvUAIf6DWo9/QsM/9sfQq
X-Gm-Gg: Acq92OHTtBRzUF49eivbLHLif4YSd7E3CQHv2Fr9mk2lHnoFhC+2HeTbTln1BAQ+3KC
	VF51Fg5N+4puKUXM2AA93jgPELJk0+eyoutfBRGuPIxtS/CNrZjmYS2We/y3pWqPGiUn7efFbyj
	UMMr5qUkJakppq+vFeZBXf0AyMgym7XSP0Gx4ZzjGN97dw+W2ydK3MiihB32fYl2uqOqQilFtM5
	VMER9lvhex4oBqI4oiHcPwwiR2Ws3/zBUgw4LrLWFPRnZybtKU5ECGQlz+g4Rf6CzbH1E4Ufh54
	LPaQZsxX0CpUKBoSgGjULVxhfjRoCYT7Mo18NlXV7hPXNCYfnbTzmkHWiJZPasAfjzu6UOmCJN5
	mb/ivwojD+GcQbEQQnKwKGWsGDBfy/tFkHTV9NmFppU6pNSfZ31UyMVt2vw3uGuOQAskUCNM/gw
	a1EbJuvo6mmNwRH3DUIk3bVAWy4AKtzgjemF+Drs42mp6OykY/Y8U5NxAMx99SMnElQUNVs590Q
	RdMj8ZVMwOPPB2kvk5aqD3Yw0ZJTv/KdwfU7g==
X-Received: by 2002:a05:600c:c167:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48e8e207f2bmr12978725e9.8.1778527152976;
        Mon, 11 May 2026 12:19:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm150350725e9.8.2026.05.11.12.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:19:12 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for calculations
Date: Mon, 11 May 2026 20:19:07 +0100
Message-ID: <20260511191910.1945705-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C89D451514D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32407-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a per-SoC PLL reference input frequency for PLL parameter
calculations instead of relying on the hardcoded 24MHz constant.

Add an input_fref field to struct rzv2h_pll_limits and derive the PLL
reference frequency from it in rzv2h_get_pll_pars(). Fall back to the
existing 24MHz value when no SoC-specific input is provided.

This allows the existing PLL divider calculation logic to be reused
unchanged on SoCs such as RZ/T2H, which use a 48MHz PLL reference
input instead of the 24MHz reference used on RZ/V2H(P), while keeping
current RZ/V2H(P) behaviour intact.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 7 ++++---
 include/linux/clk/renesas.h     | 5 +++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index e271c04cee34..b1d640e5c0f9 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -242,6 +242,7 @@ struct rzv2h_plldsi_div_clk {
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz)
 {
+	unsigned long input_fref = limits->input_fref ?: RZ_V2H_OSC_CLK_IN_MEGA;
 	u64 fout_min_millihz = mul_u32_u32(limits->fout.min, MILLI);
 	u64 fout_max_millihz = mul_u32_u32(limits->fout.max, MILLI);
 	struct rzv2h_pll_pars p, best;
@@ -254,7 +255,7 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 	best.error_millihz = S64_MAX;
 
 	for (p.p = limits->p.min; p.p <= limits->p.max; p.p++) {
-		u32 fref = RZ_V2H_OSC_CLK_IN_MEGA / p.p;
+		u32 fref = input_fref / p.p;
 		u16 divider;
 
 		for (divider = 1 << limits->s.min, p.s = limits->s.min;
@@ -335,9 +336,9 @@ bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 					continue;
 
 				/* PLL_M component of (output * 65536 * PLL_P) */
-				output = mul_u32_u32(p.m * 65536, RZ_V2H_OSC_CLK_IN_MEGA);
+				output = mul_u32_u32(p.m * 65536, input_fref);
 				/* PLL_K component of (output * 65536 * PLL_P) */
-				output += p.k * RZ_V2H_OSC_CLK_IN_MEGA;
+				output += p.k * input_fref;
 				/* Make it in mHz */
 				output *= MILLI;
 				output = DIV_U64_ROUND_CLOSEST(output, 65536 * p.p * divider);
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 0949400f44de..bd2d49e7290f 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -53,6 +53,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
  * various parameters used to configure a PLL. These limits ensure
  * the PLL operates within valid and stable ranges.
  *
+ * @input_fref: Reference input frequency to the PLL (in MHz)
+ *
  * @fout: Output frequency range (in MHz)
  * @fout.min: Minimum allowed output frequency
  * @fout.max: Maximum allowed output frequency
@@ -78,6 +80,8 @@ static inline void rzg2l_cpg_dsi_div_set_divider(u8 divider, int target) { }
  * @k.max: Maximum delta-sigma value
  */
 struct rzv2h_pll_limits {
+	u32 input_fref;
+
 	struct {
 		u32 min;
 		u32 max;
@@ -156,6 +160,7 @@ struct rzv2h_pll_div_pars {
 
 #define RZV2H_CPG_PLL_DSI_LIMITS(name)					\
 	static const struct rzv2h_pll_limits (name) = {			\
+		.input_fref = 24 * MEGA,				\
 		.fout = { .min = 25 * MEGA, .max = 375 * MEGA },	\
 		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
 		.m = { .min = 64, .max = 533 },				\
-- 
2.54.0


