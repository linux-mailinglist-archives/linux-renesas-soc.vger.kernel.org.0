Return-Path: <linux-renesas-soc+bounces-4635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A38A6827
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 12:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 788501C20D08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 10:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD07127B4D;
	Tue, 16 Apr 2024 10:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="fRA/aNza"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9806127B47;
	Tue, 16 Apr 2024 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713262767; cv=none; b=T12isH2+fp/iqA641ZqTX0KcLV91Mxa4ijQ8BoKwgD0pR7nsR1xJuu2q98vaI6Zt7oOanim5EOqAB91p3zSvwUr0feEDwhLG8YsVmJsjYWjE6sK7YeFzQpmsbk9CGcC8BzPGYv27F+9olJdm74+fccd8EJITo231AN28OEXOHX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713262767; c=relaxed/simple;
	bh=7XvcBtR7lh6++Pz6BP2gfLrCzhR5TRGG0OXjbS8ApQU=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=OXnMi8ZwUIlb9iRmI0bu0YSBJeFLFgC8AAAzZiH2TpsdDldYNeI71IHjQT11clqP+ffmfOMjp9M3l4G9LXpBNw38QtesUy4gjHPcBu8aBm7DOOC27RlN7WbKpORAJJS9bgJ/XrmFAOHvK5F7wtDpR5kc83La51eVbAAs5HYZOSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=fRA/aNza; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7Q18Un481M8WCx/Sllv3H1eh0v99TN6V9WZ4sV4IbTo=; b=fRA/aNzaCK5GIdgpm0Fau02Azj
	srnl51KYIOc0njsp3Gd/lAp3EEDLksEAr/5BJwHKCLSokVGTnGvFbS4rCoQM4JB37sxNipEkWe7EM
	S++e/fUyJCxB+FMA2oG4+Zx21t3pWMqXAZa8Skfi+8/VwX5sp9NlVSLfeK394EY+ZGukh1REolfmF
	fpmp4AQ7CSSQXTw5Bzv8qqonuklEAUb7PHv+Pb1xP4cwMNC9CdKmPUJh/mUB08qCGcQB5ecg9AM66
	HvBiCeq+GkRrNc7TQQij3uP18vQDF5ok9iN5WIjIl+Yz7rFB8EA0uq2SJ+DOZxGFIJSaRCg5s2UPx
	/JGc292w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36900 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rwfuI-0008QM-0o;
	Tue, 16 Apr 2024 11:19:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rwfuJ-00753D-6d; Tue, 16 Apr 2024 11:19:19 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	 Vladimir Oltean <olteanv@gmail.com>
Cc: "Cl__ment L__ger" <clement.leger@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next] net: dsa: rzn1_a5psw: provide own phylink MAC
 operations
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1rwfuJ-00753D-6d@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 16 Apr 2024 11:19:19 +0100

Convert rzn1_a5psw to provide its own phylink MAC operations, thus
avoiding the shim layer in DSA's port.c. We need to provide a stub for
the mac_config() method which is mandatory.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/rzn1_a5psw.c | 47 ++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 10092ea85e46..92e032972b34 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -239,23 +239,31 @@ static void a5psw_phylink_get_caps(struct dsa_switch *ds, int port,
 }
 
 static struct phylink_pcs *
