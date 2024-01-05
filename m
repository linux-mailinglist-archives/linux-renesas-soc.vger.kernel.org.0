Return-Path: <linux-renesas-soc+bounces-1317-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0377B824FE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9351E1F23B40
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 08:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2442E848;
	Fri,  5 Jan 2024 08:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QH2zw0Ql"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B4F2E825
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so1412399e87.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 00:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704443120; x=1705047920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GE/LuMLhFciDAeK89cX4ivMbVkfulPVbUibYE+rpL9E=;
        b=QH2zw0QlP7O0n6Op2s6/fILdKNUtQXISwyakEFE13PqydnS5IJoAnsH3rEn7z2oicb
         lAI1qJbUpQvLaW4Q2WywekwcVJNnEHIiXMOG7hqvVfuvfVdUi7WwGxGuAVrUKkJy1djz
         yURow/LZxST0FEaKKp3bMHIrOEafgTb+j3yuf2vBsmOToCxv98vu52DhWc1KR6mGgMDg
         GbzK28r5uecfjKm60eOncb9ZgBC35yUU2MM1wx5xRTZvqZ3z72at8WtBSuLDCdUwOw2W
         5KZ1Yq+ofeYjh37QRR+uSf5C2s0OjtHkeDJMBAFLlFwok+ArRGdkDKZcMiGHUINrk4A+
         yWIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704443120; x=1705047920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GE/LuMLhFciDAeK89cX4ivMbVkfulPVbUibYE+rpL9E=;
        b=jp4Io+hm2um/9K90wXjsRmD0qW/6j3ES9Noj6ftmMp2qQITZaqoq91LmoygH2z7L4B
         tslTFmSLEEev6DBO0giPEG39TNfal0VG5wsEuEpd6P1rOFLp50CB25uVnme76ONaNBGE
         2QUToH2aazS/r1r/bmkK7ve61Xk5QgCV/tMZy9QI/sLXPs9ogQFKu+D6t02YKTM7yFo5
         E5XnJv3NkfteeGvSnfLkgNa1qYTTCrxC9J9B7uR6PmFbVRLvtrxfQue1JMH/Y8Jj+HOX
         FaID2naNRicFACrxdQ0NzpJ3pp1YAJZ1DWl3dWi+8ySBlh1s3pFrW5iFYThwvSx6rfrP
         fGsA==
X-Gm-Message-State: AOJu0Yz17X4nP/7g5b3N7f6QVlQ6ZhsBCjmgVGBp/tB8yS32cqMRGJJ4
	pEM3d3ezvRrvPNjK06plY1yIlKh5h/EPHQ==
X-Google-Smtp-Source: AGHT+IHf0NQecuKwLq7PvhDcHSld2VFIQzS6mLk44kECf1DHQZKxGiayS8E4n7fjIgVaqdFV8NX/Xw==
X-Received: by 2002:a05:6512:2097:b0:50e:8107:1def with SMTP id t23-20020a056512209700b0050e81071defmr740789lfr.122.1704443120461;
        Fri, 05 Jan 2024 00:25:20 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709064b4f00b00a28e759a447sm596198ejv.213.2024.01.05.00.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:25:20 -0800 (PST)
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
	wsa+renesas@sang-engineering.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	geert+renesas@glider.be,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v3 17/19] net: ravb: Return cached statistics if the interface is down
Date: Fri,  5 Jan 2024 10:23:37 +0200
Message-Id: <20240105082339.1468817-18-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com>
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

The commit prepares the code for the addition of runtime PM support.

Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- this was patch 18/21 in v2
- use ndev->flags & IFF_UP instead of netif_running checks

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 76035afd4054..168b6208db37 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2117,6 +2117,9 @@ static struct net_device_stats *ravb_get_stats(struct net_device *ndev)
 	const struct ravb_hw_info *info = priv->info;
 	struct net_device_stats *nstats, *stats0, *stats1;
 
+	if (!(ndev->flags & IFF_UP))
+		return &ndev->stats;
+
 	nstats = &ndev->stats;
 	stats0 = &priv->stats[RAVB_BE];
 
@@ -2226,6 +2229,9 @@ static int ravb_close(struct net_device *ndev)
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


