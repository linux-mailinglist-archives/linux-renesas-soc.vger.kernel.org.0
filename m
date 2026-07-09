Return-Path: <linux-renesas-soc+bounces-34992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G5ImKLn2T2rZrAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:30:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C44734FB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:30:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bgqyVwlI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D30A63004C86
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 19:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9A03C1F50;
	Thu,  9 Jul 2026 19:29:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1385B3BB66B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 19:29:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625363; cv=none; b=lBOMnzHiN6kg79V0L4tQgGEOKOl/xqt/068JV8PcQC0SoxMKEA3g2B3IAqzNOTLsA7ZmkbM1iW3og11PUR359AETnippf9wMVuZNqcdTNrvKHQxAkWRZgry9Bk7dFEHgfxKIiwks4ZA8niDkqLfCjM7p0AWavLI/AznbTp/AIdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625363; c=relaxed/simple;
	bh=j0oYPaRLBENumjsSxqippfUYPYG4pT4znONq+zjuhWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfW2Ih02gbE8yF7D0VZuRrikqIhXkQxE/gf0FKGbnXLCHsQiXzZBCz0VDfTT9WDPd8nvseMm563N/Z433gwtvjNy631yRpCZZoQ+Wj8HM+tN01mtjyGPQjRFal7DY1764GoQdsvdq5i34oc8oew28bibMl8uu6g2gumWFuCCGrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgqyVwlI; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493b77b150aso1283825e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625360; x=1784230160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcfkR7nyscsSkQjMYX2e8moPxu+3WX14zYtHKAtB5H0=;
        b=bgqyVwlIK6TkChJIl7MuYHGreT5+JIvBREeykgiRhj3sTgVAo6tE2nzSJp9EbGehjv
         ojp5KSKkQF2w9ffFjrAQ80EbFAZAtT9rkR2IPl4Os7z02ozpBs3RidWfEeoRmMgLpQiU
         40BrJ+JscffBNrThRK0Jry+m20U6do+zF7QNBnQJ8iT0u/ZrayfDzcA3Ppus4ZENMb2j
         RsMS3qrdfV4UwwvoHxV9DcILlRsUbIbLF5LBcBnh/DZ7VeHHhFBHXr2yYWRQRvjIDTHS
         0+rHCo4Uo77W6Hot0E7f+Y8el1wwjk9WCACWNoGm5fbBhSmndFT5CHXaUV4iXeTNym2G
         n9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625360; x=1784230160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcfkR7nyscsSkQjMYX2e8moPxu+3WX14zYtHKAtB5H0=;
        b=j28ZUc/+ZbcjGL3YVPydI4TfRgGmIGnBooHk/3DiUnIyCEUtXyIcUj0rHHujiUnRO3
         xGgrR9BsHbnmDBPXzEhzosNQ7xTjWr2UuyXFH8nDAF6M0fP5BUutY64rTFzig5fwV/ri
         /+to1TtRilJKRkkWMWgfUMiIUZUI/rLzfDjVXmvpG1he74Y6U66ZJE8UfctSE/MmGEoQ
         7Xbnhh0IvpYXwH+/Kew5hoC8RyNQipMnuVYzYRMxPvwHQAfrtjkHEZc7nqY60vnnJGmW
         wQeWIuEB/pUupkj8NaWah9fHcvWNGFOI2CE1t76foabI/WD3867y/Gwth2xAeiIvJ2pa
         WPlQ==
X-Forwarded-Encrypted: i=1; AHgh+RplDhznQnWwBHQKs7hpuTKccL2rvlYnjNh04X8tEZseojr4LpbEHE3rBmXt8KoSEm5oUXB8SGWs0wnExT1uskNs5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7u55hnBvkeFMisP6oX08vCFBo5klh4KZ1TuYdSN1424f3hnaY
	VSArFa6yNcDXKcVWCB5P5fJnMCrURF/cdPyAEKWAzLLopIHnyhX1xBm6
X-Gm-Gg: AfdE7ckCVFfscRXPbnRuoh2JCjXLtZ5sPAzzcJgKH54KSX7pUcBH5EGSYlqQ4qw9f5M
	RxUwtadXlG88CTPqtIgNeV2e6SYqm50Y5zU3tepsKvpxNxIczoGRl/UOaCSshtoXHqIWB+mLZFi
	uDTzE7SvGBtt7EWMGw8oGv5TbiwJjcd+IMx/XR3VlgiFzlkvAJfRHnjinDz5MXsY9PThMf70Jnx
	UZlJotjUGoKMJTRTWfMb5Hgw/MDCLhZ33l1DixdS05oFaV+B/OD1059rROG2KZDo4AB0JfpeHPt
	wUEEnbhL6EJP9vUIlOGGby+HVBKqo6/wVhAb7vxnDhOVV8GcHU0+RcOTX0jPVzFdkJW7hef66lu
	8cQJrVQAbZ/l5mfA5xcIZkkx4tL+RIBqZ+h5y2dz78V1vmPXVo4nL7f9rLAwsw6s926ikFC7rtP
	qw/Gu5LiNFn8TSxPhH/D+1
