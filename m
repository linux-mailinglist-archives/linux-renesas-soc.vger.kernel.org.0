Return-Path: <linux-renesas-soc+bounces-19486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEA9B00223
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 14:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B607480BA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jul 2025 12:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517E42EA723;
	Thu, 10 Jul 2025 12:31:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AF12E8DFE;
	Thu, 10 Jul 2025 12:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752150716; cv=none; b=AsHfi/qG3CfhK/9uTpTKuf9eme9a1pwJAR+MwsICPPBwRxAf5UBQrPMSX8RuQXaZUTyxNV4RsL/pM2w27oOgxszWxnPH5X2m6lrfFI3/vfc/gRDso84Owcz7XDTbR2Sr5vLbfvgbOt7/mA5C/okBTs5LV2/B1V6XS/zKV2ztW6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752150716; c=relaxed/simple;
	bh=hV8lYlOJYW/i8HTI/bB7xiFRY7LPBhe/38EgrX8+VjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MenjtfD0Ru4y3fuzTnK7r1f+jRvihb0WyxlWS5dYuNNFzYtINulvscNkq2aojt5YEPESquIf4p3gonB9O322w/VcsOpl+woLy+jJOMrc2N5HkqnHTV7tyb7fTepyszrxBAUKnYDCtI4iX1JjjrDwzKN3/+2K8U99v08RW37bvoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: leEZL0m1QXeedU5xVz4gjQ==
X-CSE-MsgGUID: FXSLCbAFSXWYR8MibJLYMQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jul 2025 21:31:52 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7DE7C424F40F;
	Thu, 10 Jul 2025 21:31:49 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 10 Jul 2025 14:31:12 +0200
Subject: [PATCH v3 4/4] net: renesas: rswitch: add modifiable ageing time
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-add_l2_switching-v3-4-c0a328327b43@renesas.com>
References: <20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com>
In-Reply-To: <20250710-add_l2_switching-v3-0-c0a328327b43@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752150692; l=1737;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=hV8lYlOJYW/i8HTI/bB7xiFRY7LPBhe/38EgrX8+VjE=;
 b=4ji4op06OjH/yrruyVZzQrrKOOpIEwiv/BlRXFP2JZLIEnEigdznmVGEPUbcPZkwfek1ZpVPC
 4aOQ5RF5L4eCW+sWhb1krDVzeyArI0fBg8qfN3f1XaU2uDd+moFKL5d
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

This commit allows the setting of the MAC table aging in the R-Car S4
Rswitch using the SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME attribute.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index ae0b6a8088fc706334c29534df00f13756b1f374..8a8f40069f0da4cdff7e61269a1d404ef2246e2c 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -202,6 +202,25 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
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
@@ -209,6 +228,8 @@ static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
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


