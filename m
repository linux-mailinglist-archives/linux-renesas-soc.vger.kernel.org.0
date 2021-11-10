Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F34244C8D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 20:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbhKJTTW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 14:19:22 -0500
Received: from www.zeus03.de ([194.117.254.33]:55212 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232869AbhKJTTS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 14:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=s6HwuFqBbmVl70
        ElFmxaCLk4/ZymU6t4KNsHZMq82/I=; b=UaHHZq+GpzfTQ+MTpgHYpqKODtCEbU
        Y9WdVHWGM0KrUKgtlT4SESVxwElc3P1OfABR7H81TulDPm2867RKuFpqHBuB+rwz
        pG1MPSVYqXmGUYHNi2Ysz3iSFYhjXmenagMWeWfNZ12STj4J39oNbo5sKc5p8F6n
        8QIlO/ipAwB3g=
Received: (qmail 722875 invoked from network); 10 Nov 2021 20:16:26 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2021 20:16:26 +0100
X-UD-Smtp-Session: l3s3148p1@bQj5D3TQ9JogAwDPXwnKAAv7bcN/CGzA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH v2 19/21] mmc: sdhi: use dev_err_probe when getting clock fails
Date:   Wed, 10 Nov 2021 20:16:08 +0100
Message-Id: <20211110191610.5664-20-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is to improve deferred probe in this driver and to keep consistent
with an up-to-date handling of a soon to be added second clock.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since RFC v1:
* new patch

 drivers/mmc/host/renesas_sdhi_core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 4572242f9816..230182de5e88 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -916,11 +916,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	dma_priv = &priv->dma_priv;
 
 	priv->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(priv->clk)) {
-		ret = PTR_ERR(priv->clk);
-		dev_err(&pdev->dev, "cannot get clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk), "cannot get clock");
 
 	/*
 	 * Some controllers provide a 2nd clock just to run the internal card
-- 
2.30.2

