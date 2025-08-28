Return-Path: <linux-renesas-soc+bounces-21010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AE0B399F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 12:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63E7C7C4100
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Aug 2025 10:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321B030FC1E;
	Thu, 28 Aug 2025 10:28:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2577930AD1B;
	Thu, 28 Aug 2025 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376922; cv=none; b=nFtP/bWAHDBqso5niwL9PZliq3ZT50kfCPDnNNTCJ78Z7VT0Hg/ytzfTYT9wfTYaOjR00ytoRDMCNnxJLbCaB/87mJf2LaHYw/5msqlL5fR5bxVPjW/XZb9zE0MZIHomriL77/F4lluhnZGxbtmg7B0lB6FmGeNiygvE6Ky8pxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376922; c=relaxed/simple;
	bh=NuwNHlDg+lczBHywiuQttp6wPWwWu9rN6Fsf2xDj/Z4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQyZhFOPcIDhiv/DHDFrEbG/OT1SkGSmcXag/OqoT9azwbBVgJ2le4se8BBLvxtWcjselccw91xQS1dBYFjroLzwmlQdpkAGHe+l1TvWUuYc55SJ/zlTXQJ3dCZxzzDopEbMvpAp85HOQYSn4v8mP6WxGnn4zI+NE64fg47O4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: M5v/9rRRTVCGvO02rn+qRg==
X-CSE-MsgGUID: X8wOwZjWS1CXtUA0TH18bg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2025 19:23:36 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1B6D7417D5AD;
	Thu, 28 Aug 2025 19:23:32 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 28 Aug 2025 12:23:14 +0200
Subject: [PATCH net-next v4 3/4] net: renesas: rswitch: add offloading for
 L2 switching
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-add_l2_switching-v4-3-89d7108c8592@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756376599; l=19918;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=NuwNHlDg+lczBHywiuQttp6wPWwWu9rN6Fsf2xDj/Z4=;
 b=p+rxqKUlxPGnTohnFaogTj/iChGq/tGROZhiJg3cVZc7YzN5rivGu9xW8wbRe+yZCgw92Fdnl
 Jqv1ZV1lbt0DE5VRGOi2Nit1qTg388ofP7++GifjsH5OocVwwEWYcC3
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

This commit adds hardware offloading for L2 switching on R-Car S4.

On S4 brdev is limited to one per-device (not per port). Reasoning
is that hw L2 forwarding support lacks any sort of source port based
filtering, which makes it unusable to offload more than one bridge
device. Either you allow hardware to forward destination MAC to a
port, or you have to send it to CPU. You can't make it forward only
if src and dst ports are in the same brdev.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/Makefile       |   2 +-
 drivers/net/ethernet/renesas/rswitch.h      |  29 ++-
 drivers/net/ethernet/renesas/rswitch_l2.c   | 296 ++++++++++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_l2.h   |  15 ++
 drivers/net/ethernet/renesas/rswitch_main.c |  75 ++++++-
 5 files changed, 412 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/Makefile b/drivers/net/ethernet/renesas/Makefile
index 6222298bb5582b7091cf8de76acb83ac7dd39c11..d63e0c61bb68a9993d388967aea9e1d50f6a95be 100644
--- a/drivers/net/ethernet/renesas/Makefile
+++ b/drivers/net/ethernet/renesas/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_SH_ETH) += sh_eth.o
 ravb-objs := ravb_main.o ravb_ptp.o
 obj-$(CONFIG_RAVB) += ravb.o
 
-rswitch-objs := rswitch_main.o
+rswitch-objs := rswitch_main.o rswitch_l2.o
 obj-$(CONFIG_RENESAS_ETHER_SWITCH) += rswitch.o
 
 obj-$(CONFIG_RENESAS_GEN4_PTP) += rcar_gen4_ptp.o
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 131034d5d992eb59fd2299fa25de3a65285d29ad..a1d4a877e5bd4d3186544649695ddcebb7975032 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -8,12 +8,18 @@
 #define __RSWITCH_H__
 
 #include <linux/platform_device.h>
