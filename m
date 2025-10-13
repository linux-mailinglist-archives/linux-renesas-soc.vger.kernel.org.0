Return-Path: <linux-renesas-soc+bounces-22967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A85BD51F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A49A718A52AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F431299A96;
	Mon, 13 Oct 2025 16:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qdbw5Kvn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A27A2DF139
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373580; cv=none; b=VVgU+RKECn2/ezzW/AaBI6yb0Fu+p2Ja/q+NvCqxF1oV8ao9Q3KEEzYFzpColZNMFEqf9L3ys6RPo19bgK8aSm3aqKoq1kk9NuLaoWec22/7nmcohct7ihoCgYFiY4/Cn7w/A6GgzCsL9m1XNUcopczP+vxsTNyWunsnex0Ic2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373580; c=relaxed/simple;
	bh=1F2fw3zczGI81JdRBOlSZBJBqXWd49SMfjnOTq+TE44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fVOFdWGrpRHUWldaw+xBzqVnf63D0W9BQsfetwpP+qszqbVQkeGFLKASD8Vt2LRuVYtGTsb5rzyKHBZ96kGN/bOH2TJozPuyprtP/g6Sy/gdDohY0FjkaPuox4xGV6rzg6SDAj9xxxlaNH6JVp+NQTB4It/h4SxhmbC1CyWwswI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qdbw5Kvn; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760373576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLdXb05s0WYbZTpQ719etyy1IRRzOpdwBC2/F78OAUo=;
	b=qdbw5KvnjF+r23zGfOORydHoAyPMHkvmYeMipIsPwjbJ03MxQffQZ8lIFsksAonLkzA4Oj
	OefxYM2qQm6tYwcWeO5s5kM4V71l6JsLywdKJ/evB/cRG3xGuYHcKRAohi1gjdBCNHYtVd
	onSlBCfPR1eoEgA8ONar0J+4WgqhdPs=
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
Subject: [PATCH net-next 08/14] octeontx2: convert to ndo_hwtstamp API
Date: Mon, 13 Oct 2025 16:37:43 +0000
Message-ID: <20251013163749.5047-3-vadim.fedorenko@linux.dev>
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
otx2_ioctl() becomes empty, remove it.

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../marvell/octeontx2/nic/otx2_common.h       |  9 ++-
 .../ethernet/marvell/octeontx2/nic/otx2_pf.c  | 56 +++++++++----------
 .../ethernet/marvell/octeontx2/nic/otx2_vf.c  |  3 +-
 3 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
index 1c8a3c078a64..ec26d1b6c789 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
@@ -527,7 +527,7 @@ struct otx2_nic {
 	u32			nix_lmt_size;
 
 	struct otx2_ptp		*ptp;
-	struct hwtstamp_config	tstamp;
+	struct kernel_hwtstamp_config tstamp;
 
 	unsigned long		rq_bmap;
 
@@ -1098,8 +1098,11 @@ int otx2_open(struct net_device *netdev);
 int otx2_stop(struct net_device *netdev);
 int otx2_set_real_num_queues(struct net_device *netdev,
 			     int tx_queues, int rx_queues);
-int otx2_ioctl(struct net_device *netdev, struct ifreq *req, int cmd);
-int otx2_config_hwtstamp(struct net_device *netdev, struct ifreq *ifr);
+int otx2_config_hwtstamp_get(struct net_device *netdev,
+			     struct kernel_hwtstamp_config *config);
+int otx2_config_hwtstamp_set(struct net_device *netdev,
+			     struct kernel_hwtstamp_config *config,
+			     struct netlink_ext_ack *extack);
 
 /* MCAM filter related APIs */
 int otx2_mcam_flow_init(struct otx2_nic *pf);
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index e808995703cf..cf5a2d9fb0c7 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -2445,18 +2445,26 @@ static int otx2_config_hw_tx_tstamp(struct otx2_nic *pfvf, bool enable)
 	return 0;
 }
 
