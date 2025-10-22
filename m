Return-Path: <linux-renesas-soc+bounces-23424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7828CBFB727
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 12:49:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C4D14F5788
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 10:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F86432549A;
	Wed, 22 Oct 2025 10:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tyzvqPd6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6B0320CC9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 10:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130168; cv=none; b=O82ID5YGliXmXZPatOUDbIKwW43vu62x/ay6EzLsarOBgpR6kGhwy98rNBRkGu0x8Zyo75/7VcK04QCbeJIfyVgnLraT1tvEw4mFI7x28+9uKqYFh1gGUyVf69zeS+aZloZYhv5k4g5O8W+Y7Py3acZfhrD0PFhX22xoxaPuqnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130168; c=relaxed/simple;
	bh=CzvhyqEgu4+Ttj8upJh9cdjGzee85ZIKlKf8aEWKFgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6CdUwAjXlD6SbsZkGn0I4GE+upYkNSwTLmuGiBH7Ywq6E8w1uxadl9hzbZrtO8NOnjPhlJ0MvrfUHsGd8VpymUPNZNUu1yqsHsAwNgLdaBTu9njg0mYC/WTIt3+YVUe3Wc8iGxz9YokDbPp5SIewKm6UT1/4rj7G+fMaNp50is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tyzvqPd6; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761130163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sCMGfY+hGNsCc5xIiSZ8AnxmPkmOzDOfhWn0dCad568=;
	b=tyzvqPd6RsjZO/f2B0JwAfDHLvpo3Q90zcWCtP+BY0nq4VE2e50NjiLjbt0bUyz8JuECVk
	m1MiekcQHIvCb+ARCBKEmfqsFhz5FMgAgv8nHde1bFAVExIvJjNAYebkYg6pS3CDLI6xtB
	6czR/FWadrFwuUEqEtZ9UbdFyNMdXBU=
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
Subject: [PATCH net-next v4 3/6] ionic: convert to ndo_hwtstamp API
Date: Wed, 22 Oct 2025 10:48:57 +0000
Message-ID: <20251022104900.901973-4-vadim.fedorenko@linux.dev>
In-Reply-To: <20251022104900.901973-1-vadim.fedorenko@linux.dev>
References: <20251022104900.901973-1-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Convert driver to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.
ionic_eth_ioctl() becomes empty, remove it.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Brett Creeley <brett.creeley@amd.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../net/ethernet/pensando/ionic/ionic_lif.c   | 17 +-----
 .../net/ethernet/pensando/ionic/ionic_lif.h   | 11 ++--
 .../net/ethernet/pensando/ionic/ionic_phc.c   | 61 ++++++++++++-------
 3 files changed, 47 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
index b28966ae50c2..058eea86e141 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
@@ -2335,20 +2335,6 @@ static int ionic_stop(struct net_device *netdev)
 	return 0;
 }
 
