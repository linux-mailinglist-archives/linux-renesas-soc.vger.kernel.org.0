Return-Path: <linux-renesas-soc+bounces-2273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D797846B1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 09:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 871C91F2B8F1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Feb 2024 08:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74AE7BAFA;
	Fri,  2 Feb 2024 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="okuZDAAz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2287979DB0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Feb 2024 08:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706863347; cv=none; b=NfZqnzs51eTLR7608dGlpbuf2s+mrhfEI0wuUhMgUIZu4pOWid3F2hti9fu2dNVeHiqtKCm9SjLFxxt+JKzCQzSsmiSpPrLDtaEQGGtc2yVaKZVuKbdLYRH4plXqpiJP+QnaaloVegj/6H1+nW7QFqZ3kVa2nhfGzaYCbqXRyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706863347; c=relaxed/simple;
	bh=JVshC7X6jp5iUKQ3s53GX1xxIrB2+jX9y0nLCqWFTPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B8AtFaFVc5VxUFWjEqqNh9qOAyb7FMDC45ywkEx5eisfX257f3fIJsCjvHBdcTtzWDf81Bm3qBcCo1zP1ZgnMK1Ds8AnJ/L8FcKHzsbdTGbG03D6OZWN75b+BG+hfCIBtlHIxX4gR01PzAaJOsmMRQ6ZCE60t8F3hscvqF6hgfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=okuZDAAz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a30f7c9574eso259956366b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2024 00:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706863343; x=1707468143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs60FNMiWlxCExO9vXRMyYdFHoUSgLYGgL3+MWbZfl0=;
        b=okuZDAAzUXE75QcoQMgYt8AbbK6Lm4tfad8raYYdggk8Yq9VjjePA7YmSR7H/3YAYa
         68XgwWww7ODalzJxzYOwn0xS+v3/HKODS9APIAFutNLYT4hWY/jpc3QH/mw7mn11TUiI
         Yrv0rJ4//nVxOT6FKhs1lGH39T2t7OcWGlDWNryjPiX+Yv/H6Sizx8Mzq+rto7TLALcY
         SVfNE9AiGH0BvIktKfe60kIadRTXAZhQp/czjMF/qE31vvFHdQ8bk/Llb759CbFhd9uP
         B+NPfIY8CSqzUm+qokS26xW8OwKhpmLE4kR3yMAZQFVH6tAgyvtUij0FsQgykDg6AAnX
         EfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706863343; x=1707468143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zs60FNMiWlxCExO9vXRMyYdFHoUSgLYGgL3+MWbZfl0=;
        b=ZC4ORXq4R8gke731x6PnnPlxttAChHKjAE8gv72pYN0BcF9eeX9tZ/s117lH41h8uv
         Q2bjNCfmSV+DJCGLKDIpCs5nCuUmtztQCj+3Mnv/sbLXB8LgNDXhPPsz7CrzKiF4Kdfi
         5u+CWe2RUhRkP+r3qb1KTBddHkIB7kzbzMywI4x3BeY1BNzKzDFnBwg7/hQgCz4MZ03t
         Fq7BvEDYkYSatH0OwqYOqaonS8Hdv0G5Mpq9f0BzOlRZVVgj+sQ/HjgJvwOlgUtD0tKL
         Mo6+1bNaGYztnOQ2D6F9GFyD7nYawqqLSPSpDwLC0HvDZsMdvzOgAVdaOCve/iC3ZWFP
         A+Pw==
X-Gm-Message-State: AOJu0Yzz2wYWwLjC2PdMz72SFs8452co/qBjhEFujfmdvLmCmSiGbYb6
	cLzQT8J6CePqni71yfrmph2+W+SmUAq+1OGO5ojHeyQ4FcU8dQulohLZNvGm7as=
X-Google-Smtp-Source: AGHT+IG/E0v+iAcGvMeGvRSwVa4WaMqCJFtf7Z6fBkY1Kjgb9SwRU/k9I63KBz/mL+Z54gJwA5dpzA==
X-Received: by 2002:a17:906:4091:b0:a36:c2a5:d0f8 with SMTP id u17-20020a170906409100b00a36c2a5d0f8mr2636274ejj.34.1706863343447;
        Fri, 02 Feb 2024 00:42:23 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV6vjdQXUgGOWlqpX6qczcGspOtnavdUK6B7HzFv5OJ5Kx5Ig9kuPoufI1yMbwbPMEfjLk+ZmjiDcbiavmeQ3515+3J3r/LOIZxpksIW84pHGjJdsx9UxcQfoxPeVPeXgxtBzll0mDJy6ZXfeB3hX/UMkiZ9mTCT9mRBPmech8EAyykwCI9MOx1UQCf+NI6qLUa5T8iVy6SNr6twlzNwz07l+CzMwDYep5+Z8+AWosPrA4YkHPNBB//jVeUOeaR88axT1VOcVHxa/od5Igi5mB8pLCQdmwvZRv3SzVVr89S61EKkn4vIAVZypLuOQY72vz6tRXg8U7A1ROJlyw7fFWhqA3afFASBKz/4JBoq2rRJD3OxSEOti9Pq5gwTVZXmu3Oo7YIPHlKk5SuAg==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id oz35-20020a1709077da300b00a361c1375absm631642ejc.133.2024.02.02.00.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 00:42:22 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v6 15/15] net: ravb: Simplify ravb_resume()
Date: Fri,  2 Feb 2024 10:41:36 +0200
Message-Id: <20240202084136.3426492-16-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240202084136.3426492-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes in v6:
- re-arranged the tags as my b4 am/shazam placed the Rb tags
  before author's Sob tag

Changes in v5:
- none

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
index 661236affa5b..9521cd054274 100644
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


