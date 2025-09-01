Return-Path: <linux-renesas-soc+bounces-21104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 019B3B3D872
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 06:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C91ED178602
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 04:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97163253B4C;
	Mon,  1 Sep 2025 04:58:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C908324A058;
	Mon,  1 Sep 2025 04:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756702735; cv=none; b=FT9Xu3gERjmNLHlcXB+dMPjJreApaucOTc0ba3r6rJkjmRrLLS6imOpzCsHxly6ZAv+dWk1M64Fr/ZLndi2JZ6Y0lEj4IEb01WN+3Pne8OFaG4NX/qFtCAznSMke6JJf4Ud0FS9M/i6YyCkJRShTCDpDKfrj26324Fq8BxAS39o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756702735; c=relaxed/simple;
	bh=OUKs8ugCR+zskrC7MQ9iU6VRrIIcaZkBvkxwAXYin2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHypEJbAfN6NsI0t0r2R+L5silS76aYSNP931+Ixszi8tw7/AM79c2kLJansMIqJ6BuWRBKWpjFFm+xZbgqoFGFGxPKKfEZiSJ4xqj/bS7HjE2HUtZOj5fN2cqXdtueCp5DywIsdImQFmJ+xC+wGRQLMEXbbmbICZaCjL2vScCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: HwCf2ubNQjiT8vQ8Di/dQQ==
X-CSE-MsgGUID: idnWsNIXTq+u5T/40PuzPg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2025 13:58:53 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 15B25400F309;
	Mon,  1 Sep 2025 13:58:49 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 01 Sep 2025 06:58:08 +0200
Subject: [PATCH net-next v5 4/4] net: renesas: rswitch: add modifiable
 ageing time
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-add_l2_switching-v5-4-5f13e46860d5@renesas.com>
References: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
In-Reply-To: <20250901-add_l2_switching-v5-0-5f13e46860d5@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756702712; l=1694;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=OUKs8ugCR+zskrC7MQ9iU6VRrIIcaZkBvkxwAXYin2s=;
 b=GUyNSR1xPiXO6v0lzwJEPSQqXe8+baxcx4DY9Xi/KyGn3XuiMfr64p8CfVQ56qm5FcKwYrj20
 1SWvDbbjkhEB/cQJZ5MCDNWXRjtg1Unl22v6WwqkN3d/yojV/Lp/9GA
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

Allow the setting of the MAC table aging in the R-Car S4 Rswitch
using the SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME attribute.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 49a24464dbb0cf3f3219a0699fc4671ddd71ef03..4a69ec77d69c600530189f3f5e86da165022bc4e 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -193,6 +193,24 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
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
@@ -200,6 +218,8 @@ static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
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