+#include <linux/phy.h>
+
 #include "rcar_gen4_ptp.h"
 
 #define RSWITCH_MAX_NUM_QUEUES	128
 
 #define RSWITCH_NUM_AGENTS	5
 #define RSWITCH_NUM_PORTS	3
+
+#define rswitch_for_all_ports(_priv, _rdev)			\
+	list_for_each_entry(_rdev, &_priv->port_list, list)
+
 #define rswitch_for_each_enabled_port(priv, i)		\
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++)		\
 		if (priv->rdev[i]->disabled)		\
@@ -809,7 +815,8 @@ enum rswitch_gwca_mode {
 #define FWPC0_IP4EA		BIT(10)
 #define FWPC0_IPDSA		BIT(12)
 #define FWPC0_IPHLA		BIT(18)
-#define FWPC0_MACSDA		BIT(20)
+#define FWPC0_MACDSA		BIT(20)
+#define FWPC0_MACSSA		BIT(23)
 #define FWPC0_MACHLA		BIT(26)
 #define FWPC0_MACHMA		BIT(27)
 #define FWPC0_VLANSA		BIT(28)
@@ -820,12 +827,18 @@ enum rswitch_gwca_mode {
 
 #define FWPC2(i)		(FWPC20 + (i) * 0x10)
 #define FWCP2_LTWFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
+#define FWCP2_LTWFW_MASK	GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
 
 #define FWPBFC(i)		(FWPBFC0 + (i) * 0x10)
 #define FWPBFC_PBDV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
 
 #define FWPBFCSDC(j, i)         (FWPBFCSDC00 + (i) * 0x10 + (j) * 0x04)
 
+#define FWMACHEC_MACHMUE_MASK	GENMASK(26, 16)
+
+#define FWMACTIM_MACTIOG	BIT(0)
+#define FWMACTIM_MACTR		BIT(1)
+
 #define FWMACAGUSPC_MACAGUSP	GENMASK(9, 0)
 #define FWMACAGC_MACAGT		GENMASK(15, 0)
 #define FWMACAGC_MACAGE		BIT(16)
@@ -1006,10 +1019,18 @@ struct rswitch_device {
 	DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
 	bool disabled;
 
+	struct list_head list;
+
 	int port;
 	struct rswitch_etha *etha;
 	struct device_node *np_port;
 	struct phy *serdes;
+
+	struct net_device *brdev;	/* master bridge device */
+	unsigned int learning_requested : 1;
+	unsigned int learning_offloaded : 1;
+	unsigned int forwarding_requested : 1;
+	unsigned int forwarding_offloaded : 1;
 };
 
 struct rswitch_mfwd_mac_table_entry {
@@ -1034,11 +1055,17 @@ struct rswitch_private {
 	struct rswitch_etha etha[RSWITCH_NUM_PORTS];
 	struct rswitch_mfwd mfwd;
 
+	struct list_head port_list;
+
 	spinlock_t lock;	/* lock interrupt registers' control */
 	struct clk *clk;
 
 	bool etha_no_runtime_change;
 	bool gwca_halt;
+	struct net_device *offload_brdev;
 };
 
+bool is_rdev(const struct net_device *ndev);
+void rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear, u32 set);
+
 #endif	/* #ifndef __RSWITCH_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
new file mode 100644
index 0000000000000000000000000000000000000000..49a24464dbb0cf3f3219a0699fc4671ddd71ef03
--- /dev/null
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Renesas Ethernet Switch device driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/etherdevice.h>
+#include <linux/if_bridge.h>
+#include <linux/kernel.h>
+#include <net/switchdev.h>
+
+#include "rswitch.h"
+#include "rswitch_l2.h"
+
+static bool rdev_for_l2_offload(struct rswitch_device *rdev)
+{
+	return rdev->priv->offload_brdev &&
+	       rdev->brdev == rdev->priv->offload_brdev &&
+	       (test_bit(rdev->port, rdev->priv->opened_ports));
+}
+
+static void rswitch_change_l2_hw_offloading(struct rswitch_device *rdev,
+					    bool start, bool learning)
+{
+	u32 bits = learning ? FWPC0_MACSSA | FWPC0_MACHLA | FWPC0_MACHMA : FWPC0_MACDSA;
+	u32 clear = start ? 0 : bits;
+	u32 set = start ? bits : 0;
+
+	if ((learning && rdev->learning_offloaded == start) ||
+	    (!learning && rdev->forwarding_offloaded == start))
+		return;
+
+	rswitch_modify(rdev->priv->addr, FWPC0(rdev->port), clear, set);
+
+	if (learning)
+		rdev->learning_offloaded = start;
+	else
+		rdev->forwarding_offloaded = start;
+
+	netdev_info(rdev->ndev, "%s hw %s\n", start ? "starting" : "stopping",
+		    learning ? "learning" : "forwarding");
+}
+
+static void rswitch_update_l2_hw_learning(struct rswitch_private *priv)
+{
+	struct rswitch_device *rdev;
+	bool learning_needed;
+
+	rswitch_for_all_ports(priv, rdev) {
+		if (rdev_for_l2_offload(rdev))
+			learning_needed = rdev->learning_requested;
+		else
+			learning_needed = false;
+
+		rswitch_change_l2_hw_offloading(rdev, learning_needed, true);
+	}
+}
+
+static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
+{
+	struct rswitch_device *rdev;
+	unsigned int fwd_mask;
+
+	/* calculate fwd_mask with zeroes in bits corresponding to ports that
+	 * shall participate in hardware forwarding
+	 */
+	fwd_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
+
+	rswitch_for_all_ports(priv, rdev) {
+		if (rdev_for_l2_offload(rdev) && rdev->forwarding_requested)
+			fwd_mask &= ~BIT(rdev->port);
+	}
+
+	rswitch_for_all_ports(priv, rdev) {
+		if ((rdev_for_l2_offload(rdev) && rdev->forwarding_requested) ||
+		    rdev->forwarding_offloaded) {
+			/* Update allowed offload destinations even for ports
+			 * with L2 offload enabled earlier.
+			 *
+			 * Do not allow L2 forwarding to self for hw port.
+			 */
+			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
+				  priv->addr + FWPC2(rdev->port));
+		}
+
+		if (rdev_for_l2_offload(rdev) &&
+		    rdev->forwarding_requested &&
+		    !rdev->forwarding_offloaded) {
+			rswitch_change_l2_hw_offloading(rdev, true, false);
+		} else if (rdev->forwarding_offloaded) {
+			rswitch_change_l2_hw_offloading(rdev, false, false);
+		}
+	}
+}
+
+void rswitch_update_l2_offload(struct rswitch_private *priv)
+{
+	rswitch_update_l2_hw_learning(priv);
+	rswitch_update_l2_hw_forwarding(priv);
+}
+
+static void rswitch_update_offload_brdev(struct rswitch_private *priv)
+{
+	struct net_device *offload_brdev = NULL;
+	struct rswitch_device *rdev, *rdev2;
+
+	rswitch_for_all_ports(priv, rdev) {
+		if (!rdev->brdev)
+			continue;
+		rswitch_for_all_ports(priv, rdev2) {
+			if (rdev2 == rdev)
+				break;
+			if (rdev2->brdev == rdev->brdev) {
+				offload_brdev = rdev->brdev;
+				break;
+			}
+		}
+		if (offload_brdev)
+			break;
+	}
+
+	if (offload_brdev == priv->offload_brdev)
+		dev_dbg(&priv->pdev->dev,
+			"changing l2 offload from %s to %s\n",
+			netdev_name(priv->offload_brdev),
+			netdev_name(offload_brdev));
+	else if (offload_brdev)
+		dev_dbg(&priv->pdev->dev, "starting l2 offload for %s\n",
+			netdev_name(offload_brdev));
+	else if (!offload_brdev)
+		dev_dbg(&priv->pdev->dev, "stopping l2 offload for %s\n",
+			netdev_name(priv->offload_brdev));
+
+	priv->offload_brdev = offload_brdev;
+
+	rswitch_update_l2_offload(priv);
+}
+
+static bool rswitch_port_check(const struct net_device *ndev)
+{
+	return is_rdev(ndev);
+}
+
+static void rswitch_port_update_brdev(struct net_device *ndev,
+				      struct net_device *brdev)
+{
+	struct rswitch_device *rdev;
+
+	if (!is_rdev(ndev))
+		return;
+
+	rdev = netdev_priv(ndev);
+	rdev->brdev = brdev;
+	rswitch_update_offload_brdev(rdev->priv);
+}
+
+static int rswitch_port_update_stp_state(struct net_device *ndev, u8 stp_state)
+{
+	struct rswitch_device *rdev;
+
+	if (!is_rdev(ndev))
+		return -ENODEV;
+
+	rdev = netdev_priv(ndev);
+	rdev->learning_requested = (stp_state == BR_STATE_LEARNING ||
+				    stp_state == BR_STATE_FORWARDING);
+	rdev->forwarding_requested = (stp_state == BR_STATE_FORWARDING);
+	rswitch_update_l2_offload(rdev->priv);
+
+	return 0;
+}
+
+static int rswitch_netdevice_event(struct notifier_block *nb,
+				   unsigned long event, void *ptr)
+{
+	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
+	struct netdev_notifier_changeupper_info *info;
+	struct net_device *brdev;
+
+	if (!rswitch_port_check(ndev))
+		return NOTIFY_DONE;
+	if (event != NETDEV_CHANGEUPPER)
+		return NOTIFY_DONE;
+
+	info = ptr;
+
+	if (netif_is_bridge_master(info->upper_dev)) {
+		brdev = info->linking ? info->upper_dev : NULL;
+		rswitch_port_update_brdev(ndev, brdev);
+	}
+
+	return NOTIFY_OK;
+}
+
+static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
+				 const struct switchdev_attr *attr,
+				 struct netlink_ext_ack *extack)
+{
+	switch (attr->id) {
+	case SWITCHDEV_ATTR_ID_PORT_STP_STATE:
+		return rswitch_port_update_stp_state(ndev, attr->u.stp_state);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int rswitch_switchdev_event(struct notifier_block *nb,
+				   unsigned long event, void *ptr)
+{
+	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
+	int ret;
+
+	if (event == SWITCHDEV_PORT_ATTR_SET) {
+		ret = switchdev_handle_port_attr_set(ndev, ptr,
+						     rswitch_port_check,
+						     rswitch_port_attr_set);
+		return notifier_from_errno(ret);
+	}
+
+	if (!rswitch_port_check(ndev))
+		return NOTIFY_DONE;
+
+	return notifier_from_errno(-EOPNOTSUPP);
+}
+
+static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
+					    unsigned long event, void *ptr)
+{
+	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
+	int ret;
+
+	switch (event) {
+	case SWITCHDEV_PORT_OBJ_ADD:
+		return -EOPNOTSUPP;
+	case SWITCHDEV_PORT_OBJ_DEL:
+		return -EOPNOTSUPP;
+	case SWITCHDEV_PORT_ATTR_SET:
+		ret = switchdev_handle_port_attr_set(ndev, ptr,
+						     rswitch_port_check,
+						     rswitch_port_attr_set);
+		break;
+	default:
+		if (!rswitch_port_check(ndev))
+			return NOTIFY_DONE;
+		ret = -EOPNOTSUPP;
+	}
+
+	return notifier_from_errno(ret);
+}
+
+static struct notifier_block rswitch_netdevice_nb = {
+	.notifier_call = rswitch_netdevice_event,
+};
+
+static struct notifier_block rswitch_switchdev_nb = {
+	.notifier_call = rswitch_switchdev_event,
+};
+
+static struct notifier_block rswitch_switchdev_blocking_nb = {
+	.notifier_call = rswitch_switchdev_blocking_event,
+};
+
+int rswitch_register_notifiers(void)
+{
+	int ret;
+
+	ret = register_netdevice_notifier(&rswitch_netdevice_nb);
+	if (ret)
+		goto register_netdevice_notifier_failed;
+
+	ret = register_switchdev_notifier(&rswitch_switchdev_nb);
+	if (ret)
+		goto register_switchdev_notifier_failed;
+
+	ret = register_switchdev_blocking_notifier(&rswitch_switchdev_blocking_nb);
+	if (ret)
+		goto register_switchdev_blocking_notifier_failed;
+
+	return 0;
+
+register_switchdev_blocking_notifier_failed:
+	unregister_switchdev_notifier(&rswitch_switchdev_nb);
+register_switchdev_notifier_failed:
+	unregister_netdevice_notifier(&rswitch_netdevice_nb);
+register_netdevice_notifier_failed:
+
+	return ret;
+}
+
+void rswitch_unregister_notifiers(void)
+{
+	unregister_switchdev_blocking_notifier(&rswitch_switchdev_blocking_nb);
+	unregister_switchdev_notifier(&rswitch_switchdev_nb);
+	unregister_netdevice_notifier(&rswitch_netdevice_nb);
+}
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.h b/drivers/net/ethernet/renesas/rswitch_l2.h
new file mode 100644
index 0000000000000000000000000000000000000000..57050ede8f31848cde5a497811a6ee1b60dedc65
--- /dev/null
+++ b/drivers/net/ethernet/renesas/rswitch_l2.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Renesas Ethernet Switch device driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#ifndef __RSWITCH_L2_H__
+#define __RSWITCH_L2_H__
+
+void rswitch_update_l2_offload(struct rswitch_private *priv);
+
+int rswitch_register_notifiers(void);
+void rswitch_unregister_notifiers(void);
+
+#endif	/* #ifndef __RSWITCH_L2_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 99019ad9de224eaf1c4128bd29609b24d1a6f263..f3ca719b829ff30d14de841597bfee5f9302a47e 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -8,8 +8,11 @@
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/etherdevice.h>
+#include <linux/ethtool.h>
+#include <linux/ip.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/net_tstamp.h>
 #include <linux/of.h>
@@ -25,6 +28,7 @@
 #include <linux/sys_soc.h>
 
 #include "rswitch.h"
+#include "rswitch_l2.h"
 
 static int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected)
 {
@@ -34,7 +38,7 @@ static int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected
 					 1, RSWITCH_TIMEOUT_US);
 }
 
