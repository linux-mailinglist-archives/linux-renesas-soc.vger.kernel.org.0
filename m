Return-Path: <linux-renesas-soc+bounces-2550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291B84FA8E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 18:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC5DC1F26DB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 17:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E870A7F468;
	Fri,  9 Feb 2024 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l7T8VIHe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D99E7C6C0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707498312; cv=none; b=pannN9keO6xsP/VDjhu/msf3ZOy1eCmJDxLXzdYE6/DOQmoZjZryyDRmxvXqkkCGDVZWqFftfx2DWv1Kw+nb643061IE7vEGw5kCi6sRQ0NckCxPuW4Xmu3q2ltcDrtHhVNzlLRVBbF3Xb7bxLJV/yUFBYyZkC4ur/pBm9SuZF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707498312; c=relaxed/simple;
	bh=E9qfFlPW1e6QyyiFWyQNW8LWGspZ155/NwV+vfM7aoA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HXEW2FScKo1XqKyxJ0zdfBEOu7gFe82JET3NFPov0MTM2SChNApQYTqYOOD56Iz0BEc24B4IhwQxKkL28NovT+P1YSPlcRP6bbSoODyRH46fiI7kAU2n5dUUVPUoUusTUiijy2HWC5v59xD9FR602GaCAc15xauS4vIIlb5RmDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l7T8VIHe; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-337cc8e72f5so799980f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Feb 2024 09:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707498309; x=1708103109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJVjrzAqciRb2/LRj7N8tiqtGPPPqEc7yCwP1DwWHTU=;
        b=l7T8VIHegpD1YRWTO6MaIW2hj6CeU+uTg5tmRZ3y2TRklBUpQTWPvdsoLPhKmVOqUv
         QgRzKMXBg0ut+7cipkcImfG6GD6hpaRcqtiPlauQAOX4xqqqKt5rQGJKAytvzIrlWTcT
         b6pkLV1KFEm5HKWkfBDmIc4VFq3kyKvd4nwjgTJWDsarNV7ziH3wQSSi6bA4DJ7iiJPp
         19I731vgH5Sys0J51pDwf8WM1UaL9vzNeC2m/KUXED+yaiBleWTGuhGeBpf3pTfrmqdV
         jU2oMlTH/Y3xBdJ4yGrIcJKaS8eUcPLmt+/vG9l4GU+bq7jY74RyTRDAPBmLA6IF3lZO
         SeOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707498309; x=1708103109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJVjrzAqciRb2/LRj7N8tiqtGPPPqEc7yCwP1DwWHTU=;
        b=xFSyB3sU8Sc8fqiffhX8lVL4yszts0Cr4L7a1mNBYMaiU0JhGh+ig1Fwc90Gh+pXoL
         8MLOucB2iPkOMWcEn3+TI3szM7kw5lR9HaH7lOX8BTG5N1nOhAPuc75RKJhT6JAmjpw0
         8/ArMv1AP79IEOxTS1brPgIp7YE/AkuNMfLGY9QGJl6hVd3ca2avWHJ9f7tmxOaznUu/
         UuEZ1K4KRs9sm2xMonCGbQ+k2PmiUgixwxReff1yHng0QI85ivotNDVeH4LKR0DlWkcX
         CFalhzGyChSPRiQ6KL/n8OWWQLgbF5UEgDpX0K3rLHsS9SUWPSolPWw12d72XUI9/vJl
         CeGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrWZFXOumEdss/kfXD01pANPinQqxC7pGWMVo8rRhu2t5lHdQOOGMz0Hhv4ETjtXKgO8uRyL5Q8BJBiMzSK0JZubIESsd36rMJ0d+Xv43i2Ho=
X-Gm-Message-State: AOJu0Yz/jlelzmZ/3dxtsN58IXi4jSONCSBauLdPgzOk8ig5F6xo5nLH
	SIQ9aIENWqKdVuHTBbDuPa8e4Zznv5NJRrQE0oNb7gkv+bX6XPQEYoFkubC+8pkl5QjSAmALH2p
	E
X-Google-Smtp-Source: AGHT+IEHp22JYBjn3LBrSBS2ExLaFTW9k7a4NPbhDL5/QOqpK139dOb9BQtAHdDvKxL8IrBvZERLSw==
X-Received: by 2002:adf:f987:0:b0:33a:e7de:aa8b with SMTP id f7-20020adff987000000b0033ae7deaa8bmr1508064wrr.26.1707498309451;
        Fri, 09 Feb 2024 09:05:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUL4NavJtL5JVa5Qyv6YHLP16s54U4xbfNKAHPk4QSUTjHRZVC7rScJU2FPwmIlt5b5HX+LCfOT34/72Q9ciLLpeaEVxL8z/63tDftL56fqTjsDzwzwsxM+iS1lUHZau+4yGYUkv+XDo762sSc/3MQxMQ5D0ilM5MW0hgWRBglOy31oJFFWTMnMF6SkJCf9copIVlu0I3rUm5CSFm/rzAEogw0wWxINU2/ly9Qpl0O3lkygYzXQpUGpEXQb8+MyVWTeI94r22kUn9+84bXezFq3HEc6y1fzHZxhoWLC27uKfqO6GOK/gDoRwy7Ue+KEw4ZmJ826uZE2e5Q=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id j18-20020a056000125200b0033afe816977sm2254998wrx.66.2024.02.09.09.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 09:05:08 -0800 (PST)
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
Subject: [PATCH net-next v2 2/5] net: ravb: Keep the reverse order of operations in ravb_close()
Date: Fri,  9 Feb 2024 19:04:56 +0200
Message-Id: <20240209170459.4143861-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240209170459.4143861-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240209170459.4143861-1-claudiu.beznea.uj@bp.renesas.com>
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes in v2:
- none

Changes since [2]:
- none

Changes in v3 of [2]:
- fixed typos in patch description
- collected tags

Changes in v2 of [2]:
- none; this patch is new

[2] https://lore.kernel.org/all/20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index a1bf54de0e4c..c81cbd81826e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2321,6 +2321,14 @@ static int ravb_close(struct net_device *ndev)
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
@@ -2339,14 +2347,6 @@ static int ravb_close(struct net_device *ndev)
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


