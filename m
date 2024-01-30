Return-Path: <linux-renesas-soc+bounces-1977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0247841F80
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E33A91C22E0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 09:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E578657C3;
	Tue, 30 Jan 2024 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mrdnLgpt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1960DED;
	Tue, 30 Jan 2024 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606904; cv=none; b=H7BMjp8BN9MlqMn2N8eiJC0hU/Rxb1QYVmMcJ6C9+7p7yMbtVB2jx7Ez3LeW4z7CEFvvP7lqTgp3Rc8/YmEagmzypbrLRLU/5aR3OvwD0UXkmXtVWBwBIpgkMxUONDfsnLFyIvDMboDVFi5g+VTH5pbSPtsopPujmS7CUJ+A8zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606904; c=relaxed/simple;
	bh=EnKWCZNENG8M7+4V7YuqDTo7EmxFpDJHQ5fyB6a8q6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XD6ZZbun2a1GlVOllvXsonoXUODDfK9t7EdokODWz2Z/nuCwm0LJQT20rHO3x9SRH6PaFffIKwAPIlDlohAD1mqdF/GCpO2YeSfrefQaWJ3D5xa6i3ySx94y6gtIoXbD87G/Zl0+WmhJlVA/zIxyOO31rG79eNi8qNh8EjpTIPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mrdnLgpt; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFB8D60004;
	Tue, 30 Jan 2024 09:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706606900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gKaAiVBHTky8x6tO+lB4wo7nzgYAtCMdg1nH6ZUPFM=;
	b=mrdnLgptKHzGeU00hlkrhRzHICkwGQ2dIHWouMrJCgEKRY6HwBxIxa6NqoTVYsD4j9Itej
	0WfIjhI4K3XzQ7o1GOUC4o7DARIUFztoEJqY/cvrEG1vwo/6d4VvLweo0O0OSZUEcA4pF0
	6dY1KM9huhedRbcBZbk+K35KRmFbtC80Adkl43kDaOtvQJM3m81bMON1sQSX9FoCQwxXaq
	5973v+/qVloAKXPE9S6CFuEDktqikwZxlsOAuAdLMndsnKjNOIhiq/CW508PGEliHR+gpE
	OzNZBNTdxt80LAJeE42T69O9hopzGQxC+EbPrW/VaNA6C7es7u3ZEoWNOaJbxw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Jan 2024 10:28:42 +0100
Subject: [PATCH net-next v2 7/7] net: pcs: rzn1-miic: Init RX clock early
 if MAC requires it
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240130-rxc_bugfix-v2-7-5e6c3168e5f0@bootlin.com>
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

The GMAC1 controller in the RZN1 IP requires the RX MII clock signal to be
started before it initializes its own hardware, thus before it calls
phylink_start.

Check the rxc_always_on pcs flag and enable the clock signal during the
link validation phase.

Reported-by: Clément Léger <clement.leger@bootlin.com>
Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index d93f84fbb1fd..7ca10b7330ef 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -279,10 +279,26 @@ static int miic_validate(struct phylink_pcs *pcs, unsigned long *supported,
 	return -EINVAL;
 }
 
+static int miic_pre_init(struct phylink_pcs *pcs,
+			 phy_interface_t interface)
+{
+	int ret = 0;
+
+	/* Start RX clock if required */
+	if (pcs->rxc_always_on) {
+		ret = miic_config(pcs, 0, interface, NULL, false);
+		if (ret)
+			pr_err("Error: Failed to init RX clock in RZN1 MIIC PCS!");
+	}
+
+	return ret;
+}
+
 static const struct phylink_pcs_ops miic_phylink_ops = {
 	.pcs_validate = miic_validate,
 	.pcs_config = miic_config,
 	.pcs_link_up = miic_link_up,
+	.pcs_pre_init = miic_pre_init,
 };
 
 struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)

-- 
2.43.0