-int otx2_config_hwtstamp(struct net_device *netdev, struct ifreq *ifr)
+int otx2_config_hwtstamp_get(struct net_device *netdev,
+			     struct kernel_hwtstamp_config *config)
+{
+	struct otx2_nic *pfvf = netdev_priv(netdev);
+
+	*config = pfvf->tstamp;
+	return 0;
+}
+EXPORT_SYMBOL(otx2_config_hwtstamp_get);
+
+int otx2_config_hwtstamp_set(struct net_device *netdev,
+			     struct kernel_hwtstamp_config *config,
+			     struct netlink_ext_ack *extack)
 {
 	struct otx2_nic *pfvf = netdev_priv(netdev);
-	struct hwtstamp_config config;
 
 	if (!pfvf->ptp)
 		return -ENODEV;
 
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
-
-	switch (config.tx_type) {
+	switch (config->tx_type) {
 	case HWTSTAMP_TX_OFF:
 		if (pfvf->flags & OTX2_FLAG_PTP_ONESTEP_SYNC)
 			pfvf->flags &= ~OTX2_FLAG_PTP_ONESTEP_SYNC;
@@ -2465,8 +2473,11 @@ int otx2_config_hwtstamp(struct net_device *netdev, struct ifreq *ifr)
 		otx2_config_hw_tx_tstamp(pfvf, false);
 		break;
 	case HWTSTAMP_TX_ONESTEP_SYNC:
-		if (!test_bit(CN10K_PTP_ONESTEP, &pfvf->hw.cap_flag))
+		if (!test_bit(CN10K_PTP_ONESTEP, &pfvf->hw.cap_flag)) {
+			NL_SET_ERR_MSG(extack,
+				       "One-step time stamping is not supported");
 			return -ERANGE;
+		}
 		pfvf->flags |= OTX2_FLAG_PTP_ONESTEP_SYNC;
 		schedule_delayed_work(&pfvf->ptp->synctstamp_work,
 				      msecs_to_jiffies(500));
@@ -2478,7 +2489,7 @@ int otx2_config_hwtstamp(struct net_device *netdev, struct ifreq *ifr)
 		return -ERANGE;
 	}
 
-	switch (config.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		otx2_config_hw_rx_tstamp(pfvf, false);
 		break;
@@ -2497,35 +2508,17 @@ int otx2_config_hwtstamp(struct net_device *netdev, struct ifreq *ifr)
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
 		otx2_config_hw_rx_tstamp(pfvf, true);
-		config.rx_filter = HWTSTAMP_FILTER_ALL;
+		config->rx_filter = HWTSTAMP_FILTER_ALL;
 		break;
 	default:
 		return -ERANGE;
 	}
 
-	memcpy(&pfvf->tstamp, &config, sizeof(config));
+	pfvf->tstamp = *config;
 
-	return copy_to_user(ifr->ifr_data, &config,
-			    sizeof(config)) ? -EFAULT : 0;
-}
-EXPORT_SYMBOL(otx2_config_hwtstamp);
-
-int otx2_ioctl(struct net_device *netdev, struct ifreq *req, int cmd)
-{
-	struct otx2_nic *pfvf = netdev_priv(netdev);
-	struct hwtstamp_config *cfg = &pfvf->tstamp;
-
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		return otx2_config_hwtstamp(netdev, req);
-	case SIOCGHWTSTAMP:
-		return copy_to_user(req->ifr_data, cfg,
-				    sizeof(*cfg)) ? -EFAULT : 0;
-	default:
-		return -EOPNOTSUPP;
-	}
+	return 0;
 }
-EXPORT_SYMBOL(otx2_ioctl);
+EXPORT_SYMBOL(otx2_config_hwtstamp_set);
 
 static int otx2_do_set_vf_mac(struct otx2_nic *pf, int vf, const u8 *mac)
 {
@@ -2942,7 +2935,6 @@ static const struct net_device_ops otx2_netdev_ops = {
 	.ndo_set_features	= otx2_set_features,
 	.ndo_tx_timeout		= otx2_tx_timeout,
 	.ndo_get_stats64	= otx2_get_stats64,
-	.ndo_eth_ioctl		= otx2_ioctl,
 	.ndo_set_vf_mac		= otx2_set_vf_mac,
 	.ndo_set_vf_vlan	= otx2_set_vf_vlan,
 	.ndo_get_vf_config	= otx2_get_vf_config,
@@ -2951,6 +2943,8 @@ static const struct net_device_ops otx2_netdev_ops = {
 	.ndo_xdp_xmit           = otx2_xdp_xmit,
 	.ndo_setup_tc		= otx2_setup_tc,
 	.ndo_set_vf_trust	= otx2_ndo_set_vf_trust,
+	.ndo_hwtstamp_get	= otx2_config_hwtstamp_get,
+	.ndo_hwtstamp_set	= otx2_config_hwtstamp_set,
 };
 
 int otx2_wq_init(struct otx2_nic *pf)
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
index 25381f079b97..f4fdbfba8667 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_vf.c
@@ -534,8 +534,9 @@ static const struct net_device_ops otx2vf_netdev_ops = {
 	.ndo_set_features = otx2vf_set_features,
 	.ndo_get_stats64 = otx2_get_stats64,
 	.ndo_tx_timeout = otx2_tx_timeout,
-	.ndo_eth_ioctl	= otx2_ioctl,
 	.ndo_setup_tc = otx2_setup_tc,
+	.ndo_hwtstamp_get = otx2_config_hwtstamp_get,
+	.ndo_hwtstamp_set = otx2_config_hwtstamp_set,
 };
 
 static int otx2_vf_wq_init(struct otx2_nic *vf)
-- 
2.47.3