-a5psw_phylink_mac_select_pcs(struct dsa_switch *ds, int port,
+a5psw_phylink_mac_select_pcs(struct phylink_config *config,
 			     phy_interface_t interface)
 {
-	struct dsa_port *dp = dsa_to_port(ds, port);
-	struct a5psw *a5psw = ds->priv;
+	struct dsa_port *dp = dsa_phylink_to_port(config);
+	struct a5psw *a5psw = dp->ds->priv;
 
-	if (!dsa_port_is_cpu(dp) && a5psw->pcs[port])
-		return a5psw->pcs[port];
+	if (dsa_port_is_cpu(dp))
+		return NULL;
 
-	return NULL;
+	return a5psw->pcs[dp->index];
+}
+
+static void a5psw_phylink_mac_config(struct phylink_config *config,
+				     unsigned int mode,
+				     const struct phylink_link_state *state)
+{
 }
 
-static void a5psw_phylink_mac_link_down(struct dsa_switch *ds, int port,
+static void a5psw_phylink_mac_link_down(struct phylink_config *config,
 					unsigned int mode,
 					phy_interface_t interface)
 {
-	struct a5psw *a5psw = ds->priv;
+	struct dsa_port *dp = dsa_phylink_to_port(config);
+	struct a5psw *a5psw = dp->ds->priv;
+	int port = dp->index;
 	u32 cmd_cfg;
 
 	cmd_cfg = a5psw_reg_readl(a5psw, A5PSW_CMD_CFG(port));
@@ -263,15 +271,17 @@ static void a5psw_phylink_mac_link_down(struct dsa_switch *ds, int port,
 	a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(port), cmd_cfg);
 }
 
-static void a5psw_phylink_mac_link_up(struct dsa_switch *ds, int port,
+static void a5psw_phylink_mac_link_up(struct phylink_config *config,
+				      struct phy_device *phydev,
 				      unsigned int mode,
 				      phy_interface_t interface,
-				      struct phy_device *phydev, int speed,
-				      int duplex, bool tx_pause, bool rx_pause)
+				      int speed, int duplex, bool tx_pause,
+				      bool rx_pause)
 {
 	u32 cmd_cfg = A5PSW_CMD_CFG_RX_ENA | A5PSW_CMD_CFG_TX_ENA |
 		      A5PSW_CMD_CFG_TX_CRC_APPEND;
-	struct a5psw *a5psw = ds->priv;
+	struct dsa_port *dp = dsa_phylink_to_port(config);
+	struct a5psw *a5psw = dp->ds->priv;
 
 	if (speed == SPEED_1000)
 		cmd_cfg |= A5PSW_CMD_CFG_ETH_SPEED;
@@ -284,7 +294,7 @@ static void a5psw_phylink_mac_link_up(struct dsa_switch *ds, int port,
 	if (!rx_pause)
 		cmd_cfg &= ~A5PSW_CMD_CFG_PAUSE_IGNORE;
 
-	a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(port), cmd_cfg);
+	a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(dp->index), cmd_cfg);
 }
 
 static int a5psw_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
@@ -992,15 +1002,19 @@ static int a5psw_setup(struct dsa_switch *ds)
 	return 0;
 }
 
+static const struct phylink_mac_ops a5psw_phylink_mac_ops = {
+	.mac_select_pcs = a5psw_phylink_mac_select_pcs,
+	.mac_config = a5psw_phylink_mac_config,
+	.mac_link_down = a5psw_phylink_mac_link_down,
+	.mac_link_up = a5psw_phylink_mac_link_up,
+};
+
 static const struct dsa_switch_ops a5psw_switch_ops = {
 	.get_tag_protocol = a5psw_get_tag_protocol,
 	.setup = a5psw_setup,
 	.port_disable = a5psw_port_disable,
 	.port_enable = a5psw_port_enable,
 	.phylink_get_caps = a5psw_phylink_get_caps,
-	.phylink_mac_select_pcs = a5psw_phylink_mac_select_pcs,
-	.phylink_mac_link_down = a5psw_phylink_mac_link_down,
-	.phylink_mac_link_up = a5psw_phylink_mac_link_up,
 	.port_change_mtu = a5psw_port_change_mtu,
 	.port_max_mtu = a5psw_port_max_mtu,
 	.get_sset_count = a5psw_get_sset_count,
@@ -1252,6 +1266,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	ds->dev = dev;
 	ds->num_ports = A5PSW_PORTS_NUM;
 	ds->ops = &a5psw_switch_ops;
+	ds->phylink_mac_ops = &a5psw_phylink_mac_ops;
 	ds->priv = a5psw;
 
 	ret = dsa_register_switch(ds);
-- 
2.30.2


