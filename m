Return-Path: <linux-renesas-soc+bounces-19185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D908AF8773
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 07:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21EEC4800F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 05:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C930225A23;
	Fri,  4 Jul 2025 05:51:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55489223DC0;
	Fri,  4 Jul 2025 05:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608307; cv=none; b=Zv6SYpw5aYvfi0m6dGjb7P8yZS303eJPF4OFEeAkQND2tTWPmm+LRNYTQ6a7gXAtaxKpACr2oq+Gs9gKvJ3Pgb3oixBB5Czj/HEp1S8gvBRnuTGaT+popkxpvWe68/lCOoPm1sdL3nYfGQ1/UVVeWZK7FIxW1InzRgOCSsqoYGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608307; c=relaxed/simple;
	bh=TMWAIH48ZhOH7NcIlTEmJSZsLzicki8S75hRqhPlV9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACMerdAQQ5w0I94PzWO5tfRkE6QyiWAjsN8yqSf6pvPy0vAPAbkiC7T9YBSuuqQRfkLGaA3KQVDoAUDVXx4hAGRLZ8lTgN82kh9t83N6fek6ZdsTGuPhcwCZdY34MbDlA4U0sBfDxYct6AjY7nS6S3SbtcY+SmpIXs4zVs+NEu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: EK1Xbw1tREu7VA75XdcRJw==
X-CSE-MsgGUID: y+RZrP1cRCiwhoY62piNjQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jul 2025 14:51:44 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 91E8F4156F90;
	Fri,  4 Jul 2025 14:51:40 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 04 Jul 2025 07:51:17 +0200
Subject: [PATCH 3/3] net: renesas: rswitch: add modifiable ageing time
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-add_l2_switching-v1-3-ff882aacb258@renesas.com>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
In-Reply-To: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751608288; l=2498;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=TMWAIH48ZhOH7NcIlTEmJSZsLzicki8S75hRqhPlV9U=;
 b=zX9H68pRwkNotk+Npq3JXSDc3yBIbR+gWBVGqQsS2PTTv8crg1VGEs8dTfVPXw56CG7LN/900
 aKqFzB7Lsf5BkktBkQKcQ8wuUjOIGPd6KEn2Rww9e/g1py1015r0plk
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

This commit allows the setting of the MAC table aging in the R-Car S4
Rswitch using the SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME attribute.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h    |  1 +
 drivers/net/ethernet/renesas/rswitch_l2.c | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 45a9d02c5b5d3e7b62554bd56c6c0cb9231f684c..11ff1102668b081e395664ea73e19e0ecef74e24 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -849,6 +849,7 @@ enum rswitch_gwca_mode {
 #define FWMACAGC_MACDESOG	BIT(29)
 
 #define RSW_AGEING_TIME		300
+#define RSW_MAX_AGEING_TIME	65535
 
 /* TOP */
 #define TPEMIMC7(queue)		(TPEMIMC70 + (queue) * 4)
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 242beb1f15c089585f5fe5019f626df8824b971a..c8a8a60a20e70f7ce421280ed35c0c4afe1ed039 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -196,6 +196,30 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
+static int rswitch_update_ageing_time(struct net_device *ndev, clock_t time)
+{
+	struct rswitch_device *rdev = netdev_priv(ndev);
+	u32 reg_val, time_val;
+
+	if (!is_rdev(ndev))
+		return -ENODEV;
+
+	/* Although brctl accepts the ageing time parameter in seconds, the value
+	 * passed to the driver is multiplied by 100. We need it in seconds.
+	 */
+	time_val = (u32)time / 100;
+
+	if (time_val > RSW_MAX_AGEING_TIME)
+		return -EINVAL;
+
+	rdev = netdev_priv(ndev);
+	reg_val = FIELD_PREP(FWMACAGC_MACAGT, time_val);
+	reg_val |= FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
+	iowrite32(reg_val, rdev->priv->addr + FWMACAGC);
+
+	return 0;
+}
+
 static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
 				 const struct switchdev_attr *attr,
 				 struct netlink_ext_ack *extack)
@@ -203,6 +227,8 @@ static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
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


