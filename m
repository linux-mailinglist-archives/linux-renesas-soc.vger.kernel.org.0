Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5624F140B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 13:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376636AbiDDLvG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 07:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbiDDLvG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 07:51:06 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DC03D490
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=htG0tea/faHfpXH2LGaHHamETKt
        IwimJjRnv1t8vAco=; b=ddn/j2ig2XmJik2o7deY0/Pc1zBvRtj9uxP1HOmJmCZ
        FSlZaQTiTKvxIt0LynsUUa4AIwH86OsB1QyvMhU8R7Htm7lTyQ55LlUIaP0yDaPX
        wE/qtuQfE0lRzti0zt0+2CtmY9mQPr+emL7l7NO143JpY+N8Ddz8gEyxHLcNyAXQ
        =
Received: (qmail 1847510 invoked from network); 4 Apr 2022 13:49:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Apr 2022 13:49:04 +0200
X-UD-Smtp-Session: l3s3148p1@il4Tt9Lb+KQgAQnoAHNmALK3JllQBOZM
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: don't overwrite TAP settings when HS400 tuning is complete
Date:   Mon,  4 Apr 2022 13:49:02 +0200
Message-Id: <20220404114902.12175-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When HS400 tuning is complete and HS400 is going to be activated, we
have to keep the current number of TAPs and should not overwrite them
with a hardcoded value. This was probably a copy&paste mistake when
upporting HS400 support from the BSP.

Fixes: 26eb2607fa28 ("mmc: renesas_sdhi: add eMMC HS400 mode support")
Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Lightly tested with a Renesas R-Car M3N SoC. I think I can't really test
it because my TAPs are usually stable in my environment. The fix should
be obvious, though. Shimoda-san, are you happy with it?

 drivers/mmc/host/renesas_sdhi_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 89d21231ec5f..4404ca1f98d8 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -394,10 +394,10 @@ static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
 			SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
 			sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2));
 
-	/* Set the sampling clock selection range of HS400 mode */
 	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DTCNTL,
 		       SH_MOBILE_SDHI_SCC_DTCNTL_TAPEN |
-		       0x4 << SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_SHIFT);
+		       sd_scc_read32(host, priv,
+				     SH_MOBILE_SDHI_SCC_DTCNTL));
 
 	/* Avoid bad TAP */
 	if (bad_taps & BIT(priv->tap_set)) {
-- 
2.30.2

