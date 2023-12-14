Return-Path: <linux-renesas-soc+bounces-1053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E608A812F41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DDDFB21538
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2816E41224;
	Thu, 14 Dec 2023 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="CDEYaeaE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB95D54
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:43 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bf32c0140so9073332e87.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554401; x=1703159201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cT7sZVhk3SPH3qfWzj9p6vjX2dF9hm4OYxHa78CzWQ=;
        b=CDEYaeaE6qduuOmQss6XjTpBXM3l7gS2mus6VDSWgpvsyp5VVU14HtMHCVJG7z5rUX
         YkkdljRVLrtBpLWUoHHqmN73+boOi/tndrwdDrNwO03k5sScGTIoyMZv1EMB9KzhPAdV
         eXXr99nB4SQRzrDPDnMsfLd9I1uVo01hmH1PSXz6sI5ltOtO3eq6pA/gfxEnt6WqZuYj
         GskgPJd7cirHQ9sde+NaB75o769xgmBDu9vcb2MvmzihbVAzZ3NPbsrwmjHek5dOwurS
         Azdv0m4nc37IAPXIyl2lCCV0+9Fl9g/XAyvZ1Y7JV+lGnX9hALmkfZJVJSqAUdHGps5Q
         2UYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554401; x=1703159201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cT7sZVhk3SPH3qfWzj9p6vjX2dF9hm4OYxHa78CzWQ=;
        b=gGPHM2mBgXrHvTEtgKJcp57mpNB5RFY9zjb51n8GFU1pD16LRIjvdYIUw0AtBdOLe6
         QrQBtwD8bqF9SoXcGHZaAaKV6WMKuDt9HvsfeM6uCKW4abxi+yDLrcHdfrcbfLFiSK7N
         B5JYa3gQ9wNXBN4gK7v/K2IJMnTzBEDqj87LMkL82P/1aksG7VfI5Unqgl2gu7Yawl66
         mHcLNsY7cp+nHsM/0ksCzVv0ch4I0nqDmQrJXB6XdcHJlhCylLPt9MHHEPG8XVAk5EIY
         Erc5RwI5w1LXLnFJsG39td0jXHmvwV1PDDTalWJxEG2Q7nSRsl4Y+8FE7pzjkVVUHXbZ
         6JEA==
X-Gm-Message-State: AOJu0YwZMkbO3ZXZn9MHBTeMrbfkaf8xM88gx1JKswsYtQwYi6tZxsEf
	3JAHwzrLnDMFXehIC6SVWxtsCQ==
X-Google-Smtp-Source: AGHT+IG971WfjyERHQhZ0TdR63Dq7y7Fb1xD2Xpc2eRNcB9COcCGSdCFifT0aHwVpfyDHrdNy75McA==
X-Received: by 2002:a19:ad44:0:b0:50c:2fc:cac with SMTP id s4-20020a19ad44000000b0050c02fc0cacmr4070502lfd.126.1702554401526;
        Thu, 14 Dec 2023 03:46:41 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:40 -0800 (PST)
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
Subject: [PATCH net-next v2 14/21] net: ravb: Simplify ravb_suspend()
Date: Thu, 14 Dec 2023 13:45:53 +0200
Message-Id: <20231214114600.2451162-15-claudiu.beznea.uj@bp.renesas.com>
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

As ravb_close() contains now the call to ravb_ptp_stop() for both ccc_gac
and gPTP aware platforms, there is no need to keep the separated call in
ravb_suspend(). Instead, move it to ravb_wol_setup(). In this way the
resulting code is cleaner.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 31a1f8a83652..16450bf241cd 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2968,6 +2968,9 @@ static int ravb_wol_setup(struct net_device *ndev)
 	/* Enable MagicPacket */
 	ravb_modify(ndev, ECMR, ECMR_MPDE, ECMR_MPDE);
 
+	if (priv->info->ccc_gac)
+		ravb_ptp_stop(ndev);
+
 	return enable_irq_wake(priv->emac_irq);
 }
 
@@ -3000,14 +3003,10 @@ static int ravb_suspend(struct device *dev)
 	netif_device_detach(ndev);
 
 	if (priv->wol_enabled)
-		ret = ravb_wol_setup(ndev);
-	else
-		ret = ravb_close(ndev);
+		return ravb_wol_setup(ndev);
 
-	if (priv->info->ccc_gac)
-		ravb_ptp_stop(ndev);
-
-	if (priv->wol_enabled)
+	ret = ravb_close(ndev);
+	if (ret)
 		return ret;
 
 reset_assert:
-- 
2.39.2


