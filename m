Return-Path: <linux-renesas-soc+bounces-12342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFBA1965B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 17:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF203AD3C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 16:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70F62153C3;
	Wed, 22 Jan 2025 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Sd3GHeHx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A1215046;
	Wed, 22 Jan 2025 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562789; cv=none; b=WRGsQL6mgPss436nWQiLHpxu7+xddsPUFhqpH4eP8JLvxXa5DVCDStSUVtBRKRUx9P5A1ZyeyhUOtnwi6Q9/x/e0T+S1UngHR2BmsR8o5LdBFEreoSaQptby7D/WAhQTHSSDIVXTf7ADUcdT9zA0ZVlRZwfyevJzmib7u3n4T/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562789; c=relaxed/simple;
	bh=KlHCWgAbljGEWm+qjEMB3BcYWWU8q/CS6WHm8zHaD40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N0w+O4sUvHsMWcDAlX6EeCg03/xhH1QFlZOw8DWO39m5R/5mlDHieHMVvq8L7Jv0xIH6YycQnRHH4oiAFf6rcOwQ9m6UrfdmjZ5QnEKDT7ZDvf8+xlx/hXDN8PbwRRU0PXpjL9fb4maWlLy28VHi41FmsXepX4dkna+K3EK+L1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Sd3GHeHx; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90C3E2000F;
	Wed, 22 Jan 2025 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737562780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCyh9rT5nFclPQ3e7i2WrZo2/oI1T2sHOYJO1/OtkOU=;
	b=Sd3GHeHxDPoApihhIvXoeh6CCTW6mxQkrF/MBH2hvLBUEIBjVjkHxHZ7QactBeswUDYdeP
	feHIWFuGsK98vdT/uiPPUMD/Ha6eQZ6c9Dli48FSVwU5LFkQ+v//pPOa3J/HPLdlEyHTAi
	0G2W1Qs4iFwgbk76WepEqS1Q/hp3ieYr18lLdh6HvTrIl9QwiZYp/yYfQcygowQBsmtv9r
	zm34flnosH4s/j1RJ2AbXhIin5jgYi9hNPFJPBRq2DgPvbux9poFkqC4eVvMc4dK98bY/X
	/7mqj8y93yMmWsH4uln/zvgjqqYgJy5EqyJIH7M//vA70Q6VnHBGtq7DOaDlfg==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Wed, 22 Jan 2025 17:19:29 +0100
Subject: [PATCH net 2/2] net: sh_eth: Fix missing rtnl lock in suspend path
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-2-8cb9f6f88fd1@bootlin.com>
References: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
In-Reply-To: <20250122-fix_missing_rtnl_lock_phy_disconnect-v1-0-8cb9f6f88fd1@bootlin.com>
To: Paul Barker <paul.barker.ct@bp.renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>, 
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, netdev@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: kory.maincent@bootlin.com

Fix the suspend path by ensuring the rtnl lock is held where required.
Calls to sh_eth_close, sh_eth_open and wol operations must be performed
under the rtnl lock to prevent conflicts with ongoing ndo operations.

Fixes: b71af04676e9 ("sh_eth: add more PM methods")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 drivers/net/ethernet/renesas/sh_eth.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 8887b8921009..5fc8027c92c7 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -3494,10 +3494,12 @@ static int sh_eth_suspend(struct device *dev)
 
 	netif_device_detach(ndev);
 
+	rtnl_lock();
 	if (mdp->wol_enabled)
 		ret = sh_eth_wol_setup(ndev);
 	else
 		ret = sh_eth_close(ndev);
+	rtnl_unlock();
 
 	return ret;
 }
@@ -3511,10 +3513,12 @@ static int sh_eth_resume(struct device *dev)
 	if (!netif_running(ndev))
 		return 0;
 
+	rtnl_lock();
 	if (mdp->wol_enabled)
 		ret = sh_eth_wol_restore(ndev);
 	else
 		ret = sh_eth_open(ndev);
+	rtnl_unlock();
 
 	if (ret < 0)
 		return ret;

-- 
2.34.1


