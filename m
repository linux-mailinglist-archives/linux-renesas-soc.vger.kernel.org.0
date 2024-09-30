Return-Path: <linux-renesas-soc+bounces-9218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099098A965
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2CD51F234F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72011198E77;
	Mon, 30 Sep 2024 16:09:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D82C192D71;
	Mon, 30 Sep 2024 16:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712578; cv=none; b=Aw08/a6iZ+bRBfjaXEEwk9VguFNKHaqjUeYV45Ji2bOt/E5AfmrJvD/QLP3MxLi6+Ga48QKaq5aUmk8EY66S7qHU6h1EfuHHqyD1/AvvBVlF5ZgnPP4cm0Z6Ipk5+xRIsW5yVORWSodgiBG7JJRhoZpzFP/ZQPbVba1tNcY3luY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712578; c=relaxed/simple;
	bh=GAkTF+MVXTsBDvyOAjsGLZIHTuFjLwJ1GRQYar1BjnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fv8Sq2Q+aOqjedYjxUS8Y0O5aN3gG23f7ChyPZFTie2km/UnUVUHFRMypaornir9X6oAp/l0M4YWcJTZ4ZzxkzZqqhMYAyNjavv7KFkVK1F2p2NnhEBsZSOoCyG8PUWp3z3pDRsjredZ1XjhCMMQSq3NWiMJkUrDhC9EK0cbz2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=fail smtp.mailfrom=pbarker.dev; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pbarker.dev
X-IronPort-AV: E=Sophos;i="6.11,166,1725289200"; 
   d="scan'208";a="224347962"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Oct 2024 01:09:35 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.43])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 586474015141;
	Tue,  1 Oct 2024 01:09:31 +0900 (JST)
From: Paul Barker <paul@pbarker.dev>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH 07/11] net: ravb: Simplify UDP TX checksum offload
Date: Mon, 30 Sep 2024 17:08:41 +0100
Message-Id: <20240930160845.8520-8-paul@pbarker.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930160845.8520-1-paul@pbarker.dev>
References: <20240930160845.8520-1-paul@pbarker.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul.barker.ct@bp.renesas.com>

The GbEth IP will pass through a null UDP checksum without asserting any
error flags so we do not need to resort to software checksum calculation
in this case.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 9350ca10ab22..ae0268f2eb04 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2075,20 +2075,12 @@ static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
 
 	switch (ip->protocol) {
 	case IPPROTO_TCP:
-		break;
 	case IPPROTO_UDP:
-		/* If the checksum value in the UDP header field is 0, TOE does
-		 * not calculate checksum for UDP part of this frame as it is
-		 * optional function as per standards.
-		 */
-		if (udp_hdr(skb)->check == 0)
-			return false;
-		break;
+		return true;
+
 	default:
 		return false;
 	}
-
-	return true;
 }
 
 /* Packet transmit function for Ethernet AVB */
-- 
2.43.0


