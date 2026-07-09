Return-Path: <linux-renesas-soc+bounces-34999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E6m6Ihf3T2r0rAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:31:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8D3735010
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:31:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mUgt4+Mj;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 192F53080BFE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 19:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE19C3D1A8E;
	Thu,  9 Jul 2026 19:29:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F563CD8D3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 19:29:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625370; cv=none; b=rRfDN/1TPrtD3MIrOXCtkMxlD1AdsPKYwUb5YlYfTvmHt46nsWLhoNfkK1DI3q7lOa4aCSukUWOt6ePB68TlVz0iRB0H+XMKO4xwYRxcKYz/7GZAaUl1f/DNXanZWL8iqoVQs1uZyGrkzEesGUxQAhSo15+VbTP3qKLwJsDvC7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625370; c=relaxed/simple;
	bh=vzBQdJ1M1R/swWZ1bXg8311LOyCFVHJ7jmG6I8OJpQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdUNj63tMGn7izDT9V5pgAXfy629nwBEz/A7rO/C7G/4MSHjs1fC9FdWwLDxLXtJI/OYSfjKo9TqNTnctm7pFgU5YqOsNjz8d50CCBhgoFot4LbX+ShGhKsRTJ8VT1isp5ZfQvfUcH40D1W/BddCbfRO50hHxMi75xwfTRZaQd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUgt4+Mj; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso1525835e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625366; x=1784230166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axwrOiyWIwvhuEa/F51yTWG5g+FZ1REob5L9jKF4l+0=;
        b=mUgt4+MjSRwMaztBu+y3cVK+A7fj6fxpI8rWNHYK2uLxSvICWsE6/zrcBQt/t6wBwp
         kpjPmEZ2gTUc68Sq/YMqwwRxBQmDXcuxXiWkW3zRPfZMGTv/cXv1yB/EXE65smfIC1MW
         J7mJ84hBcTYu9ZghMb7he3P/hPmW/uN1+sgkUTAU4+5+HoSzg3kUuoQDco/RwfaBxomS
         /l3+1z+aRxGHYulgc9GQxnq1sRImll21gr+Z38lXxlT4a+WxMZbKENWjIkDSXFEQJTan
         9Z727EeDMVbkZxUb4qBIrLW4ZIQb/2tSAV2uu8bYaBrNJbnUgiO/OshLI0DFYLgv3d53
         4Gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625366; x=1784230166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axwrOiyWIwvhuEa/F51yTWG5g+FZ1REob5L9jKF4l+0=;
        b=nAyZFW8FHGItBQce8Bdl4joh6j+f1FYz0by2udbIOnGMJ6RRUMwbQA5g4grv7nxnuH
         km89okwYaROYI8zA3mZo6vV2xX4QuEf8jaC+4olhq7oqB5VXvZm9MsOqocgxP9oNMO1Y
         oMfZe1lDqh5BMXMu7nbsB/yc9p7MAairTCG0F/5GMStSPIdv2d0/qjId7R9lfWjGkYsc
         0/AUzeGc5zrh9hVarRb22r4qh4VJWpLUSSpx0sJCGevjpv2YUEzm0GlvUn/sNAazY4h5
         P83BP1/fTiqGC9G5D91h3jqfrwDT3kEZ0TD1b8tip5ECmUqr3HdpV7Jln3OfnDmEZX74
         5lmg==
X-Forwarded-Encrypted: i=1; AHgh+RrOeCEtJBE2NEKnziAy5Vl537nCgiLhD1EHm0dqdsFYG89JnN9QW2ZJVRPzJUdcBFWm56HlbnYdyvCdNo9TJY9IEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2U1AErskt6RY1XjjyK5DcPEvBuyT9oNhsV9w7/ShLM6UmH+LL
	7pXyZxgXX+UlvrBNaYdY4tlXs5vfqULcKtD43np2lBiAoD+FAQ30wqUn
