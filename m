Return-Path: <linux-renesas-soc+bounces-22969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E078BD5206
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E79383512F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4082566;
	Mon, 13 Oct 2025 16:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xaBy2rEi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472D819F13F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373584; cv=none; b=E7AJFBKPkOpZ4LmETtgHZmcORqh6ZGtDveIlz0rWTsArj/kGxIwJ1shRQEsbBWiphAq+WwTS62tXpnHlrVqJimfOpkv/mtw3H34dXkq5dxuHV7qE38NqkhaduUzHk7R6OIQRMLl7OVLUe5IulrOmT1EGv1DLcpSQYGkbBSStRsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373584; c=relaxed/simple;
	bh=RWONtXoN1q8REs87Dht9f+aMGmX/Gh/aSoeOzghqxD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifezOhYm9CPaluQAEf076roOH4iuY9Letgluu3ObiLg3RAUvdpCcwRnqScYKWtpcAEK8nemK+tGW20Yaqfe0wli6DihXYyxetdvDFuGSpgYBsMjkY8Vs59FeLq+2xhkmHi6d+JD7TB+gYAC440SElq6rmVLokEV3d9VO5pKwzJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xaBy2rEi; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760373580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzLRHzvjYmeftIp/PwVnGKaEj/A7z7lDmamqI6u0wnY=;
	b=xaBy2rEiTQlbZXQHWltZCGGwlYA5acT4okThrRfc280poMtBOpCFWmHZUnQ/LO0vJyL9o9
	zE6EfggfoFled47LqJW6GIFbzK4RAl7bYpi7mrZPwJep/DtZIBkzVYC6b3mnwTe5+tGIPR
	5MfGb9cXOEOwVWfiAbA2/88LFM6gdP0=
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
Subject: [PATCH net-next 10/14] ionic: convert to ndo_hwtstamp API
Date: Mon, 13 Oct 2025 16:37:45 +0000
Message-ID: <20251013163749.5047-5-vadim.fedorenko@linux.dev>
In-Reply-To: <20251013163749.5047-1-vadim.fedorenko@linux.dev>
References: <20251013163749.5047-1-vadim.fedorenko@linux.dev>
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

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../net/ethernet/pensando/ionic/ionic_lif.c   | 17 +-----
 .../net/ethernet/pensando/ionic/ionic_lif.h   | 11 ++--
 .../net/ethernet/pensando/ionic/ionic_phc.c   | 59 +++++++++++--------
 3 files changed, 45 insertions(+), 42 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
index b28966ae50c2..c5f2231a888f 100644
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
+	.ndo_hwtstamp_get	= ionic_lif_hwstamp_get,
+	.ndo_hwtstamp_set	= ionic_lif_hwstamp_set,
 };
 
 static int ionic_cmb_reconfig(struct ionic_lif *lif,
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.h b/drivers/net/ethernet/pensando/ionic/ionic_lif.h
index 43bdd0fb8733..30e1bc792ce9 100644
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
+int ionic_lif_hwstamp_set(struct net_device *netdev,
+			  struct kernel_hwtstamp_config *config,
+			  struct netlink_ext_ack *extack);
+int ionic_lif_hwstamp_get(struct net_device *netdev,
+			  struct kernel_hwtstamp_config *config);
 ktime_t ionic_lif_phc_ktime(struct ionic_lif *lif, u64 counter);
 void ionic_lif_register_phc(struct ionic_lif *lif);
 void ionic_lif_unregister_phc(struct ionic_lif *lif);
diff --git a/drivers/net/ethernet/pensando/ionic/ionic_phc.c b/drivers/net/ethernet/pensando/ionic/ionic_phc.c
index 9f5c81d44f99..02df21474956 100644
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
@@ -99,12 +100,14 @@ static int ionic_lif_hwstamp_set_ts_config(struct ionic_lif *lif,
 
 	tx_mode = ionic_hwstamp_tx_mode(config->tx_type);
 	if (tx_mode < 0) {
+		NL_SET_ERR_MSG(extack, "TX time stamping mode isn't supported");
 		err = tx_mode;
 		goto err_queues;
 	}
 
 	mask = cpu_to_le64(BIT_ULL(tx_mode));
 	if ((ionic->ident.lif.eth.hwstamp_tx_modes & mask) != mask) {
+		NL_SET_ERR_MSG(extack, "TX time stamping mode isn't supported");
 		err = -ERANGE;
 		goto err_queues;
 	}
@@ -124,32 +127,47 @@ static int ionic_lif_hwstamp_set_ts_config(struct ionic_lif *lif,
 
 	if (tx_mode) {
 		err = ionic_lif_create_hwstamp_txq(lif);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG(extack,
+				       "Error creating TX timestamp queue");
 			goto err_queues;
+		}
 	}
 
 	if (rx_filt) {
 		err = ionic_lif_create_hwstamp_rxq(lif);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG(extack,
+				       "Error creating RX timestamp queue");
 			goto err_queues;
+		}
 	}
 
 	if (tx_mode != lif->phc->ts_config_tx_mode) {
 		err = ionic_lif_set_hwstamp_txmode(lif, tx_mode);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG(extack,
+				       "Error enabling TX timestamp mode");
 			goto err_txmode;
+		}
 	}
 
 	if (rx_filt != lif->phc->ts_config_rx_filt) {
 		err = ionic_lif_set_hwstamp_rxfilt(lif, rx_filt);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG(extack,
+				       "Error enabling RX timestamp mode");
 			goto err_rxfilt;
+		}
 	}
 
 	if (rx_all != (lif->phc->ts_config.rx_filter == HWTSTAMP_FILTER_ALL)) {
 		err = ionic_lif_config_hwstamp_rxq_all(lif, rx_all);
-		if (err)
+		if (err) {
+			NL_SET_ERR_MSG(extack,
+				       "Error enabling RX timestamp mode");
 			goto err_rxall;
+		}
 	}
 
 	memcpy(&lif->phc->ts_config, config, sizeof(*config));
@@ -183,28 +201,24 @@ static int ionic_lif_hwstamp_set_ts_config(struct ionic_lif *lif,
 	return err;
 }
 
-int ionic_lif_hwstamp_set(struct ionic_lif *lif, struct ifreq *ifr)
+int ionic_lif_hwstamp_set(struct net_device *netdev,
+			  struct kernel_hwtstamp_config *config,
+			  struct netlink_ext_ack *extack)
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
 
@@ -216,7 +230,7 @@ void ionic_lif_hwstamp_replay(struct ionic_lif *lif)
 		return;
 
 	mutex_lock(&lif->queue_lock);
-	err = ionic_lif_hwstamp_set_ts_config(lif, NULL);
+	err = ionic_lif_hwstamp_set_ts_config(lif, NULL, NULL);
 	mutex_unlock(&lif->queue_lock);
 	if (err)
 		netdev_info(lif->netdev, "hwstamp replay failed: %d\n", err);
@@ -246,19 +260,18 @@ void ionic_lif_hwstamp_recreate_queues(struct ionic_lif *lif)
 	mutex_unlock(&lif->phc->config_lock);
 }
 
-int ionic_lif_hwstamp_get(struct ionic_lif *lif, struct ifreq *ifr)
+int ionic_lif_hwstamp_get(struct net_device *netdev,
+			  struct kernel_hwtstamp_config *config)
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


