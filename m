Return-Path: <linux-renesas-soc+bounces-2427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D222984CA82
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 13:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 416A91F27EF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Feb 2024 12:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDE45C61D;
	Wed,  7 Feb 2024 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PsQOPt2F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D742B5BAE2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307678; cv=none; b=ApjQ7pBBRC3eIQkh5U8XYQi1oENO54VubwquVb/+BaKEe7DY4ajCq8esO9ogwtSU7JDxDhPOT0ehMLvyMHCAcLktY/psEd3MC7d9v3smgH5MFa0YHl/ZgQS3jNuzNilkBOzoERDNcpLcncorTK++mJJ0YUdcnRz/+Rp1zYHps9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307678; c=relaxed/simple;
	bh=Bnaw5Bul5W5Zl0rFQE8Xh95+4KfAdY3EvMYCv8nCePU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iehMwRXlt+cqT0f6VhAvOUouzKMgDtuHGVZJWcGn3HWrcW61qYe7ABkcD9cFnoUXQp1/Fnnnqrwx9ucIMWGQelRp8puAHfQ3DFYiyRoYzAANhoUy6OFj9q2HPctmRinXn5cIjYmOHSZ/MxWk1dnEvj7ZM//h1BooG/dUFzZRJSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PsQOPt2F; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40ff28388a6so4760735e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707307675; x=1707912475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLK6/a0FK8Ot1/f5skgmNRY6U/7ORDdebTOrPjkUupc=;
        b=PsQOPt2FwsKCg0rQ5sY5IPRX1xYUWK4h8tDurcgejrTzOgMlF2pNZCEyXd9C87qruA
         2eFGcI0xeas8N9c0ZG8h6DBKf5pT/w/omd0B+AkWZRURER0m6EUA3yzKSLBdte/Fv7h+
         J9Ft14VKa9B7Wexn6tLnLxPTd3FaeM1moTNmBS5hJj4ugRL0ybThOy23w/2ptvf7M3D0
         zltZ3aOERHHYmcj6etSH4NQsYJZypRHmgb+pfzgUd6n+jUNyw42UcYalZ/kkvHVZQZcT
         lEb/fZo74yI1fDE2+kT1c3nyCRRcCTN9wMDreaRwNLj9fJZrmfteKvA85NlqP7/KRg2e
         Gu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307675; x=1707912475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LLK6/a0FK8Ot1/f5skgmNRY6U/7ORDdebTOrPjkUupc=;
        b=hO/J3QLObdqbapCfIxbjj4jmbdQvK3qhTPc4yt9+VmPvWz0IWJm2r5aznI7wbMDyiR
         ghnGVpauMS3xbiTftOtTUarD1Zg4XQ/4Q+Uf4c5OMipOe4XUUVmluq03VjsBLEzox2fC
         wxWLgN5T71aCh2Auomz7ydyrSxdj0IBkTBZusPU8pJpnNBoOLZDggf0A376cqlpq5IP1
         18H83nQa7qw0mzQP/b+p1Cisiy8sc/PVmi1AMFrBPSCe/Fg2/88mUSdM/NFYf9xeRcNG
         a2x0yDwPCt6Ppy37NOGwm3ZrHkc0hmNEztFPvWBvVP3u5Y0/RXOGCwNKIsNtKAyxaqez
         flCg==
X-Gm-Message-State: AOJu0YzdxY+Ny7JphEGAcKbgtB0NtnTbwE+mqPRMLIDs3hFhie/Pzil/
	C9NPQRG5xQP81KeScPrwOEBdJWKB/my9Gx/hhzJJuU/dN4YSdAOwPDB+4WePscMCaNxIMaN2ItL
	b
X-Google-Smtp-Source: AGHT+IEnt6F2h6a8gk7EjM1o+O0oLmbs31iPHhmUAfGKE1+FZAi1muDHEw85MriR63sQmrlBH7tVCg==
X-Received: by 2002:a5d:42ce:0:b0:33b:159d:8222 with SMTP id t14-20020a5d42ce000000b0033b159d8222mr3115028wrr.23.1707307674942;
        Wed, 07 Feb 2024 04:07:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXb11E56lbQq1EfsOR7tjqVyUPeRtwU8Zow6DtY9W25t78y/rDocODfy5CjN9i/AMBHyRscCgMXwp4+8t0htzMjnLJWF01eg5RMG1zWxQv5lRKPJ0qpwVUcaSkeNqbN5ovi2T3KRBL06uRm89KRWW6lfYrd6AxMwLqjRDfJyXbYtLxb88M7VbU17d4L61YZO//ZtHR5wMSURVcvKX/qPZC2ugH63b6HI07fymnE+JtmFDXo6ZPloRCtPU78/n9rqB7mPJhNzJANy7KHL3XOKZeTBulvThSkp4NnEEosarHCxAx/sSBXQ0hILuuGkToqQz4dAN/gkJkL5uE=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d50c2000000b0033b4db744e5sm1363957wrt.12.2024.02.07.04.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:07:54 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next 3/5] net: ravb: Return cached statistics if the interface is down
Date: Wed,  7 Feb 2024 14:07:31 +0200
Message-Id: <20240207120733.1746920-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240207120733.1746920-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240207120733.1746920-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Return the cached statistics in case the interface is down. There should be
no drawback to this, as cached statistics are updated in ravb_close().

In order to avoid accessing the IP registers while the IP is runtime
suspended pm_runtime_active() check was introduced. The device runtime
PM usage counter has been incremented to avoid disabling the device clocks
while the check is in progress (if any).

The commit prepares the code for the addition of runtime PM support.

Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes since [2]:
- use pm_runtime_get_noresume() and pm_runtime_active()

Changes in v3 of [2]:
- this was patch 18/21 in v2
- use ndev->flags & IFF_UP instead of netif_running checks

Changes in v2 of [2]:
- none; this patch is new

[2] https://lore.kernel.org/all/20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 0f38e127ad45..4f8d5c9e9e03 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2155,8 +2155,15 @@ static struct net_device_stats *ravb_get_stats(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
 	struct net_device_stats *nstats, *stats0, *stats1;
+	struct device *dev = &priv->pdev->dev;
 
 	nstats = &ndev->stats;
+
+	pm_runtime_get_noresume(dev);
+
+	if (!pm_runtime_active(dev))
+		goto out_rpm_put;
+
 	stats0 = &priv->stats[RAVB_BE];
 
 	if (info->tx_counters) {
@@ -2198,6 +2205,8 @@ static struct net_device_stats *ravb_get_stats(struct net_device *ndev)
 		nstats->rx_over_errors += stats1->rx_over_errors;
 	}
 
+out_rpm_put:
+	pm_runtime_put_noidle(dev);
 	return nstats;
 }
 
@@ -2265,6 +2274,9 @@ static int ravb_close(struct net_device *ndev)
 	if (info->nc_queues)
 		ravb_ring_free(ndev, RAVB_NC);
 
+	/* Update statistics. */
+	ravb_get_stats(ndev);
+
 	/* Set reset mode. */
 	return ravb_set_opmode(ndev, CCC_OPC_RESET);
 }
-- 
2.39.2


