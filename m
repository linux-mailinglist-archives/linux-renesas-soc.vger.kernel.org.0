Return-Path: <linux-renesas-soc+bounces-34327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pOSGEeRbOWpVrAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:59:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B17D16B0ED0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:59:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rmfI3Ahh;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C2FA304A668
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 15:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A443CE4B2;
	Mon, 22 Jun 2026 15:56:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9DB3BCD23
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 15:56:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782143788; cv=none; b=LMydFwu7rnDqC7h4WhyRCOZ0yvDsOQ95Vxw8oxS/tVjB9OlxUn/q8uQSbp23+3pBIlTMdCyROSvURxlyMQ6+kjTeyj7szPbqyduV2uxBKBVyrNKo2nKBubDNOnSPnKxgx6PUxF/wmJ4LrLDb78wJg65wN2o4nZ30/z2hfVagy+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782143788; c=relaxed/simple;
	bh=q79FjhgHQEDsmDffRlSw8MedN1Ja9HRPSaThIq8InOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nm1ZSYcxNLqj4q8xR6g8pMJzfuYqyS7XWH7VtuF11oRMHKbqMZUq1UMqjyElW+YdO5JUd1Zv8u/uHXg5jYXAyxafVgg2GpXyWchcSvDtusxTK/S+lWmSiUvzwFK4YxOrr3EgMOgtSmt5VL5/ZKp2AeNgVLW72+ALvKsNcovIiMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rmfI3Ahh; arc=none smtp.client-ip=209.85.128.49
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso295015e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782143783; x=1782748583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26W5bm20xxXPvYh9zBnnA32+mtO9zhFS2iykiCYny4g=;
        b=rmfI3AhhfkhjZee3cJsoW1MvjlIYu7Nl6MCzpvE2kDXZBjqL9bNJ5Da1RXfY+OKCKF
         vuHbepHoVqLGuR2kU6ThZyZr5ox1x+lR30UdhZ3nHFifzXGG7Luw5z24doqWh3K4z6Le
         glYqAVYw1PAwgdTcqhI19a3xHGTq2pbmu8YwcPFuYxykVsI4AP+yadattDgs3vgTWWoB
         7lLW5HxYiGRoqGVURHBtlGg4Cce2uATKX6wF2ItqRogGJ+ZIwXa31Cj3lOSOoqBkcZ02
         tUVpDLMmKpf8ssysurezQhW5vefFmCM3IEzXQLZ86hktIm5pnkGZ/da6estsA3Pq1XsO
         N3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143783; x=1782748583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26W5bm20xxXPvYh9zBnnA32+mtO9zhFS2iykiCYny4g=;
        b=ZmHRRiP/do4Pb7n57VJQkjwa3moWlKSroxtoD3e3lHeGXI/jSOPT4vDrZ8Q4Jv/UCX
         4425lUyeikHTMYit3ApNFKQ/khGK7vd0lnrFIzUu9yVW/rQHBo/9VbQl2YNc7S4V/QN/
         dPc0XZopWXPGsqYsLINzWo/vJtS/xWQhU6kAV24adpI4eVv5RbUBBLJkDFcGlMbVQv7d
         hJXHGscBCrKp/zpdgHrKSR2Dy8vQwtwkqfnrzJyC59N8w2fpWN3+RasVL6e62VyC6Fco
         zNF1P99ehlyXklrRK7uqy0VKKMFq2EmeLrTtCt4KOdw4towvgBRWxSSoOFnJQWT/eZ7R
         W4Fw==
X-Forwarded-Encrypted: i=1; AFNElJ9O2R7z3S1WY1y306SFS5YPWv1d/suCvmDtqrgYjVDSIa63FJYN9s0FE9KFO4kC5iAoGk2h3MfYVyxQGRcK6ByQ2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjHMX2Ph1OqStkPzZwe35aVZrM2YCfoFW2reZuQqkTqxgBsxLQ
	OqahSDPDXSuAFh6KMAvFMrphjrKX5ltZPi0XrI/OANvRUufqpEupe8v8tFZcsg==
X-Gm-Gg: AfdE7cn92rNWFsJk1soaA9CubJiWcOy4UW7TKUnIKpaQUndqvgzUHnt8J6MpItZ4cxd
	aWCJEGrDDodFDZggJMGtDHPATdxJEIRRAbqr0XvhrxQE7Y1aMO4LWdyaY+5DMzhjicU3hdt1jOi
	MLEilvv45odm5mqAxcamDEJncnMe5Zhc3so0cqVlhPnwRUWsgx1GQKgqx3lsnj/5tFpSiVJ8cV/
	8kI1osirWXrtLcnj0UQnH0plm32vNKeVJaSPXaLbFuHHgsuWQzzuo63GoWUbUDGTxVnuGUjQAy3
	QuLO1Jt7rsAHTEg+3E1nKCAMGpfR+K7I7uMmUQtYBW9x0jZ4Jj/3a0dFVePYhLkgWaXlbhtl6UZ
	OObwiU3/gHoEv0smAsA2jnF/zdqhxwOM22XHF2AVT+qvaF7E+Hb8NfuPVMQPVQjjPiYqLrIjbkZ
	Ju3RmgwjBJPqb+fauRZZ2qVFmwkHiLhtoQMAeY0w==
X-Received: by 2002:a05:600c:480f:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-4925a0c4f1cmr780625e9.13.1782143783001;
        Mon, 22 Jun 2026 08:56:23 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:fdf9:c68d:5fce:b1ef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm331778025e9.14.2026.06.22.08.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:56:22 -0700 (PDT)
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
Subject: [PATCH v18 08/12] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Date: Mon, 22 Jun 2026 16:55:59 +0100
Message-ID: <20260622155610.184271-9-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-34327-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B17D16B0ED0

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC (r9a08g046) has an SDHI controller with several
differences from existing platforms that require dedicated handling.

