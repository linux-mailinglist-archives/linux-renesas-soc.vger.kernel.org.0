Return-Path: <linux-renesas-soc+bounces-33486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u4B6ECnSH2qrqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:05:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD75C634F8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:05:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hJ12e335;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A5AD3129B93
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAEA0385D75;
	Wed,  3 Jun 2026 06:57:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3AB3FCB0C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469872; cv=none; b=rt+y/AgyGckQ7HCTwmH8YSXZfqIprq6MhIYDbSFxbcyGLC8jOs1JCJSU6/gyncykZXNWhzxDhJynTJbA58XiVcadP2YhhxgfJITXTwbg7UEtiXy7+t7QM/zPgGAh1G1SDd8mTfj7WlpwbbchUZlPXrV3+TgPOnnDm+dLtNk+iIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469872; c=relaxed/simple;
	bh=Oz5ufnT50otS5eVq3kMF329Gtgk2yxv8bNMFZvfcWTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f6iKE39N2zK9cSH4RZYVN5jOOVPE66ubRHxvtNSftJCJGwW0LIXVLWVWbfB6FdLWQ5wbLgdk6fREIPC6msGvbuW83k3NkFy8Kn/Tp9jyJJNRirJXjazakc/OVub/Pt6KcAmB4IIttHj3ebvL0YEFq5DhqJHHjHNjH2XK4dK99ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJ12e335; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso6973255e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469867; x=1781074667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC6f4Wxmf4007+Kz5r2DBYr80qLrwKMIhWhtoLp6w+U=;
        b=hJ12e335v8SAX2tutlG4KLiTtfBqTdgz0S7eTGnlx5bY3og3+wnU2RkojFL2VAoo7z
         yOPMOVQb0UTABePQDVJ+8Dk0YQ6oyaFpjI0P2GKhKtIJPZTsL6ZyFyYkPnbHtcyrzLK+
         GhpXSjfLjAbKQXxzpIq+wOpQv/Ex16liRNdVRXIcMlYMgICj6AP6GwrqpE4HlGqSpMDc
         ev/J+oPrfIoWeVqz5F+BxoCorC70+2r18BHcrGDyjGN65bshpzhuZV2D1r+OpGMgs9WP
         FeIVjQuXbQBLfDUX1oKSKjAoQ0KODCa+BlT0+j8YT/9imy0Cwu2ABq3wyXGMfz4UFcgi
         c59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469867; x=1781074667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KC6f4Wxmf4007+Kz5r2DBYr80qLrwKMIhWhtoLp6w+U=;
        b=KvsxXB+z649Q8roIOmH0iRSIhJVol8KQIrq+2IPzGHcsbB3Kt4mip8wKTXL8p7q18H
         ijYOkevcUSYiFpbXam+DkxdP/i54A6yIUsjthzx0fxqTKSQxyfMXO6R313f6Gw8kcBc+
         iPTpDaItlmAuPrgQpq31upxDWyVAnKcE9lyHlkMANsVBQZuqVMJWtqpwCIZrGVyAXDer
         zNBOjp2msHO7TdixRBG6Ijb4IDKet+WnN32m7BoZ7JvpydArjNn8/7N9eH+DB9ecubG/
         8tQffqTT+Iw6ZU+MB8/xT5rqnbEYcukdiqrjyyc7U4pglKCFoS0JojrthnfYz8a5tOSo
         /1Gg==
X-Forwarded-Encrypted: i=1; AFNElJ8oZCtr4Z1dh+aD220Y6HA8vGpoDQ4KLx9VGFEZLgbgU8sKa5I4nLRn/UUcb4mF4APcvAGHj44YIoI7Eu3XaGsWcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9migCdeUmc/G49/Y4l7K87vpA6I/9n14a1XY7KKUE8bnWDO+
	3qX6ms120UmwvanJC30Qm2ig67rLi1CJEuhk+JCBjB2KgQTrCKh4qtGG
X-Gm-Gg: Acq92OFw6SMMieL44Ri5cj8rmK6Tzg8Ac5cerIAISpfzsXicWlWvwYhWkA8FxgqMJiJ
	2Ra0+UQEhoZlegHpw/namtVtXhO96mkNz9zPL6DOSN9T1iwDZ08fqlOACwcavKc3DVp809fh+Bk
	IHQ3WsDGP4IrzgYfBZ9FvUZNTcQn0UGVZwVPsNWnt3vUcKLF6JlM8r2O5+f9M30bIcZBwk7z4XL
	PWQLpnt+7kdnEg68kkGGX/bUmcDf1W37Hqke9mfNERE8vDzzF94CSvZaJ/W5jXfNuEeTH69IXMG
	jA9d7H4iuGNrDQzV9ljQIqKx5DtfWHuf2SuK4wyn+zgkMlz59gD1CGPN83geOglYYPZRs0imW8/
	s5WMLwe5P2xShfY4YcuWp0e0nXboFTLs9zcVeDyLYFpai9GECR52ZzFl2ed/wKbi7P6wihaYivA
	xXXuCl+GsU0hXptxd0kw99ru39igkdZvwOzOvS45aK2jmhrsJxg9eHDVkB0zc=
