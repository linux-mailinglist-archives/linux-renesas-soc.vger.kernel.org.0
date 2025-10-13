Return-Path: <linux-renesas-soc+bounces-22972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B930BBD572C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 19:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E6D7483468
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 16:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099863054D0;
	Mon, 13 Oct 2025 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U163N1Dc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A495296BBC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 16:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373591; cv=none; b=glZikkUIWtvQuQ4rIqfaJPnIffTaE+JO9YR/tJilvGuCubAsyS5falWj+AKDYvgxv1Tq9/0XsCg+B18MKCzI1ArxFoVg2kG60oZmOS0u4hn96W/RwoyvzaOCFkbbD9s2Vfmz/tl1mU9CfmuLTArhL4QYnxMdSTWB2wKGEJ7YLZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373591; c=relaxed/simple;
	bh=Cns8wr+XflS6B+F6An5XHM/iR4TOAe3HlH9qMqwdBE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DByGPZpTHQifCGyEzPeqt8jMwbAT4FevWsRWxA1p7fd+i7BZFaV3jZiHxd06FqxqMo1gmvytA522ntKPaMMOg2ocQCPGZ4aMQgv3u6GT8WiJajBj7Le5pR9P9LzVw7P6ij8jp+FQk6YMRI8wXD8o1qtTHF7atp0s9mYdBK2Xbi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U163N1Dc; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760373587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvdAmcWkNoajQ6CR20j33cqtHXxt5FdcP61IY5NpwOk=;
	b=U163N1DcHJ2NgEpxZhyW1eFW8jLuwDBEjlZpX/x5zE8myE26sUqt9pRENHJf9m7UX0OziT
	Z6+67oxXywqmsTMMMzKwTpIwqOaEM6diUHhiVX+O0UvwfB2P8bPwgIFOLALeU9Z0llPCR9
	wd4VtvyhZDJbscM7JTcs4fsYSxiUqEY=
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
Subject: [PATCH net-next 13/14] net: hns3: add hwtstamp_get/hwtstamp_set ops
Date: Mon, 13 Oct 2025 16:37:48 +0000
Message-ID: <20251013163749.5047-8-vadim.fedorenko@linux.dev>
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

And .ndo_hwtstamp_get()/.ndo_hwtstamp_set() callbacks to HNS3 framework
to support HW timestamp configuration via netlink.

Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
---
 drivers/net/ethernet/hisilicon/hns3/hnae3.h   |  5 ++++
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   | 29 +++++++++++++++++++
 2 files changed, 34 insertions(+)

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
index bfa5568baa92..1e9388f1115c 100644
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
-- 
2.47.3


