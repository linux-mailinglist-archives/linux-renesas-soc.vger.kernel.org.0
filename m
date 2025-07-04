Return-Path: <linux-renesas-soc+bounces-19184-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B96BAF8772
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 07:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 701243BC6B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 05:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A993D2222CC;
	Fri,  4 Jul 2025 05:51:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6383A20D517;
	Fri,  4 Jul 2025 05:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608304; cv=none; b=H2HvCXlSfhb2EhLNhD4u/kkg4en+iArgZ8w5AL51R+cvrrN4h/9vLG2U1u+fb/yKOA6Dz1mD6QcvamQJ+5tEpfilhrrpzS3smApjSC0DopT77TyA23E8m3+SWJu50mtJjiNMUCtNYa3KWNxCiXc/GZA8hmLVR5GUwqR9fwpR2Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608304; c=relaxed/simple;
	bh=ecVPBy85iyjBludaaQ6oaRo0YgKa74EXmBwbk3LGlMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VYYhO4hjMB0utxlwfo4hR/XF6volnM46sQZNFQ6HoyxkuyXwrWUvQNTsbSuCtn58bh2G/O5Lyxc/XgN/KEn9MA/SjNkFUvVwv205nQAUX0iD0PmxBeorg7XLxY4onGQfTDen018zclymgUXRpTyOqf0hIVYTH+Bh+5XXamzkIcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: zTq/GJCURcqZ2iUSuFvGtg==
X-CSE-MsgGUID: x0hBWQEWRUiGH/9NvdC6iQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jul 2025 14:51:40 +0900
Received: from [127.0.1.1] (unknown [10.226.78.19])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 82E6D4156C50;
	Fri,  4 Jul 2025 14:51:36 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 04 Jul 2025 07:51:16 +0200
Subject: [PATCH 2/3] net: renesas: rswitch: add offloading for L2 switching
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-add_l2_switching-v1-2-ff882aacb258@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751608288; l=21682;
 i=michael.dege@renesas.com; s=20250523; h=from:subject:message-id;
 bh=ecVPBy85iyjBludaaQ6oaRo0YgKa74EXmBwbk3LGlMA=;
 b=HQNBdT4capAnpo8mjYRHdGqpA7R399n4/vWYwiPVBL3O8UIIeoDoJ1SVjw4LZG4fdEc6LPcSx
 4BtbXFRV02+BQ3dmcQRM4yQE3m1G25w+VYsDMqXns5pJfFtYPvsmfcb
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=+gYTlVQ3/MlOju88OuKnXA7MlapP4lYqJn1F81HZGSo=

This commit adds hardware offloading for L2 switching on R-Car S4

