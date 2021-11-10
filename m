Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC0844C8BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbhKJTTL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:11 -0500
Received: from www.zeus03.de ([194.117.254.33]:55010 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232749AbhKJTTJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=3cAKb61YVdDf4Z
        evDZUPD2d/F5+aJA+U/Ya2IG3i5Xg=; b=j9dDJ9uku+xIDfW03CpAIOXx/OaNh2
        wO2xVFkCtlNNYOsO58zwVesm+uSic5/4M5SSKMt19HiMF1GMGD+pnPwWUlW0nHlP
        8adk91riI8Ha012hC7ntlkSW6ifR92vA/4hWD2mZ/+xjv+MWXcVFo0TmBmB1gxld
        wwMt1ZLEZbVPk=
Received: (qmail 722432 invoked from network); 10 Nov 2021 20:16:20 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:20 +0100
X-UD-Smtp-Session: l3s3148p1@612cD3TQ1pogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 04/21] mmc: sdhi: internal_dmac: flag non-standard SDnH handling for V3M
Date:   Wed, 10 Nov 2021 20:15:53 +0100
Message-Id: <20211110191610.5664-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

V3M handles SDnH differently than other Gen3 SoCs, so let's add a
separate entry for that. This will allow better SDnH handling in the
future.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since RFC v1:
* new patch

 drivers/mmc/host/renesas_sdhi.h               |  3 +++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 0c45e82ff0de..cd82420677cc 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -18,6 +18,8 @@ struct renesas_sdhi_scc {
 	u32 tap_hs400_4tap;	/* sampling clock position for HS400 (4 TAP) */
 };
 
+#define SDHI_FLAG_NEED_CLKH_FALLBACK	BIT(0)
+
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
 	u32	      tmio_ocr_mask;
@@ -31,6 +33,7 @@ struct renesas_sdhi_of_data {
 	int taps_num;
 	unsigned int max_blk_count;
 	unsigned short max_segs;
+	unsigned long sdhi_flags;
 };
 
 #define SDHI_CALIB_TABLE_MAX 32
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 7660f7ea74dd..9d2c600fd4ce 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -125,6 +125,22 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	/* DMAC can handle 32bit blk count but only 1 segment */
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 	.max_segs	= 1,
+	.sdhi_flags	= SDHI_FLAG_NEED_CLKH_FALLBACK,
+};
+
+static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_fallback = {
+	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
+	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
+			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
+	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
+	.bus_shift	= 2,
+	.scc_offset	= 0x1000,
+	.taps		= rcar_gen3_scc_taps,
+	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
+	/* DMAC can handle 32bit blk count but only 1 segment */
+	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
+	.max_segs	= 1,
 };
 
 static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
@@ -214,6 +230,10 @@ static const struct renesas_sdhi_of_data_with_quirks of_r8a77965_compatible = {
 	.quirks = &sdhi_quirks_r8a77965,
 };
 
+static const struct renesas_sdhi_of_data_with_quirks of_r8a77970_compatible = {
+	.of_data = &of_data_rcar_gen3_no_fallback,
+};
+
 static const struct renesas_sdhi_of_data_with_quirks of_r8a77980_compatible = {
 	.of_data = &of_data_rcar_gen3,
 	.quirks = &sdhi_quirks_nohs400,
@@ -235,6 +255,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77965", .data = &of_r8a77965_compatible, },
+	{ .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77980", .data = &of_r8a77980_compatible, },
 	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
-- 
2.30.2

