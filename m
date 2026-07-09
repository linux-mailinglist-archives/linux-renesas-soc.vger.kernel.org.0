Return-Path: <linux-renesas-soc+bounces-34997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QZDSEwH3T2rsrAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:31:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D155734FEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 21:31:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HYS2pJQ4;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 930653021865
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 19:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BFA3CF682;
	Thu,  9 Jul 2026 19:29:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69AA3B5E07
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 19:29:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783625369; cv=none; b=GiQwa/DlhpaMLhJ3swI4fhGa0REvrfq0gkwIz1nyi8zbYCXAPVrd9ncARTFq2bLbt8+r/7WQo2NZHJiLG8HSg+mPwM0pV3Li9PWTGfzulV98ZRnHCTUuqzAgxGCv94M+AsUVpTnFGz7zY23wl2/2nmwY7YPa8QEyLqgwSoucREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783625369; c=relaxed/simple;
	bh=bwq13NSehOr2EEYqyZl0gf5bylYDaHbghPTzKcqUjBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWAw/W152VtrVNQxlcffXPAazbB/eYCMpjXFzHuUL5YF691yuW7wpqtWdSx8NFKIfBsE4WB53oJxvdFDgyLJTIG8P8YUFNhK8kSx3mF59gOORuI8KWXvip70j2kuLdM/qptp4xSS11EnQoxMzaccWqN1V7JrAEiR3s4GJSKAoLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYS2pJQ4; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so1259005e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783625365; x=1784230165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+raAicwZaVXekKC1BpNcwUUcnQ83y+p32wUDarORG20=;
        b=HYS2pJQ4b3sffCQV+knYYMlDol0lmr/HIZApX+E55SRQqMtjm36vfrkSdYrcdBOH7x
         8vbm9hXQKrT/fB0A4Y+Xy6zw0YCIg4kQBnVI0AWZ96A7FLrrq2lj811U3AMt5CZ/GaWD
         SEkNv9oMF0yGlNEFnnTjpn67X+o+OY2+3NDn6LiLUG4JOwO4mVnf4ReI7xqAMUXNsjjx
         6TM0T0NQ+BGpWS4FQo8mHgn3rksjNf/EQRl33jQWK71oyz8fLktN6ABBIppi4EiGWh6i
         9C3+x3pAeyZTqpsbMRowVH474hb2fepEa6H1ZLoU/iYpfeKATKuwQGG8Ls4vANDj512h
         ebKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783625365; x=1784230165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+raAicwZaVXekKC1BpNcwUUcnQ83y+p32wUDarORG20=;
        b=WBNtUX7RADIQhCK1muJ/R90dXD+C17Ghq1CZpIDBTgeXdozIs1fTvN9ADTgHRaVD5+
         Ujvo5yJqvm7cd4tfSbNgnmV0J9kLuKMgbe12CrPYfZJPgzzk3fs6ur0Y7QW8xhQcTgwr
         dH+z2iJ69H4uGazeI72ZIKBCG5IlFt+puUt05u67yCBiiWeGSo6+6Gv0E2bcKrMIHEdn
         Jo9n2qBA1E/Zo6h8jESTvXNpMWhBExjAc3A6WLWVWPINHXNyqyZbF9wIVqnzqUXP5JrW
         I8iRUcBJJIoO3VVb2REMr2C+19BUivwyn1ngpQShC61GWb8i0Ro74dm78nFs2jzib2SO
         D0+Q==
X-Forwarded-Encrypted: i=1; AHgh+Roxs5uSK29FbdFX+w5Ilc0zgG4TxSSey/Mr5GMMKaJyydriFx6TeKYh1jKThtq8qhBEDWoTMzEWr4HGcvvpvJX70g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqNXl6bkqorg/tp8XwH5OzD2VJbFoWjsYS/+TB9V9eRnEOuGx7
	E+vGxckfkswxJoDFf1Y+BAt8awwdWQ62GHIGunwr1bIenqh7lGwaBxO8
X-Gm-Gg: AfdE7cnxgyhboGw+d8W3nsGlGV2qNRmswGg0iN2sMlPSu1r9NhkDJbHhe7cyp16tR3Z
	CWgOK9zfiBRjZO5rdSOlpnZkuJan7k/Dc7ToPumuebFLy5UTgDk0vaAte1J/0tWJpi6QI+M5IcA
	hUxMCqOWEfh6SxBI1JHcmva3RZjIo3ivVwG967WE3duXpeHh7qJdYep424hWT6bxDz6FglFld7o
	RV+wjJ/CJSl7KO3gJ/bFX82knpkKi5BPeka+Tyys/8beJzxcL47rx5zCL4MD6Gfdfz7+O0EiCD3
	aodNnUZQO10FGiPB5zUgB7toOX2b6o9DDOQxf3c5DTkBoRep35gJnL9D6OZ1rLPuY8dFTjz8dDw
	ZF9dw/oHr4Xn5dqBQ4OYWhlDruMOHwf6SrUbCncg4id7EMGjS+47oZp30uBHCb1a+HCVNXXa1zE
	3H/EYELAhcbVbSWN36p6Ok
