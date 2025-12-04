Return-Path: <linux-renesas-soc+bounces-25569-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E00CA49C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 17:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1DBC31496D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 16:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694A62F6906;
	Thu,  4 Dec 2025 16:42:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447DE2F1FE3;
	Thu,  4 Dec 2025 16:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764866521; cv=none; b=A1tMMxuSxWxcitm7tZyY6LvHF9b7IAAZQtT1w6s4jgn9fMaLMDt0cC9NnLgE2at/YMXd65ygOdwQgrFDDR/t5+EH+i3w28NiNaY4Ojtp+6kumMNeatoxGE7IFee2FLoavzWh+7MqrzAOWjfjpvtv4Ge4m2olWRFZgX+skvOtMSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764866521; c=relaxed/simple;
	bh=pPNTClRoW9JRdOtd8rJh2TJKkXQUOFrmBQwQDVGQKyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/Sz6TtklA2yQ3CULmkx8T3vgklNmV4pjnXgN/mtU5XIZu4G4OMRpp9SLQurcisaO9t4/ijl/9Yj1qn9fyvclZ4xgQ2lxJW6RYKMjDQbdCCh0yiRUJ0KOoVwxwg28ihKKi+oP9aKiO8ZcxhwC5Z6ZwNHBUbstZlUAyLcZP6795U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: w7mOxRxZQ1K5gx/rCEdm9Q==
X-CSE-MsgGUID: y0DztFi6Qqy/DrtRDdT0Nw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Dec 2025 01:41:58 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.26])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id ED2784023991;
	Fri,  5 Dec 2025 01:41:49 +0900 (JST)
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
Subject: [PATCH net-next 3/3] net: stmmac: dwmac-renesas-gbeth: add physical port identification
Date: Thu,  4 Dec 2025 17:40:28 +0100
Message-ID: <20251204164028.7321-4-john.madieu.xa@bp.renesas.com>
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

Implement ndo_get_phys_port_id() and ndo_get_phys_port_name() callbacks
for the Renesas RZ/G3E GBETH driver.

The port ID is an 8-byte identifier constructed from:
- Permanent MAC address if available (addr_assign_type == NET_ADDR_PERM)
- Renesas OUI (74:90:50) as fallback for random/generated MACs
- Port index from 'port-id' DT property or ethernet alias

The port name resolution follows this hierarchy:
- 'port-name' DT property if specified (allows custom names like "mgmt")
- "p<N>" format using 'port-id' DT property
- "p<N>" format using ethernet alias index as fallback

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
index bc7bb975803ca..5acb65b0e4f06 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
@@ -16,7 +16,9 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/netdevice.h>
 #include <linux/of.h>
+#include <linux/of_net.h>
 #include <linux/pcs-rzn1-miic.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
@@ -91,6 +93,57 @@ static struct phylink_pcs *renesas_gmac_select_pcs(struct stmmac_priv *priv,
 	return priv->hw->phylink_pcs;
 }
 
+static int renesas_gbeth_get_port_id(struct device *dev)
+{
+	int port_id;
+
+	if (!device_property_read_u32(dev, "renesas,port-id", &port_id))
+		return port_id;
+
+	port_id = of_alias_get_id(dev_of_node(dev), "ethernet");
+
+	return port_id < 0 ? 0 : port_id;
+}
+
+static int renesas_gbeth_get_phys_port_name(struct net_device *ndev,
+					    char *name, size_t len)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct renesas_gbeth *gbeth = priv->plat->bsp_priv;
+	const char *port_name;
+
+	if (!device_property_read_string(gbeth->dev, "renesas,port-name", &port_name))
+		return snprintf(name, len, "%s", port_name) >= len ? -EINVAL : 0;
+
+	return snprintf(name, len, "p%d", renesas_gbeth_get_port_id(gbeth->dev)) >= len ? -EINVAL : 0;
+}
+
+static int renesas_gbeth_get_phys_port_id(struct net_device *ndev,
+					  struct netdev_phys_item_id *ppid)
+{
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	struct renesas_gbeth *gbeth = priv->plat->bsp_priv;
+	u8 *id = ppid->id;
+
+	if (ndev->addr_assign_type == NET_ADDR_PERM) {
+		memcpy(id, ndev->perm_addr, ETH_ALEN);
+	} else {
+		/* Fallback: Renesas OUI prefix (74:90:50) */
+		id[0] = 0x74;
+		id[1] = 0x90;
+		id[2] = 0x50;
+		id[3] = 0x00;
+		id[4] = 0x00;
+		id[5] = 0x00;
+	}
+
+	id[6] = renesas_gbeth_get_port_id(gbeth->dev) & 0xff;
+	id[7] = 0x00;
+	ppid->id_len = 8;
+
+	return 0;
+}
+
 static int renesas_gbeth_init(struct platform_device *pdev, void *priv)
 {
 	struct plat_stmmacenet_data *plat_dat;
@@ -194,6 +247,9 @@ static int renesas_gbeth_probe(struct platform_device *pdev)
 		plat_dat->select_pcs = renesas_gmac_select_pcs;
 	}
 
+	plat_dat->get_phys_port_id = renesas_gbeth_get_phys_port_id;
+	plat_dat->get_phys_port_name = renesas_gbeth_get_phys_port_name;
+
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
-- 
2.25.1


