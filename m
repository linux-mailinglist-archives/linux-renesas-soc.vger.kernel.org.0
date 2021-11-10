Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69AA544C8DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232764AbhKJTTX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:23 -0500
Received: from www.zeus03.de ([194.117.254.33]:55234 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232838AbhKJTTT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=9REXrPm+GOEDu2
        GmfHPmi/iMq4ONyRzWcUQGgWJ9mE8=; b=ErB9ixLzNi2bOUVJb1l6dhE8/3NOMd
        jgho4pzwjkgz4W3WeVhHjfBUFkr790eqd8rknil4TFap7FTjKzd40Og3DJFqJDGH
        O9gyPL94E1uDR+3ttIyhQsXmid00LfyvtqcjGgu20l1IPEOCCxldw6TYwX5t/LlN
        sPrNeUfpORR8c=
Received: (qmail 722893 invoked from network); 10 Nov 2021 20:16:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:27 +0100
X-UD-Smtp-Session: l3s3148p1@1f3/D3TQ9pogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 20/21] mmc: sdhi: parse DT for SDnH
Date:   Wed, 10 Nov 2021 20:16:09 +0100
Message-Id: <20211110191610.5664-21-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If there is a SDnH clock provided in DT, let's use it instead of relying
on the fallback.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since RFC v1:
* added tag from Geert
* use dev_err_probe()

 drivers/mmc/host/renesas_sdhi_core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 230182de5e88..db053fba5330 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -919,6 +919,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk), "cannot get clock");
 
+	priv->clkh = devm_clk_get_optional(&pdev->dev, "clkh");
+	if (IS_ERR(priv->clkh))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clkh), "cannot get clkh");
+
 	/*
 	 * Some controllers provide a 2nd clock just to run the internal card
 	 * detection logic. Unfortunately, the existing driver architecture does
@@ -957,7 +961,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 		dma_priv->dma_buswidth = of_data->dma_buswidth;
 		host->bus_shift = of_data->bus_shift;
 		/* Fallback for old DTs */
-		if (of_data->sdhi_flags & SDHI_FLAG_NEED_CLKH_FALLBACK)
+		if (!priv->clkh && of_data->sdhi_flags & SDHI_FLAG_NEED_CLKH_FALLBACK)
 			priv->clkh = clk_get_parent(clk_get_parent(priv->clk));
 
 	}
-- 
2.30.2

