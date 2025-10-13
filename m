Return-Path: <linux-renesas-soc+bounces-22960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B07DDBD518E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:36:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E511B351431
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45642D3A7C;
	Mon, 13 Oct 2025 16:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ng1743LF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F9C22257E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373373; cv=none; b=GenpGJgT2gZ++7+TM7l5U2CnIHF5HsluYUgx6l5D6zfjDxXUv/B3SrhBjZGOvmbicaDRXgNyL9jfwqNTiYFlp7ApSilI8qvIUkf38OVcdZojquoE/B0Uwl/U2E6GSbtBfRiLaHTr9aMU8oMFym9xNdFOvkMjgFnhD1s7ztoL4hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373373; c=relaxed/simple;
	bh=habwm88z3Fsm8DVYa+550hUJ9dfVkzyHP1ZVkKc8aqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTVkmvWFwYg/KpjD0qPDb3aM5Uy6up/W+G4AoQOFDvlT7+j+wMdH4WJxNZrq/Z4cQWyw7rN6JRilCgC+1EGSwSuJBEzlqON0pxzLzPdCy9P0E8fSoTuF7D3i82KG4Q0c05IVnx6/kPbbb+/Q1TYs4FqbQlGFmtOw3xqqUVY1QeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ng1743LF; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760373368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxtLNzmxI+T4HiW6OUpfPGAU4O042WNaLFJPK9RkTMQ=;
	b=ng1743LFXrYg9hjjg7o1R01YmDk/rCx+IczAOpfjgSOavP2Q8MflL+6eHyICOAYSszRiaP
	NUzY2T6m8JnFrqJYcadjxwoCHxTHKO2dTgkgDZAiqslFMC2q+15HDqdZuFi7T3cIQQhfYm
	KIv25ks0W/1ClunZldaH2wwrj96TvSk=
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
Subject: [PATCH net-next 02/14] ti: icssg: convert to ndo_hwtstamp API
Date: Mon, 13 Oct 2025 16:34:17 +0000
Message-ID: <20251013163429.4984-3-vadim.fedorenko@linux.dev>
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

Convert driver to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() API.
.ndo_eth_ioctl() implementation becomes pure phy_do_ioctl(), remove
it from common module, remove exported symbol and replace ndo callback.

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c  | 47 ++++++-------------
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |  4 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  6 ++-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |  4 +-
 4 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c
index 57e5f1c88f50..0eed29d6187a 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -1223,15 +1223,13 @@ void icssg_ndo_tx_timeout(struct net_device *ndev, unsigned int txqueue)
 }
 EXPORT_SYMBOL_GPL(icssg_ndo_tx_timeout);
 
-static int emac_set_ts_config(struct net_device *ndev, struct ifreq *ifr)
+int icssg_ndo_set_ts_config(struct net_device *ndev,
+			    struct kernel_hwtstamp_config *config,
+			    struct netlink_ext_ack *extack)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
-	struct hwtstamp_config config;
 
-	if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
-		return -EFAULT;
-
-	switch (config.tx_type) {
+	switch (config->tx_type) {
 	case HWTSTAMP_TX_OFF:
 		emac->tx_ts_enabled = 0;
 		break;
@@ -1242,7 +1240,7 @@ static int emac_set_ts_config(struct net_device *ndev, struct ifreq *ifr)
 		return -ERANGE;
 	}
 
-	switch (config.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		emac->rx_ts_enabled = 0;
 		break;
@@ -1262,43 +1260,28 @@ static int emac_set_ts_config(struct net_device *ndev, struct ifreq *ifr)
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
 	case HWTSTAMP_FILTER_NTP_ALL:
 		emac->rx_ts_enabled = 1;
-		config.rx_filter = HWTSTAMP_FILTER_ALL;
+		config->rx_filter = HWTSTAMP_FILTER_ALL;
 		break;
 	default:
 		return -ERANGE;
 	}
 
-	return copy_to_user(ifr->ifr_data, &config, sizeof(config)) ?
-		-EFAULT : 0;
+	return 0;
 }
+EXPORT_SYMBOL_GPL(icssg_ndo_set_ts_config);
 
-static int emac_get_ts_config(struct net_device *ndev, struct ifreq *ifr)
+int icssg_ndo_get_ts_config(struct net_device *ndev,
+			    struct kernel_hwtstamp_config *config)
 {
 	struct prueth_emac *emac = netdev_priv(ndev);
-	struct hwtstamp_config config;
-
-	config.flags = 0;
-	config.tx_type = emac->tx_ts_enabled ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
-	config.rx_filter = emac->rx_ts_enabled ? HWTSTAMP_FILTER_ALL : HWTSTAMP_FILTER_NONE;
-
-	return copy_to_user(ifr->ifr_data, &config, sizeof(config)) ?
-			    -EFAULT : 0;
-}
 