Introduce a TMIO_MMC_HWADJ2 flag (bit 15) to identify controllers
that carry a second hardware adjustment register (SDm_SCC_HWADJ2 at
offset 0x010). When both TMIO_MMC_TUNING_DELAY and TMIO_MMC_HWADJ2
are set, renesas_sdhi_set_hw_adjustment_delay() additionally programs
HWADJ2 with 0x3FFF at 3.3 V and 0xFF at 1.8 V. A new
RZG3L_SDHI_SCC_HWADJ4 register (offset 0x022) is also cleared at the
start of tuning when TMIO_MMC_INTERNAL_DIVIDER is set.

Add a new version constant SDHI_VER_RZ_G3L_SDMMC (0xce10) and
extend renesas_sdhi_sdbuf_width() to handle it alongside the existing
Gen3 variants.

Introduce of_data_rzg3l with RZ/G3L-specific parameters: a wider
clk_mask of 0x200000200, max_divider of 2048 (reflecting the
11-bit divider), a dedicated rzg3l_scc_taps table, and all relevant
tmio_flags including TMIO_MMC_INTERNAL_DIVIDER and
TMIO_MMC_HWADJ2. Wire it to a new of_rzg3l_compatible entry using
sdhi_quirks_rzg3l (which sets fixed_addr_mode) and register the
renesas,sdhi-r9a08g046 compatible string in the OF match table.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v18:
 * New patch.
---
 drivers/mmc/host/renesas_sdhi_core.c          | 20 ++++++++--
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 37 +++++++++++++++++++
 include/linux/platform_data/tmio.h            |  3 ++
 3 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f3ce29cb3053..8e14ce3ca7ba 100644
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
@@ -264,12 +266,15 @@ static int renesas_sdhi_card_busy(struct mmc_host *mmc)
 #define SH_MOBILE_SDHI_SCC_RVSCNTL	0x008
 #define SH_MOBILE_SDHI_SCC_RVSREQ	0x00A
 #define SH_MOBILE_SDHI_SCC_SMPCMP       0x00C
-#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E
+#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E /* G3L: SDm_SCC_HS400MODE1 */
+#define RZG3L_SDHI_SCC_HWADJ2		0x010
+#define SH_MOBILE_SDHI_SCC_TMPPORT2	0x00E  /* G3L: SDm_SCC_HWADJ3 */
 #define SH_MOBILE_SDHI_SCC_TMPPORT3	0x014
 #define SH_MOBILE_SDHI_SCC_TMPPORT4	0x016
 #define SH_MOBILE_SDHI_SCC_TMPPORT5	0x018
 #define SH_MOBILE_SDHI_SCC_TMPPORT6	0x01A
 #define SH_MOBILE_SDHI_SCC_TMPPORT7	0x01C
+#define RZG3L_SDHI_SCC_HWADJ4		0x022
 
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN		BIT(0)
 #define SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT	16
@@ -319,14 +324,20 @@ static inline void sd_scc_write32(struct tmio_mmc_host *host,
 static void renesas_sdhi_set_hw_adjustment_delay(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
+	bool hwadj2 = host->pdata->flags & TMIO_MMC_HWADJ2;
 
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
@@ -392,6 +403,9 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
 
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
 
+	if (host->pdata->flags & TMIO_MMC_INTERNAL_DIVIDER)
+		sd_scc_write32(host, priv, RZG3L_SDHI_SCC_HWADJ4, 0x0);
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 93219706a4d6..9cb69003ac96 100644
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
@@ -162,6 +169,26 @@ static const struct renesas_sdhi_of_data of_data_rz_g2l = {
 	.max_divider	= SDHI_MAX_DIVIDER_DEFAULT,
 };
 
+static const struct renesas_sdhi_of_data of_data_rzg3l = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_64BIT_DATA_PORT | TMIO_MMC_TUNING_DELAY |
+			  TMIO_MMC_INTERNAL_DIVIDER | TMIO_MMC_HWADJ2,
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
@@ -242,6 +269,10 @@ static const struct renesas_sdhi_quirks sdhi_quirks_rzg2l = {
 	.hs400_disabled = true,
 };
 
+static const struct renesas_sdhi_quirks sdhi_quirks_rzg3l = {
+	.fixed_addr_mode = true,
+};
+
 /*
  * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
  * So, we want to treat them equally and only have a match for ES1.2 to enforce
@@ -301,6 +332,11 @@ static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
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
@@ -314,6 +350,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77995", .data = &of_rcar_gen3_nohs400_compatible, },
 	{ .compatible = "renesas,sdhi-r8a779md", .data = &of_rcar_gen3_nohs400_compatible, },
+	{ .compatible = "renesas,sdhi-r9a08g046", .data = &of_rzg3l_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g011", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,sdhi-r9a09g057", .data = &of_rzg2l_compatible, },
 	{ .compatible = "renesas,rzg2l-sdhi", .data = &of_rzg2l_compatible, },
diff --git a/include/linux/platform_data/tmio.h b/include/linux/platform_data/tmio.h
index 6c512e96e192..96eff17179cc 100644
--- a/include/linux/platform_data/tmio.h
+++ b/include/linux/platform_data/tmio.h
@@ -56,6 +56,9 @@
 /* Some controllers have internal divider */
 #define TMIO_MMC_INTERNAL_DIVIDER	BIT(14)
 
+/* Some controllers have hw adjustment delay */
+#define TMIO_MMC_HWADJ2			BIT(15)
+
 struct tmio_mmc_data {
 	void				*chan_priv_tx;
 	void				*chan_priv_rx;
-- 
2.43.0


