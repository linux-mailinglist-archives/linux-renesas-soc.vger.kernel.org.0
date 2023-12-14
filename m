Return-Path: <linux-renesas-soc+bounces-1046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7ED812F2A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:47:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61399B21356
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF8046B87;
	Thu, 14 Dec 2023 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BtVfCesJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CF2182
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:29 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a1f33c13ff2so688988866b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554388; x=1703159188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPmtetqkn+6AHMt4qrWAH+XK1NCRm1PmSoAA4AvSe08=;
        b=BtVfCesJcX7uXnFqQj+QHIRwpHKXSpwIdKN1kqLlTULuVmWU8Ph3KbRc5+UZdUky6y
         JSyPtSXAMVFh1eutGr2XZlEGAZ9tRvoGEnpYPbj2weZsmbS4y7qoBnDY+C3b2roG/VuT
         2dX9vFNwiBmETk1l9rApf3j+zlHDUfesugHYmNvE+NPdtAWPHvcAtqh/VA3eW/+L1IlD
         dMM/9ggcQHJcshOv0WAXI6V+IeJRRbgZEYzMq8BKY+dl7iDVd8KEvPrkaI0Hbun8chOd
         tZDjFTy8/LJEOXasJwmALVe1Kk+fKStlYaKCR/pmH2m78TIuP+1NsCRdlQerBlg2bnS1
         uvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554388; x=1703159188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPmtetqkn+6AHMt4qrWAH+XK1NCRm1PmSoAA4AvSe08=;
        b=Inq/jWIh4B2csRragidRX09aRKawpVAA1B3KKnFNJ9f2+CAQ+CPCRVMnzKSylf5lY/
         xHBBuQHcScSkf9cIhQvHV9PrhG4qSGo6jNW7nubcTPrflcA9YA9jbJexm0d1lTYl+WTD
         pNX+Vwsk6+SMMespeW7Fnd0mDwBdQO5t98GutL2Mp/DZy/AiUEes6liKlNRiYI6XdmDg
         +NPoraGZEnZ7L4ibdUcGu+CK5xyWnKOBJV5t7tdOGABYnW/ytqox++TxrS+BTa/0pmZe
         DP2Fc0VxX3aQM7fSbz41ZUZxytpD2VHhml95EMIbO47uMbF1nOY0qB+x/bpybjDgV13D
         GTNg==
X-Gm-Message-State: AOJu0YxCfqoiesScA8fA21Fr7vXG4HMDqpzNO0ViUDrsjletXha1njsP
	JYeXsfFExeadnodDc69koG/Rhw==
X-Google-Smtp-Source: AGHT+IEV1vVXY4yCrxuSZjg06XM9leKb7L6pjYLxoh7jJlhdAxhghURah8mlsJHVPQriywu6r3+kgQ==
X-Received: by 2002:a17:907:aa2:b0:a10:f9a8:bfe1 with SMTP id bz2-20020a1709070aa200b00a10f9a8bfe1mr4762907ejc.16.1702554387976;
        Thu, 14 Dec 2023 03:46:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:27 -0800 (PST)
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
Subject: [PATCH net-next v2 06/21] net: ravb: Assert/de-assert reset on suspend/resume
Date: Thu, 14 Dec 2023 13:45:45 +0200
Message-Id: <20231214114600.2451162-7-claudiu.beznea.uj@bp.renesas.com>
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

RZ/G3S can go to deep sleep states where power to most of the SoC parts is
off. When resuming from such a state, the Ethernet controller needs to be
reinitialized. De-asserting the reset signal for it should also be done.
Thus, add reset assert/de-assert on suspend/resume functions.

On the resume function, the de-assert was not reverted in case of failures
to give the user a chance to restore the interface (e.g., bringing down/up
the interface) in case suspend/resume failed.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- fixed typos in patch description and subject
- on ravb_suspend() assert the reset signal in case interface is down;
  due to this the Sergey's Rb tag was left aside in this version

 drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 5a57383762e7..9a618d8dbfcd 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2985,7 +2985,7 @@ static int ravb_suspend(struct device *dev)
 	int ret;
 
 	if (!netif_running(ndev))
-		return 0;
+		goto reset_assert;
 
 	netif_device_detach(ndev);
 
@@ -2997,7 +2997,11 @@ static int ravb_suspend(struct device *dev)
 	if (priv->info->ccc_gac)
 		ravb_ptp_stop(ndev);
 
-	return ret;
+	if (priv->wol_enabled)
+		return ret;
+
+reset_assert:
+	return reset_control_assert(priv->rstc);
 }
 
 static int ravb_resume(struct device *dev)
@@ -3005,7 +3009,11 @@ static int ravb_resume(struct device *dev)
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
-	int ret = 0;
+	int ret;
+
+	ret = reset_control_deassert(priv->rstc);
+	if (ret)
+		return ret;
 
 	/* If WoL is enabled set reset mode to rearm the WoL logic */
 	if (priv->wol_enabled) {
-- 
2.39.2


