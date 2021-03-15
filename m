Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1FC33BF46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 16:01:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbhCOPAD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 11:00:03 -0400
Received: from www.zeus03.de ([194.117.254.33]:47510 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233172AbhCOO7m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 10:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=PllOxXvFTMW1Kp
        XjjzAlDTWaWaJ4IotR7bENrGIrrSs=; b=24f9K/vn+jN8tEEo0lx31LOUH95R4Y
        4eIg0qU6x9JKonMqLt6kJOgYuqVHZ9FjXoyQYgTipU1fWOPJFxypJoGHVuJ/S3d0
        ta1sLP0QFEJblYgmbt9xIAEvVnDC11TNncLu8ngmqNRgMgXjmfVRycfNmm0nawUs
        lBV7Gn76XNfX4=
Received: (qmail 1439261 invoked from network); 15 Mar 2021 15:59:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Mar 2021 15:59:40 +0100
X-UD-Smtp-Session: l3s3148p1@NszNf5S9DosgARa4RYTzARykWRFxRPkz
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 2/3] mmc: renesas_sdhi: break SCC reset into own function
Date:   Mon, 15 Mar 2021 15:59:37 +0100
Message-Id: <20210315145938.58565-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
References: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

renesas_sdhi_reset used to mainly reset the SCC but is now doing more
and even more will be added. So, factor out SCC reset to have a clear
distinction when we want to reset either SCC or SDHI+SCC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 09a5e0dafbef..db753829eaf6 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -557,21 +557,25 @@ static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_io
 	return 0;
 }
 
+static void renesas_sdhi_scc_reset(struct tmio_mmc_host *host, struct renesas_sdhi *priv)
+{
+	renesas_sdhi_disable_scc(host->mmc);
+	renesas_sdhi_reset_hs400_mode(host, priv);
+	priv->needs_adjust_hs400 = false;
+
+	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
+		       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
+		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
+}
+
 /* only populated for TMIO_MMC_MIN_RCAR2 */
 static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
 	u16 val;
 
-	if (priv->scc_ctl) {
-		renesas_sdhi_disable_scc(host->mmc);
-		renesas_sdhi_reset_hs400_mode(host, priv);
-		priv->needs_adjust_hs400 = false;
-
-		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
-			       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
-			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
-	}
+	if (priv->scc_ctl)
+		renesas_sdhi_scc_reset(host, priv);
 
 	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_ALL_RCAR2);
 
@@ -691,7 +695,7 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
 
 	ret = renesas_sdhi_select_tuning(host);
 	if (ret < 0)
-		renesas_sdhi_reset(host);
+		renesas_sdhi_scc_reset(host, priv);
 	return ret;
 }
 
-- 
2.30.0

