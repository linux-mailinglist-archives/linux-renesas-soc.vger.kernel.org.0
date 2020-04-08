Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 664201A1E35
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2020 11:46:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgDHJqw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Apr 2020 05:46:52 -0400
Received: from sauhun.de ([88.99.104.3]:39640 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726726AbgDHJqw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Apr 2020 05:46:52 -0400
Received: from localhost (p54B334FE.dip0.t-ipconnect.de [84.179.52.254])
        by pokefinder.org (Postfix) with ESMTPSA id 6382B2C1FD6;
        Wed,  8 Apr 2020 11:46:50 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/3] mmc: renesas_sdhi: refactor calculation of best TAP
Date:   Wed,  8 Apr 2020 11:46:36 +0200
Message-Id: <20200408094638.10375-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408094638.10375-1-wsa+renesas@sang-engineering.com>
References: <20200408094638.10375-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To select the best TAP, we need to find the longest stream of set bits
in a bit field. There is now a helper function for bitmaps which
iterates over all region of set bits. Using it makes the code much more
concise and easier to understand. Double so, because we need to handle
two bitmaps in the near future. Remove a superfluous comment while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since RFT/v1:
* fix off by one error spotted by Shimoda-san

 drivers/mmc/host/renesas_sdhi_core.c | 36 +++++++---------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index df826661366f..f5d174d86117 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -427,15 +427,10 @@ static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_io
 static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
-	unsigned long tap_cnt;  /* counter of tuning success */
-	unsigned long tap_start;/* start position of tuning success */
-	unsigned long tap_end;  /* end position of tuning success */
-	unsigned long ntap;     /* temporary counter of tuning success */
-	unsigned long i;
+	unsigned int tap_start = 0, tap_end = 0, tap_cnt = 0, rs, re, i;
+	unsigned int taps_size = priv->tap_num * 2;
 
 	priv->doing_tune = false;
-
-	/* Clear SCC_RVSREQ */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
 
 	/*
@@ -443,7 +438,7 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	 * result requiring the tap to be good in both runs before
 	 * considering it for tuning selection.
 	 */
-	for (i = 0; i < priv->tap_num * 2; i++) {
+	for (i = 0; i < taps_size; i++) {
 		int offset = priv->tap_num * (i < priv->tap_num ? 1 : -1);
 
 		if (!test_bit(i, priv->taps))
@@ -455,29 +450,14 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
 	 * is more than SH_MOBILE_SDHI_MAX_TAP probes long then use the
 	 * center index as the tap.
 	 */
-	tap_cnt = 0;
-	ntap = 0;
-	tap_start = 0;
-	tap_end = 0;
-	for (i = 0; i < priv->tap_num * 2; i++) {
-		if (test_bit(i, priv->taps)) {
-			ntap++;
-		} else {
-			if (ntap > tap_cnt) {
-				tap_start = i - ntap;
-				tap_end = i - 1;
-				tap_cnt = ntap;
-			}
-			ntap = 0;
+	bitmap_for_each_set_region(priv->taps, rs, re, 0, taps_size) {
+		if (re - rs > tap_cnt) {
+			tap_end = re;
+			tap_start = rs;
+			tap_cnt = tap_end - tap_start;
 		}
 	}
 
-	if (ntap > tap_cnt) {
-		tap_start = i - ntap;
-		tap_end = i - 1;
-		tap_cnt = ntap;
-	}
-
 	if (tap_cnt >= SH_MOBILE_SDHI_MAX_TAP)
 		priv->tap_set = (tap_start + tap_end) / 2 % priv->tap_num;
 	else
-- 
2.20.1

