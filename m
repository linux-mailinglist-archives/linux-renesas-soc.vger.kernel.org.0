Return-Path: <linux-renesas-soc+bounces-25570-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D6CA497E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 17:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57D7F300B332
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 16:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA2B2FF166;
	Thu,  4 Dec 2025 16:44:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from 2.mo561.mail-out.ovh.net (2.mo561.mail-out.ovh.net [46.105.75.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6264B2FBDFD
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 16:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.75.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764866679; cv=none; b=GbUfVnxSAdM7wuInI93y8cGIzO1X4+j1e2jGmFvZSSj1GOVp14xxgnmbiubAB8W7DxBOXk1seAfYmwnBO2tNeRjF886Jrd2EbSOM/lkE6k0wt7eC3YqB5xkcN40nrbuOngZzO1AxCSnIaNiRIq3RVG2xeJ1Fx9i5mcLrvyqpp1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764866679; c=relaxed/simple;
	bh=pPNTClRoW9JRdOtd8rJh2TJKkXQUOFrmBQwQDVGQKyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iVm10NexL7ECRkV5WIETh88STSKe07xyVtCOl+nKTKF/7AcU8RENVdTWMOHXDb8EAJnyNbIoCkLU1gQ7DJhtk+IK88f4lMrmKr4iSkOy1GvsstvR4MAh11dd576gFnxjFxzjs89kOnyLw8lMSIHdVWeWVlTxYVJd0SGJ6JC9xDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=bp.renesas.com; spf=fail smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=46.105.75.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=bp.renesas.com
Received: from director10.ghost.mail-out.ovh.net (unknown [10.109.231.66])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4dMgDY3tPDz6V7S
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 16:38:21 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-m4nfg (unknown [10.111.174.111])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 454B3C47F7;
	Thu,  4 Dec 2025 16:38:20 +0000 (UTC)
Received: from labcsmart.com ([37.59.142.114])
	by ghost-submission-7d8d68f679-m4nfg with ESMTPSA
	id naCeNve4MWmh+AYArq+dVg:T4
	(envelope-from <john.madieu.xa@bp.renesas.com>); Thu, 04 Dec 2025 16:38:20 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S008883cf125-3535-4afa-be96-a4b843963a19,
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
Subject: [PATCH net-next 3/3] net: stmmac: dwmac-renesas-gbeth: add physical port identification
Date: Thu,  4 Dec 2025 16:37:29 +0000
Message-Id: <20251204163729.3036329-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251204163729.3036329-1-john.madieu.xa@bp.renesas.com>
References: <20251204163729.3036329-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13329810476081317253
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTEf8MbYdR5Y2je/5fYZ71X9j5vAmYx4T9gOx+UaroPSfFmCPtyfo6y4JgKctQLxVQcntkQ0E+Yka17oLLlV4jtbf4s3AKxfgkQUAP5j2tPphj1OJDtH2iRTiql7TJmkXvJwF7DgaHrrjcyhMZglHVMJmnd0EaIdvEbM5ebDsPvfKKan+hNpqRYRDHmNru7g8SW2ZzhuZSyYUj/UQphAozIGILCDxfqqil3rhaCDizqmBFxMUIqtBYQRube/LD/v4iN4a4ZIeZ02xcuIVP8pHeyofdDqpbkPpck7oez4jiAAqfzV50/xj07LZsE55yOIpf2bZO6uec4HL2rg1bLLStyPe+/DZMWTTVkZzxgLUzScK5SFQueD/tjkYekMqxCweQo9N7cb0/f1wlqr6BQ3b4XtgDf6WHiWUeOjARzInlspqzYOh8Mb5TD7B/UpexnwvsEb8v/Av4H9YTStvXj9KFPFpY9JipKW7tx8CNmPRVUJD1UdQmUwmFOMs5jsoLmPRT6LRrBwTjM4XTP5v25HEI6Bcebdx1kWOXslRfR2R93XyoQNOFM91azmz+690tSO9y4mQNfj3nWCQzkRLxW1JnpNegBVEu/aYzcd0gdTxvjvNHpO3ZhEa+0rAPnaboZIydkLMM01TctZehBieVPYieBY1eEubmsc7SAn7diwC/MS1Q

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


