Return-Path: <linux-renesas-soc+bounces-23428-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D4498BFB73F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 12:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0B0F5021F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 10:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A71328B5D;
	Wed, 22 Oct 2025 10:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iEXFxKPg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9131325482
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 10:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130181; cv=none; b=Cww7VegH26rAJjPcoaj0ZigQqkR0RGe6T2kgjKrwPZdbd5imlv+AsOU7S0EPATzqMIYH4F919d/4Y2/JJgXHEAlLMYQV5qbGv3bUKuX5zmY7FchGqauwq0WJAcw+14L4h17mEpwEPU9/lkntAZnzYBd4cZIXUCgx0W5UhKbK+/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130181; c=relaxed/simple;
	bh=iu3Wm7sKtjIeVRCw+1srDJ3n8LrtjEKRqEmGdVvbvqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rpuAFwICC8gNWpNtkXvb6G3/5gX8325qFdNMrT1USPYxL158Msx58UsRdQGnH1Ny2hlJ9RtMJG1/WL+fRYT2400uWGdmLxqcgsycO20Yz2apFxSLZzQ6Ux5LKHWEYMnsmI5Ll2INRDk+5lHvllNlj/y1LlADjE0MpwLgcRhNhk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iEXFxKPg; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761130177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UubabpsB3NqzyRThTjtkHYxzWLJLOWVkhG1MapA7GnQ=;
	b=iEXFxKPg9psRCzEK9WlAVsvGcggHNk3J4PdZa2XMwpZQbbpt35lHjihBV++ddOTfoc5qbk
	J+AAzKjl2wxjATM5djT/QMoHD7Uxuc2fNzt7oiH6iVa2z7410vrKAq7vF4VaGfiRYiNDi+
	OIJD6/RodNAqrw/5ep2fn1AD5ny4FyE=
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
Subject: [PATCH net-next v4 6/6] net: hns3: add hwtstamp_get/hwtstamp_set ops
Date: Wed, 22 Oct 2025 10:49:00 +0000
Message-ID: <20251022104900.901973-7-vadim.fedorenko@linux.dev>
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

And .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks to HNS3 framework
to support HW timestamp configuration via netlink and adopt hns3pf to
use .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks.

Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Jijie Shao <shaojijie@huawei.com>
Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
v1 -> v2:
- actually assign ndo_tstamp callbacks
---
 drivers/net/ethernet/hisilicon/hns3/hnae3.h   |  5 +++
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   | 31 ++++++++++++++++++
 .../hisilicon/hns3/hns3pf/hclge_main.c        | 13 +++-----
 .../hisilicon/hns3/hns3pf/hclge_ptp.c         | 32 +++++++++++--------
 .../hisilicon/hns3/hns3pf/hclge_ptp.h         |  9 ++++--
 5 files changed, 64 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hnae3.h b/drivers/net/ethernet/hisilicon/hns3/hnae3.h
