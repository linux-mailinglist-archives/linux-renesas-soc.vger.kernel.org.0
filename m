Return-Path: <linux-renesas-soc+bounces-33379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OLtErwLG2qH+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:09:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E316760DED1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46C00302BD36
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FE2346A0D;
	Sat, 30 May 2026 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o0G/1JK7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C0F34041E
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157324; cv=none; b=hDIJ93r9j76w+VZkqaV8fhzq8GcPnKMW8+3wS7Z5N8AvlQu7YNW2ZfzhKJYhN/oRxItGeaQlms1aGnZ4k2BC8IEXUcvKHVZMNTtfWSjXEu6i+bYAAgTnypH8ZOMfLgFk1TS9grF8txOo9cYOMiakw9ZqCn+gzUdXeb7syWUJ3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157324; c=relaxed/simple;
	bh=MOeZzD89M01JUKdu/mbGWHPqElMHRlF13oq3pX+ClBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jD6dzF3s5WlbP548E0ZLi9RLeZMelAHFctyiScSZX5m/Ty9299kAy5P+B0wJ0IeKe0nosX9epTMxhrt+omksbK4eFkRb01SRGSlbzLky/13oJkB13shQR1ApfxTLWggEMflR70WuzElUowBLGYrOe6BgdqEURxhQKN9mHLwFLB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0G/1JK7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso78941705e9.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157319; x=1780762119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4aMOzmEL8d/PQOQgkUdqSkefep9L5LAnFLPYwMlDAk=;
        b=o0G/1JK7/7DU84SswHuhOqd2x8yTX72++aGcZbep0PLe7dYpPbGN8czfH4mn9be239
         0Eu5gM7rUaYbO9iTwYlz2O+WfNP1kGCM+rKEG7YhWZ/cEoy7HWhBz13ShPOPJ27thAim
         s5GBhGhbPDWkmSiaHAyV/DJm6iY6nkug+nljYo0Pn+fjq4kTgmo6ksh4OgTIKn/t7CE/
         opAFQJr8nIbNyLdqzyDGYE9l5FBzudLYSVRFPXVeYJRzKjrkHTRocMLeym8vkb9P6gKD
         wf8/dOzpkFaZgMmbzTOxjj2mltkNsBMsF12oFe+viNvBiBd6jg3wgBK3owfCBKInB2VX
         /Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157319; x=1780762119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b4aMOzmEL8d/PQOQgkUdqSkefep9L5LAnFLPYwMlDAk=;
        b=H7ipGqlpbwCXViX9Fy2iX1li+NGGpA96Gy569SlfLLI6F5OnKpzMMxjGqosu4+SjCD
         GOuAZpyz9VhozCKZgiBCwpHezrPiDFylLQHSSwlE8PkecU9/lxmSLUSmgm2UTrFUjirK
         4QtjJmeBSBVVcgmO6sI9jhVClCGCr63t06uaP54yiP53cstfC7CuYH4dm1sOzPklmQV+
         5vloSqvX8ua4q8YwjeOvqE/yGIC2E9+sWw/UZlUb6Li5l8YnnamFQ6mhPZmpClNc1p2F
         FXZ/MnwPu/ugd0rg/bBrJ6e/vByUI6Ep7+ijUcmZqAHGaylQZbtQjgg7zJTBNjCv2GMu
         JteA==
X-Forwarded-Encrypted: i=1; AFNElJ+WGMtqp9juybr5LzFx9Uhe0bEhMZp6l1b98cRQyijuY9LfhaVs76AVR4U3T89QxgiwmYVgR5wljbe7trMecj6nhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvHAzlGCy1buSty2lc3Zfa6nx4vTkkTzi5TqvtkH7ChIUf8dNt
	kL82QmtA3pgeCpHKpmDfYlYcOQElIjiXEkw58pfeXSCk9cRZIX48DVeH
X-Gm-Gg: Acq92OFWqNWyq1BD+kghlvWhO70lnUxP9aZUvxGEf39oS6hUp/HwYUL38fRDAT0EeEi
	yiQh2pX2u2ZKW1i6Bpb8bS/S+M7JFff7g3e7Jx6pEqyxpUMZTZXSC466owHKPqzB9sX4kC1Aq5d
	TjQpiHqvYuX2uUE4CJytig+jDaH8ch9/p2LBMEeRHCoecWpUbKxaLTRbgI5mwvXeCqfRyAqIz3r
	6F9x1BdLzHhuB2CVbIWeL7voHdYfCgRmS3XxtnL3twmF08UjeC6cnba6s/NXf9KhtH7qrPMX3bW
	RhomlrOts2NnbEBRWncg9omq2JqhuFxR5C6yVxH1HezTKUGHHOLrEduy14YMZK8fpYXKYHb6K35
	F0jR1/6OjA9+MeRZbfgZ1H0RWyreCHIeHVcWjO4zdmZsuS/MnW1pqAKi5s/58/tSZW7fUZf7oRs
	vyRlG28nODPnVjsX125uDZIdDSp13R6W4JCdhTyjLbTfMayQx0kE+7BYW+v+8=
X-Received: by 2002:a05:600c:4703:b0:48f:d1b8:9ab1 with SMTP id 5b1f17b1804b1-490a2915af8mr78625975e9.9.1780157318877;
        Sat, 30 May 2026 09:08:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:38 -0700 (PDT)
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
Subject: [PATCH 11/17] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Date: Sat, 30 May 2026 17:08:05 +0100
Message-ID: <20260530160823.130907-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33379-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: E316760DED1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for the RZ/G3L (r9a08g046) SDHI controller, which has a
new hardware version register and also has different tuning registers,
internal clk divider, 11 bit divider, 3 resets and 5 clocks compared
to other SoCs. Similar to RZ/G2L SoCs it need tuning delay.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


