Return-Path: <linux-renesas-soc+bounces-33574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VW9nGoVPIWpEDAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:12:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C5963EE1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 12:12:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Opfn+kfT;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05E293084434
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 09:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5BD3FFAA8;
	Thu,  4 Jun 2026 09:57:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641203FDBE2
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:56:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567021; cv=none; b=heZVUIdwgF7ARZRGfEE7NXjRXjEqAy+FJsRkwN7ECpT74eV5qrofjsd/ZsK7iVEnmT2KPCT0EaAC/YJYNa0WhZ8ze/3fcPnGSAPHVrvdw1gltA+1gEzKkWC6Tui++i9h/9ExhASd7X0zx71r3aF2ry4oDyQPJ33IQQXtwczdXOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567021; c=relaxed/simple;
	bh=7k9zOJLQmwMA/uzYIEjXOvz20d0UsGHSnWUHZU6C/nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VvEbb9Gj5yrOBIzUg4sBw/Ro7HYQ0KQcYwmgm70rlFj56GHyxm6rR67O7st0OTmN6+UpLk0GDltOgBveqz//trmTFLu5fq3vB3l6pc1nBBQj1dYVZSdfhXxGPEaSAfnr5HybBw+ijCMKB/o1su3NSbhnf2IyDxlVlM2w5s38ZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Opfn+kfT; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso239445f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567017; x=1781171817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5m4IybCJvRhAGS6FWlVTrHuns1jqnPal3+xcRsaPBs=;
        b=Opfn+kfTunl5vKIxlP7ahtKla8gu65LCou0ae0mOdksuCKYIYZimfx3ElTAv/FERrU
         rsujUIBbOZES1EupyVVxLWnfhlSbM/rYu0Mh0OVBfQ2tkX8OwkbDkZ8KsotkpViYZ3td
         8+h6LEl6XzSev2d5Az4HUpiOTUXnBLHN/RVxHGSIjpfhT4RPxYRZnGM6GEIe0oew0MGC
         BPHfvEsfR5VhUJZdzT/Z2oaJORJlfAALPMaKACgHtgEwVGB5+e9RNRQAMLA16TVLQtU6
         BrXN4ut/TB8xJB3sg/Osqr1ONjqkKEtzlr/LNdNXThmUndqmG5nMSxVsYrgO76DPhelM
         RRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567017; x=1781171817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5m4IybCJvRhAGS6FWlVTrHuns1jqnPal3+xcRsaPBs=;
        b=KirHHY1JOFhtyhV1Cn9y81il0yFt66qRRRd6sejYKNhlCX2eTlV0AcLTWLH7Cubv6k
         g57yUVOfYy9Fjqc11dbR9dy6M+VH71Jkr9ilWGNW3aKfBU43/iRrB1PGcsO1m8Z8Hs+0
         O4ySOpzgvoIIMtxkKYGMR/eN8ftO2Dug9ofWytgB1nc5Brwrj/KNxjtaq5b5tPIokDOV
         cl98gC07Z452sXvm8yYRCf9AtrUOkDwzPyPbWvKMe9zYopNf1k6uRuq1Frxw0ZDnE2LE
         uOJb64RXqqoj+ywk1xH9ilUzrxVFu+9vA2DW9R0diaBgMAsS5jMqkeUKuc49aJ4eUqdV
         S8Xg==
X-Forwarded-Encrypted: i=1; AFNElJ91jagv1CISKFq1gTbnAqISGJMrn4xdqoTISDznFR2oHFcsG8WbZ4Dx2NvtB0z/uB9RqRVkdZo9GNUewBxTcu7IQg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl6XWxaA08UN8ESNaKLOqIpUwe5bj8Jk60mMb1JzmwxnVrUvyU
	GWB+xW+mD5iLssKf4lbVJj+Dsa2xzu4d3YXzg+kAskdjmi+tC33tua4L
