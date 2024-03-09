Return-Path: <linux-renesas-soc+bounces-3644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CB787720D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 16:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312452819E2
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 15:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620E745C16;
	Sat,  9 Mar 2024 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="heZy+aDX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED4C4594B
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709999704; cv=none; b=VncBvg8qbmwUexdcyvBJouDMCPy/95BidECW2Qx1rLRa1EeUfQLrwlkYiXEyvUFj31qD3lrleGrURMchCk9UskUkwRSfbjm7cnQkPsRedwW2TJbYcVhztfHyunTr/NOyA215XfPE7CIu6fACB7D75tnwvCfMGtVsJtQIA4vgkkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709999704; c=relaxed/simple;
	bh=oxb58H+3dJL1CUmBT7+dL71n3m5oVb4JbCJojOpkuYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JVfRBZHw3bxG3yth90wPPgqcwREoZxRj1TG5NXGppSlNnPusaymwiTnMqWWkPCnnUd524Vd2cV9WEJW+Lw4l5TbVb1gG4aW1FCuz8fmEIhgL0KYV3ElrjA+yCODZIE6YdhveqoBuINPDpj0YGCbSQKkHiqSmcLDpCqVXLqGq//Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=heZy+aDX; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a45ba1f8e89so372047066b.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2024 07:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709999701; x=1710604501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLBg9xRWeOEFGDBrQs7OucUs0Od0oeREZgUIErgurhk=;
        b=heZy+aDXlJeGbKVWKYgYdQT8r/MrQSG2MRcfUTnMwMntU1BZCwnBrnVizOKvHmdeev
         J3e4qE4X73ZFlD8fyXEX9AeR5tDwkfNWKyAS0MadIyhU9zoj4+gXrLFs86I0RqV00cFQ
         LyaEbe3CC1Ek0z3DoIZ3f62CX4icO1UTpk4J3KX+bctWyaURlUeg7O0igVy2pvQh0AWd
         LvKc00yZwcoIMu+tY4fFnnJipNOKZirT6m2RRawmb/dYkSNSUqCP+VOYYxhSLzEJH8dj
         cJcGDu/hGS+i9tNP5d3/OZbxzmkvoht/quqatTXLJ6RZ1oEDs+qmDmIsXYnpOAiDG7WQ
         GnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709999701; x=1710604501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLBg9xRWeOEFGDBrQs7OucUs0Od0oeREZgUIErgurhk=;
        b=YwxgcRpnyUA56xOyTdNsJAwQEezWl7vVxRN9x6MSY9338HwTCWikoFpI955h0m52Pz
         RGD2hE3v/9xQiJjiArakDjaQs8ggnrzk8BwKYOJ2ALpB4N/+woj5RxigVam3lyfoqgyb
         EqTyYRbmkvMnmDJPtZC7FnpH6d3CUHeFJiDohmQjcfB2IblBtTM3HMpMr6+CVx3jgMoG
         dujRCS5wS8hCAqFGPyWUYgMl0riCWlX2YNALpGdT4KPy9uYGxn6WdJ3jLEfQn5cW+ycH
         3j6uPwFaJfi2y1U0WGcXO6Hfyu9Iuk3YxlBvoNb+lILn9LsRiWj0bkBXwNk+7S6H7mwq
         LJIA==
X-Gm-Message-State: AOJu0YwDeBDwCBQw4aykdHI3htvwvM0rIhanPSihdyJEkw4YKh5EGlPC
	oKnlKp3DC1MeOmKU9y4NUPVvHmm9mYx3OpS7/431XLFBfKUVQkYwT7yBEfvOX8c=
X-Google-Smtp-Source: AGHT+IHFKrKh+q85JxwpYDVCMdheOuNJVT349n5QNXE4KZnL8RYGyBx+xA62cTryxrHnY6Xf4F1XTw==
X-Received: by 2002:a17:906:c183:b0:a44:2ba0:8200 with SMTP id g3-20020a170906c18300b00a442ba08200mr1106169ejz.26.1709999700834;
        Sat, 09 Mar 2024 07:55:00 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id kq17-20020a170906abd100b00a40f7ed6cb9sm1005216ejb.4.2024.03.09.07.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 07:55:00 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 2/2] ravb: Add support for an optional MDIO mode
Date: Sat,  9 Mar 2024 16:53:34 +0100
Message-ID: <20240309155334.1310262-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver used the OF node of the device itself when registering the
MDIO bus. While this works it creates a problem, it forces any MDIO bus
properties to also be set on the devices OF node. This mixes the
properties of two distinctly different things and is confusing.

This change adds support for an optional mdio node to be defined as a
child to the device OF node. The child node can then be used to describe
MDIO bus properties that the MDIO core can act on when registering the
bus.

If no mdio child node is found the driver fallback to the old behavior
and register the MDIO bus using the device OF node. This change is
backward compatible with old bindings in use.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index fa48ff4aba2d..b62f765ce066 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2564,6 +2564,7 @@ static int ravb_mdio_init(struct ravb_private *priv)
 {
 	struct platform_device *pdev = priv->pdev;
 	struct device *dev = &pdev->dev;
+	struct device_node *mdio_node;
 	struct phy_device *phydev;
 	struct device_node *pn;
 	int error;
@@ -2582,8 +2583,20 @@ static int ravb_mdio_init(struct ravb_private *priv)
 	snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
 		 pdev->name, pdev->id);
 
-	/* Register MDIO bus */
-	error = of_mdiobus_register(priv->mii_bus, dev->of_node);
+	/* Register MDIO bus
+	 *
+	 * Look for a mdio child node, if it exist use it when registering the
+	 * MDIO bus. If no node is found fallback to old behavior and use the
+	 * device OF node. This is used to be able to describe MDIO bus
+	 * properties that are consumed when registering the MDIO bus.
+	 */
+	mdio_node = of_get_child_by_name(dev->of_node, "mdio");
+	if (mdio_node) {
+		error = of_mdiobus_register(priv->mii_bus, mdio_node);
+		of_node_put(mdio_node);
+	} else {
+		error = of_mdiobus_register(priv->mii_bus, dev->of_node);
+	}
 	if (error)
 		goto out_free_bus;
 
-- 
2.44.0


