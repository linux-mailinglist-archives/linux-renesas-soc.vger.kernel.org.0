Return-Path: <linux-renesas-soc+bounces-34324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5gx9OG1bOWozrAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:57:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCAC6B0E80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:57:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ElBwUJ7L;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0D9A730391CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBD53CCFB4;
	Mon, 22 Jun 2026 15:56:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AB73CBE71
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 15:56:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143782; cv=none; b=EvUG3MLmjYozY6VhYYRcwVMDhHiPyvAuCcp8cnT3irVPw0CnVJ/zdyEda5+vpL4WrGRCgKU810zz9YYvMBnw6iAuITUJVPH8dm4X0tHFkpVq0dRpNH7gaXeJGAitRBA5fCzy5qGE/HfaDAaAi9pJ6jlgSMsJo6QvFyfG3/4vONo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143782; c=relaxed/simple;
	bh=cJz2JQGY/+F7KbBGwJAZDCcNfQ/fahvRcWpWjgHuVlk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uRHJ4QMW2I+sF9GhM9A8emoKm3wjEuwS7cqb8FfFozwhjvUf7zn00FE2RdhepexuL1UnHFkxFbEFwDfrdr8SxOu2spOZQlNunhuCFhqVEMNFlpvQpTz9c2JdHWbbt8gW5fJrm932PlePiaAlWAgjYTUlnHpiSzYGn3NHuWiGICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElBwUJ7L; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b7866869so45648005e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143779; x=1782748579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdrUQAUuhv8VCFgRJROlD04gUC5+qBbq3BOMSmRTYkU=;
        b=ElBwUJ7L4VZKaEMCSEfl1K0kQOp9nClCOzpJM9O/3WA2Y+MBmYEpH9/z64UkJ8joLa
         Ww+/Ne4mHVjT1RL4VqOlVokTWqeQWjwC8BenT3WBZv79G9h1zs6aVeXPhACmO4KZKyZt
         a0VmI/Iw9/J/0CslVCzlCOvT1EC14ZTpEMrDYBhEZP7q3keTRJHwai4ii5Oe3fhfm5xP
         rTdxJDWCCQBOoRiSkndBqD0MoiqiYavmL5xwrXOFooc7b7c7oKEzdXF38m1vo1SArUej
         l1NcTsnzi4/RV6vRcEy8C0g6FL/xv9eJXgwH6yL9eMSLy/68KVjoHSP/lV0pfycywMx9
         n0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143779; x=1782748579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XdrUQAUuhv8VCFgRJROlD04gUC5+qBbq3BOMSmRTYkU=;
        b=mHJ7iDJB4Njj5CRh6J3vd+wFDM/ANV2idsBL+BB6Amdm9rU6jA/ETk4wN9GGgLKpiS
         jC9ZYuDyyg0LomNEZcavM5EQwl1JpQey/fHxqFjbzqmehE4yZwwdzMyzilpOpk/3L8nC
         /Tu5yoeXmoE9dxGy7pH/dYTDBXZDpN75jPnug7/tlIImuycyErWYZdPebiizQNuxz6OE
         T/3+uCqUY0piCmS3/9z9RFMnL+1od/4c0FrRqLPWl5Z/kFfrAoWemUbvSLtZWEaommbz
         zmHVgaX42z/NdwlRXeI5VyXUv0MUaVQIDdA3N+dRBRrXJZCaeqHaZG2T4O6qnMRy9URy
         v+Tw==
X-Forwarded-Encrypted: i=1; AFNElJ/FYMHKPBnl/uDzupjkf3VpNVQVH/CZPpCd9xUAJZiJCsGkOwCyDb7tf6t7MUnKqcYJbVibUowzSk8A+QZ5TjrzYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymbyZhV5btRCVIqBeN7zuP4ANzbno8QcZuVLFhbzqOn1xYLxYH
	rreu0igXjo+g2EiDmBVyAI3hzf17qFZnySHhv9wcLrT3SiCTI2U0nSwR
X-Gm-Gg: AfdE7cmTSiDJasG1Nt6M697wJ++yhIlRS8JqjWwORFBycodGWWAxFUlDvcBxtQogomA
	vPWqCK5L9lkgH6IcZ9lowRTU2fcfkdAFSzSaOIZahtoELE26ixUdUVVX2Uo0hboQBDXIUz5qsNS
	ePl60uiu8dEdwtiXyqOdgtktn3RxlW518SkAhsKig341Q7aoaOCz0wA0x24kGGdtPugsFiNhLJO
	K1iT4bVP8d9xNTOMQY9X573nt9IBipgDmCBGCV5H2Ca/cRvyMSvYOju6jmBEyDKau2w7L0H47yw
	rRWZQaajVuJd3yul90JsN7snyuhEPrS6oaTvLgEFFnP53mlcXAeCVMysZ2jL+gtqug5XZpxAfvl
	AuEDo0NkmMXblKhJ+La1Uoh8PVhzK5iOkPEOVZldtMOXBCFyYBZO3lG5JdmEGofhsxzkrTzS3QO
	4Gk/fngHrz8/IJoLo3EO5smAQ9Qg1i24a+BIJw1Q==