X-Received: by 2002:a05:600c:6289:b0:493:b647:1acd with SMTP id 5b1f17b1804b1-493e68dbd98mr83005195e9.36.1783625360258;
        Thu, 09 Jul 2026 12:29:20 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm84366045e9.3.2026.07.09.12.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:29:20 -0700 (PDT)
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
Subject: [PATCH v19 03/12] mmc: renesas_sdhi: Add clk_mask field to support flexible clock divider widths
Date: Thu,  9 Jul 2026 20:29:00 +0100
Message-ID: <20260709192916.630794-4-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34992-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 91C44734FB1

From: Biju Das <biju.das.jz@bp.renesas.com>

The clock divider on the RZ/G3L SoC features an 11-bit width,
requiring a wider clock mask (0x200000200) in renesas_sdhi_set_clock()
than the historically hardcoded 32-bit value (0x80000080).

To accommodate SoC variants with wider clock divider masks, expand
the internal clock control variables (clk and clock) from u32 to
u64. Introduce a clk_mask field to both struct renesas_sdhi_of_data
and struct tmio_mmc_data to allow platform configuration data to
supply SoC-specific mask properties.

Update renesas_sdhi_set_clock() to read the dynamic mask from
platform data. During the probe phase, assign a default mask
fallback of SDHI_CLK_MASK_DEFAULT (0x80000080) if no specific mask
is specified, ensuring backward compatibility with existing
hardware variants.

Finally, explicitly populate clk_mask with the default value across
all current internal and system DMAC configuration profiles, in
preparation for the upcoming RZ/G3L clock customization.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18->v19:
 * Fixed the clk_mask for non-DT platforms.
v18:
 * New patch dropping struct renesas_sdhi_hw_info instead using
   renesas_sdhi_of_data and tmio_mmc_data.
---
 drivers/mmc/host/renesas_sdhi.h               | 2 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 8 ++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 +++
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 4 ++++
 include/linux/platform_data/tmio.h            | 1 +
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 09bf9b24a8c3..f926a36f213c 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -22,6 +22,7 @@ struct renesas_sdhi_scc {
 };
 
 #define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
+#define SDHI_CLK_MASK_DEFAULT		0x80000080
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
@@ -37,6 +38,7 @@ struct renesas_sdhi_of_data {
 	unsigned int max_blk_count;
 	unsigned short max_segs;
 	unsigned long sdhi_flags;
+	u64 clk_mask;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f9ec78d699f4..1787f91d1ff2 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -194,7 +194,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 				   unsigned int new_clock)
 {
 	unsigned int clk_margin;
-	u32 clk = 0, clock;
+	u64 clk = 0, clock;
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
@@ -213,7 +213,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	 * provided for actual_clock in renesas_sdhi_clk_update().
 	 */
 	clk_margin = new_clock >> 10;
-	for (clk = 0x80000080; new_clock + clk_margin >= (clock << 1); clk >>= 1)
+	for (clk = host->pdata->clk_mask; new_clock + clk_margin >= (clock << 1); clk >>= 1)
 		clock <<= 1;
 
 	/* 1/1 clock is option */
@@ -1136,6 +1136,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		mmc_data->dma_rx_offset = of_data->dma_rx_offset;
 		mmc_data->max_blk_count = of_data->max_blk_count;
 		mmc_data->max_segs = of_data->max_segs;
+		mmc_data->clk_mask = of_data->clk_mask;
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
@@ -1144,6 +1145,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	}
 
+	if (mmd && !mmd->clk_mask)
+		mmd->clk_mask = SDHI_CLK_MASK_DEFAULT;
+
 	host->write16_hook = renesas_sdhi_write16_hook;
 	host->clk_enable = renesas_sdhi_clk_enable;
 	host->clk_disable = renesas_sdhi_clk_disable;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index b3f4a5f8dec0..c6db0418de15 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -101,6 +101,7 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
@@ -118,6 +119,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -134,6 +136,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 7ae488e5c1e0..fcd2edfa69db 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -28,6 +28,7 @@
 
 static const struct renesas_sdhi_of_data of_default_cfg = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rz_compatible = {
@@ -36,6 +37,7 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
 	.tmio_ocr_mask	= MMC_VDD_32_33,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_WAIT_WHILE_BUSY,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
@@ -43,6 +45,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 /* Definitions for sampling clocks */
@@ -70,6 +73,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.taps		= rcar_gen2_scc_taps,
 	.taps_num	= ARRAY_SIZE(rcar_gen2_scc_taps),
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 426291713b83..76056d49f5e0 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -61,5 +61,6 @@ struct tmio_mmc_data {
 	dma_addr_t			dma_rx_offset;
 	unsigned int			max_blk_count;
 	unsigned short			max_segs;
+	u64				clk_mask;
 };
 #endif
-- 
2.43.0