Signed-off-by: Michael Dege <michael.dege@renesas.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/Makefile       |   2 +-
 drivers/net/ethernet/renesas/rswitch.h      |  42 +++-
 drivers/net/ethernet/renesas/rswitch_l2.c   | 318 ++++++++++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_l2.h   |  15 ++
 drivers/net/ethernet/renesas/rswitch_main.c |  88 +++++++-
 5 files changed, 458 insertions(+), 7 deletions(-)

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
index 532192cbca4b520e06a7e35653929d8364f1ccb2..45a9d02c5b5d3e7b62554bd56c6c0cb9231f684c 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1,19 +1,25 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2022 Renesas Electronics Corporation
+ * Copyright (C) 2022-2025 Renesas Electronics Corporation
  */
 
 #ifndef __RSWITCH_H__
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
@@ -821,11 +828,28 @@ enum rswitch_gwca_mode {
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
+#define FWMACAGUSPC_MACAGUSP	GENMASK(9, 0)
+#define FWMACAGC_MACAGT		GENMASK(15, 0)
+#define FWMACAGC_MACAGE		BIT(16)
+#define FWMACAGC_MACAGSL	BIT(17)
+#define FWMACAGC_MACAGPM	BIT(18)
+#define FWMACAGC_MACDES		BIT(24)
+#define FWMACAGC_MACAGOG	BIT(28)
+#define FWMACAGC_MACDESOG	BIT(29)
+
+#define RSW_AGEING_TIME		300
+
 /* TOP */
 #define TPEMIMC7(queue)		(TPEMIMC70 + (queue) * 4)
 
@@ -994,10 +1018,18 @@ struct rswitch_device {
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
@@ -1022,11 +1054,17 @@ struct rswitch_private {
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
index 0000000000000000000000000000000000000000..242beb1f15c089585f5fe5019f626df8824b971a
--- /dev/null
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -0,0 +1,318 @@
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
+void rswitch_update_l2_offload(struct rswitch_private *priv)
+{
+	bool learning_needed, forwarding_needed;
+	unsigned int all_ports_mask, fwd_mask;
+	struct rswitch_device *rdev;
+
+	/* calculate fwd_mask with zeroes in bits corresponding to ports that
+	 * shall participate in hardware forwarding
+	 */
+	all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
+	fwd_mask = all_ports_mask;
+
+	rswitch_for_all_ports(priv, rdev) {
+		if (rdev_for_l2_offload(rdev) && rdev->forwarding_requested)
+			fwd_mask &= ~BIT(rdev->port);
+	}
+
+	rswitch_for_all_ports(priv, rdev) {
+		if (rdev_for_l2_offload(rdev)) {
+			learning_needed = rdev->learning_requested;
+			forwarding_needed = rdev->forwarding_requested;
+		} else {
+			learning_needed = false;
+			forwarding_needed = false;
+		}
+
+		if (!rdev->learning_offloaded && learning_needed) {
+			rswitch_modify(priv->addr, FWPC0(rdev->port),
+				       0,
+				       FWPC0_MACSSA | FWPC0_MACHLA | FWPC0_MACHMA);
+
+			rdev->learning_offloaded = true;
+			netdev_info(rdev->ndev, "starting hw learning\n");
+		}
+
+		if (rdev->learning_offloaded && !learning_needed) {
+			rswitch_modify(priv->addr, FWPC0(rdev->port),
+				       FWPC0_MACSSA | FWPC0_MACHLA | FWPC0_MACHMA,
+				       0);
+
+			rdev->learning_offloaded = false;
+			netdev_info(rdev->ndev, "stopping hw learning\n");
+		}
+
+		if (forwarding_needed) {
+			/* Update allowed offload destinations even for ports
+			 * with L2 offload enabled earlier.
+			 *
+			 * Do not allow L2 forwarding to self for hw port.
+			 */
+			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
+				  priv->addr + FWPC2(rdev->port));
+
+			if (!rdev->forwarding_offloaded) {
+				rswitch_modify(priv->addr, FWPC0(rdev->port),
+					       0,
+					       FWPC0_MACDSA);
+
+				rdev->forwarding_offloaded = true;
+				netdev_info(rdev->ndev,
+					    "starting hw forwarding\n");
+			}
+		} else if (rdev->forwarding_offloaded) {
+			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
+				  priv->addr + FWPC2(rdev->port));
+
+			rswitch_modify(priv->addr, FWPC0(rdev->port),
+				       FWPC0_MACDSA,
+				       0);
+
+			rdev->forwarding_offloaded = false;
+			netdev_info(rdev->ndev, "stopping hw forwarding\n");
+		}
+	}
+}
+
+static void rswitch_update_offload_brdev(struct rswitch_private *priv,
+					 bool force_update_l2_offload)
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
+	if (offload_brdev == priv->offload_brdev) {
+		if (offload_brdev && force_update_l2_offload)
+			rswitch_update_l2_offload(priv);
+		return;
+	}
+
+	if (offload_brdev && !priv->offload_brdev)
+		dev_info(&priv->pdev->dev, "starting l2 offload for %s\n",
+			 netdev_name(offload_brdev));
+	else if (!offload_brdev && priv->offload_brdev)
+		dev_info(&priv->pdev->dev, "stopping l2 offload for %s\n",
+			 netdev_name(priv->offload_brdev));
+	else
+		dev_info(&priv->pdev->dev,
+			 "changing l2 offload from %s to %s\n",
+			 netdev_name(priv->offload_brdev),
+			 netdev_name(offload_brdev));
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
+	rswitch_update_offload_brdev(rdev->priv, false);
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
+static int rswitch_port_obj_add(struct net_device *ndev, const void *ctx,
+				const struct switchdev_obj *obj,
+				struct netlink_ext_ack *extack)
+{
+	return -EOPNOTSUPP;
+}
+
+static int rswitch_port_obj_del(struct net_device *ndev, const void *ctx,
+				const struct switchdev_obj *obj)
+{
+	return -EOPNOTSUPP;
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
+		ret = switchdev_handle_port_obj_add(ndev, ptr,
+						    rswitch_port_check,
+						    rswitch_port_obj_add);
+		break;
+	case SWITCHDEV_PORT_OBJ_DEL:
+		ret = switchdev_handle_port_obj_del(ndev, ptr,
+						    rswitch_port_check,
+						    rswitch_port_obj_del);
+		break;
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
index aba772e14555d30891dc74a5a123121dad77e92b..12689530e09385b7912b25fa1b982bfd637948d4 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1,15 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2022 Renesas Electronics Corporation
+ * Copyright (C) 2022-2025 Renesas Electronics Corporation
  */
 
 #include <linux/clk.h>
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
@@ -109,10 +113,12 @@ static void rswitch_top_init(struct rswitch_private *priv)
 }
 
 /* Forwarding engine block (MFWD) */
-static void rswitch_fwd_init(struct rswitch_private *priv)
+static int rswitch_fwd_init(struct rswitch_private *priv)
 {
 	u32 all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
 	unsigned int i;
+	u32 reg_val;
+	u32 ret;
 
 	/* Start with empty configuration */
 	for (i = 0; i < RSWITCH_NUM_AGENTS; i++) {
@@ -128,6 +134,14 @@ static void rswitch_fwd_init(struct rswitch_private *priv)
 		iowrite32(0, priv->addr + FWPBFC(i));
 	}
 
+	/* Configure MAC table aging */
+	rswitch_modify(priv->addr, FWMACAGUSPC, FWMACAGUSPC_MACAGUSP,
+		       FIELD_PREP(FWMACAGUSPC_MACAGUSP, 0x140));
+
+	reg_val = FIELD_PREP(FWMACAGC_MACAGT, RSW_AGEING_TIME);
+	reg_val |= FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
+	iowrite32(reg_val, priv->addr + FWMACAGC);
+
 	/* For enabled ETHA ports, setup port based forwarding */
 	rswitch_for_each_enabled_port(priv, i) {
 		/* Port based forwarding from port i to GWCA port */
@@ -140,6 +154,17 @@ static void rswitch_fwd_init(struct rswitch_private *priv)
 
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
+	ret = rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);
+
+	return ret;
 }
 
 /* Gateway CPU agent block (GWCA) */
@@ -1602,6 +1627,9 @@ static int rswitch_open(struct net_device *ndev)
 
 	netif_start_queue(ndev);
 
+	if (rdev->brdev)
+		rswitch_update_l2_offload(rdev->priv);
+
 	return 0;
 };
 
