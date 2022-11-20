Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83EBE6313B5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Nov 2022 12:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiKTLfP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Nov 2022 06:35:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiKTLfK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Nov 2022 06:35:10 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81444FF93
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Nov 2022 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=ABjly91KC5eAxb
        Z+3p1M433cUmRlBct+0cEALkFL3/o=; b=tS5xyh+CLSy2f75Er6clOr+Ut6/2xo
        pdg+kEjtzvY0hPumonxWzHCc88B6uW0kmViRIx2px/he3FZJoSL7ygw5dHZOivZr
        mUfKzkQMw9et4MTncaBjFuDCDF0VQiy3KxPzkZYNBQ3SAbO8ZRptlzsF1J/rH7sU
        ezllbkicRUzpY=
Received: (qmail 2515323 invoked from network); 20 Nov 2022 12:35:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2022 12:35:04 +0100
X-UD-Smtp-Session: l3s3148p1@7SN/VOXtUplehh99
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 4/4] mmc: renesas_sdhi: use new convenience macro from MMC core
Date:   Sun, 20 Nov 2022 12:34:57 +0100
Message-Id: <20221120113457.42010-5-wsa+renesas@sang-engineering.com>
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

Makes the code more readable.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index ad8f79fe01b2..345934e4f59e 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1073,8 +1073,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	/* Enable tuning iff we have an SCC and a supported mode */
 	if (priv->scc_ctl && (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
-	    host->mmc->caps2 & (MMC_CAP2_HS200_1_8V_SDR |
-				MMC_CAP2_HS400_1_8V))) {
+	    host->mmc->caps2 & MMC_CAP2_HSX00_1_8V)) {
 		const struct renesas_sdhi_scc *taps = of_data->taps;
 		bool use_4tap = sdhi_has_quirk(priv, hs400_4taps);
 		bool hit = false;
-- 
2.30.2

