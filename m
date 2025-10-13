Return-Path: <linux-renesas-soc+bounces-22965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A006BD56F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 19:17:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3F94404C2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1AC2949E0;
	Mon, 13 Oct 2025 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="o8YgbP7o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E19230D35
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373573; cv=none; b=fsBkiT75rlUj3zVWK0gWvJQRyTkMx52SV1SELsz+cAXxM8p2ettB2L9aEAW847d0pKDgQ7KobSDq5aJiXDJP0Nes9aBTN4DOmGz+b/t27d2DuIid8+eyZiPWgjcCE1VKX650G6rKb2RZXUxIHUoSh+4g0Ys7BB+yBeD01RdV1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373573; c=relaxed/simple;
	bh=5C1qDxV8zG7Dy8IvFQHb/jkhHNw1IrIwOudXH4lrNb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K+s46wAkLXkn4GcQ38zbPCoBHH9AA/qNVxIZYvFo79LygJSMS+eDmfsWhM9IbMhK+gsk+7KW2/KK1+6WWuX5nDXEsFMAl3ICLVjWg/QRybW0PFX7dkNNiYB03LJaxWzpJWkzfwRgEs01pZ2REzzcI0gNUVbyVgjuNcQfqBKJsyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=o8YgbP7o; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760373569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AIohGWiAy+qevGkaLEubv6ccONSE1UxMLl4VJSnYybM=;
	b=o8YgbP7out1sKZtq2G3gJQnJpET1FN2bYQdVZ5OiUQKEGy3H8JnCqV3AY0fsLbUkXJAB7Y
	9IaFCNPevWHdd4ZzBs/zYgyiRDzqzWTu6iN1piDkxchpN3CrY79Uymy05jnCiVqmzUQJt/
	ZuwZpadBsXdPl94op6tRsIVvBaL12p4=
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Igor Russkikh <irusskikh@marvell.com>,
	Egor Pomozov <epomozov@marvell.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>,
	Dimitris Michailidis <dmichail@fungible.com>,
	Jian Shen <shenjian15@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Brett Creeley <brett.creeley@amd.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Roger Quadros <rogerq@kernel.org>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [PATCH net-next 06/14] tsnep: convert to ndo_hwtstatmp API
Date: Mon, 13 Oct 2025 16:37:41 +0000
Message-ID: <20251013163749.5047-1-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Convert to .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
After conversions the rest of tsnep_netdev_ioctl() becomes pure
phy_do_ioctl_running(), so remove tsnep_netdev_ioctl() and replace
it with phy_do_ioctl_running() in .ndo_eth_ioctl.

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 drivers/net/ethernet/engleder/tsnep.h      |  8 +-
 drivers/net/ethernet/engleder/tsnep_main.c | 14 +---
 drivers/net/ethernet/engleder/tsnep_ptp.c  | 88 +++++++++++-----------
 3 files changed, 51 insertions(+), 59 deletions(-)

diff --git a/drivers/net/ethernet/engleder/tsnep.h b/drivers/net/ethernet/engleder/tsnep.h
index f188fba021a6..03e19aea9ea4 100644
--- a/drivers/net/ethernet/engleder/tsnep.h
+++ b/drivers/net/ethernet/engleder/tsnep.h
@@ -176,7 +176,7 @@ struct tsnep_adapter {
 	struct tsnep_gcl gcl[2];
 	int next_gcl;
 
-	struct hwtstamp_config hwtstamp_config;
+	struct kernel_hwtstamp_config hwtstamp_config;
 	struct ptp_clock *ptp_clock;
 	struct ptp_clock_info ptp_clock_info;
 	/* ptp clock lock */
@@ -203,7 +203,11 @@ extern const struct ethtool_ops tsnep_ethtool_ops;
 
 int tsnep_ptp_init(struct tsnep_adapter *adapter);
 void tsnep_ptp_cleanup(struct tsnep_adapter *adapter);
-int tsnep_ptp_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd);
+int tsnep_ptp_hwtstamp_get(struct net_device *netdev,
+			   struct kernel_hwtstamp_config *config);
+int tsnep_ptp_hwtstamp_set(struct net_device *netdev,
+			   struct kernel_hwtstamp_config *config,
+			   struct netlink_ext_ack *extack);
 
 int tsnep_tc_init(struct tsnep_adapter *adapter);
 void tsnep_tc_cleanup(struct tsnep_adapter *adapter);
diff --git a/drivers/net/ethernet/engleder/tsnep_main.c b/drivers/net/ethernet/engleder/tsnep_main.c
index eba73246f986..b118407c30e8 100644
--- a/drivers/net/ethernet/engleder/tsnep_main.c
+++ b/drivers/net/ethernet/engleder/tsnep_main.c
@@ -2168,16 +2168,6 @@ static netdev_tx_t tsnep_netdev_xmit_frame(struct sk_buff *skb,
 	return tsnep_xmit_frame_ring(skb, &adapter->tx[queue_mapping]);
 }
 
