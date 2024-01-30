Return-Path: <linux-renesas-soc+bounces-1974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28B3841F7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D571F1C2470B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 09:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F3860DE0;
	Tue, 30 Jan 2024 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lBWI0Vx9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C7C5915B;
	Tue, 30 Jan 2024 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606902; cv=none; b=e7x/xWgnsc77wZk54EKiQ6oETL/dqX9sSxL6rhE4w8rxjkOec8XOy2tD6htR9wytJiCL2oitcf17dhUDl4CetIFQweVGtc6FotqPLOwXqh5megnjWdLBt5gWxTPd5S7kAQKyuO2WvRi/moy75P+WZVmZjQ5Js16TSRhb3J5B8GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606902; c=relaxed/simple;
	bh=EAMqCKiXGdRHlagD9RIjZMQgLhM62uz4XFlvbcYQmj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VDVYyOeIWRuAGQwhEpBWc+PP1NqWBEIxCd+HmEA7Ep0k2plgXSLLxgMYqqX+CdedhtPPwSHHUvIorqj3ae6eR6En5IO0AF2VB0U+fwieOucGZxkDx1zXyFadgZXxFHuMKpzaTlCdckovrPMY/vehH0pZAsFUWF73kzVId7co+6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lBWI0Vx9; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22C4160010;
	Tue, 30 Jan 2024 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706606897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLQfN2Tdko4UPRL5zaHsLOgQcHV6OkMoJDrz6HtlNCo=;
	b=lBWI0Vx9H0RxcJErx/FjWPt7KO/H5BoC3AjWN8y4mnuaW0AUFLE2zpW3vNwi/TPEzuJVbK
	moxjQmIUPt78yW6Mj7EHCwJa6a2OwM5T4tzGqv09Ky+qzSjwP0tn2/g7ZU6YXjRZ//XU1H
	GWwejrJF2HvO6kfGV/p4uoG4FsN62lMY9DenClLTP7KnCEI0vrn+UU4UynsMVmITMQ/e5Z
	YaS12dfguMRCbpycL5PmvWYuElX4kY6/o8gSiS9X1fRP0q2KJhtIxiCa4nU9QV1WbogwEG
	a1cpGVMV/3fQzjZ0mndOFgM7fbbmuihR+uG+yJQB667KhpwtFKg66rNbhXa1HQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Jan 2024 10:28:39 +0100
Subject: [PATCH net-next v2 4/7] net: stmmac: Support a generic PCS field
 in mac_device_info
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-rxc_bugfix-v2-4-5e6c3168e5f0@bootlin.com>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
In-Reply-To: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
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
index 721c1f8e892f..318a70d6b330 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -565,7 +565,7 @@ struct mac_device_info {
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
index 7f0900f53248..72e02ef0ee6b 100644
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


