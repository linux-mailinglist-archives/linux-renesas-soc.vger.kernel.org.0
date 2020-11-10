Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235CD2AD89A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Nov 2020 15:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730784AbgKJOVN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 Nov 2020 09:21:13 -0500
Received: from www.zeus03.de ([194.117.254.33]:57772 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730819AbgKJOVM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Nov 2020 09:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=CW6RZsSqYfdrES
        rVJQhiX+Wjfbk4vck8CaMzal04ZiY=; b=BA8M3EZEurE409xlsHCM42qfMyOU/Y
        6xfvDxMOPIzbjrgJGBSz9b324+Sd6y+uZ5le6vN19A52532tc2PbI9bqC/wn+JIJ
        bi2Omiz6vhYubG0DzSnyXBBZeZtp6nsnMuxM35R6FyLB9wWQ68oI3ee+iH3VG6Co
        F4UWW8pvV2IUY=
Received: (qmail 2195733 invoked from network); 10 Nov 2020 15:21:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2020 15:21:10 +0100
X-UD-Smtp-Session: l3s3148p1@xofuY8GzYsogAwDPXxAvAEQD26z+TKuA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 4/4] mmc: renesas_sdhi: simplify reset routine a little
Date:   Tue, 10 Nov 2020 15:20:58 +0100
Message-Id: <20201110142058.36393-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The 'reset' pointer is only populated for Gen2+. So, we don't need to
check for that flag inside the routine.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 4a1ed5bf216c..1fabf8c5773c 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -552,6 +552,7 @@ static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_io
 	return 0;
 }
 
+/* only populated for TMIO_MMC_MIN_RCAR2 */
 static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 {
 	struct renesas_sdhi *priv = host_to_priv(host);
@@ -569,9 +570,7 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
 	}
 
-	if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
-		sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK,
-					     TMIO_MASK_INIT_RCAR2);
+	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_INIT_RCAR2);
 }
 
 #define SH_MOBILE_SDHI_MIN_TAP_ROW 3
-- 
2.28.0