X-Gm-Gg: Acq92OEcfh6xoGesnIARd6mlpblfi+iTOz3uf2+6iWiyHgqxnDENFDg8BCfJtxsvBOY
	5mTmBGX8zgVGAswoebs6nEywvaOEZeDDdScZlZ1qdxqEOOn0+Dz1HSuYl9QaH7at/OLtjCygeLM
	Lh9sl0GbP4LtQ5XMmFRW5Jrb1h/68ZHR4hbRfF34hRoBJmdkNbABX6EE86czAOD8M4S96GWaTzg
	1samOsp3Oo/PxUlzuKVH9tA8rPLdEm+iJErlP4pmJY70msJJFxEulr0NC1G7MdTDtL6itkKT9tj
	QjfqJgoYYiB1Xc32L9YGYvias+jET1BbOA80okPiyedb8+Er1BLH0wo4C+Mdjtn64D6/bZZQ9j6
	Bk/E2FWvgw9Brz/Lmvbt9RFLWGJmu3fDSKmAnXkA+fgDTLwvpuEr0/YD9gfU5ix4V2RmZjMtSEM
	s42rouqmGxhrBKeDLfvLdqkw085xjFrP0i99PMKagPahwzHaW3nXMEQEopdc4=
X-Received: by 2002:a05:600c:4fcc:b0:490:59cc:999f with SMTP id 5b1f17b1804b1-490b5ea1016mr120694265e9.4.1780567016697;
        Thu, 04 Jun 2026 02:56:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm38037335e9.8.2026.06.04.02.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:56:56 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v6 07/11] pwm: rzg2l-gpt: Add info variable to struct rzg2l_gpt_chip
Date: Thu,  4 Jun 2026 10:56:37 +0100
Message-ID: <20260604095647.108654-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
References: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33574-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ukleinek@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-pwm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 65C5963EE1F

From: Biju Das <biju.das.jz@bp.renesas.com>

Introduce struct rzg2l_gpt_info to capture SoC-specific hardware
differences, starting with the gtcr_tpcs field mask for the prescaler
bitfield in GTCR. This is needed because the RZ/G3E GPT has a 4-bit
prescaler field versus the 3-bit field on RZ/G2L.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change.
v4->v5:
 * Updated commit description.
v3->v4:
 * Dropped field_{get,prep} as mainline now support it.
 * Updated commit description.
 * Retained RZG2L_GTCR_TPCS bit definitons
 * Replaced gtcr_tpcs_mask->gtcr_tpcs
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 18e6c0f28e29..3ee5a70ca265 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -90,9 +90,14 @@
 #define RZG2L_MAX_POEG_GROUPS	4
 #define RZG2L_LAST_POEG_GROUP	3
 
+struct rzg2l_gpt_info {
+	u32 gtcr_tpcs;
+};
+
 struct rzg2l_gpt_chip {
 	void __iomem *mmio;
 	struct mutex lock; /* lock to protect shared channel resources */
+	const struct rzg2l_gpt_info *info;
 	unsigned long rate_khz;
 	u64 period_ticks[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_request_count[RZG2L_MAX_HW_CHANNELS];
@@ -336,7 +341,7 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 
 	guard(mutex)(&rzg2l_gpt->lock);
 	if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, &gtcr)) {
-		wfhw->prescale = FIELD_GET(RZG2L_GTCR_TPCS, gtcr);
+		wfhw->prescale = field_get(rzg2l_gpt->info->gtcr_tpcs, gtcr);
 		wfhw->gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
 		wfhw->gtccr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
 		if (wfhw->gtccr > wfhw->gtpr)
@@ -380,8 +385,8 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTUDDTYC(ch), RZG2L_GTUDDTYC_UP_COUNTING);
 
 		/* Select count clock */
-		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_TPCS,
-				 FIELD_PREP(RZG2L_GTCR_TPCS, wfhw->prescale));
+		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), rzg2l_gpt->info->gtcr_tpcs,
+				 field_prep(rzg2l_gpt->info->gtcr_tpcs, wfhw->prescale));
 
 		/* Set period */
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), wfhw->gtpr);
@@ -525,6 +530,8 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rzg2l_gpt->mmio))
 		return PTR_ERR(rzg2l_gpt->mmio);
 
+	rzg2l_gpt->info = of_device_get_match_data(dev);
+
 	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
@@ -571,8 +578,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rzg2l_gpt_info rzg2l_data = {
+	.gtcr_tpcs = RZG2L_GTCR_TPCS,
+};
+
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-	{ .compatible = "renesas,rzg2l-gpt", },
+	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_gpt_of_table);
-- 
2.43.0