-int icssg_ndo_ioctl(struct net_device *ndev, struct ifreq *ifr, int cmd)
-{
-	switch (cmd) {
-	case SIOCGHWTSTAMP:
-		return emac_get_ts_config(ndev, ifr);
-	case SIOCSHWTSTAMP:
-		return emac_set_ts_config(ndev, ifr);
-	default:
-		break;
-	}
+	config->flags = 0;
+	config->tx_type = emac->tx_ts_enabled ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
+	config->rx_filter = emac->rx_ts_enabled ? HWTSTAMP_FILTER_ALL : HWTSTAMP_FILTER_NONE;
 
-	return phy_do_ioctl(ndev, ifr, cmd);
+	return 0;
 }
-EXPORT_SYMBOL_GPL(icssg_ndo_ioctl);
+EXPORT_SYMBOL_GPL(icssg_ndo_get_ts_config);
 
 void icssg_ndo_get_stats64(struct net_device *ndev,
 			   struct rtnl_link_stats64 *stats)
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
index e42d0fdefee1..1c1f4394ff1f 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
@@ -1168,7 +1168,7 @@ static const struct net_device_ops emac_netdev_ops = {
 	.ndo_validate_addr = eth_validate_addr,
 	.ndo_tx_timeout = icssg_ndo_tx_timeout,
 	.ndo_set_rx_mode = emac_ndo_set_rx_mode,
-	.ndo_eth_ioctl = icssg_ndo_ioctl,
+	.ndo_eth_ioctl = phy_do_ioctl,
 	.ndo_get_stats64 = icssg_ndo_get_stats64,
 	.ndo_get_phys_port_name = icssg_ndo_get_phys_port_name,
 	.ndo_fix_features = emac_ndo_fix_features,
@@ -1176,6 +1176,8 @@ static const struct net_device_ops emac_netdev_ops = {
 	.ndo_vlan_rx_kill_vid = emac_ndo_vlan_rx_del_vid,
 	.ndo_bpf = emac_ndo_bpf,
 	.ndo_xdp_xmit = emac_xdp_xmit,
+	.ndo_hwtstamp_get = icssg_ndo_get_ts_config,
+	.ndo_hwtstamp_set = icssg_ndo_set_ts_config,
 };
 
 static int prueth_netdev_init(struct prueth *prueth,
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.h b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
index ca8a22a4a5da..f0fa9688d9a0 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth.h
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.h
@@ -479,7 +479,11 @@ void prueth_reset_tx_chan(struct prueth_emac *emac, int ch_num,
 void prueth_reset_rx_chan(struct prueth_rx_chn *chn,
 			  int num_flows, bool disable);
 void icssg_ndo_tx_timeout(struct net_device *ndev, unsigned int txqueue);
-int icssg_ndo_ioctl(struct net_device *ndev, struct ifreq *ifr, int cmd);
+int icssg_ndo_get_ts_config(struct net_device *ndev,
+			    struct kernel_hwtstamp_config *config);
+int icssg_ndo_set_ts_config(struct net_device *ndev,
+			    struct kernel_hwtstamp_config *config,
+			    struct netlink_ext_ack *extack);
 void icssg_ndo_get_stats64(struct net_device *ndev,
 			   struct rtnl_link_stats64 *stats);
 int icssg_ndo_get_phys_port_name(struct net_device *ndev, char *name,
diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index 5e225310c9de..2a8c8847a6bd 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -747,9 +747,11 @@ static const struct net_device_ops emac_netdev_ops = {
 	.ndo_validate_addr = eth_validate_addr,
 	.ndo_tx_timeout = icssg_ndo_tx_timeout,
 	.ndo_set_rx_mode = emac_ndo_set_rx_mode_sr1,
-	.ndo_eth_ioctl = icssg_ndo_ioctl,
+	.ndo_eth_ioctl = phy_do_ioctl,
 	.ndo_get_stats64 = icssg_ndo_get_stats64,
 	.ndo_get_phys_port_name = icssg_ndo_get_phys_port_name,
+	.ndo_hwtstamp_get = icssg_ndo_get_ts_config,
+	.ndo_hwtstamp_set = icssg_ndo_set_ts_config,
 };
 
 static int prueth_netdev_init(struct prueth *prueth,
-- 
2.47.3