X-Received: by 2002:a05:600c:548d:b0:490:afc5:f94b with SMTP id 5b1f17b1804b1-490b5e8050dmr32650395e9.28.1780469866661;
        Tue, 02 Jun 2026 23:57:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:46 -0700 (PDT)
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
Subject: [PATCH v17 11/17] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Date: Wed,  3 Jun 2026 07:57:11 +0100
Message-ID: <20260603065731.93243-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33486-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD75C634F8B

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L (r9a08g046) SDHI controller, which has a
new hardware version register and also has different tuning registers,
internal clk divider, 11 bit divider, 3 resets and 5 clocks compared
to other SoCs. Similar to RZ/G2L SoCs it need tuning delay.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi_core.c          | 23 +++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 42 +++++++++++++++++++
 2 files changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 699872766f88..ee1b1f70c9e3 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -59,6 +59,7 @@
 #define SDHI_VER_GEN2_SDR104	0xcb0d
 #define SDHI_VER_GEN3_SD	0xcc10
 #define SDHI_VER_GEN3_SDMMC	0xcd10
+#define SDHI_VER_RZ_G3L_SDMMC	0xce10
 
 #define SDHI_GEN3_MMC0_ADDR	0xee140000
 
@@ -79,6 +80,7 @@ static void renesas_sdhi_sdbuf_width(struct tmio_mmc_host *host, int width)
 		break;
 	case SDHI_VER_GEN3_SD:
 	case SDHI_VER_GEN3_SDMMC:
+	case SDHI_VER_RZ_G3L_SDMMC:
 		if (width == 64)
 			val = HOST_MODE_GEN3_64BIT;
 		else if (width == 32)
@@ -205,7 +207,8 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 		goto out;
 	}
 
-	host->mmc->actual_clock = renesas_sdhi_clk_update(host, new_clock);
+	host->mmc->actual_clock = renesas_sdhi_clk_update(host, new_clock) /
+		(priv->info->internal_divider ? 2 : 1);
 	clock = host->mmc->actual_clock / priv->info->max_divider;
 
 	/*
@@ -265,12 +268,14 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_RVSCNTL	0x008
 #define SH_MOBILE_SDHI_SCC_RVSREQ	0x00A
 #define SH_MOBILE_SDHI_SCC_SMPCMP       0x00C
-#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E
+#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E /* G3L: SDm_SCC_HS400MODE1 */
+#define RZG3L_SDHI_SCC_HWADJ2		0x010
 #define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014
-#define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016
-#define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
-#define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
-#define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
+#define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016 /* R-Car */
+#define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018 /* R-Car */
+#define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A /* R-Car */
+#define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C /* R-Car */
+#define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT	16
@@ -393,6 +398,9 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
 
+	if (priv->info->internal_divider)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ4, 0x0);
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
@@ -727,6 +735,9 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	if (!priv->tap_num)
 		return 0; /* Tuning is not supported */
 
+	if (priv->info->tuning_delay && priv->tap_num == 8)
+		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
+
 	if (priv->tap_num * 2 >= sizeof(priv->taps) * BITS_PER_BYTE) {
 		dev_err(&host->pdev->dev,
 			"Too many taps, please update 'taps' in tmio_mmc_host!\n");
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index d056c3586e6f..fb8a70d28eed 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -89,6 +89,13 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	},
 };
 
+static struct renesas_sdhi_scc rzg3l_scc_taps[] = {
+	{
+		.clk_rate = 0,
+		.tap = 0x00000300,
+	},
+};
+
 static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY,
@@ -104,6 +111,23 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.max_segs	= 1,
 };
 
+static const struct renesas_sdhi_of_data of_data_rzg3l = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_64BIT_DATA_PORT,
+	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
+			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
+	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
+	.bus_shift	= 2,
+	.scc_offset	= 0x1000,
+	.taps		= rzg3l_scc_taps,
+	.taps_num	= ARRAY_SIZE(rzg3l_scc_taps),
+	/* DMAC can handle 32bit blk count but only 1 segment */
+	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
+	.max_segs	= 1,
+	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+};
+
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
@@ -217,6 +241,10 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
 	.hs400_disabled = true,
 };
 
+static const struct renesas_sdhi_quirks sdhi_quirks_rzg3l = {
+	.fixed_addr_mode = true,
+};
+
 /*
  * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
  * So, we want to treat them equally and only have a match for ES1.2 to enforce
@@ -243,6 +271,13 @@ static const struct renesas_sdhi_hw_info sdhi_hw_info_rzg2l = {
 	.tuning_delay = 1,
 };
 
+static const struct renesas_sdhi_hw_info sdhi_hw_info_rzg3l = {
+	.clk_mask = 0x200000200,
+	.max_divider = 2048,
+	.tuning_delay = 1,
+	.internal_divider = 1,
+};
+
 static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_bad_taps2367,
@@ -296,6 +331,12 @@ static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
 	.info = &sdhi_hw_info_generic,
 };
 
+static const struct renesas_sdhi_of_data_with_quirks of_rzg3l_compatible = {
+	.of_data = &of_data_rzg3l,
+	.quirks = &sdhi_quirks_rzg3l,
+	.info = &sdhi_hw_info_rzg3l,
+};
+
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
 	{ .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
@@ -309,6 +350,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,sdhi-r8a779md", .data = &of_rcar_gen3_nohs400_compatible, },
+	{ .compatible = "renesas,sdhi-r9a08g046", .data = &of_rzg3l_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g057", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
-- 
2.43.0


