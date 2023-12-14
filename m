Return-Path: <linux-renesas-soc+bounces-1056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD05812F46
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53E67282E81
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7224D104;
	Thu, 14 Dec 2023 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VDRP0MYq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4846BD67
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:46 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-54c5d041c23so10540519a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554405; x=1703159205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoiORotVHtzab0Z6R5tqUvsar+MHiUXnH/O7lUfaa34=;
        b=VDRP0MYqeIxkNCwLg1+URch3+vUo8qgO7a1B9GIQ9sq8G2Jzn6TEJHo4n/kbNcT0TQ
         UzeoerzztzZ9yt9Jx4oulqrRdu74mLvZQbfL5eT2rsWr8HCLu5BzTj6rk8sHcnFAfTt5
         CwiGIJlGtcWm4pz+N3VmlQ5HTAr9vERm11jB6w2taQDq2DtHbcdR8lIPym5PgMTbGuoe
         FaHH8gDnhn2CmZruZFXLO3lPx1+b3C+KXwogPyZ8IRsBfR2v6NJfy/Tt6j+eSymwZ6Mj
         fCFpOlymA63cxhPLuY1kd5+3o4wS5N9PWYLoXRETnDiSswU4koAfuYFBRutqcZIQRfSV
         +K2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554405; x=1703159205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NoiORotVHtzab0Z6R5tqUvsar+MHiUXnH/O7lUfaa34=;
        b=utYX+2hBMdVVnnKqYKfbfRHwzGCBptJwqQzbvLMkFXiZk2FttrlGhIWb//LTSQVerB
         WferonRzhjeIbIYLjVHb4cqQRqRcmEA93o1mjMZpIiG4fcsTszQFSk1Ye1xNY2VbUP/v
         p9GGj4pdNugDKB7IrQcfhi3hde1QoMzyV+Qb8504OrDxUF0TDv2AvuX0i/BakDqyuKg5
         gW7XIZWMkZTBjgZpOr0rvfiJvGX++kFgmXlS2w94Xbu4abiA9sDjC7YYZwiTMVkQfTlz
         EXBWzZ9NI4HDPmFRmRUH9WFXoD0NiTFNZSQmVNmPLQ7yHFwPx9vKeOR/t2DBej47fwUR
         LuQA==
X-Gm-Message-State: AOJu0YxZFjoK2nIfPUYHhMFRGbc0YCpnQrKtB5Eu7G2it+F2UgSY5du8
	jFQPTvlNN/2iic6UMonNkkHXcw==
X-Google-Smtp-Source: AGHT+IEkHkIjbZxyWNnhWgVzwKp1oLjVB6rkXJC6EiXk5LsZBUGVINMSQUgKJqcBBpk9Att/KP854w==
X-Received: by 2002:a17:906:de:b0:a19:a1ba:bada with SMTP id 30-20020a17090600de00b00a19a1babadamr2578053eji.128.1702554404767;
        Thu, 14 Dec 2023 03:46:44 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:44 -0800 (PST)
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
Subject: [PATCH net-next v2 16/21] net: ravb: Keep the reverse order of operations in ravb_close()
Date: Thu, 14 Dec 2023 13:45:55 +0200
Message-Id: <20231214114600.2451162-17-claudiu.beznea.uj@bp.renesas.com>
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

Keep the reverse order of operations in ravb_close() when comparing with
ravb_open(). This is the recommended configuration sequence.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index b581666e341f..38999ef1ea85 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2182,6 +2182,14 @@ static int ravb_close(struct net_device *ndev)
 	ravb_write(ndev, 0, RIC2);
 	ravb_write(ndev, 0, TIC);
 
+	/* PHY disconnect */
+	if (ndev->phydev) {
+		phy_stop(ndev->phydev);
+		phy_disconnect(ndev->phydev);
+		if (of_phy_is_fixed_link(np))
+			of_phy_deregister_fixed_link(np);
+	}
+
 	/* Stop PTP Clock driver */
 	if (info->gptp || info->ccc_gac)
 		ravb_ptp_stop(ndev);
@@ -2200,14 +2208,6 @@ static int ravb_close(struct net_device *ndev)
 		}
 	}
 
-	/* PHY disconnect */
-	if (ndev->phydev) {
-		phy_stop(ndev->phydev);
-		phy_disconnect(ndev->phydev);
-		if (of_phy_is_fixed_link(np))
-			of_phy_deregister_fixed_link(np);
-	}
-
 	cancel_work_sync(&priv->work);
 
 	if (info->nc_queues)
-- 
2.39.2


