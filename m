Return-Path: <linux-renesas-soc+bounces-2105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AC84398D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 09:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CCFF1C2682A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jan 2024 08:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1663979DAB;
	Wed, 31 Jan 2024 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ah6g2KWE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D4D78676
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706690526; cv=none; b=ZIQro58oIIaIDZVrr0V94443lSlnOLf/qOofrngQ6ZF46aleBs3qAN6Q7G7aPl/FjDeXevyOGcmnDJpt+qvcnDGuwm9BhIqTVXFarN2rIHRj8rXLkq4D0tTVfpRou3N6VeTiZ9nIkYgVuE0sz9nQtgsK+kz93EwEsCFtLjYSQ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706690526; c=relaxed/simple;
	bh=0ud/earGHL5ceFLGnOZtm9LhMl1uT4ztwKY+qDHwNlk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OKwyIKpx0Lof9KU/CnrrEkXKcCaGGTe85ub00zOKt4R+g9XOvAX5VimSC6eZ+2SMKqW7ZrqHSpfYl0gyNSJm3t/NTM7qbiqvN53Xe3fnQcNW/jFXcxG6F6UtqdVlTIwZPP2EJOKDGPdzW3i4BQ7tetRxkcS5NzAIXl2oIK5isbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ah6g2KWE; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso5349732a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2024 00:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706690522; x=1707295322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BONSj5EqZQfFZpRQIDw4PpK7x+FJrmVdcN0Lou7oXa8=;
        b=Ah6g2KWEBJRXaqd3OycZ5wKzvSrdWf3Rz40f+EnfW/YcQ/nc7Fau03x8raS6ddfWb6
         Vgl+3MrCV4TrT8Hnwt5cV9bVMI16oin0EQ8Jjzh0vwdZ00gUAL00d1dFoy8soasgcPNu
         xaQAx9uPTMGhnJ5WmvZ59kf4bxihHYaX4+1qYK0WUtaccN3ZslGHfvzLT9U4zcJQUolj
         eYr9VH9mkEbd3LGRxCauleROEsfHtvu/fd+amlQpZVdYVeGo0Wji4KPjuB8O6Y18ohtA
         L02ZPFRi2wFj+T3u2pTw/0H6tXFoT7ThmHkWpmt5vJ7eagSXOfd5AB6xGdJo7EDR36GJ
         ITbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706690522; x=1707295322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BONSj5EqZQfFZpRQIDw4PpK7x+FJrmVdcN0Lou7oXa8=;
        b=Gq4LZzmQlULNxTPxq+TkKjyOnrrixs28qSn6nfSdAnywzqaRex2N1gpZFp+DS8NzbX
         wkafxaxBnLwJxdBzUM5cGMxavA2wsocLpctKEsmc6ILJQvaBkBzwzY99o9sxB/5JgEQ5
         wEo62cxYmFcUYoFQL9A4SyS2XvVoxDuV3vv3t+eVDrNZITqC4L364vE/u9FAV0E5A8E/
         PUOPq6rP7EsQdQL0zWJLwrXLBpY/vPgEdC0iLZvSt6+cMHDGH3yfwqtpiLPmkFeYfvEe
         Hm2Sw1rEc18tyeWs6mPj2cX8g8KuOrY3rliMv38l9lKoR0zyt0tFpvqXXVMvk3XDthAF
         JixA==
X-Gm-Message-State: AOJu0YzBbFmcFdzmTXW8EsjIJUbGuT7MlYvN3RkQaDkqY1J/SAL3u102
	mpvqqpjl4S8ArllCSgvoOqmEEdPtBG6PHh4xH0NckxAF5RuEmD9unISlOdORzBw=
