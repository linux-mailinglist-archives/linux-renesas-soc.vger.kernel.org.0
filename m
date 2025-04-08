Return-Path: <linux-renesas-soc+bounces-15537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E88CA7F505
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 08:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D0453B0A82
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 06:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2CA161321;
	Tue,  8 Apr 2025 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hPu9xjLL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A71207E15
	for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Apr 2025 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093920; cv=none; b=HZNAfQ/Jt0sG/kp84p8UUWt/TbTlDuoYW/ujCzezgo62IF/cD82dyZhhytCemQOisfYwq141W4EUilMir1mnEeKcLMb/pEvrL1SwsKReDYfaCt1WVrurz3HJhyS3Do1af63uGSXLKqh6LKnRIWLW98Fc6DozggGlcpjIcO4dvHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093920; c=relaxed/simple;
	bh=DCFRFeOvG9Se1vy9dxQqHhggxa1GPhQtzmON2CPVQ+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vBn+R1BaVBeAeP8BVlgAE7U6CnKipSU7Ylv7hi7Qz3ajvQt8fqENy1K4uSHTOR4dTZoJS12QSXTr3ZrGO9tefXHFebognusTVgvIydK8Yc5Gh6A5ssI8kDpu+/NUx6GsRa+2Wm5Fg5FM/c8wdAqZqYTl0DdQhuqDxr/dpsesYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hPu9xjLL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=HDVRn+SJMaBmKN
	TbjPM3o80W06WAYQY8MWdQY2wavDY=; b=hPu9xjLLor8ZbWoZRsVwF1TD3kNOol
	I0/goJzYU7wxPZq2/pcX1VKywzGJ5gCfikz02az7Kiyssyyjmpjwy6t9pOdEMRbA
	Y8MfEDFU3fouhu+v0qfIFt1UYQABnKA7HAlUB6dEXq2c/dic8lQxYwKnDGe8GqS1
	eQZgTVum7m2npz3CF7gVohnNvhNl5X2RVZgVhvQvwwljN+FiZM794BM4RFPtRJvN
	L4lIsIK5cio5b/YVxgkAVzYBjn95iFJ1bDAFyJFHgBW2loUT3F/8aV6X7tX03NfF
	ggrgTN7EOJMGdXqVanT9Al4awq+YdFr59mfU9qwWHpltT6EPv8Fslwwg==
Received: (qmail 4071147 invoked from network); 8 Apr 2025 08:31:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2025 08:31:45 +0200
X-UD-Smtp-Session: l3s3148p1@fgGrgT4ySsMgAwDPXyfYALbiJ46yNPq3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: [RFC PATCH net-next] net: phy: marvell: support DT configurations with only two LEDs
Date: Tue,  8 Apr 2025 08:30:56 +0200
Message-ID: <20250408063136.5463-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/N1-extension board also connects only two out of three
LED outputs from the Marvell PHY to the actual LEDs. The already
existing setting MARVELL_PHY_LED0_LINK_LED1_ACTIVE fits this scenario,
but a device flag cannot be used because the PHYs use a generic MDIO bus
on which also PHYs from other vendors reside. So, the driver is updated
to count the number of LED nodes in DT. If the number is 2, the
alternative LED configuration is used, otherwise the default one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Is this a proper approach? FYI I double checked that
of_get_child_count() is NULL safe.

 drivers/net/phy/marvell.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
index 623292948fa7..b967b4fcd25a 100644
--- a/drivers/net/phy/marvell.c
+++ b/drivers/net/phy/marvell.c
@@ -843,7 +843,8 @@ static int m88e1510_config_aneg(struct phy_device *phydev)
 static void marvell_config_led(struct phy_device *phydev)
 {
 	u16 def_config;
-	int err;
+	int num_leds, err;
+	struct device_node *np_leds;
 
 	switch (MARVELL_PHY_FAMILY_ID(phydev->phy_id)) {
 	/* Default PHY LED config: LED[0] .. Link, LED[1] .. Activity */
@@ -857,7 +858,9 @@ static void marvell_config_led(struct phy_device *phydev)
 	 * LED[2] .. Blink, Activity
 	 */
 	case MARVELL_PHY_FAMILY_ID(MARVELL_PHY_ID_88E1510):
-		if (phydev->dev_flags & MARVELL_PHY_LED0_LINK_LED1_ACTIVE)
+		np_leds = of_find_node_by_name(phydev->mdio.dev.of_node, "leds");
+		num_leds = of_get_child_count(np_leds);
+		if (phydev->dev_flags & MARVELL_PHY_LED0_LINK_LED1_ACTIVE || num_leds == 2)
 			def_config = MII_88E1510_PHY_LED0_LINK_LED1_ACTIVE;
 		else
 			def_config = MII_88E1510_PHY_LED_DEF;
-- 
2.47.2


