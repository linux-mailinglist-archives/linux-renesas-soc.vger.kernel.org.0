Return-Path: <linux-renesas-soc+bounces-33929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V8iVGVwYLGovLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:31:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE1B67A31B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:31:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cNwTQSxT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8E24300B08D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCB3438D3F0;
	Fri, 12 Jun 2026 14:30:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A56238C401
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:30:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274657; cv=none; b=Y7B31fatFWoSjZvzzSH3bk4hSzwh5MxdxT8t2YQIqQBbFoxiv3yyHY6wE5WDz+Dx2pKBl7RPK7TXL+fVSDjIPLzJftkZ+AgMYgrcaGcKybhZkJqhaimiWij4WTH/deiZj8YSFVNJtMGU4wuWdIoqSfAcp1YquZbtLLuhnyr9nOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274657; c=relaxed/simple;
	bh=iGtG+0lwcDHNaDdsmWDwoW1Z4Hd+hBkqiiVoObvf+dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SGR7Yp73B8L8AjdbEnVU7vcQ6D25AHFTEpUS0dCChzVPR5fMIbKNvDzaJ8pJmw2oAV1m/lOxsq96tDgd08TgsEYHOzyGQDZD56EqkXtbpDxsZsVEo/38eroljFW8vaDJE1LGREWpY4P9rzwyPwYfhc6ZbHWRdh8EbUbt3j6pOYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNwTQSxT; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4600cbb06deso657183f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274655; x=1781879455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXfYvyQdjiG+rGpfHpfWBCGzM82QHIcgpJsxLzxBnRA=;
        b=cNwTQSxT6ZAMPe9MUfwTH7TDZB/ZrfauneauFG77PBoG2kpjXcAaZA0eu3jio3H7TO
         fbVBeEZE4w/xe2ZovP15ErLQ4seZ3EypbGuCR8wssU0U+BOOTFBzzEl9KTu7NQPAC0Bp
         31yVy+BobWtSik/z1iCUzEhGw9yRkmCC/AVk/JNHSzC69W2qhw3Z2jVNfmr8OC1SVfr/
         b2KmpjfiWYPcTsBEnCYydNDELTSCmXHdooPVedGof3BAkqknXSBWkSm/qn2uoXwBzHO7
         luGiFn3DKtFOrUnfPvKjuicN6wwU8Bb5WzdwXuUf+RjWwi2NS0hPdKJedzSjWhu6YP/G
         j+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274655; x=1781879455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JXfYvyQdjiG+rGpfHpfWBCGzM82QHIcgpJsxLzxBnRA=;
        b=fRPv2uQQHpcwDx6/Rfu1o0dRvdlg5l1dEFc7PTeptt+Qh6smDkhQngSZO9Hx1dcz/W
         bPjRDodBaS8c87AMRopsTK3qc8YxNjW4ZWDpmpHdNtRRmF9iJSZNOHowujYOLjjecHkN
         gQnY/I6cJR1HDhqWdXzeuVqpUIx8qj+j2wVG+5W1iLOKmPtOpb0CBHHVoOqlu+7cRXIr
         5TjDtFjwTnxhvFkz/8MbWQ+sII4BdD/YAkMRbCDsvL8cNzg1J4zHqsPL3IrkZAgEkLjL
         UbnuU8FDA91q+Ekci5oxNuXs3Q1N9nLcGbdjU7km9fi7MAmd4Y0lbK5kvLKSZ7NlXFzi
         43tw==
X-Forwarded-Encrypted: i=1; AFNElJ8OqJ4YlMqX3mVg+h6DlM9ZK99lTulsAHvZB+tqw51opNtSo0CNkzBAXxh2DcOfZ20weJVr3aarRV+UFu5DWQmE0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaYCQmUoCIxfee3U/D+FFwTCoq0Hr5Xwfr+0mNzW3uBM/mBu3Q
	jQvKq2gvCYldPmPepk2Kvd433McEugo1rw/9fFIiz+SYVc9D8NgGZIVh
