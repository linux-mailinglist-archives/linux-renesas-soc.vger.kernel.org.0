Return-Path: <linux-renesas-soc+bounces-23370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1ACBF5A03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 11:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DE7D1981CFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 09:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE56432ABFE;
	Tue, 21 Oct 2025 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J6qLD1me"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4BB25BF13
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Oct 2025 09:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040112; cv=none; b=hej6OjlLH/UBqbwmJsgAfpFva0UQOgj++fOmanluENNysm1s6gjpE6LhuA/w/w73/SkwmGYmdJwMR03LeGY+z0lkJ3L1isZpIpYpd0IHCBGqfwGtaJ0+QwyX9Q+ZKPd9pvr1JlT7yfb6eEzSK+0Cuvcm5WLMTr+miVdenuJSHH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040112; c=relaxed/simple;
	bh=vtYoHofrji/5wfxlWCFQd5eTpK/jwkOgvIPh7Vi6tGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6yCk0JkSaeESRsLNeLfQw7sruFqIF6mOYKurlfjTE51cApXX0i1SkPZU/gBfXmV47q9wjpHuK1AUZRbrRa4hphl+soZiyd4zdoyVFXLBl35OOK1ghlEgd6RR0UiVfFVnlsddZDIV8IHIp65iNGAcaSvwv9nIUugcAgWQvTnlCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J6qLD1me; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761040108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/vHgmkZ+O6EpWVGo/heDZ/tNMt5HxcUwuejSbWQBCn0=;
	b=J6qLD1me6msUVlRLutSJs67mo10tP7L75TMJZ4OUdl0MNlRpbm/4ah2Ju8hdWqAQizZ29U
	1jKXV3tzD5B5JDfJUzXv63dN0xgGBjrjPZjYmSmAVy9spmc+8X0GXryPI9SLLvF7U8y7Iu
	YhfBb1J0iZ8CwSKD0UO0OX9n6SlB7Gk=
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
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: [PATCH net-next v3 2/6] mlx4: convert to ndo_hwtstamp API
Date: Tue, 21 Oct 2025 09:47:47 +0000
Message-ID: <20251021094751.900558-3-vadim.fedorenko@linux.dev>
In-Reply-To: <20251021094751.900558-1-vadim.fedorenko@linux.dev>
References: <20251021094751.900558-1-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Convert driver to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
mlx4_en_ioctl() becomes empty, remove it.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../net/ethernet/mellanox/mlx4/en_netdev.c    | 62 ++++++++-----------
 drivers/net/ethernet/mellanox/mlx4/mlx4_en.h  |  6 +-
 2 files changed, 29 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
index 308b4458e0d4..81bf8908b897 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
@@ -2420,21 +2420,22 @@ static int mlx4_en_change_mtu(struct net_device *dev, int new_mtu)
 	return 0;
 }
 
-static int mlx4_en_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
+static int mlx4_en_hwtstamp_set(struct net_device *dev,
+				struct kernel_hwtstamp_config *config,
+				struct netlink_ext_ack *extack)
 {
 	struct mlx4_en_priv *priv = netdev_priv(dev);
 	struct mlx4_en_dev *mdev = priv->mdev;
-	struct hwtstamp_config config;
-
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
 
 	/* device doesn't support time stamping */
-	if (!(mdev->dev->caps.flags2 & MLX4_DEV_CAP_FLAG2_TS))
+	if (!(mdev->dev->caps.flags2 & MLX4_DEV_CAP_FLAG2_TS)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "device doesn't support time stamping");
 		return -EINVAL;
+	}
 
 	/* TX HW timestamp */
