Return-Path: <linux-renesas-soc+bounces-22966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB48BBD51F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8376918A501C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043752D23AD;
	Mon, 13 Oct 2025 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LzUArI59"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51CD2BF009
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373575; cv=none; b=biOCbGBxqcktDyKyx2b0PZ3uQ8lc+SQ1wG0A0Gdn1ALd6WPKcPx70sN8UqYLT6wY1vaauuOO1vvdYDTZ4MdO9b5leXMzzvmh5gtYZk3xmAUfU44gmdZrKVLv2NoHNsqsY4AeoM9g7Bc7QyhOuei+faPLdKrhjlIseHesiu5AxIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373575; c=relaxed/simple;
	bh=HAAZOzmH1YE2EtOhwnrx1f4Hq32SdMRExouviIWnQJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rgc0lWmPRgHgdUzia0XUsDCLFVXjLgC2u7tS86fVk5sJY6mxCayCDTLecGA5l3FCgiIOKV0t0/IHLh4Il+cCa6rW42em4SHlHpIEbhRXEampaAQ8QQ6C3pScs1troeieeWwOluDDQrgWKr+Ka6yIp0fBEJaDIOaBObraza6paL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LzUArI59; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760373571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4YLeJeO2zsMVmpGaNcq2NA4cUB3VmM8bAEBpWfr3ps=;
	b=LzUArI59VSw/ObXNTN+Ytuk1H/VFXvzKOYzOISSyBGRySrwgnWq3ot5ZZCvs+cH6Gx5EP9
	uUkOOz1s4Os1fxtzPg2LjTqrYdvyq1jXZPbI2b80NuWmNxJoLCrE5i19MaCxMjdnpZUe8g
	d6oiCGK71qXdY4OcLCskUmcNRrdlhqI=
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
Subject: [PATCH net-next 07/14] funeth: convert to ndo_hwtstamp API
Date: Mon, 13 Oct 2025 16:37:42 +0000
Message-ID: <20251013163749.5047-2-vadim.fedorenko@linux.dev>
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
.ndo_eth_ioctl() implementation becomes empty, remove it.

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 drivers/net/ethernet/fungible/funeth/funeth.h |  4 +-
 .../ethernet/fungible/funeth/funeth_main.c    | 40 +++++++------------
 2 files changed, 16 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/fungible/funeth/funeth.h b/drivers/net/ethernet/fungible/funeth/funeth.h
index 1250e10d21db..55e705e239f8 100644
--- a/drivers/net/ethernet/fungible/funeth/funeth.h
+++ b/drivers/net/ethernet/fungible/funeth/funeth.h
@@ -4,7 +4,7 @@
 #define _FUNETH_H
 
 #include <uapi/linux/if_ether.h>
-#include <uapi/linux/net_tstamp.h>
+#include <linux/net_tstamp.h>
 #include <linux/mutex.h>
 #include <linux/seqlock.h>
 #include <linux/xarray.h>
@@ -121,7 +121,7 @@ struct funeth_priv {
 	u8 rx_coal_usec;
 	u8 rx_coal_count;
 
-	struct hwtstamp_config hwtstamp_cfg;
+	struct kernel_hwtstamp_config hwtstamp_cfg;
 
 	/* cumulative queue stats from earlier queue instances */
 	u64 tx_packets;
diff --git a/drivers/net/ethernet/fungible/funeth/funeth_main.c b/drivers/net/ethernet/fungible/funeth/funeth_main.c
index ac86179a0a81..792cddac6f1b 100644
--- a/drivers/net/ethernet/fungible/funeth/funeth_main.c
+++ b/drivers/net/ethernet/fungible/funeth/funeth_main.c
@@ -1014,26 +1014,25 @@ static int fun_get_port_attributes(struct net_device *netdev)
 	return 0;
 }
 
-static int fun_hwtstamp_get(struct net_device *dev, struct ifreq *ifr)
+static int fun_hwtstamp_get(struct net_device *dev,
+			    struct kernel_hwtstamp_config *config)
 {
 	const struct funeth_priv *fp = netdev_priv(dev);
 
-	return copy_to_user(ifr->ifr_data, &fp->hwtstamp_cfg,
-			    sizeof(fp->hwtstamp_cfg)) ? -EFAULT : 0;
+	*config = fp->hwtstamp_cfg;
+	return 0;
 }
 
-static int fun_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
+static int fun_hwtstamp_set(struct net_device *dev,
+			    struct kernel_hwtstamp_config *config,
+			    struct netlink_ext_ack *extack)
 {
 	struct funeth_priv *fp = netdev_priv(dev);
-	struct hwtstamp_config cfg;
-
-	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
-		return -EFAULT;
 
 	/* no TX HW timestamps */
-	cfg.tx_type = HWTSTAMP_TX_OFF;
+	config->tx_type = HWTSTAMP_TX_OFF;
 
-	switch (cfg.rx_filter) {
+	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
 		break;
 	case HWTSTAMP_FILTER_ALL:
@@ -1051,26 +1050,14 @@ static int fun_hwtstamp_set(struct net_device *dev, struct ifreq *ifr)
 	case HWTSTAMP_FILTER_PTP_V2_SYNC:
 	case HWTSTAMP_FILTER_PTP_V2_DELAY_REQ:
 	case HWTSTAMP_FILTER_NTP_ALL:
-		cfg.rx_filter = HWTSTAMP_FILTER_ALL;
+		config->rx_filter = HWTSTAMP_FILTER_ALL;
 		break;
 	default:
 		return -ERANGE;
 	}
 
-	fp->hwtstamp_cfg = cfg;
-	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
-}
-
-static int fun_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
-{
-	switch (cmd) {
-	case SIOCSHWTSTAMP:
-		return fun_hwtstamp_set(dev, ifr);
-	case SIOCGHWTSTAMP:
-		return fun_hwtstamp_get(dev, ifr);
-	default:
-		return -EOPNOTSUPP;
-	}
+	fp->hwtstamp_cfg = *config;
+	return 0;
 }
 
 /* Prepare the queues for XDP. */
@@ -1340,7 +1327,6 @@ static const struct net_device_ops fun_netdev_ops = {
 	.ndo_change_mtu		= fun_change_mtu,
 	.ndo_set_mac_address	= fun_set_macaddr,
 	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_eth_ioctl		= fun_ioctl,
 	.ndo_uninit		= fun_uninit,
 	.ndo_bpf		= fun_xdp,
 	.ndo_xdp_xmit		= fun_xdp_xmit_frames,
@@ -1348,6 +1334,8 @@ static const struct net_device_ops fun_netdev_ops = {
 	.ndo_set_vf_vlan	= fun_set_vf_vlan,
 	.ndo_set_vf_rate	= fun_set_vf_rate,
 	.ndo_get_vf_config	= fun_get_vf_config,
+	.ndo_hwtstamp_get	= fun_hwtstamp_get,
+	.ndo_hwtstamp_set	= fun_hwtstamp_set,
 };
 
 #define GSO_ENCAP_FLAGS (NETIF_F_GSO_GRE | NETIF_F_GSO_IPXIP4 | \
-- 
2.47.3