X-Gm-Gg: Acq92OG90wiA7hjIeXHLGxp6hFAxgKkK2miPwVRuF8u3jcwxwTdPLABs7RJoM4pM1sM
	2Yibq8Pu3hCQUShQOL/3t0YKlxbnGYjJvAFMjq+y7YZIBn9OAbGjX9xKnklKYV0++58kBAw6zKm
	WtZ5OFeOkVEgOwa+byQy2LHBxEb/R1zTIuCYGqpf+c3HeVwAmSnzfVXT87oj4jqndu1qqCYL9K/
	tqPHfumDyeNxotVopk5rTvHcXfYSMTUCdovTqOos0ps3XYKKc6Hx/tV1xBJtSTwnfSMaHygqtgy
	+i64ipvuvXnmQ9zmfjANcGZHXnfROf2TY8ttaqDz1xflfSMtAa+6yLkdp5Wu+s6Y6XiuyTqgMKw
	k1L7UIhtY6Co4RyrK5V/09uMr6xb0cIZj4prQTtFljz3Sqlop6afxwN+LbLTL9HQ7l3EnykT1C3
	8aqkZbw7NLNOQl2jx+nT0rBrzyS0VRHfZbhKaEZVg180trlHKN
X-Received: by 2002:a05:6000:2086:b0:460:6b59:c471 with SMTP id ffacd0b85a97d-4606d035fcfmr4098308f8f.25.1781274654803;
        Fri, 12 Jun 2026 07:30:54 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:54 -0700 (PDT)
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
Subject: [PATCH 03/11] clk: renesas: r9a08g046: Add USB2.0 clock and reset entries
Date: Fri, 12 Jun 2026 15:30:31 +0100
Message-ID: <20260612143048.317907-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33929-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CE1B67A31B

From: Biju Das <biju.das.jz@bp.renesas.com>

Add module clock and reset definitions for the USB2.0 interfaces on the
RZ/G3L (r9a08g046) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index edc83a4104b2..4488bd1988e8 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -416,6 +416,16 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU1, BIT(13))),
 	DEF_MOD("ssi3_pclk_sfr",	R9A08G046_SSI3_PCLK_SFR, R9A08G046_CLK_P0, 0x570, 7,
 					MSTOP(BUS_MCPU1, BIT(13))),
+	DEF_MOD("usb_u2h0_hclk",	R9A08G046_USB_U2H0_HCLK, R9A08G046_CLK_P1, 0x578, 0,
+					MSTOP(BUS_PERI_COM, BIT(5))),
+	DEF_MOD("usb_u2h1_hclk",	R9A08G046_USB_U2H1_HCLK, R9A08G046_CLK_P1, 0x578, 1,
+					MSTOP(BUS_PERI_COM, BIT(7))),
+	DEF_MOD("usb_u2p0_exr_cpuclk",	R9A08G046_USB_U2P0_EXR_CPUCLK, R9A08G046_CLK_P1, 0x578, 2,
+					MSTOP(BUS_PERI_COM, BIT(6))),
+	DEF_MOD("usb_pclk",		R9A08G046_USB_PCLK, R9A08G046_CLK_P1, 0x578, 3,
+					MSTOP(BUS_PERI_COM, BIT(4))),
+	DEF_MOD("usb_u2p1_exr_cpuclk",	R9A08G046_USB_U2P1_EXR_CPUCLK, R9A08G046_CLK_P1, 0x578, 4,
+					MSTOP(BUS_PERI_COM, BIT(13))),
 	DEF_MOD("eth0_clk_axi",		R9A08G046_ETH0_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 0,
 					MSTOP(BUS_PERI_COM, BIT(2))),
 	DEF_MOD("eth1_clk_axi",		R9A08G046_ETH1_CLK_AXI, R9A08G046_CLK_P1, 0x57c, 1,
@@ -531,6 +541,11 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_SSI1_RST_M2_REG, 0x870, 1),
 	DEF_RST(R9A08G046_SSI2_RST_M2_REG, 0x870, 2),
 	DEF_RST(R9A08G046_SSI3_RST_M2_REG, 0x870, 3),
+	DEF_RST(R9A08G046_USB_U2H0_HRESETN, 0x878, 0),
+	DEF_RST(R9A08G046_USB_U2H1_HRESETN, 0x878, 1),
+	DEF_RST(R9A08G046_USB_U2P0_EXL_SYSRST, 0x878, 2),
+	DEF_RST(R9A08G046_USB_PRESETN, 0x878, 3),
+	DEF_RST(R9A08G046_USB_U2P1_EXL_SYSRST, 0x878, 4),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_I2C0_MRST, 0x880, 0),
-- 
2.43.0


