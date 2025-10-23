Return-Path: <linux-renesas-soc+bounces-23557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD88C03A3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Oct 2025 00:05:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 95580357D26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 22:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A985A28FFE7;
	Thu, 23 Oct 2025 22:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N34YjTTJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE42325392C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 22:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761257133; cv=none; b=XIgw9ACiuhSnWcaeOhOVtJGVb+VpWlUUx2jYLnZ/IC9MAt/qxkZUSzRFuiinPmmH2IokF1T/5tGWTnV43yXi9HwXYUFxvtnJpPIvY+BPbPzGAlGplkv6hGIng3iphreWLtaQTAhvLLEdJKsvs9mrXH8ddBHmCVTrIv3MMqO4V1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761257133; c=relaxed/simple;
	bh=d8BQDnh0Ryiu7a1KwUdNaceGhIm64M2HooeicMzhtyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDuc1IKM3D1JIf6o0p8nP/rJ+BP9cNtiWJKRQ954BKzS0ov/NoFzXRrZCCwjIux91Sqw2+gwcVD6ZPG1jDPwwsXHZcIsu6AYF7Hb58/BBuFeyI2gUHzITbOdKXL7Gfh1c5U+2X0wawrGkK5GxdiLuiDzqTw5F69V3nZ2cPFbID4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N34YjTTJ; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761257119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fBqJXb6byxA6duMzC7vR1GJY8AU0aT3gF0c28VTzDhM=;
	b=N34YjTTJmkOSqFWZpYc3sTzeOrWbK0OquHl8CtiQVBFjzOKrJgx93JED26whlBUBhW2/Rq
	BXNKMTKfk9JZEz6D8t27egrk0N9CsYy1Xcf9R8Y18C433oZVkQmhK2R83MTGsFU5CB1Gs1
	HjvUciYE9aqpiYt/xfUWCxfW0/jhb1I=
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
To: Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	netdev@vger.kernel.org,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH net-next v5 4/6] net: ravb: convert to ndo_hwtstamp API
Date: Thu, 23 Oct 2025 22:04:55 +0000
Message-ID: <20251023220457.3201122-5-vadim.fedorenko@linux.dev>
In-Reply-To: <20251023220457.3201122-1-vadim.fedorenko@linux.dev>
References: <20251023220457.3201122-1-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Convert driver to use .ndo_hwtstamp_set()/.ndo_hwtstamp_get callbacks.
ravb_do_ioctl() becomes pure phy_do_ioctl_running(), remove it and
replace in callbacks.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 drivers/net/ethernet/renesas/ravb_main.c | 61 ++++++++----------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e2d7ce1a85e8..014d5a51c65b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2410,41 +2410,38 @@ static int ravb_close(struct net_device *ndev)
 	return 0;
 }
 
-static int ravb_hwtstamp_get(struct net_device *ndev, struct ifreq *req)
+static int ravb_hwtstamp_get(struct net_device *ndev,
+			     struct kernel_hwtstamp_config *config)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	struct hwtstamp_config config;
 
-	config.flags = 0;
-	config.tx_type = priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
-						HWTSTAMP_TX_OFF;
+	config->flags = 0;
+	config->tx_type = priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
+						 HWTSTAMP_TX_OFF;
 	switch (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE) {
 	case RAVB_RXTSTAMP_TYPE_V2_L2_EVENT:
-		config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+		config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
 		break;
 	case RAVB_RXTSTAMP_TYPE_ALL:
-		config.rx_filter = HWTSTAMP_FILTER_ALL;
+		config->rx_filter = HWTSTAMP_FILTER_ALL;
 		break;
 	default:
-		config.rx_filter = HWTSTAMP_FILTER_NONE;
+		config->rx_filter = HWTSTAMP_FILTER_NONE;
 	}
 
-	return copy_to_user(req->ifr_data, &config, sizeof(config)) ?
-		-EFAULT : 0;
+	return 0;
 }
 
 /* Control hardware time stamping */
-static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
+static int ravb_hwtstamp_set(struct net_device *ndev,
+			     struct kernel_hwtstamp_config *config,
+			     struct netlink_ext_ack *extack)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	struct hwtstamp_config config;
 	u32 tstamp_rx_ctrl = RAVB_RXTSTAMP_ENABLED;
 	u32 tstamp_tx_ctrl;
 
-	if (copy_from_user(&config, req->ifr_data, sizeof(config)))
-		return -EFAULT;
-
-	switch (config.tx_type) {
+	switch (config->tx_type) {
 	case HWTSTAMP_TX_OFF:
 		tstamp_tx_ctrl = 0;
 		break;
@@ -2455,7 +2452,7 @@ static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
 		return -ERANGE;
 	}
 
-	switch (config.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		tstamp_rx_ctrl = 0;
 		break;
@@ -2463,36 +2460,14 @@ static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
 		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
 		break;
 	default:
-		config.rx_filter = HWTSTAMP_FILTER_ALL;
+		config->rx_filter = HWTSTAMP_FILTER_ALL;
 		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_ALL;
 	}
 
 	priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
 	priv->tstamp_rx_ctrl = tstamp_rx_ctrl;
 
-	return copy_to_user(req->ifr_data, &config, sizeof(config)) ?
-		-EFAULT : 0;
-}
-
-/* ioctl to device function */
-static int ravb_do_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
-{
-	struct phy_device *phydev = ndev->phydev;
-
-	if (!netif_running(ndev))
-		return -EINVAL;
-
-	if (!phydev)
-		return -ENODEV;
-
-	switch (cmd) {
-	case SIOCGHWTSTAMP:
-		return ravb_hwtstamp_get(ndev, req);
-	case SIOCSHWTSTAMP:
-		return ravb_hwtstamp_set(ndev, req);
-	}
-
-	return phy_mii_ioctl(phydev, req, cmd);
+	return 0;
 }
 
 static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
@@ -2628,11 +2603,13 @@ static const struct net_device_ops ravb_netdev_ops = {
 	.ndo_get_stats		= ravb_get_stats,
 	.ndo_set_rx_mode	= ravb_set_rx_mode,
 	.ndo_tx_timeout		= ravb_tx_timeout,
-	.ndo_eth_ioctl		= ravb_do_ioctl,
+	.ndo_eth_ioctl		= phy_do_ioctl_running,
 	.ndo_change_mtu		= ravb_change_mtu,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_set_mac_address	= eth_mac_addr,
 	.ndo_set_features	= ravb_set_features,
+	.ndo_hwtstamp_get	= ravb_hwtstamp_get,
+	.ndo_hwtstamp_set	= ravb_hwtstamp_set,
 };
 
 /* MDIO bus init function */
-- 
2.47.3


