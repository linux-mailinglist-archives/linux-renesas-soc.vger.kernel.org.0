Return-Path: <linux-renesas-soc+bounces-23373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9317BF59F1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 11:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3922484FC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B74232B987;
	Tue, 21 Oct 2025 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UfXcRL+z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C632B9A5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 09:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040130; cv=none; b=JWzatsRq0aDYcttUYzgGJ29y2yxJVgSQei/4av6DglrVXCEw1vFupjR0yK4mILnR8RfhQkebVMWJeFyC1Ep5p4Xrp6H1TUq/B0VW7LqMnABTTEevbd86+nPj6Jv7mov62UCgbWUWLJYdWfGIJbrwi4EwIMXePJ+AGLm5R3mmdBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040130; c=relaxed/simple;
	bh=FfbEl7kUdBVJUv2FOP8L0z663dfdh1GY03VMLv3dgKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CI8twKpABD0S0eLhZhbR1f3w1UcDsv+vNm9QKLpXMmsvR337hQXD5f8dWD7+XqKcaWytVpTvN2VDAbAgyIEEaIPF36QzVIs1ePZPD3RilgCukhBYGmCb3WUoAojqbUSlp6ucfrVOAXNESCDjPLItFcKOseLHuzoszbquIbQ2Bws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UfXcRL+z; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761040126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSRDByoUa8ZYSCnAAhl5kaGsnYYmNQkKU9dYn7yp+OE=;
	b=UfXcRL+zq9ACOiycZ7/7I3p+ABcXkmeEuqbKgJWxG9igkYtpiFaqamZab4q7ooVfSzcNm/
	Wuo7zAtwfmmWWP9+zkIbT/Bd554p7OjsCl9oGxi4zR7g7Ti0yE7Hs590UL+Nf49mo/20/j
	teNteNsUUF8amEeql4+GnNwH1fSuYjg=
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
Subject: [PATCH net-next v3 4/6] net: ravb: convert to ndo_hwtstamp API
Date: Tue, 21 Oct 2025 09:47:49 +0000
Message-ID: <20251021094751.900558-5-vadim.fedorenko@linux.dev>
In-Reply-To: <20251021094751.900558-1-vadim.fedorenko@linux.dev>
References: <20251021094751.900558-1-vadim.fedorenko@linux.dev>
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
index 9d3bd65b85ff..113d7c7bd921 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2390,41 +2390,38 @@ static int ravb_close(struct net_device *ndev)
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
@@ -2435,7 +2432,7 @@ static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
 		return -ERANGE;
 	}
 
-	switch (config.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		tstamp_rx_ctrl = 0;
 		break;
@@ -2443,36 +2440,14 @@ static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
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
@@ -2608,11 +2583,13 @@ static const struct net_device_ops ravb_netdev_ops = {
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


