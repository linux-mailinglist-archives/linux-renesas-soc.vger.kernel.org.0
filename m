Return-Path: <linux-renesas-soc+bounces-21011-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 703B8B399F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 12:32:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EAF1983517
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 10:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BEBB30BBB4;
	Thu, 28 Aug 2025 10:28:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6220430DD30;
	Thu, 28 Aug 2025 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376932; cv=none; b=uUOzPfdShtSTp2KBX7m2TArrzpNEBPelpxIVAVlytqKaIFydTLON9Rld4WEDIPd6zanV1G+cjReIHzpAXl0bya/yyilOCA0UGwehK+WVqXFKYrFu1KEviCi9A8NUrTkEmZh05WEuCgmnEM2PVJO/Uagb8Pq2Yc1bgEli0s4CvKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376932; c=relaxed/simple;
	bh=ZcLgD+aABZq8JCiT7rC4+lqrGItq9ZZqx9iHu8LIkMY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MmJIsKOoKEe3ZGu79yt/DJM7ysUdHBwcde5c/9Xe7RIGyncAb+NZZJRicvQshNaJKw7ecpK6EytlLub7sAd/XVkai3bdwoyZA/pU5ENn8jSlphLsYdoMnHkPmQsW+sRRIdM4y+Xn5arWW5DrV+zZOZouWMk+6e7H5rD9dgTwRGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: GCTWor7IRISm7hdbbKt0JQ==
X-CSE-MsgGUID: f3a6C8MSQ4eugfOZlickJQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 28 Aug 2025 19:23:40 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4FEB9417D5AD;
	Thu, 28 Aug 2025 19:23:37 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 28 Aug 2025 12:23:15 +0200
Subject: [PATCH net-next v4 4/4] net: renesas: rswitch: add modifiable
 ageing time
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-add_l2_switching-v4-4-89d7108c8592@renesas.com>
References: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
In-Reply-To: <20250828-add_l2_switching-v4-0-89d7108c8592@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756376599; l=1737;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=ZcLgD+aABZq8JCiT7rC4+lqrGItq9ZZqx9iHu8LIkMY=;
 b=ZMgbXZMgYWe2AUoX/Yj4DIoix8t0HSj5/PsE5gVuJT3ICzAzSBH3Sc2xnOVAjNHLl/5DVcMph
 nMcYd0DcUj0BO6RCj+NtNzVyyYI+KpEkRytuQy7e5bSe71Q4njOh8WY
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

This commit allows the setting of the MAC table aging in the R-Car S4
Rswitch using the SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME attribute.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 49a24464dbb0cf3f3219a0699fc4671ddd71ef03..c57396af70a4b291746d6451eae7cf60b3f89721 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -193,6 +193,25 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+static int rswitch_update_ageing_time(struct net_device *ndev, clock_t time)
+{
+	struct rswitch_device *rdev = netdev_priv(ndev);
+	u32 reg_val;
+
+	if (!is_rdev(ndev))
+		return -ENODEV;
+
+	if (!FIELD_FIT(FWMACAGC_MACAGT, time))
+		return -EINVAL;
+
+	rdev = netdev_priv(ndev);
+	reg_val = FIELD_PREP(FWMACAGC_MACAGT, time);
+	reg_val |= FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
+	iowrite32(reg_val, rdev->priv->addr + FWMACAGC);
+
+	return 0;
+}
+
 static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
 				 const struct switchdev_attr *attr,
 				 struct netlink_ext_ack *extack)
@@ -200,6 +219,8 @@ static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
 	switch (attr->id) {
 	case SWITCHDEV_ATTR_ID_PORT_STP_STATE:
 		return rswitch_port_update_stp_state(ndev, attr->u.stp_state);
+	case SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME:
+		return rswitch_update_ageing_time(ndev, attr->u.ageing_time);
 	default:
 		return -EOPNOTSUPP;
 	}

-- 
2.50.1