X-Gm-Gg: AfdE7cm0alc6/xOYJ5KVKwhnTzLhqNPVOmLEP3NzHJyj3YKRyfLXvD+po1PliflnE5U
	nmG1g/QxkpHxjBEIufrjD6JlOgX1js0wo71Lz51kXargID3u6yHk5yhdnmYLIpX1TMcUXS8D2Ra
	MwLtdVO9nJyLwcvuAltMEEb1n5PzZrQES+LtwyYXefSoUWzbVhvrleqi76NWpgFRxBBcycCoYih
	fTUazT3ktWtboVgzE8TYgGlk1iM/0v1ZzPbnuECCcFnGDUI4zGBoDTDwO+Lbw46zVMQtVIqNunO
	QSROasva4AnYoNmG6CQDYI72kHinJh8glDRQ83VJAWWCxZ6eXEQRrvt2Q9Hc6KBgkzaNdRlaPe8
	Tj3vo2MeAjffAv7CxelDB5c89azBsft+F4AW+pnNEY9oNfmVhvR9ztIj6qo7bfP2rv0ylYG0igx
	ApnGEYoWUVneO6c/I5fMHS
X-Received: by 2002:a05:600c:c165:b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-493f2bfeecbmr3196745e9.11.1783625366373;
        Thu, 09 Jul 2026 12:29:26 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm84366045e9.3.2026.07.09.12.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:29:26 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v19 10/12] mmc: renesas_sdhi: Make HS400 OSEL bit configurable per SoC
Date: Thu,  9 Jul 2026 20:29:07 +0100
Message-ID: <20260709192916.630794-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
References: <20260709192916.630794-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34999-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C8D3735010

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3L and R-Car both use SH_MOBILE_SDHI_SCC_TMPPORT2 but interpret
its bitfields differently. R-Car uses BIT(4) (HS400OSEL) to control
HS400 data output timing, while RZ/G3L uses the lower 16 bits for tuning
delay and does not require the OSEL bit.

Remove the hardcoded SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL constant
and replace it with a per-platform osel_tmpout field in both
renesas_sdhi_of_data and tmio_mmc_data. The field is propagated
during probe and consumed in renesas_sdhi_hs400_complete() and
renesas_sdhi_reset_hs400_mode() when setting or clearing the HS400EN
bit in TMPPORT2.

Set osel_tmpout = BIT(4) explicitly on of_data_rcar_gen3 and
of_data_rcar_gen3_no_sdh_fallback; platforms that omit it (such as
RZ/G2L and RZ/G3L) default to zero, leaving the OSEL bit untouched
during HS400 mode transitions.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18->v19:
 * No change.
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi.h               | 1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 6 +++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 ++
 include/linux/platform_data/tmio.h            | 1 +
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 39d915da6f38..30eaa501664d 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -41,6 +41,7 @@ struct renesas_sdhi_of_data {
 	unsigned long sdhi_flags;
 	u64 clk_mask;
 	unsigned int max_divider;
+	u32 osel_tmpout;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index cec703122b22..caeabce7e192 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -307,7 +307,6 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP	BIT(24)
 #define SH_MOBILE_SDHI_SCC_SMPCMP_CMD_ERR	(BIT(8) | BIT(24))
 
-#define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL	BIT(4)
 #define SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN	BIT(31)
 
 /* Definitions for values the SH_MOBILE_SDHI_SCC_TMPPORT4 register */
@@ -454,7 +453,7 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
+			host->pdata->osel_tmpout) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
@@ -595,7 +594,7 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
 		       ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
-			 SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
+			 host->pdata->osel_tmpout) &
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
 	if (sdhi_has_quirk(priv, hs400_calib_table) || sdhi_has_quirk(priv, hs400_bad_taps))
@@ -1195,6 +1194,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->max_segs = of_data->max_segs;
 		mmc_data->clk_mask = of_data->clk_mask;
 		mmc_data->max_divider = of_data->max_divider;
+		mmc_data->osel_tmpout = of_data->osel_tmpout;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index e78dbcb6c887..6a1b59d2e837 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -129,6 +129,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -147,6 +148,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
+	.osel_tmpout	= BIT(4),
 };
 
 static const struct renesas_sdhi_of_data of_data_rz_g2l = {
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index e6663cc736be..6443ba01c723 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -72,5 +72,6 @@ struct tmio_mmc_data {
 	unsigned short			max_segs;
 	u64				clk_mask;
 	unsigned int			max_divider;
+	u32				osel_tmpout;
 };
 #endif
-- 
2.43.0