-static void rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear, u32 set)
+void rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear, u32 set)
 {
 	iowrite32((ioread32(addr + reg) & ~clear) | set, addr + reg);
 }
@@ -109,7 +113,7 @@ static void rswitch_top_init(struct rswitch_private *priv)
 }
 
 /* Forwarding engine block (MFWD) */
-static void rswitch_fwd_init(struct rswitch_private *priv)
+static int rswitch_fwd_init(struct rswitch_private *priv)
 {
 	u32 all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
 	unsigned int i;
@@ -149,6 +153,16 @@ static void rswitch_fwd_init(struct rswitch_private *priv)
 
 	/* For GWCA port, allow direct descriptor forwarding */
 	rswitch_modify(priv->addr, FWPC1(priv->gwca.index), FWPC1_DDE, FWPC1_DDE);
+
+	/* Initialize hardware L2 forwarding table */
+
+	/* Allow entire table to be used for "unsecure" entries */
+	rswitch_modify(priv->addr, FWMACHEC, 0, FWMACHEC_MACHMUE_MASK);
+
+	/* Initialize MAC hash table */
+	iowrite32(FWMACTIM_MACTIOG, priv->addr + FWMACTIM);
+
+	return rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);
 }
 
 /* Gateway CPU agent block (GWCA) */
