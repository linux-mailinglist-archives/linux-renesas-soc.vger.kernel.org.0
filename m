Return-Path: <linux-renesas-soc+bounces-1038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC828812EA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:35:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3FEC2823E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21B0405C4;
	Thu, 14 Dec 2023 11:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ON25wB6i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8A0B2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:35:21 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54f4f7d082cso9014038a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702553720; x=1703158520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0gHZD3cMjj9yW82P6ku1zzmvNbHgS+iySEVHglaLUs=;
        b=ON25wB6iif8pQ8JbWWTOsZvcVpQ1NRhji2psljlVEiyuM2D4xpRMS05hGtmrkXhy4u
         EkrzaiJYu5eN4NCiJOg6zkX/tpi6cZHAzhNXvADe8etauAcZRrtg3xXxP/CqfmanEoyN
         KEAloUs7HYU5IfJ3vACFMXyGrDTi+f5+YacsYiCPrsRRY0gc6JgYWCiXtbM7Ff2iJJcC
         0tjoIw4+MVwU1LWPNsF965vloS6RziyiEWcR7PqNVwe0gEDDvZFdxj+IoPVFy6HIafYP
         YbPeVcX4tl8vme5MPSCWM5BmquJcv/27iweqwkmmEwhiqkxZPbR9IkHKNqLk6+9b6c4N
         EEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702553720; x=1703158520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0gHZD3cMjj9yW82P6ku1zzmvNbHgS+iySEVHglaLUs=;
        b=UOGI4trabZLIUm0AlqnJCrF3Badyc0JoymzSRlRNxvl7TrTDu1YIhlyZAIEqg7IdFO
         JRRjoqxJydpRFk9Uaoaprfqr7be96A4hikSyl3DT8Ul2Wvd/JodYscSdJ/pjP8jVLiAP
         50oUDTL2i2ietLzgS6LUBdkOLLstipUADOBT0JQg2SD2Y36rwZ9oH26PQmguociOYqXl
         egY0bqPpHRY95anaM88YZ3Xjk4X1y942dGXT5JhJFXwBtnJ8+5PKj2oCagOfSqQ5mVmG
         cNpZ7h8YP6aufsKt/Jnc9cSLQG4imNwZ8lJTwII9Z87V9hlmEZ3zYJQcbl6PjExpnIPn
         mEwA==
X-Gm-Message-State: AOJu0YxXM07d/H7li9bZXEevd0xfPtA5sASd3NyQq35FnUqdFfBdxa0s
	BIwZ/UdOU/x+bt/Xhi/72Sg0qg==
X-Google-Smtp-Source: AGHT+IEPIr5qMUSYS0pZ2a7PQpJRpsOGm64wMN0YrTZ+S3/KOSq0LgrO6aEFgz9CNy3ht0DWxckSkw==
X-Received: by 2002:a17:906:d95:b0:a19:a19b:78bc with SMTP id m21-20020a1709060d9500b00a19a19b78bcmr4403151eji.127.1702553719861;
        Thu, 14 Dec 2023 03:35:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id vx12-20020a170907a78c00b00a1ddb5a2f7esm9290656ejc.60.2023.12.14.03.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:35:19 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	claudiu.beznea.uj@bp.renesas.com,
	yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com,
	niklas.soderlund+renesas@ragnatech.se,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	mitsuhiro.kimura.kc@renesas.com,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 1/2] net: ravb: Wait for operation mode to be applied
Date: Thu, 14 Dec 2023 13:31:36 +0200
Message-Id: <20231214113137.2450292-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

CSR.OPS bits specify the current operating mode and (according to
documentation) they are updated when the operating mode change request
is processed. Thus, check CSR.OPS before proceeding.

Fixes: 568b3ce7a8ef ("ravb: factor out register bit twiddling code")
Fixes: 0184165b2f42 ("ravb: add sleep PM suspend/resume support")
Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
Fixes: 3e3d647715d4 ("ravb: add wake-on-lan support via magic packet")
Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 47 ++++++++++++++++++++----
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 9178f6d60e74..ce95eb5af354 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -683,8 +683,11 @@ static int ravb_dmac_init(struct net_device *ndev)
 
 	/* Setting the control will start the AVB-DMAC process. */
 	ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_OPERATION);
+	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_OPERATION);
+	if (error)
+		netdev_err(ndev, "failed to switch device to operation mode\n");
 
-	return 0;
+	return error;
 }
 
 static void ravb_get_tx_tstamp(struct net_device *ndev)
@@ -1744,6 +1747,18 @@ static inline int ravb_hook_irq(unsigned int irq, irq_handler_t handler,
 	return error;
 }
 
+static int ravb_set_reset_mode(struct net_device *ndev)
+{
+	int error;
+
+	ravb_write(ndev, CCC_OPC_RESET, CCC);
+	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_RESET);
+	if (error)
+		netdev_err(ndev, "failed to switch device to reset mode\n");
+
+	return error;
+}
+
 /* Network device open function for Ethernet AVB */
 static int ravb_open(struct net_device *ndev)
 {
@@ -2551,10 +2566,11 @@ static int ravb_set_gti(struct net_device *ndev)
 	return 0;
 }
 
-static void ravb_set_config_mode(struct net_device *ndev)
+static int ravb_set_config_mode(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
+	int error;
 
 	if (info->gptp) {
 		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
@@ -2566,6 +2582,12 @@ static void ravb_set_config_mode(struct net_device *ndev)
 	} else {
 		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
 	}
+
+	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_CONFIG);
+	if (error)
+		netdev_err(ndev, "failed to switch device to config mode\n");
+
+	return error;
 }
 
 /* Set tx and rx clock internal delay modes */
@@ -2785,7 +2807,9 @@ static int ravb_probe(struct platform_device *pdev)
 	ndev->ethtool_ops = &ravb_ethtool_ops;
 
 	/* Set AVB config mode */
-	ravb_set_config_mode(ndev);
+	error = ravb_set_config_mode(ndev);
+	if (error)
+		goto out_disable_refclk;
 
 	if (info->gptp || info->ccc_gac) {
 		/* Set GTI value */
@@ -2893,6 +2917,7 @@ static void ravb_remove(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
+	int error;
 
 	unregister_netdev(ndev);
 	if (info->nc_queues)
@@ -2908,8 +2933,9 @@ static void ravb_remove(struct platform_device *pdev)
 	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
 			  priv->desc_bat_dma);
 
-	/* Set reset mode */
-	ravb_write(ndev, CCC_OPC_RESET, CCC);
+	error = ravb_set_reset_mode(ndev);
+	if (error)
+		netdev_err(ndev, "Failed to reset ndev\n");
 
 	clk_disable_unprepare(priv->gptp_clk);
 	clk_disable_unprepare(priv->refclk);
@@ -2991,8 +3017,11 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	int ret = 0;
 
 	/* If WoL is enabled set reset mode to rearm the WoL logic */
-	if (priv->wol_enabled)
-		ravb_write(ndev, CCC_OPC_RESET, CCC);
+	if (priv->wol_enabled) {
+		ret = ravb_set_reset_mode(ndev);
+		if (ret)
+			return ret;
+	}
 
 	/* All register have been reset to default values.
 	 * Restore all registers which where setup at probe time and
@@ -3000,7 +3029,9 @@ static int __maybe_unused ravb_resume(struct device *dev)
 	 */
 
 	/* Set AVB config mode */
-	ravb_set_config_mode(ndev);
+	ret = ravb_set_config_mode(ndev);
+	if (ret)
+		return ret;
 
 	if (info->gptp || info->ccc_gac) {
 		/* Set GTI value */
-- 
2.39.2


