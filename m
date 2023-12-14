Return-Path: <linux-renesas-soc+bounces-1043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290A812F1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1B91F21454
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A578141222;
	Thu, 14 Dec 2023 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NVaV6MdF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B4210A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:24 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a22f59c6aeaso253610366b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554383; x=1703159183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YimeFaEHAC3lIu4QGMGIH0XFkFOK3pB7g8Rtk8OXULw=;
        b=NVaV6MdFFn44vQOJ+T5Ea3KVQg2gyfSQXRtVBG80811Bw1y0QPFHPnbE4xxMd+RmZU
         ShxVe3PU8hmFyrjsBHGkZGl9MSKMm69RyYy0apLcy6a1d/bTymZGSqOPk3xjWv4vCduE
         2NPAi35pRpgZu49R0TkEIcgE7u29CEj/sDijwTHMbMBU47gGANB4NDekfWi5fh2jGKPr
         EpamgjlewSiqBb/ttqQUdgoB8sX4bze6b7gj0qOWzI4wR7bAat6hkDyZQQm4OhNspXFz
         cRIF11Ide+Z/p0WaZ4taEohoG8LPWitYv3Xd9k/BJyE5RYsmKykNZkZJIKQPtTdJnM3I
         mu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554383; x=1703159183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YimeFaEHAC3lIu4QGMGIH0XFkFOK3pB7g8Rtk8OXULw=;
        b=PvSOO3gmdP6GUffTAfD6+fonCJ4F9H2HzSnlY6lKlwBi3Me+ErE1RxvpT1fw322Uhj
         rhyzBFTfI+ObACrozkm9/MZgUeYWeQfXdmxT+VzGC/mCLbPnWcNKMEo4UC3+bGU831+b
         wO5xZxTrCiLHzyw7155O8IBIiE6J0SJ40D6zrqyLZ5OWvfCwHLo8RBFvfEmXzy0K+cBG
         9Mt3b/nEINybMiCMD6UnPeBSA+3i94TCsSKh0OgV/+s52xPVfYjwFnHs6jc7gpSaKF/e
         IzA1zllTP6l+F5SgFTnUkSnqGRZ6Cq8/LzmtvhGhcGJ+jpzAD4gVc7I+re6+CChY52yM
         S/+w==
X-Gm-Message-State: AOJu0Yymg1t5w1Q5Pny6eAl+bFhMASmsLP8L0U6h/fmcqqL+UIiKFt/w
	dHwGWhkN6BNEu1PLxwmhE4Bq8g==
X-Google-Smtp-Source: AGHT+IGCn2/UbIdGnznzhJ0TGCQKSt7Gts2t4IoBzSpbr36Rkj3nYjorrXYeBtJoiUGaYtkZs1R4kQ==
X-Received: by 2002:a17:907:2955:b0:a02:8b23:895d with SMTP id et21-20020a170907295500b00a028b23895dmr3746075ejc.35.1702554383237;
        Thu, 14 Dec 2023 03:46:23 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:22 -0800 (PST)
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
Subject: [PATCH net-next v2 03/21] net: ravb: Make reset controller support mandatory
Date: Thu, 14 Dec 2023 13:45:42 +0200
Message-Id: <20231214114600.2451162-4-claudiu.beznea.uj@bp.renesas.com>
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

On the RZ/G3S SoC the reset controller is mandatory for the IP to work.
The device tree binding documentation for the ravb driver specifies that
the resets are mandatory. Based on this, make the resets mandatory also in
driver for all ravb devices.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes in v2:
- collected tags

 drivers/net/ethernet/renesas/ravb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index aa5e9b27ed31..b4d5a14ac4e5 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2645,7 +2645,7 @@ static int ravb_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	rstc = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
 				     "failed to get cpg reset\n");
-- 
2.39.2


