Return-Path: <linux-renesas-soc+bounces-19509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F4B012CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 07:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10BDA1C83324
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jul 2025 05:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F0C1C7015;
	Fri, 11 Jul 2025 05:40:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75806192D83;
	Fri, 11 Jul 2025 05:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752212446; cv=none; b=LP/OK0R1AKPbQT/HyM9HgXChrG6Q2MGAgy66iOlHsL0zbz9D4ciBLjNq75Z3UUWBJ+F4J73IQu67alXnDlN3WcW66Z0VSFh1JVitkASmCt3HcW6KEsKKBEEkaMrBoJN387+YxMuUSTekyz3IiUaylJq2mrMg3H6Yaef9fu/Phwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752212446; c=relaxed/simple;
	bh=cLcSoW4RHFm1zNpR3N8xD4FvB98ZNkaDU1D2fYe6qoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+MH7ThJtaadhVWHStjTPVaE0zd8c2qUBClA0+3nbvhfgVYvQtdW0BDzRdn2ek90vrZ1XbHqpyAtOu1KAuITHZimlwFoNiHS4BEye/pM5nxa11UNq0HRvk1lD4ZqShEIo/uL5T13oBovvsxByrbGI9r3R87WNh2aLbkD/pWvQuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 8ouIrc07RPWR8qAsOQQyXw==
X-CSE-MsgGUID: 5T/umF0RT5ygupuhHbcXYQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jul 2025 14:40:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.72])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 58B70413B428;
	Fri, 11 Jul 2025 14:40:32 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v2] net: phy: micrel: Add ksz9131_resume()
Date: Fri, 11 Jul 2025 06:40:21 +0100
Message-ID: <20250711054029.48536-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/G3E SMARC EVK uses KSZ9131RNXC phy. On deep power state,
PHY loses the power and on wakeup the rgmii delays are not reconfigured
causing it to fail.

Replace the callback kszphy_resume()->ksz9131_resume() for reconfiguring
the rgmii_delay when it exits from PM suspend state.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Added ksz9131-specific phy_driver->resume to reconfigure the rgmii
   delays on exit from PM suspend state.
 * Replaced 'priv->is_suspended'->'phydev->suspended' for checking
   exit from PM state.
 * Updated commit description.
Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20250705170326.106073-1-biju.das.jz@bp.renesas.com/#26459627
---
 drivers/net/phy/micrel.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 74fd6ff32c6c..f678c1bdacdf 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -5633,6 +5633,14 @@ static int lan8841_suspend(struct phy_device *phydev)
 	return kszphy_generic_suspend(phydev);
 }
 
+static int ksz9131_resume(struct phy_device *phydev)
+{
+	if (phydev->suspended && phy_interface_is_rgmii(phydev))
+		ksz9131_config_rgmii_delay(phydev);
+
+	return kszphy_resume(phydev);
+}
+
 static struct phy_driver ksphy_driver[] = {
 {
 	.phy_id		= PHY_ID_KS8737,
@@ -5879,7 +5887,7 @@ static struct phy_driver ksphy_driver[] = {
 	.get_strings	= kszphy_get_strings,
 	.get_stats	= kszphy_get_stats,
 	.suspend	= kszphy_suspend,
-	.resume		= kszphy_resume,
+	.resume		= ksz9131_resume,
 	.cable_test_start	= ksz9x31_cable_test_start,
 	.cable_test_get_status	= ksz9x31_cable_test_get_status,
 	.get_features	= ksz9477_get_features,
-- 
2.43.0


