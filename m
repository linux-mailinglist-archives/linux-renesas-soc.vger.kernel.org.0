Return-Path: <linux-renesas-soc+bounces-267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5AF7F9C4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 10:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6183E1C20B07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 09:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22EA16418;
	Mon, 27 Nov 2023 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m079bd8O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A7519D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:48 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a00191363c1so575112866b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Nov 2023 01:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1701075887; x=1701680687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELkubP0P+TLGoCnHyLiXJ02PqgLHPPVcTUt4fu5hI+U=;
        b=m079bd8OcJFjx2msty6Z505gA3PCNLsaHAVt4LHONHEE7B36nWigeeRxBK3dbs0a4k
         SzOzokAVadlBLFaTRAUNwFBBpX9tvxtJ7PwSwOyOKiRHwMXLRpzZ/poRfBuggQ02BsY8
         KDAyh67FRQ/Pm7U19f+eRHBw/buiigB3YUIib6QEYsaTZvD9vWEZ51pq3371W7HR1ib4
         rB/Fl1a/lT0kpz+AscGl6u5MDKiFzArgxAAiNS0tvizvKDpx+SGpKc1GgsMzMAId3cnZ
         fRMiO0hpo0xRQnNdguTt5CrLrs5bKofZuw/i9lW42cOFi3tBYCpC8zOYX/n7lzrM+E0s
         bPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075887; x=1701680687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELkubP0P+TLGoCnHyLiXJ02PqgLHPPVcTUt4fu5hI+U=;
        b=KWt8qIXfedn00FKpTydoAUedGygNHEZHpoCqaq3vrI1/1S5v7ehomHYqEez2hgy1DN
         dxWQNfQXXE+JfKWjGf6XkJIHZSPuJXuCc0U60PlvKSdWi1uQOUEUtItnwiBackFvXbG3
         8n758TDk0L7/x/a1ECWdooAtkLQERjjb6CEDzo3JUH08tTF2W3ZB41JLzwKtdif1+3yI
         gQFlAgkcVnlHewIoU73VCogsw1vL3k8qAJSom3VWJI3WtiiDm0NP5MRRuaTcaJICNU+G
         Ne7HhZH7rP3y7HWTtssR1KjRriuoXEvC2aY02UbTSyqTcn1LWVtLz5VaSTm9ItH1dvJl
         H8/g==
X-Gm-Message-State: AOJu0YzRdAj28e4jaLRgLUCFBzivSN1SWmEwo6aPCcz1wgYs85kiA6Di
	gsqvK+kwOGhPFp2D79zAyJ1wmg==
X-Google-Smtp-Source: AGHT+IEIMf4qeMFVDjYLj32OSSye/z3Y4oNh+XijNY2yVvs3ZhGPDM3AVtdECxYxN4j1YBRLpqAqWw==
X-Received: by 2002:a17:906:3a87:b0:a03:24d9:12ce with SMTP id y7-20020a1709063a8700b00a0324d912cemr7704534ejd.63.1701075886887;
        Mon, 27 Nov 2023 01:04:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.125])
        by smtp.gmail.com with ESMTPSA id ay14-20020a170906d28e00b009fad1dfe472sm5456539ejb.153.2023.11.27.01.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 01:04:46 -0800 (PST)
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
Subject: [PATCH 4/6] net: ravb: Start TX queues after HW initialization succeeded
Date: Mon, 27 Nov 2023 11:04:24 +0200
Message-Id: <20231127090426.3761729-5-claudiu.beznea.uj@bp.renesas.com>
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

ravb_phy_start() may fail. If that happens, the TX queues will remain
started. Thus, move the netif_tx_start_all_queues() after PHY is
successfully initialized.

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes since [1]:
- collected Rb tag

[1] https://lore.kernel.org/all/20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 2d4f4fb3d16e..f7e62e6c9df9 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1812,13 +1812,13 @@ static int ravb_open(struct net_device *ndev)
 	if (info->gptp)
 		ravb_ptp_init(ndev, priv->pdev);
 
-	netif_tx_start_all_queues(ndev);
-
 	/* PHY control start */
 	error = ravb_phy_start(ndev);
 	if (error)
 		goto out_ptp_stop;
 
+	netif_tx_start_all_queues(ndev);
+
 	return 0;
 
 out_ptp_stop:
-- 
2.39.2


