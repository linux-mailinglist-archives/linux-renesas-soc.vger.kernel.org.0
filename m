Return-Path: <linux-renesas-soc+bounces-1052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C922A812F39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 861FD282CD6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067374BABF;
	Thu, 14 Dec 2023 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kvJ9INdg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D97193
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:39 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bfa5a6cffso9338709e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554398; x=1703159198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUpk9YEw4O5jZFB/MhCu88qNpJzCkLxLIB6VsR179rU=;
        b=kvJ9INdg0ZqMNqg8of9oBNzFNJJFxmQ70NToJ82NrikOjaxrizVuPoNIqcBLuY/+MD
         T1oo8gLFyEyXjhVMAZKvOHsYmBnVeP7XM+SGiO5pX0YTkfxHW5XfpBI15FVAAZymQ3Eu
         5QsPdbE2qjJNp219I0CFCIexY4OwHZbGR/yom+uSMYbt/kqBMHX/GT5v8OdnPqPtrN2g
         hFv2SqqMJNQ0B9mTNAwRv3jMAjVQ3QW6HAAfb5czcaVASuAjHk6ZEbg8pwUd0Xv1flQA
         SFdGx6V7oDTlp/XyR79Odwvr1zHAn5L8im5BPr9eYcr2ivNfxjnFGNrfIfRWV6FayLun
         xMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554398; x=1703159198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YUpk9YEw4O5jZFB/MhCu88qNpJzCkLxLIB6VsR179rU=;
        b=etgLY5A6JFgpdjvThSDyGC79PLokNSYblZJmGSVZfFDPFq9eSoXfC9DPlWjHVTDm8p
         wU14NBP3Q89m7FW8BZHtn3xXaFjzEn8OmK9ze7j9NxysynZyf+CEhPfEE6g4qDbJOnD6
         piJ1QgTxAmVYWn38elM3Z+zZ2vRJ2r98c83jK6A0fVB/bV6P3tnpXV2EtXuzY8CaRsYr
         Ri+bGfvpQEboocwOsFrrOCkNQ5Jzplk4PtE/qL3CspkyxILN/odzZWmf9dfu+yj+NAvs
         SMKA8kQRs0xNhmInVKgZPHLvNfNhrJ3rv+1OvRqb7i/PA63P9QnscETQ84C6MFni1/+E
         ldww==
X-Gm-Message-State: AOJu0YzTnTFhtu+QkTB1nqsk3tYgIZlli4pOPomsChzHUpT2EpOQJMmA
	Zw/IIXXUoG+5hgWQ2kKB6ZKN/A==
X-Google-Smtp-Source: AGHT+IE0y3Td04brKCB75tYN8zqof2o97uZkz4II4IxWKFLNIX1b77Ouhh0D+qPezdfOihQoAIzZ1g==
X-Received: by 2002:ac2:4e8f:0:b0:50c:44:919e with SMTP id o15-20020ac24e8f000000b0050c0044919emr3721718lfr.108.1702554398125;
        Thu, 14 Dec 2023 03:46:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:37 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v2 12/21] net: ravb: Move ptp initialization in the driver's ndo_open API for ccc_gac platorms
Date: Thu, 14 Dec 2023 13:45:51 +0200
Message-Id: <20231214114600.2451162-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The initialization sequence for PTP is the same for platforms with ccc_gac
and gptp (according to chapter "Figure 50.71 Flow of gPTP Initialization
(Normal, Common to All Modes)" of the R-Car Series, 3rd generation hardware
manual and chapter "Figure 37A.53 Flow of gPTP Initialization (Normal,
Common to All Modes)" of the RZ/G Series hardware manual).

As some IP variants switch to reset mode (and thus registers' content is
lost) when setting clocks (due to module standby functionality) to be able
to implement runtime PM, move the PTP initialization to the driver's
ndo_open API.

This commit prepares the code for the addition of runtime PM.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 6b8ca08be35e..db9222fc57c2 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1835,7 +1835,7 @@ static int ravb_open(struct net_device *ndev)
 		goto out_dma_stop;
 
 	/* Initialise PTP Clock driver */
-	if (info->gptp)
+	if (info->gptp || info->ccc_gac)
 		ravb_ptp_init(ndev, priv->pdev);
 
 	/* PHY control start */
@@ -1849,7 +1849,7 @@ static int ravb_open(struct net_device *ndev)
 
 out_ptp_stop:
 	/* Stop PTP Clock driver */
-	if (info->gptp)
+	if (info->gptp || info->ccc_gac)
 		ravb_ptp_stop(ndev);
 out_dma_stop:
 	ravb_stop_dma(ndev);
@@ -2151,7 +2151,7 @@ static int ravb_close(struct net_device *ndev)
 	ravb_write(ndev, 0, TIC);
 
 	/* Stop PTP Clock driver */
-	if (info->gptp)
+	if (info->gptp || info->ccc_gac)
 		ravb_ptp_stop(ndev);
 
 	/* Set the config mode to stop the AVB-DMAC's processes */
@@ -2846,10 +2846,6 @@ static int ravb_probe(struct platform_device *pdev)
 	/* Initialise HW timestamp list */
 	INIT_LIST_HEAD(&priv->ts_skb_list);
 
-	/* Initialise PTP Clock driver */
-	if (info->ccc_gac)
-		ravb_ptp_init(ndev, pdev);
-
 	/* Debug message level */
 	priv->msg_enable = RAVB_DEF_MSG_ENABLE;
 
@@ -2894,10 +2890,6 @@ static int ravb_probe(struct platform_device *pdev)
 out_dma_free:
 	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
 			  priv->desc_bat_dma);
-
-	/* Stop PTP Clock driver */
-	if (info->ccc_gac)
-		ravb_ptp_stop(ndev);
 out_rpm_put:
 	pm_runtime_put(&pdev->dev);
 out_rpm_disable:
@@ -2924,10 +2916,6 @@ static void ravb_remove(struct platform_device *pdev)
 
 	ravb_mdio_release(priv);
 
-	/* Stop PTP Clock driver */
-	if (info->ccc_gac)
-		ravb_ptp_stop(ndev);
-
 	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
 			  priv->desc_bat_dma);
 
-- 
2.39.2


