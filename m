Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D84A4EED63
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 14:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345926AbiDAMrX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 08:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241268AbiDAMrW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 08:47:22 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 966061DBA8B
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Apr 2022 05:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=D1WY+DvyUkvv92W7r6Y6YhhSn3H
        pbOZaXASGTjElDaU=; b=zmEL5yJJhSxQPs5s8ydGW/HF3RyHz2XP+1KnTxZaLci
        auCjfn60C620IYeHUrfqq5fwfxY/iGRNGgV0mNI0yNkt7uZvjvtudKLI701G1+S6
        h12+Gk2uhQibWTUk1iLO0o/AeJwtM4wwvKYu4SrjSdKuubgDClRC06CCeUsjLfNE
        =
Received: (qmail 735860 invoked from network); 1 Apr 2022 14:45:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2022 14:45:29 +0200
X-UD-Smtp-Session: l3s3148p1@ViZOJ5fbxKUgAQnoAGGbAFirbAEmXd1u
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] mmc: renesas_sdhi: special 4tap settings only apply to HS400
Date:   Fri,  1 Apr 2022 14:45:23 +0200
Message-Id: <20220401124523.42892-1-wsa+renesas@sang-engineering.com>
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

Previous doucmentation was vague, so we included SDR104 for slow SDnH
clock settings. It turns out now, that it is only needed for HS400.

Fixes: bb6d3fa98a41 ("clk: renesas: rcar-gen3: Switch to new SD clock handling")
Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 2797a9c0f17d..2a4d314aa027 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -144,9 +144,9 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
 		return clk_get_rate(priv->clk);
 
 	if (priv->clkh) {
+		/* HS400 with 4TAP needs different clock settings */
 		bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
-		bool need_slow_clkh = (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) ||
-				      (host->mmc->ios.timing == MMC_TIMING_MMC_HS400);
+		bool need_slow_clkh = host->mmc->ios.timing == MMC_TIMING_MMC_HS400;
 		clkh_shift = use_4tap && need_slow_clkh ? 1 : 2;
 		ref_clk = priv->clkh;
 	}
-- 
2.30.2