@@ -1611,6 +1625,9 @@ static int rswitch_open(struct net_device *ndev)
 
 	netif_start_queue(ndev);
 
+	if (rdev->brdev)
+		rswitch_update_l2_offload(rdev->priv);
+
 	return 0;
 };
 
@@ -1633,6 +1650,9 @@ static int rswitch_stop(struct net_device *ndev)
 
 	napi_disable(&rdev->napi);
 
+	if (rdev->brdev)
+		rswitch_update_l2_offload(rdev->priv);
+
 	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
 
@@ -1859,16 +1879,46 @@ static int rswitch_eth_ioctl(struct net_device *ndev, struct ifreq *req, int cmd
 	}
 }
 
+static int rswitch_get_port_parent_id(struct net_device *ndev,
+				      struct netdev_phys_item_id *ppid)
+{
+	struct rswitch_device *rdev = netdev_priv(ndev);
+	const char *name;
+
+	name = dev_name(&rdev->priv->pdev->dev);
+	ppid->id_len = min_t(size_t, strlen(name), sizeof(ppid->id_len));
+	memcpy(ppid->id, name, ppid->id_len);
+
+	return 0;
+}
+
+static int rswitch_get_phys_port_name(struct net_device *ndev,
+				      char *name, size_t len)
+{
+	struct rswitch_device *rdev = netdev_priv(ndev);
+
+	snprintf(name, len, "tsn%d", rdev->port);
+
+	return 0;
+}
+
 static const struct net_device_ops rswitch_netdev_ops = {
 	.ndo_open = rswitch_open,
 	.ndo_stop = rswitch_stop,
 	.ndo_start_xmit = rswitch_start_xmit,
 	.ndo_get_stats = rswitch_get_stats,
 	.ndo_eth_ioctl = rswitch_eth_ioctl,
+	.ndo_get_port_parent_id = rswitch_get_port_parent_id,
+	.ndo_get_phys_port_name = rswitch_get_phys_port_name,
 	.ndo_validate_addr = eth_validate_addr,
 	.ndo_set_mac_address = eth_mac_addr,
 };
 
