Return-Path: <linux-renesas-soc+bounces-24217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ED5C3B18C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89F5E1B20CFF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BAEB3451B2;
	Thu,  6 Nov 2025 12:56:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69223451B8;
	Thu,  6 Nov 2025 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433784; cv=none; b=U4Q1tJdFGhbCWGtHMbTUbIvCnLyiDRai0BZQ1EbpHxQH3rMILIlqXaCJSzA23GiwjwdRR9OGCoqPo5mGOFtycjDfRefNjbFgow5mLLiWPpnk7m1hgzYHQcFyXlTUjka9OKHPsiBEZHuP4/ygBDEggupvYeP4YyQiRwaEXdxxMzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433784; c=relaxed/simple;
	bh=rfH/J5yC8NMJ5/lkmqBT0HqYYorj5XSnG7FrO4WX2Ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f13gm68qTcThPF5+xiLVmo8PlZaD7BD5RhWui/8+1hZccYPd0oFULbfdAHt+PH8BisHdoVDVOyn5+UWlcLfbY0GjSFKcAi9/hXBBWz/IeZ9A5lTQPaMT5U8JTI+WhlcYujmk+ars/vMqNXtXdokz695edAojUANycZ+7ZXJbAAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: mM8D28FXRle06k5t66bK2g==
X-CSE-MsgGUID: NJsuTuKoR0mtWfubUyOyGw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 21:56:22 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 19A8B4006DE3;
	Thu,  6 Nov 2025 21:56:16 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:31 +0100
Subject: [PATCH net-next 07/10] net: renesas: rswitch: fix FWPCx register
 names
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-7-dcbb8368ca54@renesas.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
In-Reply-To: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=2767;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=rfH/J5yC8NMJ5/lkmqBT0HqYYorj5XSnG7FrO4WX2Ak=;
 b=EMVDJwaRLph4+GRxT+c7sC+cLZrxYI/fHryM8skZDbMgtZ3UzXzVrc33ea96G9dbKQ5OEkzYc
 3YlCCwzoDoMAfTsNNcWqs7QD5DUwZxI9sZIQvL+WS0s58poEXy9UpCm
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Some bit access macros had letters in the register name mixed up.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      | 6 +++---
 drivers/net/ethernet/renesas/rswitch_l2.c   | 2 +-
 drivers/net/ethernet/renesas/rswitch_main.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index ac32091b7991..ef64bd6e5a75 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -856,12 +856,12 @@ enum rswitch_gwca_mode {
 #define FWPC0_VLANSA		BIT(28)
 
 #define FWPC1(i)		(FWPC10 + (i) * 0x10)
-#define FWCP1_LTHFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
+#define FWPC1_LTHFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
 #define FWPC1_DDE		BIT(0)
 
 #define FWPC2(i)		(FWPC20 + (i) * 0x10)
-#define FWCP2_LTWFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
-#define FWCP2_LTWFW_MASK	GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
+#define FWPC2_LTWFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
+#define FWPC2_LTWFW_MASK	GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
 
 #define FWPBFC(i)		(FWPBFC0 + (i) * 0x10)
 #define FWPBFC_PBDV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 4a69ec77d69c..b69859a0a42a 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -80,7 +80,7 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 			 *
 			 * Do not allow L2 forwarding to self for hw port.
 			 */
-			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
+			iowrite32(FIELD_PREP(FWPC2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
 				  priv->addr + FWPC2(rdev->port));
 		}
 
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index d32d4d18606d..e92b5cdffd10 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -124,10 +124,10 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 		/* Disable all port features */
 		iowrite32(0, priv->addr + FWPC0(i));
 		/* Disallow L3 forwarding and direct descriptor forwarding */
-		iowrite32(FIELD_PREP(FWCP1_LTHFW, all_ports_mask),
+		iowrite32(FIELD_PREP(FWPC1_LTHFW, all_ports_mask),
 			  priv->addr + FWPC1(i));
 		/* Disallow L2 forwarding */
-		iowrite32(FIELD_PREP(FWCP2_LTWFW, all_ports_mask),
+		iowrite32(FIELD_PREP(FWPC2_LTWFW, all_ports_mask),
 			  priv->addr + FWPC2(i));
 		/* Disallow port based forwarding */
 		iowrite32(0, priv->addr + FWPBFC(i));

-- 
2.43.0