X-Received: by 2002:a05:600d:108:10b0:493:d3c5:6c32 with SMTP id 5b1f17b1804b1-493f2b2b535mr3578775e9.6.1783625364854;
        Thu, 09 Jul 2026 12:29:24 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6ccdbbsm84366045e9.3.2026.07.09.12.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:29:24 -0700 (PDT)
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
Subject: [PATCH v19 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Date: Thu,  9 Jul 2026 20:29:05 +0100
Message-ID: <20260709192916.630794-9-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-34997-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6D155734FEB

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC (r9a08g046) has an SDHI controller with several
differences from existing platforms, requiring dedicated handling.

Utilise the TMIO_MMC_HWADJ flag to identify controllers that carry
a second hardware adjustment register (SDm_SCC_HWADJ2 at offset 0x010).
When both TMIO_MMC_TUNING_DELAY and TMIO_MMC_HWADJ are set,
renesas_sdhi_set_hw_adjustment_delay() additionally programs HWADJ2
with 0x3FFF at 3.3 V and 0xFF at 1.8 V. A new RZG3L_SDHI_SCC_HWADJ4
register (offset 0x022) is also cleared at the start of tuning when
TMIO_MMC_INTERNAL_DIVIDER is set.

Add a new version constant SDHI_VER_RZ_G3L_SDMMC (0xce10) and extend
renesas_sdhi_sdbuf_width() to handle it alongside the existing Gen3
variants.

Introduce of_data_rzg3l with RZ/G3L-specific parameters: a wider
clk_mask of 0x200000200, a max_divider of 2048 (reflecting the 11-bit
divider), a dedicated rzg3l_scc_taps table, and all relevant tmio_flags,
including TMIO_MMC_INTERNAL_DIVIDER and TMIO_MMC_HWADJ. Wire it to a
new of_rzg3l_compatible entry using sdhi_quirks_rzg3l (which sets
fixed_addr_mode), and register the "renesas,sdhi-r9a08g046" compatible
string in the OF match table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18->v19:
 * Update commit description.
 * Updated handling for clk divider.
 * Renamed TMIO_MMC_HWADJ2->TMIO_MMC_HWADJ to make it generic for
   hardware tuning delays
 * Dropped duplicate SH_MOBILE_SDHI_SCC_TMPPORT2 macro
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c          | 28 ++++++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 37 +++++++++++++++++++
 include/linux/platform_data/tmio.h            |  3 ++
 3 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 6ec8dc96b581..c4908c09d89d 100644
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
@@ -234,7 +236,14 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	}
 
 	clock = clk & CLK_CTL_DIV_MASK;
-	if (clock != CLK_CTL_DIV_MASK)
+	if (host->pdata->max_divider != SDHI_MAX_DIVIDER_DEFAULT) {
+		u64 tmp;
+
+		tmp = FIELD_GET(GENMASK(9, 8), clk);
+		clock |= FIELD_PREP(GENMASK(17, 16), tmp);
+	}
+
+	if ((clock & CLK_CTL_DIV_MASK) != CLK_CTL_DIV_MASK)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
@@ -273,12 +282,14 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_RVSCNTL	0x008
 #define SH_MOBILE_SDHI_SCC_RVSREQ	0x00A
 #define SH_MOBILE_SDHI_SCC_SMPCMP       0x00C
-#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E
+#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E /* G3L: SDm_SCC_HS400MODE1 */
+#define RZG3L_SDHI_SCC_HWADJ2		0x010
 #define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014
 #define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
 #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
+#define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT	16
@@ -328,14 +339,20 @@ static inline void sd_scc_write32(struct tmio_mmc_host *host,
 static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	bool hwadj2 = host->pdata->flags & TMIO_MMC_HWADJ;
 
 	if (!(host->pdata->flags & TMIO_MMC_TUNING_DELAY))
 		return;
 
-	if (host->mmc->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330)
+	if (host->mmc->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330) {
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x0);
-	else
+		if (hwadj2)
+			sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2, 0x3FFF);
+	} else {
 		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2, 0x1);
+		if (hwadj2)
+			sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ2, 0xFF);
+	}
 }
 
 static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
@@ -401,6 +418,9 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
 
+	if (host->pdata->flags & TMIO_MMC_HWADJ)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ4, 0x0);
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 8476678d47a6..e78dbcb6c887 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -88,6 +88,13 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
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
@@ -161,6 +168,26 @@ static const struct renesas_sdhi_of_data of_data_rz_g2l = {
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
+static const struct renesas_sdhi_of_data of_data_rzg3l = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY |
+			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ,
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
+	.clk_mask	= 0x200000200,
+	.max_divider	= 2048,
+};
+
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
 	{ 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
 	 16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 },
@@ -241,6 +268,10 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
 	.hs400_disabled = true,
 };
 
+static const struct renesas_sdhi_quirks sdhi_quirks_rzg3l = {
+	.fixed_addr_mode = true,
+};
+
 /*
  * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
  * So, we want to treat them equally and only have a match for ES1.2 to enforce
@@ -300,6 +331,11 @@ static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
 	.quirks = &sdhi_quirks_fixed_addr,
 };
 
+static const struct renesas_sdhi_of_data_with_quirks of_rzg3l_compatible = {
+	.of_data = &of_data_rzg3l,
+	.quirks = &sdhi_quirks_rzg3l,
+};
+
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
 	{ .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
@@ -313,6 +349,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,sdhi-r8a779md", .data = &of_rcar_gen3_nohs400_compatible, },
+	{ .compatible = "renesas,sdhi-r9a08g046", .data = &of_rzg3l_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g057", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 6c512e96e192..e6663cc736be 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -56,6 +56,9 @@
 /* Some controllers have internal divider */
 #define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
 
+/* Some controllers have hw adjustment delay */
+#define TMIO_MMC_HWADJ			BIT(15)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0


