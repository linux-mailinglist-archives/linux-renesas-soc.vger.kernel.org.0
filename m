Return-Path: <linux-renesas-soc+bounces-587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B094D8029D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 02:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E8E1280C16
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Dec 2023 01:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2CD23D8;
	Mon,  4 Dec 2023 01:21:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id D6D5CE8;
	Sun,  3 Dec 2023 17:21:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,248,1695654000"; 
   d="scan'208";a="185170576"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Dec 2023 10:21:01 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E3C68411E23B;
	Mon,  4 Dec 2023 10:21:01 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v3 6/9] net: rswitch: Set GWMDNC register
Date: Mon,  4 Dec 2023 10:20:55 +0900
Message-Id: <20231204012058.3876078-7-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204012058.3876078-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231204012058.3876078-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support jumbo frames, set GWMDNC register with acceptable maximum
values for TX and RX.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 2 ++
 drivers/net/ethernet/renesas/rswitch.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index f94c76161794..d24ba2411d5e 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -667,6 +667,8 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 	iowrite32(upper_32_bits(priv->gwca.linkfix_table_dma), priv->addr + GWDCBAC0);
 	iowrite32(lower_32_bits(priv->gwca.ts_queue.ring_dma), priv->addr + GWTDCAC10);
 	iowrite32(upper_32_bits(priv->gwca.ts_queue.ring_dma), priv->addr + GWTDCAC00);
+	iowrite32(GWMDNC_TSDMN(1) | GWMDNC_TXDMN(0x1e) | GWMDNC_RXDMN(0x1f),
+		  priv->addr + GWMDNC);
 	iowrite32(GWCA_TS_IRQ_BIT, priv->addr + GWTSDCC0);
 
 	iowrite32(GWTPC_PPPL(GWCA_IPV_NUM), priv->addr + GWTPC0);
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 2ac9a86b6238..17e617ec4187 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -773,6 +773,10 @@ enum rswitch_gwca_mode {
 #define GWARIRM_ARIOG		BIT(0)
 #define GWARIRM_ARR		BIT(1)
 
+#define GWMDNC_TSDMN(num)	(((num) << 16) & GENMASK(17, 16))
+#define GWMDNC_TXDMN(num)	(((num) << 8) & GENMASK(12, 8))
+#define GWMDNC_RXDMN(num)	((num) & GENMASK(4, 0))
+
 #define GWDCC_BALR		BIT(24)
 #define GWDCC_DCP_MASK		GENMASK(18, 16)
 #define GWDCC_DCP(prio)		FIELD_PREP(GWDCC_DCP_MASK, (prio))
-- 
2.34.1


