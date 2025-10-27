Return-Path: <linux-renesas-soc+bounces-23648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB144C0E395
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 15:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3F5C734DADB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 14:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8582D2BF011;
	Mon, 27 Oct 2025 14:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tpK3du1B";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eZdw1Cff"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88D72BD5AF;
	Mon, 27 Oct 2025 14:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573825; cv=none; b=RDo7WYZDKcnSm5gfn317RonTqiLzRyimC8BUUidWG+Z+Dgg2WVBMGV5Re86xuMl+TNIMVMoJ7kL5dphaejogM+pL/3ms20vCw9TEPGkarqUy58dj9K5Yx7Ay58JqGe/Qps/D5NAug/4x2pc/dw6w2emRL0410zY7nRo7fLKN+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573825; c=relaxed/simple;
	bh=yqoFvqZAIm8yD06JHGM+BPxm/vwZP0X0Bxtd9vwKj0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5YlN4Ko0QRYNYNI8Cjf4dJdt7pIkrvqn+KCSkAW3oPTn3DLs2udhZZSDkqUU9yj9q1eBCrVmtdkO4PEMapqxg5BGPMeu730Ywz1xOht7FlfqFxH7TSifnHj+uMr/qYvX0dnpysIUe/WZh6mbC9An1JChPKeCdEZblTOvBfKg6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tpK3du1B; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eZdw1Cff; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cwFbd4lYdz9tRr;
	Mon, 27 Oct 2025 15:03:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761573821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jknHS/iKfmAu2In9TXO/DSZXKw2IE+AhpQnlnm9FrNE=;
	b=tpK3du1Bey2iEmm6x0xOANqL/nhO3wbRIMJAMCuXMhw7fCc89MSmSNgI00MZUvolrW+OzU
	aIZ+EY43PrxahrysYe3YycnBkW/RtlM9Qg4fJ/S5ZV0uMSClAtmg66wt6xV447jbF+BCX2
	joBCK7sXA0aTDjO0YrreK/mlwp5xwwYsc2Nsib0uV7WLWg6O/k7+/f73YtE9wDNmH39Vw5
	l1giqkOrQzCKscXmzbjc/DzA1Ae80ZhmMTVCNa2epUh7mLWLXqITXZeB7uk3z+x9quBEcb
	bTM7l62/Vog4l/4UCMj0lfT7XQpYxrgFeVEzIKU2HPyVxVLKtrlMiv0cLSbg/g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761573819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jknHS/iKfmAu2In9TXO/DSZXKw2IE+AhpQnlnm9FrNE=;
	b=eZdw1CffSlLq1cpcc5fUEoFX19kA0uT3vGvXNoXMz0HQO3ruZDdnH4yYc3eD+s9z9h6YeC
	LKIxh8QGfUuMdq/svlYDYi3AqDsyOhO4VOdFjXKeTNb0QWSPBXttr9SVDTRZdhKg8a0UzL
	9eawQ7HNWaPggyMFp9QWh3jE9LYUj714JXbGidB1EGFiCm1fMx0QctJusA+lGXG9L0Vbt2
	QheqQQxK0NoKKnRa0XO3pzOQzJR5dXIXtedhS7k5DrPUzQYdVziTMJJ1GTynnr0RMxHgvg
	60TR+0BW6yrNzi17PzUlYygFGuapGBwmW7Eqo4Qb5BKBOwac5FckbhqbN+FLEw==
To: netdev@vger.kernel.org
Cc: Thanh Quan <thanh.quan.xn@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Hai Pham <hai.pham.ud@renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dan Murphy <dmurphy@ti.com>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org
Subject: [net,PATCH v2] net: phy: dp83869: fix STRAP_OPMODE bitmask
Date: Mon, 27 Oct 2025 15:02:43 +0100
Message-ID: <20251027140320.8996-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hn4d64qmojg4by8drbtfiakbqpapa5f5
X-MBO-RS-ID: 0da13dba7a229ab3c54

From: Thanh Quan <thanh.quan.xn@renesas.com>

According to the TI DP83869HM datasheet Revision D (June 2025), section
7.6.1.41 STRAP_STS Register, the STRAP_OPMODE bitmask is bit [11:9].
Fix this.

In case the PHY is auto-detected via PHY ID registers, or not described
in DT, or, in case the PHY is described in DT but the optional DT property
"ti,op-mode" is not present, then the driver reads out the PHY functional
mode (RGMII, SGMII, ...) from hardware straps.

Currently, all upstream users of this PHY specify both DT compatible string
"ethernet-phy-id2000.a0f1" and ti,op-mode = <DP83869_RGMII_COPPER_ETHERNET>
property, therefore it seems no upstream users are affected by this bug.

The driver currently interprets bits [2:0] of STRAP_STS register as PHY
functional mode. Those bits are controlled by ANEG_DIS, ANEGSEL_0 straps
and an always-zero reserved bit. Systems that use RGMII-to-Copper functional
mode are unlikely to disable auto-negotiation via ANEG_DIS strap, or change
auto-negotiation behavior via ANEGSEL_0 strap. Therefore, even with this bug
in place, the STRAP_STS register content is likely going to be interpreted
by the driver as RGMII-to-Copper mode.

However, for a system with PHY functional mode strapping set to other mode
than RGMII-to-Copper, the driver is likely to misinterpret the strapping
as RGMII-to-Copper and misconfigure the PHY.

For example, on a system with SGMII-to-Copper strapping, the STRAP_STS
register reads as 0x0c20, but the PHY ends up being configured for
incompatible RGMII-to-Copper mode.

Fixes: 0eaf8ccf2047 ("net: phy: dp83869: Set opmode from straps")
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org> # Port from U-Boot to Linux
---
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
Register 0x6e STRAP_STS readout, from U-Boot, but the register is
read-only and the hardware straps do not change between U-Boot and
Linux:
"
=> mdio write port@4 0xd 0x1f ; mdio write port@4 0xe 0x6e ; mdio write port@4 0xd 0x401f ; mdio read port@4 0xe
Reading from bus port@4
PHY at address 2:
14 - 0xc20
"
---
V2: Update commit message, add RB from Andrew
    https://lore.kernel.org/all/3b5e2a79-186e-4c92-9bef-51fdd34af351@lunn.ch/
---
 drivers/net/phy/dp83869.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/dp83869.c b/drivers/net/phy/dp83869.c
index a2cd1cc35cde1..1f381d7b13ff3 100644
--- a/drivers/net/phy/dp83869.c
+++ b/drivers/net/phy/dp83869.c
@@ -84,7 +84,7 @@
 #define DP83869_CLK_DELAY_DEF			7
 
 /* STRAP_STS1 bits */
-#define DP83869_STRAP_OP_MODE_MASK		GENMASK(2, 0)
+#define DP83869_STRAP_OP_MODE_MASK		GENMASK(11, 9)
 #define DP83869_STRAP_STS1_RESERVED		BIT(11)
 #define DP83869_STRAP_MIRROR_ENABLED           BIT(12)
 
@@ -528,7 +528,7 @@ static int dp83869_set_strapped_mode(struct phy_device *phydev)
 	if (val < 0)
 		return val;
 
-	dp83869->mode = val & DP83869_STRAP_OP_MODE_MASK;
+	dp83869->mode = FIELD_GET(DP83869_STRAP_OP_MODE_MASK, val);
 
 	return 0;
 }
-- 
2.51.0