X-Google-Smtp-Source: AGHT+IFzePjkrpbDwYkajriYVblY0QL9xwF/SLkY0HcbYLtg3g8hGD8Nbc3LdTsBKGTDNQuWZFC/ng==
X-Received: by 2002:aa7:d891:0:b0:55f:19c4:600c with SMTP id u17-20020aa7d891000000b0055f19c4600cmr601408edq.37.1706690522296;
        Wed, 31 Jan 2024 00:42:02 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWypG4NjsIWtmFnxHAIB2Xg4ZXhliltyN5KNvLXbGuACdT1px3qJ0c8BBI24SB7qIODYblTkwjFDInRgDNZxlEXJNxY/RD5dsbkqakVl751NSpmf2mZatCmYZTvkdUPHe2km8sRAxGwbT5t6YuH70Xq5cOmWrYJB8Hh0oZKdlY/g/KhFsjaKtXy+A4cO0UrgIjCDbUGuj8afhxGyGyNPTni+UO6qdJoQCpI2Y3120xMCLz3H1h/+FWu1dwoKKbMMXPLMalLJvvti5RibK5s/0K4gbBu1S1QUGCgVuEHJm5sTDlBAYJpohO5e8qpvwdmXmOxJWXcT0eQtvqlOIjg/SNxELpI0eF01c1WhZC1iVom3f5eMYRZaKJlKy/OxOcoc0uAPEtCC3sAMjRg6X86+1n2GaGiiX2RCLJhFK7+zMDHLFv8Tho=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id cq16-20020a056402221000b0055f02661ae2sm2863630edb.78.2024.01.31.00.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 00:42:02 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v5 12/15] net: ravb: Move PTP initialization in the driver's ndo_open API for ccc_gac platorms
Date: Wed, 31 Jan 2024 10:41:30 +0200
Message-Id: <20240131084133.1671440-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131084133.1671440-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131084133.1671440-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The initialization sequence for PTP is the same for platforms with ccc_gac
and gptp (according to "Figure 50.71 Flow of gPTP Initialization (Normal,
Common to All Modes)" of the R-Car Series, 3rd generation hardware
manual and "Figure 37A.53 Flow of gPTP Initialization (Normal, Common to
All Modes)" of the RZ/G Series hardware manual).

As some IP variants switch to reset mode (and thus the registers content is
lost) when setting clocks (due to module standby functionality) to be able
to implement runtime PM, move the PTP initialization to the driver's
ndo_open API.

This commit prepares the code for the addition of runtime PM.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- fixed typos in patch description
- collected tags

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 318ab27635bb..54099fef946e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1876,7 +1876,7 @@ static int ravb_open(struct net_device *ndev)
 	ravb_set_gti(ndev);
 
 	/* Initialise PTP Clock driver */
-	if (info->gptp)
+	if (info->gptp || info->ccc_gac)
 		ravb_ptp_init(ndev, priv->pdev);
 
 	/* PHY control start */
@@ -1890,7 +1890,7 @@ static int ravb_open(struct net_device *ndev)
 
 out_ptp_stop:
 	/* Stop PTP Clock driver */
-	if (info->gptp)
+	if (info->gptp || info->ccc_gac)
 		ravb_ptp_stop(ndev);
 	ravb_stop_dma(ndev);
 out_napi_off:
@@ -2200,7 +2200,7 @@ static int ravb_close(struct net_device *ndev)
 	ravb_write(ndev, 0, TIC);
 
 	/* Stop PTP Clock driver */
-	if (info->gptp)
+	if (info->gptp || info->ccc_gac)
 		ravb_ptp_stop(ndev);
 
 	/* Set the config mode to stop the AVB-DMAC's processes */
@@ -2813,10 +2813,6 @@ static int ravb_probe(struct platform_device *pdev)
 	/* Initialise HW timestamp list */
 	INIT_LIST_HEAD(&priv->ts_skb_list);
 
-	/* Initialise PTP Clock driver */
-	if (info->ccc_gac)
-		ravb_ptp_init(ndev, pdev);
-
 	/* Debug message level */
 	priv->msg_enable = RAVB_DEF_MSG_ENABLE;
 
@@ -2861,10 +2857,6 @@ static int ravb_probe(struct platform_device *pdev)
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
@@ -2890,10 +2882,6 @@ static void ravb_remove(struct platform_device *pdev)
 
 	ravb_mdio_release(priv);
 
-	/* Stop PTP Clock driver */
-	if (info->ccc_gac)
-		ravb_ptp_stop(ndev);
-
 	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
 			  priv->desc_bat_dma);
 
-- 
2.39.2


