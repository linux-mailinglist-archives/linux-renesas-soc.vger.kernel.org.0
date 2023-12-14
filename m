Return-Path: <linux-renesas-soc+bounces-1045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EADED812F28
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F0251F213C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAD641778;
	Thu, 14 Dec 2023 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ebcRxg6k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47827124
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:27 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-551ee7d5214so1029806a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554386; x=1703159186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sboPzcqED4l7A2TcVT8TTFqV3DguoQYe1ei2qrslI+E=;
        b=ebcRxg6kZ6cjtU0xL4eBRKIbE+gPxPeJ3BYGM4TCCvSvMaRG5QIqhI63YeGOF41/CL
         2rVetTJdjjOYkFASXmuTSmrvr+9RQlfZhmMfZVMlpF5BHLucnIzNfHwf2FHHk1FPpxrQ
         YGKjwGih8kuKQmzSE9CTUWxOosTTPi7H/phQGFw3MSZ6xP3POdxRkto3YoUZdpu9L6AV
         Sa1O47InUGCYa4vCBfmCYoRGpur9/0GoRQZWOfGZE+wHR2xm4SNnj76jp5UgyA/1kFvl
         ssuQtcoN5pgrz6tJQMnQDXd7UPyhBq9kMtv/4RPGFOQCTQ93AsUxa252ti0YmD3/ZGmC
         3BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554386; x=1703159186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sboPzcqED4l7A2TcVT8TTFqV3DguoQYe1ei2qrslI+E=;
        b=n/gupYgFxYnwA9kAgTHEXsOt0YgZo+vCLnDmbKUodliYrlOZwVUWeif5bCZHqvzL0m
         yyZbsHSfqQgywtNbM4rx+tSfgpSbSXuK0QiZxvdoV+8cfy50Vlp5XisA+JRnAyHq5MHW
         VlXk5zi6j/33v4jtz90SdHV98Vcp9CisGSumpGo1qZVmbjjHDdFmjHZ6zxkVI9DBKHoM
         ULKxZWO8XENFS+8AT1QnyImjxngUXnGDJu2SNVxCkLunzrNkaU0fBfSbjz8E5yM7g2IK
         9fNajqEa/gkTDdQE28hFxgT2e7S+6AHgqpNAkpQbPMSZocKeM2cMIW4C0NQpUMpYnMVT
         C7ZQ==
X-Gm-Message-State: AOJu0YyhBP4zfaQ0liPYwxa+C0LY6s3RPgvBLTs8/X6SFDSkmvBS02nK
	r11HOp2zinz3meUGFnFGwBB8dw==
X-Google-Smtp-Source: AGHT+IHl53VNtTjSgWUmsHo7m90haNzQ56Bx9egUjEPl/J+iHBivUUh8qpwlQivBaht+nSz2egnnTQ==
X-Received: by 2002:a17:906:104d:b0:a19:c793:c85c with SMTP id j13-20020a170906104d00b00a19c793c85cmr8063016ejj.6.1702554386392;
        Thu, 14 Dec 2023 03:46:26 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:26 -0800 (PST)
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
Subject: [PATCH net-next v2 05/21] net: ravb: Use tabs instead of spaces
Date: Thu, 14 Dec 2023 13:45:44 +0200
Message-Id: <20231214114600.2451162-6-claudiu.beznea.uj@bp.renesas.com>
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

Use tabs instead of spaces in the ravb_set_rate_gbeth() function.
This aligns with the coding style requirements.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes in v2:
- collected tags

 drivers/net/ethernet/renesas/ravb_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 82085bb9b7a3..5a57383762e7 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -85,13 +85,13 @@ static void ravb_set_rate_gbeth(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 
 	switch (priv->speed) {
-	case 10:                /* 10BASE */
+	case 10:		/* 10BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_10, GECMR);
 		break;
-	case 100:               /* 100BASE */
+	case 100:		/* 100BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_100, GECMR);
 		break;
-	case 1000:              /* 1000BASE */
+	case 1000:		/* 1000BASE */
 		ravb_write(ndev, GBETH_GECMR_SPEED_1000, GECMR);
 		break;
 	}
-- 
2.39.2