+bool is_rdev(const struct net_device *ndev)
+{
+	return (ndev->netdev_ops == &rswitch_netdev_ops);
+}
+
 static int rswitch_get_ts_info(struct net_device *ndev, struct kernel_ethtool_ts_info *info)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
@@ -1968,6 +2018,8 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	if (err < 0)
 		goto out_txdmac;
 
+	list_add_tail(&rdev->list, &priv->port_list);
+
 	return 0;
 
 out_txdmac:
@@ -1987,6 +2039,7 @@ static void rswitch_device_free(struct rswitch_private *priv, unsigned int index
 	struct rswitch_device *rdev = priv->rdev[index];
 	struct net_device *ndev = rdev->ndev;
 
+	list_del(&rdev->list);
 	rswitch_txdmac_free(ndev);
 	rswitch_rxdmac_free(ndev);
 	of_node_put(rdev->np_port);
@@ -2033,7 +2086,9 @@ static int rswitch_init(struct rswitch_private *priv)
 		}
 	}
 
-	rswitch_fwd_init(priv);
+	err = rswitch_fwd_init(priv);
+	if (err < 0)
+		goto err_fwd_init;
 
 	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
 				     clk_get_rate(priv->clk));
@@ -2082,6 +2137,7 @@ static int rswitch_init(struct rswitch_private *priv)
 err_gwca_request_irq:
 	rcar_gen4_ptp_unregister(priv->ptp_priv);
 
+err_fwd_init:
 err_ptp_register:
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
 		rswitch_device_free(priv, i);
@@ -2116,6 +2172,7 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
+
 	spin_lock_init(&priv->lock);
 
 	priv->clk = devm_clk_get(&pdev->dev, NULL);
@@ -2153,6 +2210,8 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	if (!priv->gwca.queues)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&priv->port_list);
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_sync(&pdev->dev);
 
@@ -2163,6 +2222,15 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (list_empty(&priv->port_list))
+		dev_warn(&pdev->dev, "could not initialize any ports\n");
+
+	ret = rswitch_register_notifiers();
+	if (ret) {
+		dev_err(&pdev->dev, "could not register notifiers\n");
+		return ret;
+	}
+
 	device_set_wakeup_capable(&pdev->dev, 1);
 
 	return ret;
@@ -2196,6 +2264,7 @@ static void renesas_eth_sw_remove(struct platform_device *pdev)
 {
 	struct rswitch_private *priv = platform_get_drvdata(pdev);
 
+	rswitch_unregister_notifiers();
 	rswitch_deinit(priv);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.50.1


