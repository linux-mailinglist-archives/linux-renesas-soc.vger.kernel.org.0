Return-Path: <linux-renesas-soc+bounces-22962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0056BD52A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A1B31500D43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007A82F83D8;
	Mon, 13 Oct 2025 16:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T6bIYzxv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A552EBDF9;
	Mon, 13 Oct 2025 16:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373376; cv=none; b=Ds/pJPy+rgSMgoZuWe0YVBwGbnUSsY46MbIKAHYFsMS2JIw1/BpKZCkzLKH8GlUVGZR/8v+o5dadJBxmebL8bR2SAh3uiyn8WJLK9GonlQoP2WhGdC1UnW2PnjhrUWDn8X/7rYdWqFuZWXOEpC6F96ATIYXAx1crguMmmaRfr8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373376; c=relaxed/simple;
	bh=ieUaFo3sR5A1yKNDHBEbfEnvLPJikT+qMc8csEs1J4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tp/BAb1LiS4YERrs4fVl8pAwfAmvsR9DVtLADyNp2FzrSS+c0M4nw+VwkWh+1cetQ3xCZARxSMzZtRf8qkqhHv6GybCrjjllXlFNd9dOvW8nvZPQohfRPMBPR/Q5+PTOjFj/ideAicVcg5qBWyZlkhtCWfYjiiuf3tnVqNo95SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T6bIYzxv; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760373372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJWQpGgsz8/auK/a/IFSX2jmcy3k6NNLzx6dxZ/pae4=;
	b=T6bIYzxvaWwqGC8+cgHfdSISi0RFuun6iThXvKe+YpIaTeFHJpGU1xbI8ALdsrisc6X/Dd
	b7Gxl++5p2sFrlvpVTsB5J4FitvKxWmCj5qzOqpu+7KJj1Ggqv3p3dMAbFuT3QNqfkzE4h
	wMS8/FEmYv0Q/wU7z4q1/pSMM23nqEU=
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
Subject: [PATCH net-next 04/14] net: atlantic: convert to ndo_hwtstamp API
Date: Mon, 13 Oct 2025 16:34:19 +0000
Message-ID: <20251013163429.4984-5-vadim.fedorenko@linux.dev>
In-Reply-To: <20251013163429.4984-1-vadim.fedorenko@linux.dev>
References: <20251013163429.4984-1-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Convert driver to .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
.ndo_eth_ioctl() becomes empty so remove it. Also simplify code with no
functional changes.

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../net/ethernet/aquantia/atlantic/aq_main.c  | 66 +++++--------------
 .../net/ethernet/aquantia/atlantic/aq_ptp.c   |  6 +-
 .../net/ethernet/aquantia/atlantic/aq_ptp.h   |  8 +--
 3 files changed, 22 insertions(+), 58 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_main.c b/drivers/net/ethernet/aquantia/atlantic/aq_main.c
index b565189e5913..4ef4fe64b8ac 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_main.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_main.c
@@ -258,10 +258,15 @@ static void aq_ndev_set_multicast_settings(struct net_device *ndev)
 	(void)aq_nic_set_multicast_list(aq_nic, ndev);
 }
 