X-Received: by 2002:a05:600c:4755:b0:492:25a1:e2f9 with SMTP id 5b1f17b1804b1-4924257c2bcmr204410105e9.26.1782143778753;
        Mon, 22 Jun 2026 08:56:18 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm331778025e9.14.2026.06.22.08.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:56:18 -0700 (PDT)
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
Subject: [PATCH v18 04/12] mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock divider ranges
Date: Mon, 22 Jun 2026 16:55:55 +0100
Message-ID: <20260622155610.184271-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
References: <20260622155610.184271-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34324-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CCAC6B0E80

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC supports a maximum clock divider beyond the existing
hardcoded value of 512, requiring a configurable max_divider field.
Introduce max_divider in both renesas_sdhi_of_data and tmio_mmc_data.

Replace the two hardcoded 512 constants in renesas_sdhi_clk_enable()
and renesas_sdhi_set_clock() with host->pdata->max_divider. A fallback
of 512 is applied at probe time when no value is provided, preserving
behaviour for existing platforms.

All existing of_data entries across both the internal and system DMAC
drivers are updated to explicitly set max_divider = 512, consistent
with the approach taken for clk_mask in the previous patch.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi.h               | 2 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 8 ++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 +++
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 4 ++++
 include/linux/platform_data/tmio.h            | 1 +
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index f926a36f213c..438b2a7afe76 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -23,6 +23,7 @@ struct renesas_sdhi_scc {
 
 #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
 #define SDHI_CLK_MASK_DEFAULT		0x80000080
+#define SDHI_MAX_DIVIDER_DEFAULT	512
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
@@ -39,6 +40,7 @@ struct renesas_sdhi_of_data {
 	unsigned short max_segs;
 	unsigned long sdhi_flags;
 	u64 clk_mask;
+	unsigned int max_divider;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index cccc8fc235d2..7e48e78cbfab 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -117,7 +117,7 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
 	 * Minimum frequency is the minimum input clock frequency
 	 * divided by our maximum divider.
 	 */
-	mmc->f_min = max(clk_round_rate(priv->clk, 1) / 512, 1L);
+	mmc->f_min = max(clk_round_rate(priv->clk, 1) / host->pdata->max_divider, 1L);
 
 	/* enable 16bit data access on SDBUF as default */
 	renesas_sdhi_sdbuf_width(host, 16);
@@ -205,7 +205,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	}
 
 	host->mmc->actual_clock = renesas_sdhi_clk_update(host, new_clock);
-	clock = host->mmc->actual_clock / 512;
+	clock = host->mmc->actual_clock / host->pdata->max_divider;
 
 	/*
 	 * Add a margin of 1/1024 rate higher to the clock rate in order
@@ -1137,6 +1137,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->max_blk_count = of_data->max_blk_count;
 		mmc_data->max_segs = of_data->max_segs;
 		mmc_data->clk_mask = of_data->clk_mask;
+		mmc_data->max_divider = of_data->max_divider;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
@@ -1148,6 +1149,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (!mmc_data->clk_mask)
 		mmc_data->clk_mask = SDHI_CLK_MASK_DEFAULT;
 
+	if (!mmc_data->max_divider)
+		mmc_data->max_divider = SDHI_MAX_DIVIDER_DEFAULT;
+
 	host->write16_hook = renesas_sdhi_write16_hook;
 	host->clk_enable = renesas_sdhi_clk_enable;
 	host->clk_disable = renesas_sdhi_clk_disable;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 2865ec30be66..c91b910488da 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -103,6 +103,7 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
@@ -121,6 +122,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -138,6 +140,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index d1a4f65ddd91..d91b48dce8c9 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -30,6 +30,7 @@
 static const struct renesas_sdhi_of_data of_default_cfg = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rz_compatible = {
@@ -39,6 +40,7 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
@@ -47,6 +49,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 /* Definitions for sampling clocks */
@@ -75,6 +78,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.taps_num	= ARRAY_SIZE(rcar_gen2_scc_taps),
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 76056d49f5e0..27ea21c00419 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -62,5 +62,6 @@ struct tmio_mmc_data {
 	unsigned int			max_blk_count;
 	unsigned short			max_segs;
 	u64				clk_mask;
+	unsigned int			max_divider;
 };
 #endif
-- 
2.43.0


