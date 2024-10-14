Return-Path: <linux-renesas-soc+bounces-9726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B6E99CE60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 16:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A48D1C22B38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 14:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB72E1AB526;
	Mon, 14 Oct 2024 14:43:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935E3E571;
	Mon, 14 Oct 2024 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916991; cv=none; b=r4s3oteEFLsbZM7AVr2G/xqaZq47+eEL4K3s9m0zRTmkwsXoq2XryuOZ31Gl9deyYcKD0T5uvFKQokMZ4uSKoJxeikgE+Fvcj5iCLK0UMbtyovAubaPNNCszajv/+tzuge6x4OOnTcaO2mmWnNq1OHm0cMFZARGSv9lYScgBRno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916991; c=relaxed/simple;
	bh=6MtAe8xATYYq/dl/4aDZ/abizKkkYyR7LFawF7AsOUw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=vE9PM54Jj4l77Zkle2X1se5BKxPUup51pjVQAA1Dway3ocLBnwxWD6YfuwNFcdNUtzAuQBJcv1l7ki+yBJRgWWGTs5jPxUStOpWcGbWdn+LXRGa/jwcQ0iVF0fCsLpNimAGNb12iy/3o7kN1SHJEND8IS+hv7dpG7TvEx7Rax5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XS0LC01JLz1j9nF;
	Mon, 14 Oct 2024 22:41:54 +0800 (CST)
Received: from kwepemm600001.china.huawei.com (unknown [7.193.23.3])
	by mail.maildlp.com (Postfix) with ESMTPS id A7996140113;
	Mon, 14 Oct 2024 22:43:06 +0800 (CST)
Received: from huawei.com (10.175.113.133) by kwepemm600001.china.huawei.com
 (7.193.23.3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 14 Oct
 2024 22:43:05 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <niklas.soderlund@ragnatech.se>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<andrew@lunn.ch>, <zhangxiaoxu5@huawei.com>
CC: <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <wanghai38@huawei.com>
Subject: [PATCH net] net: ethernet: rtsn: fix potential memory leak in rtsn_start_xmit()
Date: Mon, 14 Oct 2024 22:42:50 +0800
Message-ID: <20241014144250.38802-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600001.china.huawei.com (7.193.23.3)

The rtsn_start_xmit() returns NETDEV_TX_OK without freeing skb
in case of skb->len being too long, add dev_kfree_skb_any() to fix it.

Fixes: b0d3969d2b4d ("net: ethernet: rtsn: Add support for Renesas Ethernet-TSN")
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/net/ethernet/renesas/rtsn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index f9f63c61d792..6b3f7fca8d15 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -1057,6 +1057,7 @@ static netdev_tx_t rtsn_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	if (skb->len >= TX_DS) {
 		priv->stats.tx_dropped++;
 		priv->stats.tx_errors++;
+		dev_kfree_skb_any(skb);
 		goto out;
 	}
 
-- 
2.17.1