-static int tsnep_netdev_ioctl(struct net_device *netdev, struct ifreq *ifr,
-			      int cmd)
-{
-	if (!netif_running(netdev))
-		return -EINVAL;
-	if (cmd == SIOCSHWTSTAMP || cmd == SIOCGHWTSTAMP)
-		return tsnep_ptp_ioctl(netdev, ifr, cmd);
-	return phy_mii_ioctl(netdev->phydev, ifr, cmd);
-}
-
 static void tsnep_netdev_set_multicast(struct net_device *netdev)
 {
 	struct tsnep_adapter *adapter = netdev_priv(netdev);
@@ -2384,7 +2374,7 @@ static const struct net_device_ops tsnep_netdev_ops = {
 	.ndo_open = tsnep_netdev_open,
 	.ndo_stop = tsnep_netdev_close,
 	.ndo_start_xmit = tsnep_netdev_xmit_frame,
-	.ndo_eth_ioctl = tsnep_netdev_ioctl,
+	.ndo_eth_ioctl = phy_do_ioctl_running,
 	.ndo_set_rx_mode = tsnep_netdev_set_multicast,
 	.ndo_get_stats64 = tsnep_netdev_get_stats64,
 	.ndo_set_mac_address = tsnep_netdev_set_mac_address,
@@ -2394,6 +2384,8 @@ static const struct net_device_ops tsnep_netdev_ops = {
 	.ndo_bpf = tsnep_netdev_bpf,
 	.ndo_xdp_xmit = tsnep_netdev_xdp_xmit,
 	.ndo_xsk_wakeup = tsnep_netdev_xsk_wakeup,
+	.ndo_hwtstamp_get = tsnep_ptp_hwtstamp_get,
+	.ndo_hwtstamp_set = tsnep_ptp_hwtstamp_set,
 };
 
 static int tsnep_mac_init(struct tsnep_adapter *adapter)
diff --git a/drivers/net/ethernet/engleder/tsnep_ptp.c b/drivers/net/ethernet/engleder/tsnep_ptp.c
index 54fbf0126815..ae1308eb813d 100644
--- a/drivers/net/ethernet/engleder/tsnep_ptp.c
+++ b/drivers/net/ethernet/engleder/tsnep_ptp.c
@@ -19,57 +19,53 @@ void tsnep_get_system_time(struct tsnep_adapter *adapter, u64 *time)
 	*time = (((u64)high) << 32) | ((u64)low);
 }
 
-int tsnep_ptp_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
+int tsnep_ptp_hwtstamp_get(struct net_device *netdev,
+			   struct kernel_hwtstamp_config *config)
 {
 	struct tsnep_adapter *adapter = netdev_priv(netdev);
-	struct hwtstamp_config config;
-
-	if (!ifr)
-		return -EINVAL;
-
-	if (cmd == SIOCSHWTSTAMP) {
-		if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-			return -EFAULT;
-
-		switch (config.tx_type) {
-		case HWTSTAMP_TX_OFF:
-		case HWTSTAMP_TX_ON:
-			break;
-		default:
-			return -ERANGE;
-		}
-
-		switch (config.rx_filter) {
-		case HWTSTAMP_FILTER_NONE:
-			break;
-		case HWTSTAMP_FILTER_ALL:
-		case HWTSTAMP_FILTER_PTP_V1_L4_EVENT:
-		case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
-		case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
-		case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
-		case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
-		case HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ:
-		case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
-		case HWTSTAMP_FILTER_PTP_V2_L2_SYNC:
-		case HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ:
-		case HWTSTAMP_FILTER_PTP_V2_EVENT:
-		case HWTSTAMP_FILTER_PTP_V2_SYNC:
-		case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
-		case HWTSTAMP_FILTER_NTP_ALL:
-			config.rx_filter = HWTSTAMP_FILTER_ALL;
-			break;
-		default:
-			return -ERANGE;
-		}
-
-		memcpy(&adapter->hwtstamp_config, &config,
-		       sizeof(adapter->hwtstamp_config));
+
+	*config = adapter->hwtstamp_config;
+	return 0;
+}
+
+int tsnep_ptp_hwtstamp_set(struct net_device *netdev,
+			   struct kernel_hwtstamp_config *config,
+			   struct netlink_ext_ack *extack)
+{
+	struct tsnep_adapter *adapter = netdev_priv(netdev);
+
+	switch (config->tx_type) {
+	case HWTSTAMP_TX_OFF:
+	case HWTSTAMP_TX_ON:
+		break;
+	default:
+		return -ERANGE;
 	}
 
-	if (copy_to_user(ifr->ifr_data, &adapter->hwtstamp_config,
-			 sizeof(adapter->hwtstamp_config)))
-		return -EFAULT;
+	switch (config->rx_filter) {
+	case HWTSTAMP_FILTER_NONE:
+		break;
+	case HWTSTAMP_FILTER_ALL:
+	case HWTSTAMP_FILTER_PTP_V1_L4_EVENT:
+	case HWTSTAMP_FILTER_PTP_V1_L4_SYNC:
+	case HWTSTAMP_FILTER_PTP_V1_L4_DELAY_REQ:
+	case HWTSTAMP_FILTER_PTP_V2_L4_EVENT:
+	case HWTSTAMP_FILTER_PTP_V2_L4_SYNC:
+	case HWTSTAMP_FILTER_PTP_V2_L4_DELAY_REQ:
+	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
+	case HWTSTAMP_FILTER_PTP_V2_L2_SYNC:
+	case HWTSTAMP_FILTER_PTP_V2_L2_DELAY_REQ:
+	case HWTSTAMP_FILTER_PTP_V2_EVENT:
+	case HWTSTAMP_FILTER_PTP_V2_SYNC:
+	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
+	case HWTSTAMP_FILTER_NTP_ALL:
+		config->rx_filter = HWTSTAMP_FILTER_ALL;
+		break;
+	default:
+		return -ERANGE;
+	}
 
+	adapter->hwtstamp_config = *config;
 	return 0;
 }
 
-- 
2.47.3