-static int ionic_eth_ioctl(struct net_device *netdev, struct ifreq *ifr, int cmd)
-{
-	struct ionic_lif *lif = netdev_priv(netdev);
-
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		return ionic_lif_hwstamp_set(lif, ifr);
-	case SIOCGHWTSTAMP:
-		return ionic_lif_hwstamp_get(lif, ifr);
-	default:
-		return -EOPNOTSUPP;
-	}
-}
-
 static int ionic_get_vf_config(struct net_device *netdev,
 			       int vf, struct ifla_vf_info *ivf)
 {
@@ -2812,7 +2798,6 @@ static int ionic_xdp(struct net_device *netdev, struct netdev_bpf *bpf)
 static const struct net_device_ops ionic_netdev_ops = {
 	.ndo_open               = ionic_open,
 	.ndo_stop               = ionic_stop,
-	.ndo_eth_ioctl		= ionic_eth_ioctl,
 	.ndo_start_xmit		= ionic_start_xmit,
 	.ndo_bpf		= ionic_xdp,
 	.ndo_xdp_xmit		= ionic_xdp_xmit,
@@ -2833,6 +2818,8 @@ static const struct net_device_ops ionic_netdev_ops = {
 	.ndo_get_vf_config	= ionic_get_vf_config,
 	.ndo_set_vf_link_state	= ionic_set_vf_link_state,
 	.ndo_get_vf_stats       = ionic_get_vf_stats,
+	.ndo_hwtstamp_get	= ionic_hwstamp_get,
+	.ndo_hwtstamp_set	= ionic_hwstamp_set,
 };
 
 static int ionic_cmb_reconfig(struct ionic_lif *lif,
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.h b/drivers/net/ethernet/pensando/ionic/ionic_lif.h
index 43bdd0fb8733..7c5ebc81fdfb 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_lif.h
+++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.h
@@ -6,7 +6,7 @@
 
 #include <linux/ptp_clock_kernel.h>
 #include <linux/timecounter.h>
-#include <uapi/linux/net_tstamp.h>
+#include <linux/net_tstamp.h>
 #include <linux/dim.h>
 #include <linux/pci.h>
 #include "ionic_rx_filter.h"
@@ -254,7 +254,7 @@ struct ionic_phc {
 	struct timecounter tc;
 
 	struct mutex config_lock; /* lock for ts_config */
-	struct hwtstamp_config ts_config;
+	struct kernel_hwtstamp_config ts_config;
 	u64 ts_config_rx_filt;
 	u32 ts_config_tx_mode;
 
@@ -362,8 +362,11 @@ int ionic_lif_size(struct ionic *ionic);
 #if IS_ENABLED(CONFIG_PTP_1588_CLOCK)
 void ionic_lif_hwstamp_replay(struct ionic_lif *lif);
 void ionic_lif_hwstamp_recreate_queues(struct ionic_lif *lif);
-int ionic_lif_hwstamp_set(struct ionic_lif *lif, struct ifreq *ifr);
-int ionic_lif_hwstamp_get(struct ionic_lif *lif, struct ifreq *ifr);
+int ionic_hwstamp_set(struct net_device *netdev,
+		      struct kernel_hwtstamp_config *config,
+		      struct netlink_ext_ack *extack);
+int ionic_hwstamp_get(struct net_device *netdev,
+		      struct kernel_hwtstamp_config *config);
 ktime_t ionic_lif_phc_ktime(struct ionic_lif *lif, u64 counter);
 void ionic_lif_register_phc(struct ionic_lif *lif);
 void ionic_lif_unregister_phc(struct ionic_lif *lif);
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_phc.c b/drivers/net/ethernet/pensando/ionic/ionic_phc.c
index 9f5c81d44f99..05b44fc482f8 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_phc.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_phc.c
@@ -65,11 +65,12 @@ static u64 ionic_hwstamp_rx_filt(int config_rx_filter)
 }
 
 static int ionic_lif_hwstamp_set_ts_config(struct ionic_lif *lif,
-					   struct hwtstamp_config *new_ts)
+					   struct kernel_hwtstamp_config *new_ts,
+					   struct netlink_ext_ack *extack)
 {
+	struct kernel_hwtstamp_config *config;
+	struct kernel_hwtstamp_config ts = {};
 	struct ionic *ionic = lif->ionic;
-	struct hwtstamp_config *config;
-	struct hwtstamp_config ts;
 	int tx_mode = 0;
 	u64 rx_filt = 0;
 	int err, err2;
@@ -99,12 +100,16 @@ static int ionic_lif_hwstamp_set_ts_config(struct ionic_lif *lif,
 
 	tx_mode = ionic_hwstamp_tx_mode(config->tx_type);
 	if (tx_mode < 0) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "TX time stamping mode isn't supported");
 		err = tx_mode;
 		goto err_queues;
 	}
 
 	mask = cpu_to_le64(BIT_ULL(tx_mode));
 	if ((ionic->ident.lif.eth.hwstamp_tx_modes & mask) != mask) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "TX time stamping mode isn't supported");
 		err = -ERANGE;
 		goto err_queues;
 	}
