Return-Path: <linux-renesas-soc+bounces-34323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +OMiGWBbOWowrAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:57:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F626B0E71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:57:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bfhEH56k;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CF3C3036494
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC8E43CC7DF;
	Mon, 22 Jun 2026 15:56:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8BF3CB8F5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 15:56:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143781; cv=none; b=iZsoiJFRchdklH8HMgkVPc4q5k0sv9uuUPYKxZ9IheTyNxRNU0sG0oz0Zag0CInLO0lTkQX7lwnPj5f7AnIrGbqeVWaYybwTG9EkPoG/90sHpH/6w00ojrMpNC8uO++DujcozjZd8tbfGgz6bfC9WjZM40SCj8lpTq4+4/8MAMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143781; c=relaxed/simple;
	bh=SXjnOfbCzJ/6V76jVEm05ut1YuExL3PtjU4gtCsiAv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jCWHZ7Kh74x1vh/vhcudcOHvyKU+U1vsjosjdHW2o7skalPknhQi9wyacbv8J4gllkxGGJwsTn+OUSE0JXP1TpEk8pXltwAS3O6yOIIqA/lzHGxhZzR0dSMdJs2kg7XopPgx/Sjhm3AUSUFXtLGYKvjIRjjr+LuQaVQadm9jnDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfhEH56k; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49222fb062bso48577455e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143778; x=1782748578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFVvxw7+OHLEbEKh6fXwSYeaPrqWGK8k4TcINmSIxbs=;
        b=bfhEH56kDPaZFWKLHkI1cGM55H6uGcHtSqYAJ2eVi3I3qk+L1xQuepfNdkMyLHYGxk
         yADXxD34e+nSeDCYIKZTP7sVN2joGDxVFHuFwjtpF7oU/jcBbyOBvnDznqJM3SjSzGYa
         jHPHu570JuCki71jcoNhgTQgrV2GbbI1C4kGbYKgrpczrBI233YwOge2DAQoM7ZU+NZr
         e5mzKMd1ERx2SlmV9n60b7o+/AdeOSps9I9OsqQlAdKRBdpWAvSHKfYx95QoXdjBUC0X
         PeLJGFre1rR+h9x5u0npqWV4+/SZPD+FwOr9IgH1TgnaKDFUu94y+9weDV4VB4GSiN0l
         onUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143778; x=1782748578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFVvxw7+OHLEbEKh6fXwSYeaPrqWGK8k4TcINmSIxbs=;
        b=KsF7EZzy/ECoL5A7OEr+0F3ll/K6cYNmxGZk2nBdi6b7aLpZm6nkIjnE5ZP3fl4NKu
         i3Y1HHy7+JIJwrCoU5f70Zt8F+6WovnZm3fujyxSlEWpfK+sMYb3C5UplbqJHFydWQaY
         VkU56D1hyEfD3Y/zOaF8ZovOG0rskXGS5ozgsPHRQ2nSpiqz0mmL5+dnWav7MF494bG2
         oENAcXjGvPNLrO8nr3/8R6Axt/iIV1jokSks6eEW4Py0pJrF+pKKQP0+JwYf+SrRnKfr
         1ZKF6AMF20haJjuOqfWz+XyZnkKloTBeKojFBmMeLLS1cs0tM2qEIKST1fLPTw1XI7it
         G8Dg==
X-Forwarded-Encrypted: i=1; AFNElJ85M3PIc8KnX/vqICZwm0MOE8dqNR6X0Hy28x9YBf25tm24VT0XYRhVRGK7gLxQlQCYulroKnudgxOVhFHmm657Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMC9N5sWdI4SwLRKs98T+SCMIn1KSEstHzdJ07RFIDdOVB4/LE
	i12eWf8u1uaynd/7aWM4EP3P5JBxhNH2GlRBysoe+es0rD/naflzcuBV
X-Gm-Gg: AfdE7clD0d/gmfAu39gYLH9owUAgr7Kg6LCA6yYEQautux0slgLfE/p/JT/iI7zQYKC
	cLmgDplACTr1bZA3pc2n5YqSjM0/cAPVxX8NwRoQc5qCxrZxUP3/1JUD0XxC4u8d21pYgTmjo52
	4n7ep/3v5Mc9/o4/uFpCFDPvxlHRJzP4AUDLNmu522MBevRpgr4g2QUlIiEoEzAQ4paAcldsqKT
	o7kZA1YP15GzvbiUFAfNiDwWnGkAJme+iQAORLyqFKsQFXOA94nWG2jrIipUXU6fgpgeLH+INAF
	lotJ7argxxYAly8JgcZpkphY2uQ+035bxOcPhYNqOuAEAMJ18BjIK2TVghioIJeFT2b2Iw89HYr
	yJQb03MJe+zBhUexruLpU1kHCS0Mte2WmNqz2o/c96Kp8H/My3H+J2RNIZACFazbCSYBwdcQoiX
	4nO8+QmCFweoQ4BbMhHDsJ7OmcWMnw4uyxynFelA==
X-Received: by 2002:a05:600d:101:b0:492:4050:d495 with SMTP id 5b1f17b1804b1-49240ea31famr168962785e9.30.1782143777814;
        Mon, 22 Jun 2026 08:56:17 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm331778025e9.14.2026.06.22.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:56:17 -0700 (PDT)
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
Subject: [PATCH v18 03/12] mmc: renesas_sdhi: Add clk_mask field to support SoC-specific clock divider widths
Date: Mon, 22 Jun 2026 16:55:54 +0100
Message-ID: <20260622155610.184271-4-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34323-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7F626B0E71

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC uses an 11-bit clock divider, which requires a wider clock
mask of 0x200000200 in renesas_sdhi_set_clock() compared to the existing
hardcoded 0x80000080. This exceeds 32 bits, so clk_mask and the related
clk/clock locals are widened to u64.

Add a clk_mask field to renesas_sdhi_of_data and tmio_mmc_data so each SoC
can supply its own clock mask. renesas_sdhi_set_clock() now reads
host->pdata->clk_mask instead of using a hardcoded constant, and
renesas_sdhi_probe() falls back to SDHI_CLK_MASK_DEFAULT (0x80000080) when
no mask is provided, preserving existing behaviour.

All current of_data entries in both the internal and system DMAC drivers
are updated to set clk_mask = SDHI_CLK_MASK_DEFAULT explicitly, in
preparation for RZ/G3L support supplying its own clk_mask value in a later
patch.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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
index f9ec78d699f4..cccc8fc235d2 100644
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
 
+	if (!mmc_data->clk_mask)
+		mmc_data->clk_mask = SDHI_CLK_MASK_DEFAULT;
+
 	host->write16_hook = renesas_sdhi_write16_hook;
 	host->clk_enable = renesas_sdhi_clk_enable;
 	host->clk_disable = renesas_sdhi_clk_disable;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 990e3d18d560..2865ec30be66 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -102,6 +102,7 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
@@ -119,6 +120,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -135,6 +137,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 13f9a25f4722..d1a4f65ddd91 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -29,6 +29,7 @@
 
 static const struct renesas_sdhi_of_data of_default_cfg = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rz_compatible = {
@@ -37,6 +38,7 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
 	.tmio_ocr_mask	= MMC_VDD_32_33,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_WAIT_WHILE_BUSY,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
@@ -44,6 +46,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
+	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
 };
 
 /* Definitions for sampling clocks */
@@ -71,6 +74,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
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


