Return-Path: <linux-renesas-soc+bounces-1316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B903824FE8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 09:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51969B223BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jan 2024 08:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919C72E820;
	Fri,  5 Jan 2024 08:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ph7Tx93m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD012E65A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jan 2024 08:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-555936e7018so1534051a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jan 2024 00:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704443116; x=1705047916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdMglme1FJfw7lAsTxrQOv9zf0VFBKQ+XeA3yTFVwPY=;
        b=ph7Tx93mBP8BW9Wm+ilPiVumvQRsA+BfYxelnWMV4hbp2rUsYb2FzYlRDr4fRjkYzd
         AJsD5N0OgaxaWz0N4ucnnaoY5KwcMstMJIBkIO3RbAZPcn9ztKESln5C63dm7O79B+6i
         o6mjk7jKjTVHbxy+y+qZlF0RBQGc/mvYK/FdjfZZXj5lzOZ56fXgdZ5YgSBVNHKJYzNJ
         MaioQkztGoZcUQ/ALCkVcWyyvMX69qpy/QLvyH15+tqg8/tQRLziTctYsdfkWhg/kkko
         uVnyQEBSDpIgDI/uhejzCTwT1bdcLG/IBSuNi3eLQisCCkluFCveDE/3jzejulDI0QgN
         awPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704443116; x=1705047916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdMglme1FJfw7lAsTxrQOv9zf0VFBKQ+XeA3yTFVwPY=;
        b=nc66nwzLDVLGIpmMthTIQh20PtDrYK+Fk7E/rHq50p9iKE/LyAHLV9mSsi00gMqMVy
         +UUSVzS7KHh7B43/5ny67tOm0oYrbLd1iSAmGe0VFtRavRT0Y9jbW02ukUjbuWWv0/RW
         ClLpDuPO2HpkNxfF41lISfLDrmBwBHlsMZLRoM90IbH2OCeZ54lGFF7GHJ+t2OCNIXFb
         2lEv0+AAmoJA0XlgnTGjQ6TgILkc3+H/uUkmpAzRzgqIo1LAhWQ80S72sV6FvabpSn+C
         mpPA/09nJMfC9nuNJLvgi0vEp/hFrZmAUOugUc7KBpJjGk2SuiBPup/4KkZTsS/rRmnC
         e0/g==
X-Gm-Message-State: AOJu0YwOPIG+cP2yYf5tssVT0ecxraVKMvCs/ZGwoexGUmWw3O0PsVIg
	IyV5knIQvfGjKTNdBLBS4W5WlrvTdvjIow==
X-Google-Smtp-Source: AGHT+IHtrhPa7L0ID5UiH5qjOlmZfOf5pCAOPCIdR12pQMZeSbjKp0iKyjIeMrFf7jhx15VZXPJeHw==
X-Received: by 2002:a17:907:1748:b0:a28:c289:7bd2 with SMTP id lf8-20020a170907174800b00a28c2897bd2mr792831ejc.37.1704443115928;
        Fri, 05 Jan 2024 00:25:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709064b4f00b00a28e759a447sm596198ejv.213.2024.01.05.00.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 00:25:15 -0800 (PST)
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
Subject: [PATCH net-next v3 16/19] net: ravb: Keep the reverse order of operations in ravb_close()
Date: Fri,  5 Jan 2024 10:23:36 +0200
Message-Id: <20240105082339.1468817-17-claudiu.beznea.uj@bp.renesas.com>
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

Keep the reverse order of operations in ravb_close() when compared with
ravb_open(). This is the recommended configuration sequence.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- fixed typos in patch description
- collected tags

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 06c7ee45d567..76035afd4054 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2189,6 +2189,14 @@ static int ravb_close(struct net_device *ndev)
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
@@ -2207,14 +2215,6 @@ static int ravb_close(struct net_device *ndev)
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


