Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F8017B94A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 10:32:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgCFJcI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 04:32:08 -0500
Received: from sauhun.de ([88.99.104.3]:56030 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726212AbgCFJcI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 04:32:08 -0500
Received: from localhost (p54B33158.dip0.t-ipconnect.de [84.179.49.88])
        by pokefinder.org (Postfix) with ESMTPSA id B283C2C1F5E;
        Fri,  6 Mar 2020 10:32:06 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Subject: [PATCH RFT 3/3] mmc: renesas_sdhi: improve TAP selection if all TAPs are good
Date:   Fri,  6 Mar 2020 10:31:59 +0100
Message-Id: <20200306093159.6155-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306093159.6155-1-wsa+renesas@sang-engineering.com>
References: <20200306093159.6155-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When tuning HS400, if all TAPS are good, we can utilize the SMPCMP
register to select the optimal TAP. For that, we populate a second
bitmap with SMPCMP results and query it in case the regular bitmap is
full (= all good).

Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 2a4c83a5f32e..12d8016672b0 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -61,6 +61,8 @@ struct renesas_sdhi {
 
 	/* Tuning values: 1 for success, 0 for failure */
 	DECLARE_BITMAP(taps, BITS_PER_LONG);
+	/* Sampling data comparison: 1 for match, 0 for mismatch */
+	DECLARE_BITMAP(smpcmp, BITS_PER_LONG);
 	unsigned int tap_num;
 	unsigned long tap_set;
 };
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index beac70a0defb..4a5abf28dee5 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -428,7 +428,8 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 	unsigned int tap_start = 0, tap_end = 0, tap_cnt = 0, rs, re, i;
-	unsigned int taps_size = priv->tap_num * 2;
+	unsigned int taps_size = priv->tap_num * 2, min_tap_row;
+	unsigned long *bitmap;
 
 	priv->doing_tune = false;
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
@@ -443,6 +444,21 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 
 		if (!test_bit(i, priv->taps))
 			clear_bit(i + offset, priv->taps);
+
+		if (!test_bit(i, priv->smpcmp))
+			clear_bit(i + offset, priv->smpcmp);
+	}
+
+	/*
+	 * If all TAP are OK, the sampling clock position is selected by
+	 * identifying the change point of data.
+	 */
+	if (bitmap_full(priv->taps, taps_size)) {
+		bitmap = priv->smpcmp;
+		min_tap_row = 1;
+	} else {
+		bitmap = priv->taps;
+		min_tap_row = SH_MOBILE_SDHI_MIN_TAP_ROW;
 	}
 
 	/*
@@ -450,7 +466,7 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	 * is at least SH_MOBILE_SDHI_MIN_TAP_ROW probes long then use the
 	 * center index as the tap, otherwise bail out.
 	 */
-	bitmap_for_each_set_region(priv->taps, rs, re, 0, taps_size) {
+	bitmap_for_each_set_region(bitmap, rs, re, 0, taps_size) {
 		if (re - 1 - rs > tap_cnt) {
 			tap_end = re - 1;
 			tap_start = rs;
@@ -458,7 +474,7 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 		}
 	}
 
-	if (tap_cnt >= SH_MOBILE_SDHI_MIN_TAP_ROW)
+	if (tap_cnt >= min_tap_row)
 		priv->tap_set = (tap_start + tap_end) / 2 % priv->tap_num;
 	else
 		return -EIO;
@@ -491,6 +507,7 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
 
 	priv->doing_tune = true;
 	bitmap_zero(priv->taps, priv->tap_num * 2);
+	bitmap_zero(priv->smpcmp, priv->tap_num * 2);
 
 	/* Issue CMD19 twice for each tap */
 	for (i = 0; i < 2 * priv->tap_num; i++) {
@@ -499,6 +516,9 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
 
 		if (mmc_send_tuning(host->mmc, opcode, NULL) == 0)
 			set_bit(i, priv->taps);
+
+		if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_SMPCMP) == 0)
+			set_bit(i, priv->smpcmp);
 	}
 
 	return renesas_sdhi_select_tuning(host);
-- 
2.20.1

