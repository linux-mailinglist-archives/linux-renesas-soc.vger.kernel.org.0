Return-Path: <linux-renesas-soc+bounces-6690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB80914EB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 15:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4FEBB240E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 13:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683BC142E8F;
	Mon, 24 Jun 2024 13:31:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8590E13E046
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719235887; cv=none; b=Yc16clXt3a+0+vfFbFAuG1AA/ZlC8yiG3nH+f+IY7j/yt7sCEA7jKVb3yI+BvlGDPo0RTPGM0sD/YL+8L+ktg94F2hbZjX60RG9vYpykosjdMDFCtcY+ipH4htnd3HYlQByN8OHsPsFmURNjc6tzSGwl252RAeSBt0Jj1DV71kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719235887; c=relaxed/simple;
	bh=H3LL2YSxXaLgsqNQRkKFKgHJh4jLqO69pPcbgow43B4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NAW8aYxrxvuSgjAuq/JrVID4Z+jue3NmNj3WRzYZCjkGdCbdf3nhgR4SvduhYDIBSicoKMoEp8sOppoUDWwNpjJX8+BDDukYQUcMSgnu9joX2xV1ghLeN5VBc90yenZzSDhd7UZCeoTVlM1yrYZuMAzB6gRIvG3Ii8EBE2ZDVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4W77xv3HChz4wy9Z
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 15:25:39 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d11f:2bfd:8d32:701a])
	by laurent.telenet-ops.be with bizsmtp
	id fRRT2C00U4jBKfC01RRTBf; Mon, 24 Jun 2024 15:25:32 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sLjhF-000HSU-6r;
	Mon, 24 Jun 2024 15:25:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sLjhH-007u9A-N8;
	Mon, 24 Jun 2024 15:25:27 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next v2 1/2] ravb: Improve ravb_hw_info instance order
Date: Mon, 24 Jun 2024 15:25:24 +0200
Message-Id: <a76febe3737e26365a784e9193da9363f22aa550.1719234830.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719234830.git.geert+renesas@glider.be>
References: <cover.1719234830.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move ravb_gen2_hw_info before ravb_gen3_hw_info to match
ravb_match_table[] order.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 drivers/net/ethernet/renesas/ravb_main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c1546b916e4ef581..974e0bb9da1947f2 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2652,7 +2652,7 @@ static int ravb_mdio_release(struct ravb_private *priv)
 	return 0;
 }
 
-static const struct ravb_hw_info ravb_gen3_hw_info = {
+static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
 	.set_feature = ravb_set_features_rcar,
@@ -2668,16 +2668,13 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
 	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
-	.internal_delay = 1,
-	.tx_counters = 1,
-	.multi_irqs = 1,
-	.irq_en_dis = 1,
-	.ccc_gac = 1,
+	.aligned_tx = 1,
+	.gptp = 1,
 	.nc_queues = 1,
 	.magic_pkt = 1,
 };
 
-static const struct ravb_hw_info ravb_gen2_hw_info = {
+static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
 	.set_feature = ravb_set_features_rcar,
@@ -2693,8 +2690,11 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
 	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
-	.aligned_tx = 1,
-	.gptp = 1,
+	.internal_delay = 1,
+	.tx_counters = 1,
+	.multi_irqs = 1,
+	.irq_en_dis = 1,
+	.ccc_gac = 1,
 	.nc_queues = 1,
 	.magic_pkt = 1,
 };
-- 
2.34.1


