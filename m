Return-Path: <linux-renesas-soc+bounces-2643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4558519DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 17:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 581F5B24693
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 16:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AEF41760;
	Mon, 12 Feb 2024 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pnraRMQq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436193D998;
	Mon, 12 Feb 2024 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707756112; cv=none; b=Ov0jBkk9XhDYG+I4AEFCna65iWC9FEEmY1vildqJaIAcpMZA8LcVAQsC6vNFsjrnbDmTv3BWkrOOmPWkM1b0VuyWCYJSZWzNDy2zmUA7QRv2B02k1POVNWVk/SH3RLcZPe9AM35gqjS6T9duIBheSFSrv9DDjvew6B/55jWkBVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707756112; c=relaxed/simple;
	bh=xFayUEgulXMhdyXpODa+kiQHmo3EKmYmG30okGol07k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A1n8sPbZbpdFwVseHtYrSniIgrp+oKN/GvCtXfBWywlnbMAH9ATNagqP4FR7ZOZViriEfLWM6oQkFLKdr9ccQSLhfBqmGSmBwo74CiJeMsIbACWc3sN82+dhcB13rJ7Hj8Qypr89VomeEGjoNZgpK9wMs5bYW+AdB3wNs+mhGoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pnraRMQq; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60F7140015;
	Mon, 12 Feb 2024 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707756108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvjZHLMOPyZvhYtEiNXCG1LQjVmCDnKn5LrGq5/CUOY=;
	b=pnraRMQqkPo4gPauAtyzGYRhjTd4CPyOL3h5T65og6TfcpQw04zFSO/raroSaAL3EaoaSX
	ADSCwCEwbKzg5M0c7KgD40qYnJms5vZEctwnoDM0dVlVG18obI2RIIP3WcHOrm4OxfwVug
	chLvDqRKiPSdO90yOSyhsu+ewvd35K6o9/F9aUq+fJEhsd/4JzBCu2siV7rvNeIsrDJLf8
	u1u1a/GcBWq9b2oj8kd87Z37necpwAoH9VDxtkC+5jD0o8OCoiWm5eQuaitvnWlxTC7703
	Nr1P/b8n0dkUN5G7ko4PoY6aitlcJcf86zhfJszwiaBm7sgapHUv28k2HolYFQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 Feb 2024 17:42:11 +0100
Subject: [PATCH net-next v3 4/7] net: stmmac: Support a generic PCS field
 in mac_device_info
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-rxc_bugfix-v3-4-e9f2eb6b3b05@bootlin.com>
References: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
In-Reply-To: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com

Global stmmac support for early initialization of PCS devices requires a
generic PCS reference that can be passed to phylink_pcs_pre_init().
Currently, the mac_device_info struct contains only one PCS field, which is
specific to the Lynx model.

As PCS models are hardware-specific, it is more appropriate to have a
generic PCS field in the mac_device_info struct.

Refactor the lynx_pcs field into a generic phylink_pcs field.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h        | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 5 +----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index a6fefe675ef1..f55cf09f0783 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -593,7 +593,7 @@ struct mac_device_info {
 	const struct stmmac_mmc_ops *mmc;
 	const struct stmmac_est_ops *est;
 	struct dw_xpcs *xpcs;
-	struct phylink_pcs *lynx_pcs; /* Lynx external PCS */
+	struct phylink_pcs *phylink_pcs;
 	struct mii_regs mii;	/* MII register Addresses */
 	struct mac_link link;
 	void __iomem *pcsr;     /* vpointer to device CSRs */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 68f85e4605cb..12b4a80ea3aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -479,9 +479,9 @@ static int socfpga_dwmac_probe(struct platform_device *pdev)
 			goto err_dvr_remove;
 		}
 
-		stpriv->hw->lynx_pcs = lynx_pcs_create_mdiodev(pcs_bus, 0);
-		if (IS_ERR(stpriv->hw->lynx_pcs)) {
-			ret = PTR_ERR(stpriv->hw->lynx_pcs);
+		stpriv->hw->phylink_pcs = lynx_pcs_create_mdiodev(pcs_bus, 0);
+		if (IS_ERR(stpriv->hw->phylink_pcs)) {
+			ret = PTR_ERR(stpriv->hw->phylink_pcs);
 			goto err_dvr_remove;
 		}
 	}
@@ -498,7 +498,7 @@ static void socfpga_dwmac_remove(struct platform_device *pdev)
 {
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct stmmac_priv *priv = netdev_priv(ndev);
-	struct phylink_pcs *pcs = priv->hw->lynx_pcs;
+	struct phylink_pcs *pcs = priv->hw->phylink_pcs;
 
 	stmmac_pltfr_remove(pdev);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 47cd8666af43..ec4f6377b5ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -944,10 +944,7 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 	if (priv->hw->xpcs)
 		return &priv->hw->xpcs->pcs;
 
-	if (priv->hw->lynx_pcs)
-		return priv->hw->lynx_pcs;
-
-	return NULL;
+	return priv->hw->phylink_pcs;
 }
 
 static void stmmac_mac_config(struct phylink_config *config, unsigned int mode,

-- 
2.43.0


