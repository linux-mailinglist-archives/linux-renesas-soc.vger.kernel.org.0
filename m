Return-Path: <linux-renesas-soc+bounces-22973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFD5BD5245
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 18:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8D44C3511F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3FF17F4F6;
	Mon, 13 Oct 2025 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X53QfW+I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD95296BBC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373658; cv=none; b=OrxcQqjluNdgTk0AFWqJrOPLt9/OPxwR9nTOfoYTk3DMW8Rp//31BXvd3sKBdIByMlox9dvr16KmTEQYgQGCVLVYCk/FhGDWHlgnyka5nqlOXOWjv3YxBGOs48xm9CTpMpqkXBlLJ8zFghy1t35pJYyagteIgPSAyy+s89j1GY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373658; c=relaxed/simple;
	bh=sN7m7KVtFP1O6UMDR1mCq5KvZmUG+2AyD9HcCn9BHzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RMJINtLohle57Q7pG7JbabXkIPgX3heIzHTI+X+sACihYspdRLacj3Rh3uK8W7Qh9SpU9vSPy4U6DNTkONSbulugPluJYNgGZSFsTDv5Ypqnx0RQmGVv5JuaJxqQ4xc9101wGbDDOV/A3KRyZADpEEG1nqZEr75kleiytdjrxRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X53QfW+I; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760373643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xr1xLID5gomdkQtccCZ4HHd+IBsFKVqD/prj31TJZnk=;
	b=X53QfW+IPT36daDXqxSkJ9/GguRsk/1Ep03WReFIZuTCxROBWdN5oTBjdS/x2HbeBzUbDK
	3Pbh/cmeqVJuM3JPuxmxAfs6XOfuA60aQRChAMQVZPFJmwlVBHKhymGswIBmQkSpplZ22W
	kR442kZmCMXOaqPWICYZl/BJBl1rZ9w=
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
Subject: [PATCH net-next 14/14] net: hns3: move hns3pf to use hwtstamp callbacks
Date: Mon, 13 Oct 2025 16:39:23 +0000
Message-ID: <20251013163923.5078-1-vadim.fedorenko@linux.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Adopt hns3pf to use .ndo_hwtstamp_get()/.ndo_hwtstamp_set()
callbacks.

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 .../hisilicon/hns3/hns3pf/hclge_main.c        | 13 +++-----
 .../hisilicon/hns3/hns3pf/hclge_ptp.c         | 32 +++++++++++--------
 .../hisilicon/hns3/hns3pf/hclge_ptp.h         |  9 ++++--
 3 files changed, 28 insertions(+), 26 deletions(-)

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