@@ -124,32 +129,47 @@ static int ionic_lif_hwstamp_set_ts_config(struct ionic_lif *lif,
 
 	if (tx_mode) {
 		err = ionic_lif_create_hwstamp_txq(lif);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Error creating TX timestamp queue");
 			goto err_queues;
+		}
 	}
 
 	if (rx_filt) {
 		err = ionic_lif_create_hwstamp_rxq(lif);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Error creating RX timestamp queue");
 			goto err_queues;
+		}
 	}
 
 	if (tx_mode != lif->phc->ts_config_tx_mode) {
 		err = ionic_lif_set_hwstamp_txmode(lif, tx_mode);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Error enabling TX timestamp mode");
 			goto err_txmode;
+		}
 	}
 
 	if (rx_filt != lif->phc->ts_config_rx_filt) {
 		err = ionic_lif_set_hwstamp_rxfilt(lif, rx_filt);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Error enabling RX timestamp mode");
 			goto err_rxfilt;
+		}
 	}
 
 	if (rx_all != (lif->phc->ts_config.rx_filter == HWTSTAMP_FILTER_ALL)) {
 		err = ionic_lif_config_hwstamp_rxq_all(lif, rx_all);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG_MOD(extack,
+					   "Error enabling RX timestamp mode");
 			goto err_rxall;
+		}
 	}
 
 	memcpy(&lif->phc->ts_config, config, sizeof(*config));
@@ -183,28 +203,24 @@ static int ionic_lif_hwstamp_set_ts_config(struct ionic_lif *lif,
 	return err;
 }
 
-int ionic_lif_hwstamp_set(struct ionic_lif *lif, struct ifreq *ifr)
+int ionic_hwstamp_set(struct net_device *netdev,
+		      struct kernel_hwtstamp_config *config,
+		      struct netlink_ext_ack *extack)
 {
-	struct hwtstamp_config config;
+	struct ionic_lif *lif = netdev_priv(netdev);
 	int err;
 
 	if (!lif->phc || !lif->phc->ptp)
 		return -EOPNOTSUPP;
 
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
-
 	mutex_lock(&lif->queue_lock);
-	err = ionic_lif_hwstamp_set_ts_config(lif, &config);
+	err = ionic_lif_hwstamp_set_ts_config(lif, config, extack);
 	mutex_unlock(&lif->queue_lock);
 	if (err) {
 		netdev_info(lif->netdev, "hwstamp set failed: %d\n", err);
 		return err;
 	}
 
-	if (copy_to_user(ifr->ifr_data, &config, sizeof(config)))
-		return -EFAULT;
-
 	return 0;
 }
 
@@ -216,7 +232,7 @@ void ionic_lif_hwstamp_replay(struct ionic_lif *lif)
 		return;
 
 	mutex_lock(&lif->queue_lock);
-	err = ionic_lif_hwstamp_set_ts_config(lif, NULL);
+	err = ionic_lif_hwstamp_set_ts_config(lif, NULL, NULL);
 	mutex_unlock(&lif->queue_lock);
 	if (err)
 		netdev_info(lif->netdev, "hwstamp replay failed: %d\n", err);
@@ -246,19 +262,18 @@ void ionic_lif_hwstamp_recreate_queues(struct ionic_lif *lif)
 	mutex_unlock(&lif->phc->config_lock);
 }
 
-int ionic_lif_hwstamp_get(struct ionic_lif *lif, struct ifreq *ifr)
+int ionic_hwstamp_get(struct net_device *netdev,
+		      struct kernel_hwtstamp_config *config)
 {
-	struct hwtstamp_config config;
+	struct ionic_lif *lif = netdev_priv(netdev);
 
 	if (!lif->phc || !lif->phc->ptp)
 		return -EOPNOTSUPP;
 
 	mutex_lock(&lif->phc->config_lock);
-	memcpy(&config, &lif->phc->ts_config, sizeof(config));
+	memcpy(config, &lif->phc->ts_config, sizeof(*config));
 	mutex_unlock(&lif->phc->config_lock);
 
-	if (copy_to_user(ifr->ifr_data, &config, sizeof(config)))
-		return -EFAULT;
 	return 0;
 }
 
-- 
2.47.3


