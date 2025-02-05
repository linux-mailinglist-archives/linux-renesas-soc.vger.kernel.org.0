Return-Path: <linux-renesas-soc+bounces-12873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B846A2951A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 16:44:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1E77165BF5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 15:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F6D186E40;
	Wed,  5 Feb 2025 15:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="i2VFE+Zw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A80815FA7B;
	Wed,  5 Feb 2025 15:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770242; cv=none; b=ph6Lymby3FMB6ALxdCLEXF07OGDVy71Jypwuk/FkHjYO3HLAgJVLOhBPH0Fmi6STxpoAkhegUUstFxjUp3djKJs5tBITuqQQRu1uvkLx13sBjmRPjb/DIfRDz2jef0cqDvEe84malLZIUOsw5kqgrpIf2OnIwWTGrI48XKjk3rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770242; c=relaxed/simple;
	bh=3wTXueV/0ry3dwoBWf3S3UNb7ff2VP83EEMeipAYG70=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=DZXy4FzCwsFYFLHvVq3py8l0wk3OCUHlYFr5ixgM8DdI+n9/Fq1nwEEwgXtrGp9CFHCIqdEzR5Jov7NL4TVAa0yFveXZLi2O5soaVe224AfkkI3D7iaWUYlIT6y2XTviIe1EctakLDSoRCxqVeyGNfxHHWicb0L1qv94DCc0tHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=i2VFE+Zw; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HlG8zghp3Ba5hSTSJEAI4GQj2NKSYIMKvt1QHE/jTjM=; b=i2VFE+ZwNMfgr33FhsZIW9M3Fp
	rwnB4WKpZwCmMAlA/mvKhF6JSBUWnE6xUZLGHd/FrJxZXnRBlNQtwzXtQp68d1NpGAIYW79yBiaGl
	h1c3+Hj977p8zp/tomIwqCJ0FyLoE0jcBnvH8EStjlbuh/82WVo2v6EGXWSlvIEFEjp3RqhH90+Uz
	3FRjbJNA26waEGD3BeXVr5nCaOXqKtu+u/e7qYSW2sh2cewk/LYYrwa6sxecq7dZoQi43w17J6EPP
	o9RI05ugx43S4nvuH0VkASiM2enK8rN32Odn61FkGlrH/oxUCK5XSDnMtVlZtzLdpS3Hc+ZlfSagV
	PoIi2Vig==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46534 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tfhZA-0007Yz-0f;
	Wed, 05 Feb 2025 15:43:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tfhYq-003aTm-Nx; Wed, 05 Feb 2025 15:43:32 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: "Cl__ment L__ger" <clement.leger@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next] net: pcs: rzn1-miic: fill in PCS
 supported_interfaces
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tfhYq-003aTm-Nx@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 05 Feb 2025 15:43:32 +0000

Populate the PCS supported_interfaces bitmap with the interfaces that
this PCS supports. This makes the manual checking in miic_validate()
redundant, so remove that.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 61944574d087..11a96459a425 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -268,17 +268,6 @@ static void miic_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		     (MIIC_CONVCTRL_CONV_SPEED | MIIC_CONVCTRL_FULLD), val);
 }
 
-static int miic_validate(struct phylink_pcs *pcs, unsigned long *supported,
-			 const struct phylink_link_state *state)
-{
-	if (phy_interface_mode_is_rgmii(state->interface) ||
-	    state->interface == PHY_INTERFACE_MODE_RMII ||
-	    state->interface == PHY_INTERFACE_MODE_MII)
-		return 1;
-
-	return -EINVAL;
-}
-
 static int miic_pre_init(struct phylink_pcs *pcs)
 {
 	struct miic_port *miic_port = phylink_pcs_to_miic_port(pcs);
@@ -307,7 +296,6 @@ static int miic_pre_init(struct phylink_pcs *pcs)
 }
 
 static const struct phylink_pcs_ops miic_phylink_ops = {
-	.pcs_validate = miic_validate,
 	.pcs_config = miic_config,
 	.pcs_link_up = miic_link_up,
 	.pcs_pre_init = miic_pre_init,
@@ -363,6 +351,10 @@ struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
 	miic_port->pcs.ops = &miic_phylink_ops;
 	miic_port->pcs.neg_mode = true;
 
+	phy_interface_set_rgmii(miic_port->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_RMII, miic_port->pcs.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_MII, miic_port->pcs.supported_interfaces);
+
 	return &miic_port->pcs;
 }
 EXPORT_SYMBOL(miic_create);
-- 
2.30.2


