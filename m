Return-Path: <linux-renesas-soc+bounces-309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FB07FB387
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 09:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 986A31C20CBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 08:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AAFA16408;
	Tue, 28 Nov 2023 08:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BhSlTlws"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5871FF5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 00:04:46 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-409299277bbso38149605e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 00:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701158685; x=1701763485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tex/f+v5XiThmeQ/1yf1Rnsid+DeltBdSjavRwGvUE0=;
        b=BhSlTlwsDX7EXSCG+VX6B79BvgoXHd3U8a/cpeGFbEjaV2osMCqUhL1pl4XF9LE0bQ
         iPwiKRrjO2grjbrzsg8VG4nqHOJRJGP8BDCO0SuLC0xuWcG/MGsCJrry6FTYGfFBFkQe
         rhCsCs8vcXl7YB+XR+OVZp8Nkz4hPDab+7zPn6DtAlpGmXmseDlEjry+8DyTE3Q0SRDF
         S01ZUwc8WvTwJsfEi6HLvdLa7IxdUoKiMm+gnW1DcEkdwk94w/vERWZyR/S8VCyshEvl
         UuKsydZip5vsibo/rNvTIu6QW2BxwpZd5MSQ4vy2tMxbcx4TDYCDdrLVv/+t7poAAXr/
         bhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701158685; x=1701763485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tex/f+v5XiThmeQ/1yf1Rnsid+DeltBdSjavRwGvUE0=;
        b=mogEBwZibI59DEEGJJtxj5ZULvRJ+ocvWRSbhbs7TOvtbFb513zMbtKqdxzU1zW5JH
         D5+3Z/IDRGFLnUAHHM3Zx8FISW2ICYpGEQ/QEahVGb5hWfUMNPLA0G7CPZBjYd0OIdWs
         we9m1FLkgXRtQuPkB0Oh26pzSX2WuaYKjX3pWCJzSF9hhOBsiHnC+bkGzN0yiPfcniAc
         h+aqNo8F9vJUTtjglJRV/7hYwJKQlXIn5PXDo2QjNP0jYC465p+ieUhf5nLaEjsQse8Y
         3Q+kAd5oDrglHE6+PmdGm2POsdAx44sMt+wcIjccvhFAm74qZQ7AAiScopQtsqHFgvRd
         AgIw==
X-Gm-Message-State: AOJu0YwV7GbibLRruhAENcNwdKapM7n+1mbpy+2TnDKBHGG9mL/Yt20w
	aPVNYbCgsn98rB+TOFK5KjzicQ==
X-Google-Smtp-Source: AGHT+IFiDsJyWYZmV3dZR43yD6C7sj8hAw5H2KlFm+QwzJszuvuTxrXcIrJdx2qTTyted2pjAXexOQ==
X-Received: by 2002:a05:600c:1381:b0:405:3455:e1a3 with SMTP id u1-20020a05600c138100b004053455e1a3mr9383229wmf.17.1701158684750;
        Tue, 28 Nov 2023 00:04:44 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.125])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c4ed200b0040b4ccdcffbsm1127534wmq.2.2023.11.28.00.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 00:04:44 -0800 (PST)
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
	renesas@sang-engineering.com,
	robh@kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com,
	masaru.nagai.vx@renesas.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] net: ravb: Use pm_runtime_resume_and_get()
Date: Tue, 28 Nov 2023 10:04:35 +0200
Message-Id: <20231128080439.852467-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231128080439.852467-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231128080439.852467-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

pm_runtime_get_sync() may return an error. In case it returns with an error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- s/out_runtime_disable/out_rpm_disable
- collected Rb tag

Changes since [1]:
- added goto label for pm_runtime_disable(); with this innecessary
  changes were removed

[1] https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 50c4c79be035..0af2ace286be 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2650,7 +2650,9 @@ static int ravb_probe(struct platform_device *pdev)
 		goto out_free_netdev;
 
 	pm_runtime_enable(&pdev->dev);
-	pm_runtime_get_sync(&pdev->dev);
+	error = pm_runtime_resume_and_get(&pdev->dev);
+	if (error < 0)
+		goto out_rpm_disable;
 
 	if (info->multi_irqs) {
 		if (info->err_mgmt_irqs)
@@ -2876,6 +2878,7 @@ static int ravb_probe(struct platform_device *pdev)
 	clk_disable_unprepare(priv->refclk);
 out_release:
 	pm_runtime_put(&pdev->dev);
+out_rpm_disable:
 	pm_runtime_disable(&pdev->dev);
 	reset_control_assert(rstc);
 out_free_netdev:
-- 
2.39.2


