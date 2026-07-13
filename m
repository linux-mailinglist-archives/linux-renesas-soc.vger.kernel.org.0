Return-Path: <linux-renesas-soc+bounces-35157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3FU3A9olVWoCkgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:52:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3C74E28F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:52:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PcxNFDzn;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E5B0302D320
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ACCC352010;
	Mon, 13 Jul 2026 17:52:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B860734CFC3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 17:52:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965130; cv=none; b=fsXGDFrYKXSFqXiJnhOhH+Wzp3h593ESbTeV3qgrQT8a3cQEZ1adeZ9VaPEbEi55n96GtdQ2LAcVAhtmbImU2WrnmichpHLxCLinpZruEXArUKHqYsO2N62LpoNaQZU2KQeUNV85fddq8KyebU3VdrtYkkmQBlhZWHa1qbPiDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965130; c=relaxed/simple;
	bh=sGl2NnbY05IvzVX6jJgdX3/HmVBvIodFkNp4haqr1tY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=as571MfWcH+o8pr1iPRVbw642ZX5nJ4WS5modpar621mCzPy0U9Y6z4qPn01MQIPevjQ5VfwQUsVmTenuXBQc893CaM0UpB3KkUJNYad5C5EGt9kcuwj++hjvFLqKemlpqKCLczLynJcX2HYYQQpJsW8CC874+ZLGU3i0vUZkNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcxNFDzn; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47df440fcd5so1882187f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 10:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783965126; x=1784569926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzfNMOVZX0qXrXstMrns1/4B8fF0IvJ3fbJ7JiKv+2I=;
        b=PcxNFDznVbXKys9mKZcKVBoYosBVYpU6dFlcV6f2sNkmWtUqQGM3v2GNJgnmlDIsFL
         05LNkwBXb3V8E9GuTkKIyDxaIYDVmIGvXoLcInyy3jylDs0TupiqKuUAX1y88A+g2NRr
         yWstW7P6uSqkoNGBFBJnVVlT3vMqAv6KbczJ4W/akq4sM59TNcwCwBVGGErJtDkQeLrW
         r0pqzgjqGcwxN0cFSBSwg3n3A4gvoNFI/sbsyjYFy5EWrNLFZkqySuoGFeKFxYFsbe7o
         755rjRQUG0T7KMIJix6/TlNcmuyRNxR3oq7Fb9J+AsPCiYzGB3qBCU1sFiEcwdtTnzST
         XMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783965126; x=1784569926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzfNMOVZX0qXrXstMrns1/4B8fF0IvJ3fbJ7JiKv+2I=;
        b=dlHPO29BgvHinB+067HE6De1rhg9uHbbaA6n2p7mu8Qw9g/tsl1mPvd1nBmGT9fGtQ
         8DfoPpCkcu/0F+S0C5LV5lMaC11/TZ7Z5ryR7PJkn8UCMqpwfj7VZcbonvI7Ahk0CJ88
         Qe1RrTxP8H2w5D7aU+8TTP/kLd61q69IazMUhUhHCaiWJzIhITFnRjO+BrJ+VLYWU3aU
         ES0/3VisbdCaLhzuzeyJdSObmmuuDH4jMfd/C6FEiQoh0SlqfaK6GvCkly8LoJRvukq/
         w13CMXv0Tn68lswKG3j7lzAZ18RAOsJ2oEeTYriMuWxcPL2zplpFop4qbPK7LGc4teBj
         BhNA==
X-Forwarded-Encrypted: i=1; AHgh+RqsBq2P7ax7+fwnn7obGhC62X2fhMblJd8SudNtGUMePCOaKzx+S9bcrk3VYynCYx95zA7nwubvuEAGEoEld+elQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTirnbPb/wxmJswIx6SKG5gQ6+Ttu+ZhZw43EOkGl7eAJ7ugbq
	/KqqEce4wSea3nFSmVwbJEZfCUdnQzuGMt8hMMJAaf52SfCSlOfjziLJ
X-Gm-Gg: AfdE7clPOY0TiUfbfqppkpsWyxb813p64XG4FDJF1v16NcjFyNOu25TClUO4F9/qcSc
	QnoidrtfheccgXYraZteIz8dxBlh8PbI6lMQx2nBSUp16EvdnI4ReJBNSaGBcHBcsPeIkcs6LHw
	TRw0Rg8FfViluk2ADnP8ySymh/nBUp4v4aj3JhPc1nx5uFSFS+5XZR4cx4Fp7huzEFNejgmdxfI
	CEIhm7VhvoxNBNti5Ba5yOa2ti/SNoKzvEPxQHGYolWyENxfsORwdIMkJflVeOEWYjcKoNYKfn4
	aNCS9LldK+dDSmhRpHWMtsauDFJ0/1WwOtz43VORYfs2YL5jyvxizXMGdg63BSTz869KVzfR58M
	LyOSpF+I90LFFatCEXnXixynBxr/zegrXTA9AU6mX4kvYyC6D/nBuUfPnIZ5HPunLPhfpGcpSuH
	c6n3Y2WvHKlY1tdtReHBgIyyxHyBtgnd6EkCciPg==
