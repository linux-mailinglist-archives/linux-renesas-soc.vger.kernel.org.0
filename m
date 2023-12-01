Return-Path: <linux-renesas-soc+bounces-482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E3800333
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 06:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DB5B1C20E86
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 05:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DD58F4D;
	Fri,  1 Dec 2023 05:47:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 190421724;
	Thu, 30 Nov 2023 21:47:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,240,1695654000"; 
   d="scan'208";a="188815812"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Dec 2023 14:47:01 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1A21C403FE26;
	Fri,  1 Dec 2023 14:47:01 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v2 9/9] net: rswitch: Allow jumbo frames
Date: Fri,  1 Dec 2023 14:46:55 +0900
Message-Id: <20231201054655.3731772-10-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231201054655.3731772-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow jumbo frames by changing maximum MTU size and number of RX queues.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 ++
 drivers/net/ethernet/renesas/rswitch.h | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index c5e3ee8f82bc..f55e15987dce 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1882,6 +1882,8 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	snprintf(ndev->name, IFNAMSIZ, "tsn%d", index);
 	ndev->netdev_ops = &rswitch_netdev_ops;
 	ndev->ethtool_ops = &rswitch_ethtool_ops;
+	ndev->max_mtu = RSWITCH_MAX_MTU;
+	ndev->min_mtu = ETH_MIN_MTU;
 
 	netif_napi_add(ndev, &rdev->napi, rswitch_poll);
 
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 4252677e2a55..72e3ff596d31 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -26,9 +26,10 @@
 		else
 
 #define TX_RING_SIZE		1024
-#define RX_RING_SIZE		1024
+#define RX_RING_SIZE		4096
 #define TS_RING_SIZE		(TX_RING_SIZE * RSWITCH_NUM_PORTS)
 
+#define RSWITCH_MAX_MTU		9600
 #define RSWITCH_HEADROOM	(NET_SKB_PAD + NET_IP_ALIGN)
 #define RSWITCH_DESC_BUF_SIZE	2048
 #define RSWITCH_TAILROOM	SKB_DATA_ALIGN(sizeof(struct skb_shared_info))
-- 
2.34.1