-	switch (config.tx_type) {
+	switch (config->tx_type) {
 	case HWTSTAMP_TX_OFF:
 	case HWTSTAMP_TX_ON:
 		break;
@@ -2443,7 +2444,7 @@ static int mlx4_en_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 	}
 
 	/* RX HW timestamp */
-	switch (config.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		break;
 	case HWTSTAMP_FILTER_ALL:
@@ -2461,39 +2462,27 @@ static int mlx4_en_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
 	case HWTSTAMP_FILTER_NTP_ALL:
-		config.rx_filter = HWTSTAMP_FILTER_ALL;
+		config->rx_filter = HWTSTAMP_FILTER_ALL;
 		break;
 	default:
 		return -ERANGE;
 	}
 
 	if (mlx4_en_reset_config(dev, config, dev->features)) {
-		config.tx_type = HWTSTAMP_TX_OFF;
-		config.rx_filter = HWTSTAMP_FILTER_NONE;
+		config->tx_type = HWTSTAMP_TX_OFF;
+		config->rx_filter = HWTSTAMP_FILTER_NONE;
 	}
 
-	return copy_to_user(ifr->ifr_data, &config,
-			    sizeof(config)) ? -EFAULT : 0;
+	return 0;
 }
 
-static int mlx4_en_hwtstamp_get(struct net_device *dev, struct ifreq *ifr)
+static int mlx4_en_hwtstamp_get(struct net_device *dev,
+				struct kernel_hwtstamp_config *config)
 {
 	struct mlx4_en_priv *priv = netdev_priv(dev);
 
-	return copy_to_user(ifr->ifr_data, &priv->hwtstamp_config,
-			    sizeof(priv->hwtstamp_config)) ? -EFAULT : 0;
-}
-
-static int mlx4_en_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
-{
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		return mlx4_en_hwtstamp_set(dev, ifr);
-	case SIOCGHWTSTAMP:
-		return mlx4_en_hwtstamp_get(dev, ifr);
-	default:
-		return -EOPNOTSUPP;
-	}
+	*config = priv->hwtstamp_config;
+	return 0;
 }
 
 static netdev_features_t mlx4_en_fix_features(struct net_device *netdev,
@@ -2560,7 +2549,7 @@ static int mlx4_en_set_features(struct net_device *netdev,
 	}
 
 	if (reset) {
-		ret = mlx4_en_reset_config(netdev, priv->hwtstamp_config,
+		ret = mlx4_en_reset_config(netdev, &priv->hwtstamp_config,
 					   features);
 		if (ret)
 			return ret;
@@ -2844,7 +2833,6 @@ static const struct net_device_ops mlx4_netdev_ops = {
 	.ndo_set_mac_address	= mlx4_en_set_mac,
 	.ndo_validate_addr	= eth_validate_addr,
 	.ndo_change_mtu		= mlx4_en_change_mtu,
-	.ndo_eth_ioctl		= mlx4_en_ioctl,
 	.ndo_tx_timeout		= mlx4_en_tx_timeout,
 	.ndo_vlan_rx_add_vid	= mlx4_en_vlan_rx_add_vid,
 	.ndo_vlan_rx_kill_vid	= mlx4_en_vlan_rx_kill_vid,
@@ -2858,6 +2846,8 @@ static const struct net_device_ops mlx4_netdev_ops = {
 	.ndo_features_check	= mlx4_en_features_check,
 	.ndo_set_tx_maxrate	= mlx4_en_set_tx_maxrate,
 	.ndo_bpf		= mlx4_xdp,
+	.ndo_hwtstamp_get	= mlx4_en_hwtstamp_get,
+	.ndo_hwtstamp_set	= mlx4_en_hwtstamp_set,
 };
 
 static const struct net_device_ops mlx4_netdev_ops_master = {
@@ -3512,7 +3502,7 @@ int mlx4_en_init_netdev(struct mlx4_en_dev *mdev, int port,
 }
 
 int mlx4_en_reset_config(struct net_device *dev,
-			 struct hwtstamp_config ts_config,
+			 struct kernel_hwtstamp_config *ts_config,
 			 netdev_features_t features)
 {
 	struct mlx4_en_priv *priv = netdev_priv(dev);
@@ -3522,8 +3512,8 @@ int mlx4_en_reset_config(struct net_device *dev,
 	int port_up = 0;
 	int err = 0;
 
-	if (priv->hwtstamp_config.tx_type == ts_config.tx_type &&
-	    priv->hwtstamp_config.rx_filter == ts_config.rx_filter &&
+	if (priv->hwtstamp_config.tx_type == ts_config->tx_type &&
+	    priv->hwtstamp_config.rx_filter == ts_config->rx_filter &&
 	    !DEV_FEATURE_CHANGED(dev, features, NETIF_F_HW_VLAN_CTAG_RX) &&
 	    !DEV_FEATURE_CHANGED(dev, features, NETIF_F_RXFCS))
 		return 0; /* Nothing to change */
@@ -3542,7 +3532,7 @@ int mlx4_en_reset_config(struct net_device *dev,
 	mutex_lock(&mdev->state_lock);
 
 	memcpy(&new_prof, priv->prof, sizeof(struct mlx4_en_port_profile));
-	memcpy(&new_prof.hwtstamp_config, &ts_config, sizeof(ts_config));
+	memcpy(&new_prof.hwtstamp_config, ts_config, sizeof(*ts_config));
 
 	err = mlx4_en_try_alloc_resources(priv, tmp, &new_prof, true);
 	if (err)
@@ -3560,7 +3550,7 @@ int mlx4_en_reset_config(struct net_device *dev,
 			dev->features |= NETIF_F_HW_VLAN_CTAG_RX;
 		else
 			dev->features &= ~NETIF_F_HW_VLAN_CTAG_RX;
-	} else if (ts_config.rx_filter == HWTSTAMP_FILTER_NONE) {
+	} else if (ts_config->rx_filter == HWTSTAMP_FILTER_NONE) {
 		/* RX time-stamping is OFF, update the RX vlan offload
 		 * to the latest wanted state
 		 */
@@ -3581,7 +3571,7 @@ int mlx4_en_reset_config(struct net_device *dev,
 	 * Regardless of the caller's choice,
 	 * Turn Off RX vlan offload in case of time-stamping is ON
 	 */
-	if (ts_config.rx_filter != HWTSTAMP_FILTER_NONE) {
+	if (ts_config->rx_filter != HWTSTAMP_FILTER_NONE) {
 		if (dev->features & NETIF_F_HW_VLAN_CTAG_RX)
 			en_warn(priv, "Turning off RX vlan offload since RX time-stamping is ON\n");
 		dev->features &= ~NETIF_F_HW_VLAN_CTAG_RX;
diff --git a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
index ad0d91a75184..aab97694f86b 100644
--- a/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
+++ b/drivers/net/ethernet/mellanox/mlx4/mlx4_en.h
@@ -388,7 +388,7 @@ struct mlx4_en_port_profile {
 	u8 num_up;
 	int rss_rings;
 	int inline_thold;
-	struct hwtstamp_config hwtstamp_config;
+	struct kernel_hwtstamp_config hwtstamp_config;
 };
 
 struct mlx4_en_profile {
@@ -612,7 +612,7 @@ struct mlx4_en_priv {
 	bool wol;
 	struct device *ddev;
 	struct hlist_head mac_hash[MLX4_EN_MAC_HASH_SIZE];
-	struct hwtstamp_config hwtstamp_config;
+	struct kernel_hwtstamp_config hwtstamp_config;
 	u32 counter_index;
 
 #ifdef CONFIG_MLX4_EN_DCB
@@ -780,7 +780,7 @@ void mlx4_en_ptp_overflow_check(struct mlx4_en_dev *mdev);
 
 int mlx4_en_moderation_update(struct mlx4_en_priv *priv);
 int mlx4_en_reset_config(struct net_device *dev,
-			 struct hwtstamp_config ts_config,
+			 struct kernel_hwtstamp_config *ts_config,
 			 netdev_features_t new_features);
 void mlx4_en_update_pfc_stats_bitmap(struct mlx4_dev *dev,
 				     struct mlx4_en_stats_bitmap *stats_bitmap,
-- 
2.47.3