@@ -1624,6 +1652,9 @@ static int rswitch_stop(struct net_device *ndev)
 
 	napi_disable(&rdev->napi);
 
+	if (rdev->brdev)
+		rswitch_update_l2_offload(rdev->priv);
+
 	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
 
@@ -1850,16 +1881,46 @@ static int rswitch_eth_ioctl(struct net_device *ndev, struct ifreq *req, int cmd
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
@@ -1959,6 +2020,8 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	if (err < 0)
 		goto out_txdmac;
 
+	list_add_tail(&rdev->list, &priv->port_list);
+
 	return 0;
 
 out_txdmac:
@@ -1978,6 +2041,7 @@ static void rswitch_device_free(struct rswitch_private *priv, unsigned int index
 	struct rswitch_device *rdev = priv->rdev[index];
 	struct net_device *ndev = rdev->ndev;
 
+	list_del(&rdev->list);
 	rswitch_txdmac_free(ndev);
 	rswitch_rxdmac_free(ndev);
 	of_node_put(rdev->np_port);
@@ -2024,7 +2088,9 @@ static int rswitch_init(struct rswitch_private *priv)
 		}
 	}
 
-	rswitch_fwd_init(priv);
+	err = rswitch_fwd_init(priv);
+	if (err < 0)
+		goto err_fwd_init;
 
 	err = rcar_gen4_ptp_register(priv->ptp_priv, RCAR_GEN4_PTP_REG_LAYOUT,
 				     clk_get_rate(priv->clk));
@@ -2073,6 +2139,7 @@ static int rswitch_init(struct rswitch_private *priv)
 err_gwca_request_irq:
 	rcar_gen4_ptp_unregister(priv->ptp_priv);
 
+err_fwd_init:
 err_ptp_register:
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
 		rswitch_device_free(priv, i);
@@ -2107,6 +2174,7 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
+
 	spin_lock_init(&priv->lock);
 
 	priv->clk = devm_clk_get(&pdev->dev, NULL);
@@ -2144,6 +2212,8 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	if (!priv->gwca.queues)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&priv->port_list);
+
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_sync(&pdev->dev);
 
@@ -2154,6 +2224,15 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
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
@@ -2187,6 +2266,7 @@ static void renesas_eth_sw_remove(struct platform_device *pdev)
 {
 	struct rswitch_private *priv = platform_get_drvdata(pdev);
 
+	rswitch_unregister_notifiers();
 	rswitch_deinit(priv);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.49.0


