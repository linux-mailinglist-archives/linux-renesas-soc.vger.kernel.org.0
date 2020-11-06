Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44AE32A903D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Nov 2020 08:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgKFHZ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Nov 2020 02:25:57 -0500
Received: from www.zeus03.de ([194.117.254.33]:41476 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726198AbgKFHZ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Nov 2020 02:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=v40b6ex/W8faqw
        qSuNLfB1ZPnYt5rbA+6JSyjKrwpsM=; b=VMdZHQ9g9SjAi/J5Ik5fg3L50+hHu2
        Qth2AMRTHwtzWTyg2FdorhLKj+CkP/7+VEe9PP6/Dl4hnfPwOBKPuoRRnp8NcpQG
        l1F84KwJnYP5klwgaE4IVM4zSsiTayiXYm2nrf4PO9KEpnkIdi6pB39wdMk1fzaU
        v9igUCi4BHCiU=
Received: (qmail 858651 invoked from network); 6 Nov 2020 08:25:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Nov 2020 08:25:55 +0100
X-UD-Smtp-Session: l3s3148p1@kKyGH2uzWIggAwDPXwt7AGjsMIC0/1f/
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] Revert "mmc: renesas_sdhi: workaround a regression when reinserting SD cards"
Date:   Fri,  6 Nov 2020 08:25:49 +0100
Message-Id: <20201106072549.1495-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
References: <20201106072549.1495-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This reverts commit db1af1e9712920f47b5dc6a995fca3eec05ea85e. It was
only a workaround to hide a regression. We now have proper fixes.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 414314151d0a..20e5eb63caf8 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -572,17 +572,6 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
 					     TMIO_MASK_INIT_RCAR2);
 }
 
-/*
- * This is a temporary workaround! This driver used 'hw_reset' wrongly and the
- * fix for that showed a regression. So, we mimic the old behaviour until the
- * proper solution is found.
- */
-static void renesas_sdhi_hw_reset(struct mmc_host *mmc)
-{
-	struct tmio_mmc_host *host = mmc_priv(mmc);
-	renesas_sdhi_reset(host);
-}
-
 #define SH_MOBILE_SDHI_MIN_TAP_ROW 3
 
 static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
@@ -1020,8 +1009,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		if (of_data && of_data->scc_offset) {
 			priv->scc_ctl = host->ctl + of_data->scc_offset;
 			host->reset = renesas_sdhi_reset;
-			host->ops.hw_reset = renesas_sdhi_hw_reset;
-			host->mmc->caps |= MMC_CAP_HW_RESET;
 		}
 	}
 
-- 
2.28.0

