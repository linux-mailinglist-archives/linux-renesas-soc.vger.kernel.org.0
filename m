Return-Path: <linux-renesas-soc+bounces-1274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDBE822F7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 15:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1072CB22D48
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jan 2024 14:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11A11A5A0;
	Wed,  3 Jan 2024 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NLIgcVMN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD41A71F;
	Wed,  3 Jan 2024 14:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 043CD6000D;
	Wed,  3 Jan 2024 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704292109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hmed1jEpoZI+pixYHArlZGQKHPpdNarPzqdiGktR7JI=;
	b=NLIgcVMNlWi0/VrDdnLc+QqsaPfWKXhZvk1NqViiDyZoMs1+PEZ28REKDlv2RaCmv99Ia7
	O3cKXIDjObnrrQ3k0kn9fwsvvKqeQYbdKq+GSSSPXeT6XihHjUEddonlcvdgea4nUuiYj3
	FfWkiCOgoXFtcJjzjK2S9E9j3GmrLOlKufDkFOhe7QRchKn+MgCN8eO0Z8lB6sJEzSZtQ3
	h4YuROcxNvOczQb+kJni36zKsewpgKSiObzwFvhwbiPjq3rGXm0z+aQI92ISmJuj5KketI
	D1tZS5HrIcfnYpp1E8jLoIKm6Ii3WoXpr7EpCo0gY1IqmDHEW5buHcXJxCOeYQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Marek Vasut <marex@denx.de>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sylvain Girard <sylvain.girard@se.com>,
	Pascal EBERHARD <pascal.eberhard@se.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net 5/5] net: pcs: rzn1-miic: Init RX clock early if MAC requires it
Date: Wed,  3 Jan 2024 15:28:25 +0100
Message-ID: <20240103142827.168321-6-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103142827.168321-1-romain.gantois@bootlin.com>
References: <20240103142827.168321-1-romain.gantois@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 drivers/net/pcs/pcs-rzn1-miic.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 97139c07130f..bf796491b826 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -271,12 +271,20 @@ static void miic_link_up(struct phylink_pcs *pcs, unsigned int mode,
 static int miic_validate(struct phylink_pcs *pcs, unsigned long *supported,
 			 const struct phylink_link_state *state)
 {
-	if (phy_interface_mode_is_rgmii(state->interface) ||
-	    state->interface == PHY_INTERFACE_MODE_RMII ||
-	    state->interface == PHY_INTERFACE_MODE_MII)
-		return 1;
+	int ret = 1;
 
-	return -EINVAL;
+	if (!phy_interface_mode_is_rgmii(state->interface) &&
+	    state->interface != PHY_INTERFACE_MODE_RMII &&
+	    state->interface != PHY_INTERFACE_MODE_MII)
+		return -EINVAL;
+
+	if (pcs->rxc_always_on) {
+		ret = miic_config(pcs, 0, state->interface, NULL, false);
+		if (ret)
+			pr_err("Error: Failed to init RX clock in RZN1 MIIC PCS!");
+	}
+
+	return ret;
 }
 
 static const struct phylink_pcs_ops miic_phylink_ops = {
-- 
2.43.0


