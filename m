Return-Path: <linux-renesas-soc+bounces-3507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E325E8734F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 11:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F31C7B2643E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Mar 2024 10:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC319605DA;
	Wed,  6 Mar 2024 10:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wp53OyPz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1252605B6;
	Wed,  6 Mar 2024 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709722311; cv=none; b=YcJ+zJamc/0SUXUh+nBTf3oYt6dMV2MxmVG7KvqZTOsQwjHtiyOk5EpyJYfiD3w1bm1M5EHHNqaXyVwn7zYLK/EwXjbgJebn+4eyA1DWDFunroZM5oWI7fks/31HfleL14P73wagJzAaRwXrKmiV1dK1NPvWPP65fFUOFxrMWOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709722311; c=relaxed/simple;
	bh=2eQWpRS30C0KyoZbJqdAB/PojhfK48hK27/11iwfB4g=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=ES3SstG8y7KPY4sgKD0Bu5cS8Cd8V+eHxIorKb1ui9FCu06gogaSg+g63GbRrf62gQ0QiCohhWcoGrRo+FbH1aamcsOPEj3ofPztkHgna2yeukhqbMHhu/9HO0mbxh4VUB1Up4Db75JcQ1ROBGMGQpVdzqSqS5vkBwF9CJPwPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=wp53OyPz; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J8pJ3c17+2ktYh31xGrVyrSlsoXAy/Qy8FJ/XaBJ1uQ=; b=wp53OyPzNvc4r2L6zxyz47c7dl
	JUoDOT2KfmfdIf4CQBN3xbmClL7sQz0nU8PDlZKfzsaDGpdrDokbxkFUzz9JvgU3v2q61Grr61Vys
	MaeSIJSsSvfrKzoMCcXBgc+7aoEK76pzjv9w0kj1YMpGkPcpiZ9UC6M5WN8jewQfKjaTlzAxCYOB7
	n1J1ZI7RJ4zwn8xPH3ghbsqoiEuqZqVmxQp46RL+9NxP8xGw6v0U9DkqszDEqqSaj1l1JM/2IUSYA
	MgTsDDmHcjkTb72pdTWL8JN5Q3qU9usF0bLxVr4O7DGcm72ownOVvKzJcrzVj+ZsTNMDytmtgW+aT
	RaBlhngg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33020 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rhos9-0008FB-1h;
	Wed, 06 Mar 2024 10:51:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rhos9-003yuW-Az; Wed, 06 Mar 2024 10:51:41 +0000
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
Subject: [PATCH net-next] net: pcs: rzn1-miic: update PCS driver to use
 neg_mode
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1rhos9-003yuW-Az@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 06 Mar 2024 10:51:41 +0000

Update the RZN1-MIIC PCS driver to use neg_mode rather than the mode
argument to match the other updated PCS drivers.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index d93f84fbb1fd..4bd66fdde367 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -183,7 +183,7 @@ static void miic_converter_enable(struct miic *miic, int port, int enable)
 	miic_reg_rmw(miic, MIIC_CONVRST, MIIC_CONVRST_PHYIF_RST(port), val);
 }
 
-static int miic_config(struct phylink_pcs *pcs, unsigned int mode,
+static int miic_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 		       phy_interface_t interface,
 		       const unsigned long *advertising, bool permit)
 {
@@ -234,7 +234,7 @@ static int miic_config(struct phylink_pcs *pcs, unsigned int mode,
 	return 0;
 }
 
-static void miic_link_up(struct phylink_pcs *pcs, unsigned int mode,
+static void miic_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 			 phy_interface_t interface, int speed, int duplex)
 {
 	struct miic_port *miic_port = phylink_pcs_to_miic_port(pcs);
@@ -333,6 +333,7 @@ struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)
 	miic_port->miic = miic;
 	miic_port->port = port - 1;
 	miic_port->pcs.ops = &miic_phylink_ops;
+	miic_port->pcs.neg_mode = true;
 
 	return &miic_port->pcs;
 }
-- 
2.30.2