index 3b548f71fa8a..d7c3df1958f3 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hnae3.h
+++ b/drivers/net/ethernet/hisilicon/hns3/hnae3.h
@@ -804,6 +804,11 @@ struct hnae3_ae_ops {
 	int (*dbg_get_read_func)(struct hnae3_handle *handle,
 				 enum hnae3_dbg_cmd cmd,
 				 read_func *func);
+	int (*hwtstamp_get)(struct hnae3_handle *handle,
+			    struct kernel_hwtstamp_config *config);
+	int (*hwtstamp_set)(struct hnae3_handle *handle,
+			    struct kernel_hwtstamp_config *config,
+			    struct netlink_ext_ack *extack);
 };
 
 struct hnae3_dcb_ops {
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index bfa5568baa92..7a0654e2d3dd 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -2419,6 +2419,35 @@ static int hns3_nic_do_ioctl(struct net_device *netdev,
 	return h->ae_algo->ops->do_ioctl(h, ifr, cmd);
 }
 
+static int hns3_nic_hwtstamp_get(struct net_device *netdev,
+				 struct kernel_hwtstamp_config *config)
+{
+	struct hnae3_handle *h = hns3_get_handle(netdev);
+
+	if (!netif_running(netdev))
+		return -EINVAL;
+
+	if (!h->ae_algo->ops->hwtstamp_get)
+		return -EOPNOTSUPP;
+
+	return h->ae_algo->ops->hwtstamp_get(h, config);
+}
+
+static int hns3_nic_hwtstamp_set(struct net_device *netdev,
+				 struct kernel_hwtstamp_config *config,
+				 struct netlink_ext_ack *extack)
+{
+	struct hnae3_handle *h = hns3_get_handle(netdev);
+
+	if (!netif_running(netdev))
+		return -EINVAL;
+
+	if (!h->ae_algo->ops->hwtstamp_set)
+		return -EOPNOTSUPP;
+
+	return h->ae_algo->ops->hwtstamp_set(h, config, extack);
+}
+
 static int hns3_nic_set_features(struct net_device *netdev,
 				 netdev_features_t features)
 {
@@ -3048,6 +3077,8 @@ static const struct net_device_ops hns3_nic_netdev_ops = {
 	.ndo_set_vf_rate	= hns3_nic_set_vf_rate,
 	.ndo_set_vf_mac		= hns3_nic_set_vf_mac,
 	.ndo_select_queue	= hns3_nic_select_queue,
+	.ndo_hwtstamp_get	= hns3_nic_hwtstamp_get,
+	.ndo_hwtstamp_set	= hns3_nic_hwtstamp_set,
 };
 
 bool hns3_is_phys_func(struct pci_dev *pdev)
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 9d34d28ff168..81d3bdc098e6 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -9445,15 +9445,8 @@ static int hclge_do_ioctl(struct hnae3_handle *handle, struct ifreq *ifr,
 	struct hclge_vport *vport = hclge_get_vport(handle);
 	struct hclge_dev *hdev = vport->back;
 
-	switch (cmd) {
-	case SIOCGHWTSTAMP:
-		return hclge_ptp_get_cfg(hdev, ifr);
-	case SIOCSHWTSTAMP:
-		return hclge_ptp_set_cfg(hdev, ifr);
-	default:
-		if (!hdev->hw.mac.phydev)
-			return hclge_mii_ioctl(hdev, ifr, cmd);
-	}
+	if (!hdev->hw.mac.phydev)
+		return hclge_mii_ioctl(hdev, ifr, cmd);
 
 	return phy_mii_ioctl(hdev->hw.mac.phydev, ifr, cmd);
 }
@@ -12901,6 +12894,8 @@ static const struct hnae3_ae_ops hclge_ops = {
 	.get_dscp_prio = hclge_get_dscp_prio,
 	.get_wol = hclge_get_wol,
 	.set_wol = hclge_set_wol,
+	.hwtstamp_get = hclge_ptp_get_cfg,
+	.hwtstamp_set = hclge_ptp_set_cfg,
 };
 
 static struct hnae3_ae_algo ae_algo = {
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.c
index 4bd52eab3914..0081c5281455 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.c
@@ -204,13 +204,17 @@ static int hclge_ptp_adjtime(struct ptp_clock_info *ptp, s64 delta)
 	return 0;
 }
 
-int hclge_ptp_get_cfg(struct hclge_dev *hdev, struct ifreq *ifr)
+int hclge_ptp_get_cfg(struct hnae3_handle *handle,
+		      struct kernel_hwtstamp_config *config)
 {
+	struct hclge_vport *vport = hclge_get_vport(handle);
+	struct hclge_dev *hdev = vport->back;
+
 	if (!test_bit(HCLGE_STATE_PTP_EN, &hdev->state))
 		return -EOPNOTSUPP;
 
-	return copy_to_user(ifr->ifr_data, &hdev->ptp->ts_cfg,
-		sizeof(struct hwtstamp_config)) ? -EFAULT : 0;
+	*config = hdev->ptp->ts_cfg;
+	return 0;
 }
 
 static int hclge_ptp_int_en(struct hclge_dev *hdev, bool en)
@@ -269,7 +273,7 @@ static int hclge_ptp_cfg(struct hclge_dev *hdev, u32 cfg)
 	return ret;
 }
 
-static int hclge_ptp_set_tx_mode(struct hwtstamp_config *cfg,
+static int hclge_ptp_set_tx_mode(struct kernel_hwtstamp_config *cfg,
 				 unsigned long *flags, u32 *ptp_cfg)
 {
 	switch (cfg->tx_type) {
@@ -287,7 +291,7 @@ static int hclge_ptp_set_tx_mode(struct hwtstamp_config *cfg,
 	return 0;
 }
 
-static int hclge_ptp_set_rx_mode(struct hwtstamp_config *cfg,
+static int hclge_ptp_set_rx_mode(struct kernel_hwtstamp_config *cfg,
 				 unsigned long *flags, u32 *ptp_cfg)
 {
 	int rx_filter = cfg->rx_filter;
@@ -332,7 +336,7 @@ static int hclge_ptp_set_rx_mode(struct hwtstamp_config *cfg,
 }
 
 static int hclge_ptp_set_ts_mode(struct hclge_dev *hdev,
-				 struct hwtstamp_config *cfg)
+				 struct kernel_hwtstamp_config *cfg)
 {
 	unsigned long flags = hdev->ptp->flags;
 	u32 ptp_cfg = 0;
@@ -359,9 +363,12 @@ static int hclge_ptp_set_ts_mode(struct hclge_dev *hdev,
 	return 0;
 }
 
-int hclge_ptp_set_cfg(struct hclge_dev *hdev, struct ifreq *ifr)
+int hclge_ptp_set_cfg(struct hnae3_handle *handle,
+		      struct kernel_hwtstamp_config *config,
+		      struct netlink_ext_ack *extack)
 {
-	struct hwtstamp_config cfg;
+	struct hclge_vport *vport = hclge_get_vport(handle);
+	struct hclge_dev *hdev = vport->back;
 	int ret;
 
 	if (!test_bit(HCLGE_STATE_PTP_EN, &hdev->state)) {
@@ -369,16 +376,13 @@ int hclge_ptp_set_cfg(struct hclge_dev *hdev, struct ifreq *ifr)
 		return -EOPNOTSUPP;
 	}
 
-	if (copy_from_user(&cfg, ifr->ifr_data, sizeof(cfg)))
-		return -EFAULT;
-
-	ret = hclge_ptp_set_ts_mode(hdev, &cfg);
+	ret = hclge_ptp_set_ts_mode(hdev, config);
 	if (ret)
 		return ret;
 
-	hdev->ptp->ts_cfg = cfg;
+	hdev->ptp->ts_cfg = *config;
 
-	return copy_to_user(ifr->ifr_data, &cfg, sizeof(cfg)) ? -EFAULT : 0;
+	return 0;
 }
 
 int hclge_ptp_get_ts_info(struct hnae3_handle *handle,
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.h b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.h
index 61faddcc3dd0..0162fa5ac146 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.h
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_ptp.h
@@ -62,7 +62,7 @@ struct hclge_ptp {
 	unsigned long flags;
 	void __iomem *io_base;
 	struct ptp_clock_info info;
-	struct hwtstamp_config ts_cfg;
+	struct kernel_hwtstamp_config ts_cfg;
 	spinlock_t lock;	/* protects ptp registers */
 	u32 ptp_cfg;
 	u32 last_tx_seqid;
@@ -133,8 +133,11 @@ bool hclge_ptp_set_tx_info(struct hnae3_handle *handle, struct sk_buff *skb);
 void hclge_ptp_clean_tx_hwts(struct hclge_dev *hdev);
 void hclge_ptp_get_rx_hwts(struct hnae3_handle *handle, struct sk_buff *skb,
 			   u32 nsec, u32 sec);
-int hclge_ptp_get_cfg(struct hclge_dev *hdev, struct ifreq *ifr);
-int hclge_ptp_set_cfg(struct hclge_dev *hdev, struct ifreq *ifr);
+int hclge_ptp_get_cfg(struct hnae3_handle *handle,
+		      struct kernel_hwtstamp_config *config);
+int hclge_ptp_set_cfg(struct hnae3_handle *handle,
+		      struct kernel_hwtstamp_config *config,
+		      struct netlink_ext_ack *extack);
 int hclge_ptp_init(struct hclge_dev *hdev);
 void hclge_ptp_uninit(struct hclge_dev *hdev);
 int hclge_ptp_get_ts_info(struct hnae3_handle *handle,
-- 
2.47.3


