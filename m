Return-Path: <linux-renesas-soc+bounces-1719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BFA838F47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4AB2292887
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1485612F3;
	Tue, 23 Jan 2024 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ti8TJJXr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1827C60EDE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014794; cv=none; b=ReygVFb7fgv1gp44iccamx6DpRFs6Yi4uAmVCdjji5tKpNmdGzUXBkoa81wXlc+hhhXiGEOPc87UuzxlWoXW4EsJjZGhvpSMNGLi4AJAcsaqUq5N47y5CuisFjTiszpY966BRq/NaZRH5HUImJeya741+jDYFyaDulju91EZcTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014794; c=relaxed/simple;
	bh=GAfex3EeCPOP5cI6V5/XBZUeYcq3hRCugb2RoCTcDIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ajRk1/K2w6t1euU3qxCv2uRFwOZwEacMICRMF8XP21boVOT5+RNMJccty/fMrYB3YUDngiSe+drGhuJTRWrchncGaqdVgZ8fxb/+IB4ePrggPJ8HQzHgYoyCPLWe/kN0PzPt4icQTDfND84feTQHJFI912wZsd0Y8dnFrHNq06k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ti8TJJXr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-337d6d7fbd5so3108608f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014791; x=1706619591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gee9HyQUIxP/lOlV73mQEGTBYaMlN2Gud82I2snD3lY=;
        b=Ti8TJJXrVyNSkWt4/LQ3iQAdtT/hduqfZPWbO8tIv/sETH09Pb9WiSYh1Q7sIptpMH
         kRyf+RlG8GNmLtupoJDbQvFbg1MB7MD034YPKRJNnVy3GY749dMZc0NI9uMSUi13qy4X
         9NB1ZhyY+aX/k2TgwAwUA5AVSX6GBSE4vl5YnwgMci+vjZD1s/xA7a+t4LYTFUL7Uig0
         Jjy+rViQ4KheY8M8XGVmeh6/+/DAw4LOgSBftQFqPjrAsxoLl2Nx+VUxRtHpyIkv711l
         2KqjQR4R14LJ9yhVquyQLdlvaLt78TUuRz3iju/6QOTJgBfPoqWew//RQEY2bRMWhHXg
         tXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014791; x=1706619591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gee9HyQUIxP/lOlV73mQEGTBYaMlN2Gud82I2snD3lY=;
        b=MJM9toHEzb+aikrrfAsf+K0mlBozePQiFAtStugryD1cP0QVWuEcO34vDJycB018s8
         GOn7nmc0lkib3wrPvBqGpUYnPxQ5BgjATt+Rpz9xAc5KYL5URsD7xmJAn/eASQgkkrsP
         kw7N608SM5eKwXKdGKpsEbiXetRNmWNq5Bhh2AlqyMY+REGBeBq2Gy+JRcM4zgihgVxx
         n7zvIi+4a8/yXiKC99Z0Q8fYd0AqINzl6xe/DjS4Eiegrk+zY9rJ4tpUdsgre3e3hXFd
         Fnn4lOxC3Nnu/WaDoBJttr28JAfcj03ypkrfM9xP8Hwa57GEP3xs0fPu5Ssp3BqxKr+C
         5fLg==
X-Gm-Message-State: AOJu0YzNGICPNA+ov0d8iS3cg8a7gffZSGXf1fUbWIiF8C+tiEPPHCXr
	99+oxuVn1fUmv9rDp+XniL9hjxAfqKTQqKeP45a11x88D2PaXeTGmUxotP0bQ7E=
X-Google-Smtp-Source: AGHT+IHP6aM461l+fJb6gS6Dzbxboy8KQYTWPCasaDd9or9E6K2RV/TfXvZrITgSvXHUTE9OL+aGAA==
X-Received: by 2002:a7b:c4d0:0:b0:40e:937f:16d8 with SMTP id g16-20020a7bc4d0000000b0040e937f16d8mr122523wmk.50.1706014791440;
        Tue, 23 Jan 2024 04:59:51 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:51 -0800 (PST)
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
Subject: [PATCH net-next v4 15/15] net: ravb: Simplify ravb_resume()
Date: Tue, 23 Jan 2024 14:58:29 +0200
Message-Id: <20240123125829.3970325-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove explicit calls to functions that are called by ravb_open(). There is
no need to have them doubled now that the ravb_open() already contains
what is needed for the interface configuration. Along with it,
configurations needed by PTP were moved to ravb_wol_restore(). With this,
code in ravb_resume() becomes simpler.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- fixed typos in patch description
- collected tags

Changes in v2:
- none; this patch is new


 drivers/net/ethernet/renesas/ravb_main.c | 58 ++++++++++--------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 74568c836468..ff105e332396 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2939,6 +2939,20 @@ static int ravb_wol_restore(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
+	int error;
+
+	/* Set reset mode to rearm the WoL logic. */
+	error = ravb_set_opmode(ndev, CCC_OPC_RESET);
+	if (error)
+		return error;
+
+	/* Set AVB config mode. */
+	error = ravb_set_config_mode(ndev);
+	if (error)
+		return error;
+
+	if (priv->info->ccc_gac)
+		ravb_ptp_init(ndev, priv->pdev);
 
 	if (info->nc_queues)
 		napi_enable(&priv->napi[RAVB_NC]);
@@ -2978,53 +2992,29 @@ static int ravb_resume(struct device *dev)
 {
 	struct net_device *ndev = dev_get_drvdata(dev);
 	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
 	int ret;
 
 	ret = reset_control_deassert(priv->rstc);
 	if (ret)
 		return ret;
 
-	/* If WoL is enabled set reset mode to rearm the WoL logic */
+	if (!netif_running(ndev))
+		return 0;
+
+	/* If WoL is enabled restore the interface. */
 	if (priv->wol_enabled) {
-		ret = ravb_set_opmode(ndev, CCC_OPC_RESET);
+		ret = ravb_wol_restore(ndev);
 		if (ret)
 			return ret;
 	}
 
-	/* All register have been reset to default values.
-	 * Restore all registers which where setup at probe time and
-	 * reopen device if it was running before system suspended.
-	 */
-
-	/* Set AVB config mode */
-	ret = ravb_set_config_mode(ndev);
-	if (ret)
+	/* Reopening the interface will restore the device to the working state. */
+	ret = ravb_open(ndev);
+	if (ret < 0)
 		return ret;
 
-	ravb_set_gti(ndev);
-
-	if (info->internal_delay)
-		ravb_set_delay_mode(ndev);
-
-	/* Restore descriptor base address table */
-	ravb_write(ndev, priv->desc_bat_dma, DBAT);
-
-	if (priv->info->ccc_gac)
-		ravb_ptp_init(ndev, priv->pdev);
-
-	if (netif_running(ndev)) {
-		if (priv->wol_enabled) {
-			ret = ravb_wol_restore(ndev);
-			if (ret)
-				return ret;
-		}
-		ret = ravb_open(ndev);
-		if (ret < 0)
-			return ret;
-		ravb_set_rx_mode(ndev);
-		netif_device_attach(ndev);
-	}
+	ravb_set_rx_mode(ndev);
+	netif_device_attach(ndev);
 
 	return ret;
 }
-- 
2.39.2


