Return-Path: <linux-renesas-soc+bounces-19372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2ECAFC711
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 11:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4B616FD78
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 09:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A4082690D1;
	Tue,  8 Jul 2025 09:28:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179D0267B9B;
	Tue,  8 Jul 2025 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751966888; cv=none; b=uLLuL8evQyVLtVruekyeJWZd+Ni8771r4kJQpAoioJ6BR0CZsiK3N5XS8whZ+H+c8vcpdVY289mpDm6/WAsTFYf8wkv3QZt9DOV2C/cJNSGB3wyKWnjsxO0j18OLNr/ZJCAC5hyQO/fsLlouiVlf5ml1Ep7qCRtlhkHnav9iZl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751966888; c=relaxed/simple;
	bh=sBbFMN6RILra4rzHuBM5P/MUPPZUf2xD4RniwCpXdjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QVdrxuj6T5Y5rXevenviut4nwJ3YyUPEJOd+QlQx109AXkqncMqScmAkBuFlylzTNAjNSPnsslu9vTyVVJtewcjuVNKcCZy6Z4caZJxY4qb+06oALLt7MVijouMEsfdOZmigFHOEhnwfHXgmARzlFlcBNg5KxpMh3o1hVmo0h2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: jXKrjl2hR0igmWBENkQuTQ==
X-CSE-MsgGUID: iPszyIUlRnW924+v0TB4Fg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jul 2025 18:28:05 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3FAA54009640;
	Tue,  8 Jul 2025 18:28:02 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 08 Jul 2025 11:27:40 +0200
Subject: [PATCH v2 4/4] net: renesas: rswitch: add modifiable ageing time
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-add_l2_switching-v2-4-f91f5556617a@renesas.com>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
In-Reply-To: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751966866; l=1737;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=sBbFMN6RILra4rzHuBM5P/MUPPZUf2xD4RniwCpXdjA=;
 b=tICA4vHrDtwTqshXj8EW7ZEi5o7qGvR8rH2UtRXivJQiqUpxmQ9p93nO1+kw3mm8OeODQ6Wz2
 OsNwKtg2iNzDSR0imgSGJWbl0RiHt17RGmiHdCGjBEgj6MmEaK5VOUb
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

This commit allows the setting of the MAC table aging in the R-Car S4
Rswitch using the SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME attribute.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 4177601000016b61def64735710052ba25222ff2..3d47ac668b4f5dfca87a192f2fc020597bef115d 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -196,6 +196,25 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
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
@@ -203,6 +222,8 @@ static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
 	switch (attr->id) {
 	case SWITCHDEV_ATTR_ID_PORT_STP_STATE:
 		return rswitch_port_update_stp_state(ndev, attr->u.stp_state);
+	case SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME:
+		return rswitch_update_ageing_time(ndev, attr->u.ageing_time);
 	default:
 		return -EOPNOTSUPP;
 	}

-- 
2.49.0


