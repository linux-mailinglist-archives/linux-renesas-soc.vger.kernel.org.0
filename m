Return-Path: <linux-renesas-soc+bounces-265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F08B27F9C49
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 10:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D6931C209B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 09:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6787615487;
	Mon, 27 Nov 2023 09:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MPzl9jCx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4331182
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:43 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9ffb5a4f622so541090766b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701075882; x=1701680682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1Odgh8NQ+ymmAyVzkExaOV4kNSDq/6wv5PLiqzNFYg=;
        b=MPzl9jCxhIUN6DjkTUK94dkPbCkWZ1DjnfDjx6uOOvWT6PjCae5EzmolsWinzmZaDz
         K2Vixs6mgTPcu+u670olQFdDmbWA0nZf3A+wb15aMQc26Ga6DmyI6Yc1617gtHzxCf0o
         0Is6WO1rNR1GkZUxprIeqIGRu8ftoxs3D64nP4hGBzj+S/IcDIOlZp+UEJSPHCdoFdpm
         mttuZ05PnlSdRjjgPNxCtYtOQc/ivHVlSifejBhvbGzOOMMcz880QivPgMcWeACWCYmI
         IeBip2veRpGlkuGCRxiGYxyAFLZ/CjYkq8CzC13J7MlOe+FyIdyu2owObzrm77AuHCXI
         cItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075882; x=1701680682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1Odgh8NQ+ymmAyVzkExaOV4kNSDq/6wv5PLiqzNFYg=;
        b=I8r8BOK1Eej3nebm7OG8/wpqzJVMEXik/sUylNZn83XcgC6ux7W1vmeijXrsT73Rnw
         OgTjPni0VKGtLrB5OMUeUgylUf5uMHQN2KxptlSEMH2SbY3QfCev90+j8tv0pCM/7gHJ
         HUrvu2ae2b1TeLKTC32X4UvAyiIyZEX4jkUOFUpF66/YtdTmV748o/6nxJlfhE4hvSYi
         Cp//pVztP6KgB59PUc9OdfdD/5ij0Tvhr4QO+7Gw3WXzoCt3HfRVQ+qMfxyLEHLXgxQx
         AsAM6jKy0c+NgM45IhQEXcJSIBNRDpchvN+FA24pVN5RQ7/StEqkN9NRlZPCN3RG6C8X
         tbBg==
X-Gm-Message-State: AOJu0Yzluh7oD6I8byECZJGwr+0xoArn8MQNL70iwiOVqE7MmDu6EDrA
	1ljKcq7XfS70fMo+qWSVpG7inw==
X-Google-Smtp-Source: AGHT+IGyVXfUv1sDMUPq/6NZ7GqiTKqXeM9iCEMC+wqTiTcYkSKLXtlJyA2qzpJxPGOMLqTAsDKrKA==
X-Received: by 2002:a17:906:10d:b0:a00:2686:6b40 with SMTP id 13-20020a170906010d00b00a0026866b40mr6513858eje.14.1701075882183;
        Mon, 27 Nov 2023 01:04:42 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.125])
        by smtp.gmail.com with ESMTPSA id ay14-20020a170906d28e00b009fad1dfe472sm5456539ejb.153.2023.11.27.01.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 01:04:41 -0800 (PST)
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
	geert+renesas@glider.be,
	wsa+renesas@sang-engineering.com,
	robh@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com,
	masaru.nagai.vx@renesas.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/6] net: ravb: Check return value of reset_control_deassert()
Date: Mon, 27 Nov 2023 11:04:21 +0200
Message-Id: <20231127090426.3761729-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231127090426.3761729-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

reset_control_deassert() could return an error. Some devices cannot work
if reset signal de-assert operation fails. To avoid this check the return
code of reset_control_deassert() in ravb_probe() and take proper action.

Fixes: 0d13a1a464a0 ("ravb: Add reset support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes since [1]:
- added goto label for free_netdev()

[1] https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c70cff80cc99..50c4c79be035 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2645,7 +2645,10 @@ static int ravb_probe(struct platform_device *pdev)
 	ndev->features = info->net_features;
 	ndev->hw_features = info->net_hw_features;
 
-	reset_control_deassert(rstc);
+	error = reset_control_deassert(rstc);
+	if (error)
+		goto out_free_netdev;
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_sync(&pdev->dev);
 
@@ -2872,11 +2875,11 @@ static int ravb_probe(struct platform_device *pdev)
 out_disable_refclk:
 	clk_disable_unprepare(priv->refclk);
 out_release:
-	free_netdev(ndev);
-
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(rstc);
+out_free_netdev:
+	free_netdev(ndev);
 	return error;
 }
 
-- 
2.39.2


