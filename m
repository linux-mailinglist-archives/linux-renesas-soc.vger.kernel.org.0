Return-Path: <linux-renesas-soc+bounces-25578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7BDCA4B75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 18:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62F083008EA7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 17:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422002DC78F;
	Thu,  4 Dec 2025 17:09:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from 3.mo561.mail-out.ovh.net (3.mo561.mail-out.ovh.net [46.105.44.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AFC2D8DB1
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.44.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764868183; cv=none; b=aYbj0mRk7OL23cSQByILGUEuiO1KGCvYJkbV8mrzFxMCDl1IU3aEbkvBIv/LnKJKPhWWlO3ocY2wN+LzzQuk5GnOGUROLXruc46sfN9EbW7277DwaLLQku//pZdgj2njHu9UXNO/BdJj5Tjxyem0nL4dIewouxu6ttGMEL444Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764868183; c=relaxed/simple;
	bh=ps7X22mJaepfHJwvepPsYAMOu2GaY4KcdCKbf+NP7HU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=odkjx9dez9+pZwOR9jcpD48YEqZhcuelKjHbrriUdhMNL8fgrMoVXHo49e8a6RghXJwO8xx9EfddRpHHzmWDetEWyyHapgpcrkDr4d1x6W4PLIHsteFjr4XHXGXbx0WcbrYT97bd47WJbE3aBERnpSX/T7r+GDEuYc5EnQPfRBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=bp.renesas.com; spf=fail smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=46.105.44.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=bp.renesas.com
Received: from director6.ghost.mail-out.ovh.net (unknown [10.110.0.68])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4dMg4k4nqSz6VHm
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 16:31:34 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-mkpf7 (unknown [10.111.182.250])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7A580802E1;
	Thu,  4 Dec 2025 16:31:33 +0000 (UTC)
Received: from labcsmart.com ([37.59.142.99])
	by ghost-submission-7d8d68f679-mkpf7 with ESMTPSA
	id GduLDmO3MWnQjQQATXHgnQ:T2
	(envelope-from <john.madieu.xa@bp.renesas.com>); Thu, 04 Dec 2025 16:31:33 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G00348cfb848-68c3-474d-8767-bd08eb0a84b3,
                    E90FA267686E4F2ED65044873A5FD8D85CF2A6B0) smtp.auth=john.madieu@labcsmart.com
X-OVh-ClientIp:141.94.163.193
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
Date: Thu,  4 Dec 2025 16:31:20 +0000
Message-Id: <20251204163122.3032995-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251204163122.3032995-1-john.madieu.xa@bp.renesas.com>
References: <20251204163122.3032995-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13215250159305065861
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTGTG1S+3Oe5+8Q7M5Xj6P3TY9ZSd28daoqwJLfe4PAzxlZip2ovKqHAZR0UEgCCF584RfnTnm80GuzRzUgxrdRG/nU8CQ35rlXvkCLxVojFBBYDzeRh2XlZwewCG6Sh+IhIXNlqqye8HH6vGv+5xuoLyoXf5eKj5tfXOTcMgYnHKKznzQd/71usWeslfg2b77GUiupjYLNkgufd/jyA42aCrWkhDsfDOjF2UtRx6s+IRt7iEWIy8E0dtI4cvw5d0O8hGPjuMBtOifeyTXEqNtTujffvjjlMY6LUU1br14Ia1rr+ibexdAS4IBukdxwB+yZ+kTJbCrtNA5vh9kt19x5Ycd6VbowB8ySUWeKttitRnLEnnw6E7p/7zeDahNGTA5eJmNOpEOqFH4NGxe/FVqRg9uS59zoLxqtZaThebXnLnN38yIfUrhwo039FoTZhQxBPdI+LrC10lJQ5cBfbtup8dK7TsGwqJVOyEf6P7UExOOgPaimlXc8oDBmTQlkJROoVYzZf07vs/dz4AuGEIk4DIP35MkF+shZwIQuqI9dYdTZ74g9U2ErkRp4mW2TMvtMxUzRLXJ13y3MblrrhHIW9Cjmgh1+Gc6W8g+E2+JDSnbhMCIgnJT1qUiukkqJNVHud1WQ1teB0vu1Gsp/dDNyxC/GfBh4uDBaYFmI/IbPfRQ

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