-#if IS_REACHABLE(CONFIG_PTP_1588_CLOCK)
-static int aq_ndev_config_hwtstamp(struct aq_nic_s *aq_nic,
-				   struct hwtstamp_config *config)
+static int aq_ndev_hwtstamp_set(struct net_device *netdev,
+				struct kernel_hwtstamp_config *config,
+				struct netlink_ext_ack *extack)
 {
+	struct aq_nic_s *aq_nic = netdev_priv(netdev);
+
+	if (!IS_REACHABLE(CONFIG_PTP_1588_CLOCK) || !aq_nic->aq_ptp)
+		return -EOPNOTSUPP;
+
 	switch (config->tx_type) {
 	case HWTSTAMP_TX_OFF:
 	case HWTSTAMP_TX_ON:
@@ -290,59 +295,17 @@ static int aq_ndev_config_hwtstamp(struct aq_nic_s *aq_nic,
 
 	return aq_ptp_hwtstamp_config_set(aq_nic->aq_ptp, config);
 }
-#endif
-
-static int aq_ndev_hwtstamp_set(struct aq_nic_s *aq_nic, struct ifreq *ifr)
-{
-	struct hwtstamp_config config;
-#if IS_REACHABLE(CONFIG_PTP_1588_CLOCK)
-	int ret_val;
-#endif
-
-	if (!aq_nic->aq_ptp)
-		return -EOPNOTSUPP;
-
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
-#if IS_REACHABLE(CONFIG_PTP_1588_CLOCK)
-	ret_val = aq_ndev_config_hwtstamp(aq_nic, &config);
-	if (ret_val)
-		return ret_val;
-#endif
-
-	return copy_to_user(ifr->ifr_data, &config, sizeof(config)) ?
-	       -EFAULT : 0;
-}
 
-#if IS_REACHABLE(CONFIG_PTP_1588_CLOCK)
-static int aq_ndev_hwtstamp_get(struct aq_nic_s *aq_nic, struct ifreq *ifr)
+static int aq_ndev_hwtstamp_get(struct net_device *netdev,
+				struct kernel_hwtstamp_config *config)
 {
-	struct hwtstamp_config config;
+	struct aq_nic_s *aq_nic = netdev_priv(netdev);
 
 	if (!aq_nic->aq_ptp)
 		return -EOPNOTSUPP;
 
-	aq_ptp_hwtstamp_config_get(aq_nic->aq_ptp, &config);
-	return copy_to_user(ifr->ifr_data, &config, sizeof(config)) ?
-	       -EFAULT : 0;
-}
-#endif
-
-static int aq_ndev_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
-{
-	struct aq_nic_s *aq_nic = netdev_priv(netdev);
-
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		return aq_ndev_hwtstamp_set(aq_nic, ifr);
-
-#if IS_REACHABLE(CONFIG_PTP_1588_CLOCK)
-	case SIOCGHWTSTAMP:
-		return aq_ndev_hwtstamp_get(aq_nic, ifr);
-#endif
-	}
-
-	return -EOPNOTSUPP;
+	aq_ptp_hwtstamp_config_get(aq_nic->aq_ptp, config);
+	return 0;
 }
 
 static int aq_ndo_vlan_rx_add_vid(struct net_device *ndev, __be16 proto,
@@ -500,12 +463,13 @@ static const struct net_device_ops aq_ndev_ops = {
 	.ndo_set_mac_address = aq_ndev_set_mac_address,
 	.ndo_set_features = aq_ndev_set_features,
 	.ndo_fix_features = aq_ndev_fix_features,
-	.ndo_eth_ioctl = aq_ndev_ioctl,
 	.ndo_vlan_rx_add_vid = aq_ndo_vlan_rx_add_vid,
 	.ndo_vlan_rx_kill_vid = aq_ndo_vlan_rx_kill_vid,
 	.ndo_setup_tc = aq_ndo_setup_tc,
 	.ndo_bpf = aq_xdp,
 	.ndo_xdp_xmit = aq_xdp_xmit,
+	.ndo_hwtstamp_get = aq_ndev_hwtstamp_get,
+	.ndo_hwtstamp_set = aq_ndev_hwtstamp_set,
 };
 
 static int __init aq_ndev_init_module(void)
diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
index 5acb3e16b567..0fa0f891c0e0 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
@@ -51,7 +51,7 @@ struct ptp_tx_timeout {
 
 struct aq_ptp_s {
 	struct aq_nic_s *aq_nic;
-	struct hwtstamp_config hwtstamp_config;
+	struct kernel_hwtstamp_config hwtstamp_config;
 	spinlock_t ptp_lock;
 	spinlock_t ptp_ring_lock;
 	struct ptp_clock *ptp_clock;
@@ -567,7 +567,7 @@ static void aq_ptp_rx_hwtstamp(struct aq_ptp_s *aq_ptp, struct skb_shared_hwtsta
 }
 
 void aq_ptp_hwtstamp_config_get(struct aq_ptp_s *aq_ptp,
-				struct hwtstamp_config *config)
+				struct kernel_hwtstamp_config *config)
 {
 	*config = aq_ptp->hwtstamp_config;
 }
@@ -588,7 +588,7 @@ static void aq_ptp_prepare_filters(struct aq_ptp_s *aq_ptp)
 }
 
 int aq_ptp_hwtstamp_config_set(struct aq_ptp_s *aq_ptp,
-			       struct hwtstamp_config *config)
+			       struct kernel_hwtstamp_config *config)
 {
 	struct aq_nic_s *aq_nic = aq_ptp->aq_nic;
 	const struct aq_hw_ops *hw_ops;
diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.h b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.h
index 210b723f2207..5e643ec7cc06 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.h
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.h
@@ -60,9 +60,9 @@ void aq_ptp_tx_hwtstamp(struct aq_nic_s *aq_nic, u64 timestamp);
 
 /* Must be to check available of PTP before call */
 void aq_ptp_hwtstamp_config_get(struct aq_ptp_s *aq_ptp,
-				struct hwtstamp_config *config);
+				struct kernel_hwtstamp_config *config);
 int aq_ptp_hwtstamp_config_set(struct aq_ptp_s *aq_ptp,
-			       struct hwtstamp_config *config);
+			       struct kernel_hwtstamp_config *config);
 
 /* Return either ring is belong to PTP or not*/
 bool aq_ptp_ring(struct aq_nic_s *aq_nic, struct aq_ring_s *ring);
@@ -130,9 +130,9 @@ static inline int aq_ptp_xmit(struct aq_nic_s *aq_nic, struct sk_buff *skb)
 
 static inline void aq_ptp_tx_hwtstamp(struct aq_nic_s *aq_nic, u64 timestamp) {}
 static inline void aq_ptp_hwtstamp_config_get(struct aq_ptp_s *aq_ptp,
-					      struct hwtstamp_config *config) {}
+					      struct kernel_hwtstamp_config *config) {}
 static inline int aq_ptp_hwtstamp_config_set(struct aq_ptp_s *aq_ptp,
-					     struct hwtstamp_config *config)
+					     struct kernel_hwtstamp_config *config)
 {
 	return 0;
 }
-- 
2.47.3