X-Received: by 2002:a05:6000:400a:b0:46f:7d90:8114 with SMTP id ffacd0b85a97d-47f2dcb50e7mr11645539f8f.14.1783965125949;
        Mon, 13 Jul 2026 10:52:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:c899:4fec:2bdb:b719])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464d6fa7sm1011037f8f.37.2026.07.13.10.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:52:05 -0700 (PDT)
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
Subject: [PATCH v20 04/12] mmc: renesas_sdhi: Add max_divider field to support SoC-specific clock ranges
Date: Mon, 13 Jul 2026 18:51:45 +0100
Message-ID: <20260713175159.138334-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
References: <20260713175159.138334-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-35157-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7E3C74E28F

From: Biju Das <biju.das.jz@bp.renesas.com>

The clock hardware on the RZ/G3L SoC supports a broader clock
divider range extending beyond the historically hardcoded value of 512.
This requires a flexible mechanism to pass SoC-specific divider
boundaries down to the core clock management logic.

Introduce a max_divider field to both struct renesas_sdhi_of_data
and struct tmio_mmc_data. Replace the static 512 constants inside
the core functions renesas_sdhi_clk_enable(), renesas_sdhi_clk_update(),
and renesas_sdhi_set_clock() with the dynamically supplied field.

To preserve backward compatibility with existing hardware variants,
implement a probe-time fallback mechanism that defaults to
SDHI_MAX_DIVIDER_DEFAULT (512) if no explicit constraint value is
assigned by platform data.

Finally, explicitly populate max_divider with the legacy default
across all current internal and system DMAC configuration profiles,
in preparation for the upcoming RZ/G3L extended divider support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v19->v20:
 * Replaced the check mmd->max_divider with mmc_data->max_divider and
   moved the code after assignment of variable mmd, this ensures
   assigning the default values for non-DT platforms and DT platforms with
   no device data.
v18->v19:
 * Fixed max-divider setting for non-DT platforms.
 * Replaced the magic number '9' with ilog2 function in
   renesas_sdhi_clk_enable().
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi.h               |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 12 ++++++++----
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +++
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  4 ++++
 include/linux/platform_data/tmio.h            |  1 +
 5 files changed, 18 insertions(+), 4 deletions(-)

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
index 604d886e483c..d893a263e770 100644
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
@@ -156,7 +156,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	/*
 	 * We want the bus clock to be as close as possible to, but no
 	 * greater than, new_clock.  As we can divide by 1 << i for
-	 * any i in [0, 9] we want the input clock to be as close as
+	 * any i in [0, {9,11}] we want the input clock to be as close as
 	 * possible, but no greater than, new_clock << i.
 	 *
 	 * Add an upper limit of 1/1024 rate higher to the clock rate to fix
@@ -165,7 +165,7 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	 * for 533.333333 MHz will selects a slower 400 MHz due to rounding
 	 * error (533333333 Hz / 4 * 4 = 533333332 Hz < 533333333 Hz)).
 	 */
-	for (i = min(9, ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
+	for (i = min(ilog2(host->pdata->max_divider), ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
 		freq = clk_round_rate(ref_clk, new_clock << i);
 		new_upper_limit = (new_clock << i) + ((new_clock << i) >> 10);
 		if (freq > new_upper_limit) {
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
@@ -1182,6 +1183,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (!mmc_data->clk_mask)
 		mmc_data->clk_mask = SDHI_CLK_MASK_DEFAULT;
 
+	if (!mmc_data->max_divider)
+		mmc_data->max_divider = SDHI_MAX_DIVIDER_DEFAULT;
+
 	dma_priv->filter = shdma_chan_filter;
 	dma_priv->enable = renesas_sdhi_enable_dma;
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index c6db0418de15..2bf354331b2d 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -102,6 +102,7 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
@@ -120,6 +121,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.max_segs	= 1,
 	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
@@ -137,6 +139,7 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_sdh_fallback = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index fcd2edfa69db..bb66ff7de065 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -29,6 +29,7 @@
 static const struct renesas_sdhi_of_data of_default_cfg = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rz_compatible = {
@@ -38,6 +39,7 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
@@ -46,6 +48,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
 	.clk_mask	= SDHI_CLK_MASK_DEFAULT,
+	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
 /* Definitions for sampling clocks */
@@ -74,6 +77,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
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


