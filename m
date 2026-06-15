Return-Path: <linux-renesas-soc+bounces-34035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n8gdAjAPMGqmMgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 16:41:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D96687480
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 16:41:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H9Y5BAEC;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BA723054E8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 14:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71713FBEA3;
	Mon, 15 Jun 2026 14:40:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736283FA5C6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 14:40:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534406; cv=none; b=qSBVWwtkY0wCRkBNgXgZcmljt15zLi6416fm8HldaCYdg1mUktFb61rWiXAhn4+T9kMlkmtHPXo7IYItAbqbQ6MmIlz7plbiqISNPeBEGd9JqxvAld0SScFl+ciQiJZsEdzFn8G0fx/xmmV0eO6EbeTu1jXPB6s26wSWiyLA5jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534406; c=relaxed/simple;
	bh=m66F2sL25SNBJsCp1T2HIzM0RPg0EP/lLtzkItOGeTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=By1AUC5VPMSd4bBU5XbdZsyX3/t663GKuB7yQgMYRb39TVA9uhXK92mEuSkOhlnRdGJC58yhLPlje6Nm5sLiNCcVLIzCslwX87KSA5zPULPsw/RefUndCz7F8ufYtIjPsY7oUjoQDj541/WGwLmqH4R+5CEv8we5tPFnjCKTgeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9Y5BAEC; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so20685365e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781534403; x=1782139203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU/52Hsil9tk4JLlHlSaydCvbsd+hTRfmIz26QTpIbs=;
        b=H9Y5BAECGBOY2rbXHVx/Ncm+oMUbsHX6DeIkcju8psO5UMzVbfTzn0mVFtNI/M+2SM
         fTfxRjEcRQsN/vLyEhtYhDulpBatU4M2xOUqa0GOaXy+PWt4bfcwOvPyxo9Xug3sKTe5
         yN67/3Vy23shGqNf4+xbaJAvTKXzgaLVb3++o2z9OLvve+5Gbi3z5GtKZi8KRyQPJJP/
         YK7NVxxBUU6JDxXEOvjt9nqwB0T+o9ZG2xOPK7O1PJgvxDaR1FJKmxlemW7cXta+bDVW
         OxqbZ5MgMAa607Qhyl/EoWPm5cYWpF9i4sGINfc3MmSPWP5LX1QGXdV75DWvrnblHgT+
         kcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534403; x=1782139203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZU/52Hsil9tk4JLlHlSaydCvbsd+hTRfmIz26QTpIbs=;
        b=sb+EHsDo2sfzGHLgWPfDPFk4Mwm2x7mgrJwCF8M/PKXA0ieMRFyLUbikydBFTh6eQz
         bHMmlqMQK9CzMgha+eS8PdEgysYbYcZJ/2kFCjJtdj6TD1Q+McJazDtN6QZYtTVQE3jU
         xXz87mpTaf+01NP6QNDbEcSCOpfqx7LYW7TlkL0SKDbnDJzupQG0io0r9c3RCzMDu9ZO
         2t1P/eTxl9MFF7LX9rxpLEWppQsggRnC/1VeJFeMaNJ42D4+5e2MOpJSOjbB00P0DUnd
         skUDlzzluojY6M/f0oTMk1z+ps6ZeS8MlfeANVOcyJcY4rvMH/7DEPbg4L5+o3wTOMX1
         2eSw==
X-Forwarded-Encrypted: i=1; AFNElJ/H8K3gelBj54ySAHZf2U1fQzCAy9kBr1k4oUy3CV3DKRpp92ZUndkXQ/JjBnh59M4ZysGTX+BZd1XtaVZNtoNC+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvdX7hbixzzuU3bn4d3BOSQfuKJT7JRkAY4Y9fcF/P/WT4LKV3
	/qTJ34/8HYMjVmuqJ0kKFMsx883+qHjvQCri5Q02lygs52iz1W4LBliX
X-Gm-Gg: Acq92OE+kqfRzOC1Yn4MAdCN0eACwHyvJivKBeXFmJ6SzF5c3wRGvR8eQjP6fbfiX6O
	dtM4p8bUYK1ARFWUdj1a9O3AZD/+5WUmz93Fv9I/ypO2ScBqd7GI4Uey8R6Y8GFU4RFHadTl7Sv
	KI8bwLEXu0ZAa4R7UFFHt/RR7jcX3R6VsJ/UTIv0gqLcoeyRSlGtkcaXlBWuqv8d0Q1S1ve0qpJ
	JDJVD/SBBLuipJOoBYVfiGBDmXatz63WqjK1pbj1h1GjXfuCA3RgBoLXwgLvbmGj3+LabKzOsWu
	bVvclENmQ3nLdcu18rNjP14/32r5xCKUgcKdu6tPZfNZBdlIA/ELZFwwXE9wLC2WCFed/QIDs5B
	1W5eoJMI78Zb+XrNR/GL5Ktm0e+b2Zx4DJGMBCv7ai1rbp1zD5a9lArQlN31uXn/v99zvnsEG8V
	AmNd7zT5m2ZCF6RRjptdQ1vf6UrVFjOYVDONiT2FNblPyxkC567vQGdbUbkrZiDUgabTP216/TQ
	PR/5GA54AGJpOgAhxTmMXfBWopq0HvgI8JV
X-Received: by 2002:a05:600c:8b56:b0:490:e60b:5fb5 with SMTP id 5b1f17b1804b1-490ec527e4emr178094045e9.34.1781534402500;
        Mon, 15 Jun 2026 07:40:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c05ebsm256627915e9.9.2026.06.15.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:40:01 -0700 (PDT)
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
Subject: [PATCH 2/2] clk: renesas: r9a09g077: Add RTC clocks
Date: Mon, 15 Jun 2026 15:39:43 +0100
Message-ID: <20260615143943.1610095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34035-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72D96687480

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the core and module clock definitions for the Real-Time Clock (RTC)
peripheral on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 873c41ae5606..5640c2035e5a 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -149,7 +149,7 @@ static const struct rzv2h_pll_limits r9a09g077_cpg_pll3_limits = {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_LCDC_CLKD,
+	LAST_DT_CORE_CLK = R9A09G077_PCLKRTC,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -337,6 +337,7 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 		sel_clk_pll4d3_div10_div20, ARRAY_SIZE(sel_clk_pll4d3_div10_div20), 0),
 	DEF_DIV_LCDC("LCDC_CLKD", R9A09G077_LCDC_CLKD, CLK_SEL_CLK_PLL3, LCDCDIVSEL,
 		     dtable_2_32),
+	DEF_FIXED("PCLKRTC", R9A09G077_PCLKRTC, CLK_EXTAL, 128, 1),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
@@ -367,6 +368,7 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci5fck", 600, CLK_SCI5ASYNC),
 	DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
 	DEF_MOD("spi3", 602, CLK_SPI3ASYNC),
+	DEF_MOD("rtc", 605, R9A09G077_CLK_PCLKL),
 	DEF_MOD("lcdc", 1204, R9A09G077_CLK_PCLKAL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
-- 
2.54.0


