Return-Path: <linux-renesas-soc+bounces-1041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC36812F19
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF6791C2152B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFC841215;
	Thu, 14 Dec 2023 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aBCyfvzf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9B1711A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:21 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-548ce39b101so10887184a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554380; x=1703159180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOZAMEvogW3XDicAaSrKeFR75wLTaTJmQUaxz//D884=;
        b=aBCyfvzffeuy42b2a47jBeJGrg53dY+MTmMzoc7yMX7VflA5yHr0WL7S68E4JNifGL
         KX6bZomu8uTJJaZZIS6nlHo9+XvgF9AaHiOmieyFEiuxYPQ86d9SqUkFEUB6edAoQo73
         VESw2BtfPzNGCvPWudZMpFasmOmr3kME8U4VaXnzdjAThNxHcnku8ZAjVWxNM3PqcPIe
         31fqqntHiX+5FVMekoykFVKbQehCe8JFIrbyAd4NBgCGclXP0C8EMMLy8ezhrpUSVnCG
         m/Dttb3Pt7yC9nt3olSIJikvLP+8oYIun8TH1ykpxSVkVul3drPvV5tnMheC5dW9W9x0
         /SNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554380; x=1703159180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOZAMEvogW3XDicAaSrKeFR75wLTaTJmQUaxz//D884=;
        b=i9hDRNd6LEiB8Y8YbuiSFwJScJKFK8e/UXccMZtY/durhfV/lmKYTxLK6aRLBuBESE
         vljk1b3jydKGUx5X/s+zLQybii2nscbT0H63PyreK0CGD9CMVRZQ082h9te6363aLEC0
         jZSv17SeKcH3B9QFK5bGlSKFKTP2ymDsOcrBAYSr6lPauj2YcGirVeFihNJq5YU60E+p
         rpMVnYpwFWWKAjQa5kE1/ZAsBG7VfiAZj7lAvXoF38p7GLAzyqAOB6brVbhwOSXXh+id
         izMlHGU3RuJFiXmytQvtt87GfGXx5m4+7u+Uy4QDo8JRRmcm9GBEavKt+cDyP3LYfa95
         3sPQ==
X-Gm-Message-State: AOJu0YyYM1OfcszS7NpWzf4J4YgmF7tsckH85TDqWQUlDC9UQOOq0Xc/
	MveAykZQYDng2+BaEu1wl9jfaQ==
X-Google-Smtp-Source: AGHT+IEAFaM5Cm0jFSOiB0BP6s0buW/H66IBrBKllrAZ3Y8UZeWvQVog2DOBsNItlsCh8+yUrOEP2g==
X-Received: by 2002:a17:906:14e:b0:a19:a19b:4231 with SMTP id 14-20020a170906014e00b00a19a19b4231mr2526628ejh.156.1702554380148;
        Thu, 14 Dec 2023 03:46:20 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:19 -0800 (PST)
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
Subject: [PATCH net-next v2 01/21] net: ravb: Let IP-specific receive function to interrogate descriptors
Date: Thu, 14 Dec 2023 13:45:40 +0200
Message-Id: <20231214114600.2451162-2-claudiu.beznea.uj@bp.renesas.com>
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

ravb_poll() initial code used to interrogate the first descriptor of the
RX queue in case gPTP is false to determine if ravb_rx() should be called.
This is done for non-gPTP IPs. For gPTP IPs the driver PTP-specific
information was used to determine if receive function should be called. As
every IP has its own receive function that interrogates the RX descriptors
list in the same way the ravb_poll() was doing there is no need to double
check this in ravb_poll(). Removing the code from ravb_poll() leads to a
cleaner code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- addressed review comments and keep stale code out of this patch


 drivers/net/ethernet/renesas/ravb_main.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 1c253403a297..8e67a18b2924 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1282,25 +1282,16 @@ static int ravb_poll(struct napi_struct *napi, int budget)
 	struct net_device *ndev = napi->dev;
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
-	bool gptp = info->gptp || info->ccc_gac;
-	struct ravb_rx_desc *desc;
 	unsigned long flags;
 	int q = napi - priv->napi;
 	int mask = BIT(q);
 	int quota = budget;
-	unsigned int entry;
 
-	if (!gptp) {
-		entry = priv->cur_rx[q] % priv->num_rx_ring[q];
-		desc = &priv->gbeth_rx_ring[entry];
-	}
 	/* Processing RX Descriptor Ring */
 	/* Clear RX interrupt */
 	ravb_write(ndev, ~(mask | RIS0_RESERVED), RIS0);
-	if (gptp || desc->die_dt != DT_FEMPTY) {
-		if (ravb_rx(ndev, &quota, q))
-			goto out;
-	}
+	if (ravb_rx(ndev, &quota, q))
+		goto out;
 
 	/* Processing TX Descriptor Ring */
 	spin_lock_irqsave(&priv->lock, flags);
-- 
2.39.2


