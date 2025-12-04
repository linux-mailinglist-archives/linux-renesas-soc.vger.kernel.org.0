Return-Path: <linux-renesas-soc+bounces-25567-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5A7CA4948
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 17:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6B269301E98E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 16:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD032FD1CF;
	Thu,  4 Dec 2025 16:41:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AF22F617D;
	Thu,  4 Dec 2025 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764866511; cv=none; b=KIiQYzPbznh7rHHFFhdQpkFNvxET35f6p0tLE/zN+VbOzfDPqPVHV4VQSvSVoh5BkPrNKi2VmNqr6PdslxYLuxbmdPOkY9g9FpU+6cZ2jRBunt0pzGUKx6sgLx1N7gwitM4vQ/f04zvRZC5PH843C6p9R3vF5IkygKe7gEA0XNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764866511; c=relaxed/simple;
	bh=ps7X22mJaepfHJwvepPsYAMOu2GaY4KcdCKbf+NP7HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjIFBjsu6wSG8sGF1jkFizNwYvRMBwMkAu6jXQMk83Le1EYSUo0XwCXQB4VYkRVAC9lmhK0vgMo2As9KCReRYIxdH2GpHm9qq5sTLz3ekRBcu9KzSKIlMJCwXJPNy79dNNjglqkFgg9mh3cFjOlZdA5nZzKueUllLbBHZ21VHck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: ACsD4IskTIK7/hVZ01MOiQ==
X-CSE-MsgGUID: Mzt16R81SUexQZxL6cMpEQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Dec 2025 01:41:39 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.26])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 06BFD402399A;
	Fri,  5 Dec 2025 01:41:31 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk,
	magnus.damm@gmail.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH net-next 1/3] net: stmmac: add physical port identification support
Date: Thu,  4 Dec 2025 17:40:26 +0100
Message-ID: <20251204164028.7321-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204164028.7321-1-john.madieu.xa@bp.renesas.com>
References: <20251204164028.7321-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement ndo_get_phys_port_id and ndo_get_phys_port_name callbacks
to provide physical port identification for all stmmac-based devices.

Default implementations use the permanent MAC address for port ID and
bus_id for port name. Glue drivers can override these by setting
get_phys_port_id and get_phys_port_name callbacks in plat_stmmacenet_data.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 54 +++++++++++++++++++
 include/linux/stmmac.h                        |  5 ++
 2 files changed, 59 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 15b0c08ebd877..e8f642c9941b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7151,6 +7151,58 @@ static void stmmac_get_stats64(struct net_device *dev, struct rtnl_link_stats64
 	stats->rx_missed_errors = priv->xstats.rx_missed_cntr;
 }
 
+/**
+ * stmmac_get_phys_port_id - Get physical port identification
+ * @dev: net device structure
+ * @ppid: pointer to physical port id structure
+ *
+ * Returns a unique physical port identifier. If the platform provides
+ * a custom callback, it is used. Otherwise, the permanent MAC address
+ * serves as the default identifier.
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+static int stmmac_get_phys_port_id(struct net_device *dev,
+				   struct netdev_phys_item_id *ppid)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+
+	/* Allow glue driver to override */
+	if (priv->plat->get_phys_port_id)
+		return priv->plat->get_phys_port_id(dev, ppid);
+
+	/* Default: use permanent MAC address as port ID */
+	ppid->id_len = ETH_ALEN;
+	memcpy(ppid->id, dev->perm_addr, ETH_ALEN);
+
+	return 0;
+}
+
+/**
+ * stmmac_get_phys_port_name - Get physical port name
+ * @dev: net device structure
+ * @name: buffer to store the port name
+ * @len: length of the buffer
+ *
+ * Returns a human-readable physical port name. If the platform provides
+ * a custom callback, it is used. Otherwise, a default name based on
+ * the bus_id is generated.
+ *
+ * Return: 0 on success, negative error code otherwise
+ */
+static int stmmac_get_phys_port_name(struct net_device *dev,
+				     char *name, size_t len)
+{
+	struct stmmac_priv *priv = netdev_priv(dev);
+
+	/* Allow glue driver to override */
+	if (priv->plat->get_phys_port_name)
+		return priv->plat->get_phys_port_name(dev, name, len);
+
+	/* Default: use bus_id as port identifier */
+	return snprintf(name, len, "p%d", priv->plat->bus_id) >= len ? -EINVAL : 0;
+}
+
 static const struct net_device_ops stmmac_netdev_ops = {
 	.ndo_open = stmmac_open,
 	.ndo_start_xmit = stmmac_xmit,
@@ -7172,6 +7224,8 @@ static const struct net_device_ops stmmac_netdev_ops = {
 	.ndo_xsk_wakeup = stmmac_xsk_wakeup,
 	.ndo_hwtstamp_get = stmmac_hwtstamp_get,
 	.ndo_hwtstamp_set = stmmac_hwtstamp_set,
+	.ndo_get_phys_port_id = stmmac_get_phys_port_id,
+	.ndo_get_phys_port_name = stmmac_get_phys_port_name,
 };
 
 static void stmmac_reset_subtask(struct stmmac_priv *priv)
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 4f70a6551e68c..2b98c2d354804 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -277,6 +277,11 @@ struct plat_stmmacenet_data {
 	void (*pcs_exit)(struct stmmac_priv *priv);
 	struct phylink_pcs *(*select_pcs)(struct stmmac_priv *priv,
 					  phy_interface_t interface);
+	/* Physical port identification callbacks (optional, for glue driver override) */
+	int (*get_phys_port_id)(struct net_device *ndev,
+				struct netdev_phys_item_id *ppid);
+	int (*get_phys_port_name)(struct net_device *ndev,
+				  char *name, size_t len);
 	void *bsp_priv;
 	struct clk *stmmac_clk;
 	struct clk *pclk;
-- 
2.25.1


