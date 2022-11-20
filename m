Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 863AA6313B2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Nov 2022 12:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbiKTLfM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Nov 2022 06:35:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiKTLfJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Nov 2022 06:35:09 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFBF4E437
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Nov 2022 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=DxxrXcFkEh3/ps
        PBEodOzXZdpNuF5lGC5J0GieLFf/o=; b=ty0CqIkV8bDH8Jw6EEDxquvMmlX+8K
        JgnKrej5tamnS7cNe4a8RLKxy8VUvVTnm5zRTi0E15f8ScOUqtMZpYetv7DGHuQ4
        qDDatfN61ostgSa+QPi8LGu9Mrbe6k75a+H+/y3eWL+5xAw/aTl3arCu5H3CngS0
        qlByoKmMYKr5M=
Received: (qmail 2515227 invoked from network); 20 Nov 2022 12:35:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2022 12:35:03 +0100
X-UD-Smtp-Session: l3s3148p1@wO9kVOXtMplehh99
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH v2 1/4] mmc: renesas_sdhi: alway populate SCC pointer
Date:   Sun, 20 Nov 2022 12:34:54 +0100
Message-Id: <20221120113457.42010-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120113457.42010-1-wsa+renesas@sang-engineering.com>
References: <20221120113457.42010-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We need the SCC pointer to reset the device, so populate it even when we
don't need it for tuning.

Fixes: 45bffc371fef ("mmc: renesas_sdhi: only reset SCC when its pointer is populated")
Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index b93ab11f112a..4372197dc2a9 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1067,11 +1067,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ver >= SDHI_VER_GEN3_SD)
 		host->get_timeout_cycles = renesas_sdhi_gen3_get_cycles;
 
+	/* Check for SCC so we can reset it if needed */
+	if (of_data && of_data->scc_offset && ver >= SDHI_VER_GEN2_SDR104)
+		priv->scc_ctl = host->ctl + of_data->scc_offset;
+
 	/* Enable tuning iff we have an SCC and a supported mode */
-	if (of_data && of_data->scc_offset &&
-	    (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
-	     host->mmc->caps2 & (MMC_CAP2_HS200_1_8V_SDR |
-				 MMC_CAP2_HS400_1_8V))) {
+	if (priv->scc_ctl && (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
+	    host->mmc->caps2 & (MMC_CAP2_HS200_1_8V_SDR |
+				MMC_CAP2_HS400_1_8V))) {
 		const struct renesas_sdhi_scc *taps = of_data->taps;
 		bool use_4tap = quirks && quirks->hs400_4taps;
 		bool hit = false;
@@ -1091,7 +1094,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		if (!hit)
 			dev_warn(&host->pdev->dev, "Unknown clock rate for tuning\n");
 
-		priv->scc_ctl = host->ctl + of_data->scc_offset;
 		host->check_retune = renesas_sdhi_check_scc_error;
 		host->ops.execute_tuning = renesas_sdhi_execute_tuning;
 		host->ops.prepare_hs400_tuning = renesas_sdhi_prepare_hs400_tuning;
-- 
2.30.2

