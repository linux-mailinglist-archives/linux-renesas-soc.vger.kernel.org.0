Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1F21EE34E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2020 13:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgFDLUy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jun 2020 07:20:54 -0400
Received: from www.zeus03.de ([194.117.254.33]:58174 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727082AbgFDLUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jun 2020 07:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=Z93EQCVx29m/J8
        oT4GzMC5ngz7xne9z1CvWsn7xKrXw=; b=JSE4mkCT9EjQg3BHj/YbjjCvCI18vK
        KrYSQOOSL3FjfrpbrnSs3mXJsIXSuIaX8OhJbZ53sms94krE4jBbtPw7uEd55RUD
        Wlxh3TDzmXNBtYNTG0uexK0KakmlUIj2ySTBFfNTDy6AhWVZI12Pj92N5S/ILKVV
        0qq/PADIgLqpY=
Received: (qmail 1656181 invoked from network); 4 Jun 2020 13:20:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2020 13:20:51 +0200
X-UD-Smtp-Session: l3s3148p1@ZA5UVkCncuUgAwDPXw1XANux7yWtmp4Z
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] mmc: renesas_sdhi: keep SCC clock active when tuning
Date:   Thu,  4 Jun 2020 13:20:40 +0200
Message-Id: <20200604112040.22144-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
References: <20200604112040.22144-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Tuning procedure switches to lower frequencies but that will turn the
SCC off and accessing its register then will hang. So, flag when we are
tuning and keep the current setup of the external clock if we are doing
so. Note that we still switch to the lower frequency because of the
internal divider. We just make sure to not modify the external clock.
This patch depends on a MMC core patch calling the downgrade function
earlier.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 25 ++++++++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 14c64caefc64..58a8c9133ba4 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -59,6 +59,7 @@ struct renesas_sdhi {
 	u32 scc_tappos;
 	u32 scc_tappos_hs400;
 	bool doing_tune;
+	bool keep_scc_freq;
 
 	/* Tuning values: 1 for success, 0 for failure */
 	DECLARE_BITMAP(taps, BITS_PER_LONG);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 15e21894bd44..589a59fb70eb 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -117,8 +117,12 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 	unsigned int freq, diff, best_freq = 0, diff_min = ~0;
 	int i;
 
-	/* tested only on R-Car Gen2+ currently; may work for others */
-	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
+	/*
+	 * We simply return the current rate if a) we are not on a R-Car Gen2+
+	 * SoC (may work for others, but untested) or b) if the SCC needs its
+	 * clock during tuning, so we don't change the external clock setup.
+	 */
+	if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2) || priv->keep_scc_freq)
 		return clk_get_rate(priv->clk);
 
 	/*
@@ -323,6 +327,9 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 	u32 bad_taps = priv->quirks ? priv->quirks->hs400_bad_taps : 0;
 	bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
 
+	/* Tuning done, no special handling for SCC clock needed anymore */
+	priv->keep_scc_freq = false;
+
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
 		sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
 
@@ -401,6 +408,14 @@ static void renesas_sdhi_disable_scc(struct mmc_host *mmc)
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
 			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
+
+	/*
+	 * During retune, we still access SCC registers, so keep clock on.
+	 * We have it here again because for retuning it is too late when we
+	 * only enable this flag when HS400 tuning gets initialized.
+	 */
+	if (mmc_doing_retune(mmc))
+		priv->keep_scc_freq = true;
 }
 
 static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
@@ -427,8 +442,12 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
 static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
 {
 	struct tmio_mmc_host *host = mmc_priv(mmc);
+	struct renesas_sdhi *priv = host_to_priv(host);
+
+	/* During tuning, we still access SCC registers, so keep clock on */
+	priv->keep_scc_freq = true;
+	renesas_sdhi_reset_hs400_mode(host, priv);
 
-	renesas_sdhi_reset_hs400_mode(host, host_to_priv(host));
 	return 0;
 }
 
-- 
2.20.1

