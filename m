Return-Path: <linux-renesas-soc+bounces-1059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB612812F52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DF8EB21702
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94A84123D;
	Thu, 14 Dec 2023 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Y+m+p6IK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41A0D7E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:51 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a22ed5f0440so390724666b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554410; x=1703159210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14qVcRtLUoxmGTGt0RCexgzno6C/e+ZUicAuIzWdGM8=;
        b=Y+m+p6IKW7np4yvKR3QIsaIFRHZ7BtcGXWxM4p8gan3plrP0UJWam9zMILEllQkOzp
         9nZN8tWs/6VP5hNn3BckBwe7B/eqIQCO7fPH1Oi+aUwC+3Z5UpDue3sPEIHUIi4UfXIw
         opqQIr70z9f/1eoxLlCdkFD6MeuIcs01NdJ02GBfLxJVFCIa4TEQhspGGBKjZS6oQWA5
         M6JYjyYoaPDkaubYLYJa22KQLuhKyqaFSabc7V0+ow5EIAOgEe/tmqj3cObCJPrbHmJc
         u5sf/tc9qqJS8vmUDg0InKcv4zyuaHnqYfJVCYlkQ5nd/cYang+ex3iHP6Igy2DlGDBn
         vMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554410; x=1703159210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14qVcRtLUoxmGTGt0RCexgzno6C/e+ZUicAuIzWdGM8=;
        b=hCXQ+ojBX8bZdCZ5XSTbKNXDYaIAIZK+bxIFPtC2h4kYgdJqi2HGALyI5LErw4JOHV
         6cH7uAs/MkE8nwjVn8uZm/skZVHtRaE4bNqZlAsbk+8FfcSXeppzI6o9TRrlL77r4QjT
         ufomH0Hk7ahMMNMiQJTN5gR7USH0OfNywpNmyvKEjFrXzM8DxkviCxk8fchpThis6PEO
         YLy/nyjf2VQHkMqMCq+jpktwR2rhk3SO45UlzDrdQX57HPYIm9PuvHO6WIUn/mwaV/AE
         pY1EXDphswzNbZ9INFA1ZPimYlrHpRefTIeon6TsENYKwxQtKv8g6nQGX5XBztWy1yvL
         ra2g==
X-Gm-Message-State: AOJu0YxJUjH78YiDOJcJ4IH16jffqkJu+nioza0AL7UoCxUtOufZG5zK
	LRkA5cfmv5LNyzqKCRWfYveMmg==
X-Google-Smtp-Source: AGHT+IHmclDok0JjLUg0rjrhrqia2ROzMPs6mwFhPJ8AeOdZc7oPAsNAsr5T6UPZrffIVAhz+HTrRA==
X-Received: by 2002:a17:907:7d8b:b0:9e3:f24d:5496 with SMTP id oz11-20020a1709077d8b00b009e3f24d5496mr3578988ejc.28.1702554410066;
        Thu, 14 Dec 2023 03:46:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:49 -0800 (PST)
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
Subject: [PATCH net-next v2 19/21] net: ravb: Do not set promiscuous mode if the interface is down
Date: Thu, 14 Dec 2023 13:45:58 +0200
Message-Id: <20231214114600.2451162-20-claudiu.beznea.uj@bp.renesas.com>
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

Do not allow setting promiscuous mode if the interface is down. In case
runtime PM is enabled, and while interface is down, the IP will be in reset
mode (as for some platforms disabling/enabling the clocks will switch the
IP to standby mode which will lead to losing registers' content).

Commit prepares for the addition of runtime PM.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 1995cf7ff084..633346b6cd7c 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2164,6 +2164,9 @@ static void ravb_set_rx_mode(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 	unsigned long flags;
 
+	if (!netif_running(ndev))
+		return;
+
 	spin_lock_irqsave(&priv->lock, flags);
 	ravb_modify(ndev, ECMR, ECMR_PRM,
 		    ndev->flags & IFF_PROMISC ? ECMR_PRM : 0);
-- 
2.39.2


