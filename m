Return-Path: <linux-renesas-soc+bounces-24219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F9C3B1EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:14:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 62E28504091
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0C3D337B93;
	Thu,  6 Nov 2025 12:56:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2BD33769F;
	Thu,  6 Nov 2025 12:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433798; cv=none; b=Ujw4/INiW+GCrCk8I1zU4Pj8pbbkW+yhaoC/fYYBOa/njtNb10j2G/+YirlAWAtRzUoahe6u73WVqzScdW0k2gsAM1q0uX3Iib9/wbBS6eoNLUNe2DtB7E/qqP9P7d98rNIO+r+CIqSEZ4G7Q84/Ytha4cyYtBnI343JtavnjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433798; c=relaxed/simple;
	bh=dPZuUDEZsd1R2ZSIWgMQuxdFaeB3MjSUb/uWITR3P1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mV6znz1RGntkOBowSeDkQBeReIb2Ju6qzvn3kr8tTMHgBI1jZ/tYNhGsoSTvEY7jAg1+yABvoASCjjJ27FI5fIq1Rpb39+Pfnh9N7OjlgILDrq82b8+RR5Pa7HD3cmq0zraSHJuWX5MLs+KaKUkBlEtP4ekArjh0wx0WaSIxP6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: DQwDClIATES0YFQ9acVBfg==
X-CSE-MsgGUID: R0ZxsaE1Rmyy6RAjcGgzQQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2025 21:56:34 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D3EB34007553;
	Thu,  6 Nov 2025 21:56:28 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:33 +0100
Subject: [PATCH net-next 09/10] net: renesas: rswitch: add simple l3
 routing
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-9-dcbb8368ca54@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=31480;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=dPZuUDEZsd1R2ZSIWgMQuxdFaeB3MjSUb/uWITR3P1I=;
 b=CPR5fIzlDWSCTpNcoCWzvvpATj/kUt8f1RyrKh7CtDsc7BVCkoAaWFdskGtij6i+HBdOOoso4
 7GbRe0PaCvaCajvC9Q6DB/V63i0qYW8Gl1+4ypIWnZXOouvYQb/4+NK
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Add hardware offloading for L3 routing on R-Car S4.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/Makefile       |   2 +-
 drivers/net/ethernet/renesas/rswitch.h      |  66 ++-
 drivers/net/ethernet/renesas/rswitch_l3.c   | 751 ++++++++++++++++++++++++++++
 drivers/net/ethernet/renesas/rswitch_l3.h   |  24 +
 drivers/net/ethernet/renesas/rswitch_main.c |  69 ++-
 5 files changed, 906 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/renesas/Makefile b/drivers/net/ethernet/renesas/Makefile
index d63e0c61bb68..ffe4e2dcb5d8 100644
--- a/drivers/net/ethernet/renesas/Makefile
+++ b/drivers/net/ethernet/renesas/Makefile
@@ -8,7 +8,7 @@ obj-$(CONFIG_SH_ETH) += sh_eth.o
 ravb-objs := ravb_main.o ravb_ptp.o
 obj-$(CONFIG_RAVB) += ravb.o
 
-rswitch-objs := rswitch_main.o rswitch_l2.o
+rswitch-objs := rswitch_main.o rswitch_l2.o rswitch_l3.o
 obj-$(CONFIG_RENESAS_ETHER_SWITCH) += rswitch.o
 
 obj-$(CONFIG_RENESAS_GEN4_PTP) += rcar_gen4_ptp.o
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 773bde67bebc..6e57ca88e1f7 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -871,6 +871,9 @@ enum rswitch_gwca_mode {
 
 #define FWMACHEC_MACHMUE_MASK	GENMASK(26, 16)
 
+#define RSWITCH_LTH_STREAM_W	10
+#define RSWITCH_LTH_RRULE_W	8
+
 #define FWMACTIM_MACTIOG	BIT(0)
 #define FWMACTIM_MACTR		BIT(1)
 
@@ -1152,8 +1155,20 @@ struct rswitch_gwca {
 	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
 };
 
-#define NUM_QUEUES_PER_NDEV	2
-#define TS_TAGS_PER_PORT	256
+struct rswitch_route_monitor {
+	struct net_device *ndev;
+
+	struct notifier_block fib_nb;
+
+	struct list_head ipv4_local_route_list;
+	struct list_head ipv4_bcast_route_list;
+	struct list_head ipv4_ucast_route_list;
+
+	spinlock_t lock;	/* spinlock because fib notifier is atomic */
+};
+
+#define NUM_QUEUES_PER_NDEV     2
+#define TS_TAGS_PER_PORT        256
 struct rswitch_device {
 	struct rswitch_private *priv;
 	struct net_device *ndev;
@@ -1173,10 +1188,14 @@ struct rswitch_device {
 	struct phy *serdes;
 
 	struct net_device *brdev;	/* master bridge device */
+	struct rswitch_route_monitor rmon;
+
 	unsigned int learning_requested : 1;
 	unsigned int learning_offloaded : 1;
 	unsigned int forwarding_requested : 1;
 	unsigned int forwarding_offloaded : 1;
+
+	unsigned int l3_offload_enabled : 1;
 };
 
 struct rswitch_mfwd_mac_table_entry {
@@ -1209,9 +1228,50 @@ struct rswitch_private {
 	bool etha_no_runtime_change;
 	bool gwca_halt;
 	struct net_device *offload_brdev;
+
+	spinlock_t l3_lock;	/* lock L3 HW register access */
+	DECLARE_BITMAP(l23_update_bitmap, RSWITCH_MAX_NUM_RRULE);
+	struct list_head l23_update_list;
+};
+
+struct rswitch_l23update_spec {
+	u8 dst_mac[ETH_ALEN];
+};
+
+struct rswitch_l23update {
+	struct list_head list;
+	unsigned int use_count;
+	unsigned int index;
+	struct rswitch_l23update_spec spec;
+};
+
+struct rmon_ipv4_route {
+	struct list_head list;
+	__be32 addr;
+	__be32 mask;
+	__be32 gw_addr;
+	struct list_head offload_list;
+};
+
+struct rmon_ipv4_route_exception {
+	struct list_head list;
+	__be32 addr;
+};
+
+/* Hardware frame type identifiers (bits 130:128 of stream id) */
+#define RSWITCH_FRAME_TYPE_IPV4_TCP	3
+#define RSWITCH_FRAME_TYPE_IPV4_UDP	2
+#define RSWITCH_FRAME_TYPE_IPV4_OTHER	1
+
+struct rmon_ipv4_dst_offload {
+	struct list_head list;
+	struct rswitch_l23update *update;
+	__be32 addr;
+	u8 types_offloaded;	/* bits for RSWITCH_FRAME_TYPE_* */
 };
 
-bool is_rdev(const struct net_device *ndev);
 void rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear, u32 set);
+int  rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected);
 
+bool is_rdev(const struct net_device *ndev);
 #endif	/* #ifndef __RSWITCH_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_l3.c b/drivers/net/ethernet/renesas/rswitch_l3.c
new file mode 100644
index 000000000000..74b10c867bd1
--- /dev/null
+++ b/drivers/net/ethernet/renesas/rswitch_l3.c
@@ -0,0 +1,751 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Renesas Ethernet Switch device driver L3 offloading
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/etherdevice.h>
+#include <linux/ip.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <net/switchdev.h>
+
+#include "rswitch.h"
+#include "rswitch_l3.h"
+
+static bool rdev_for_l3_offload(struct rswitch_device *rdev)
+{
+	return (test_bit(rdev->port, rdev->priv->opened_ports) &&
+		!netdev_has_any_upper_dev(rdev->ndev));
+}
+
+void rswitch_update_l3_offload(struct rswitch_private *priv)
+{
+	u32 all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
+	struct rswitch_device *rdev;
+	bool l3_offload_enable_cond;
+	u32 l3_rdev_count;
+	u32 l3_ports_mask;
+
+	l3_ports_mask = all_ports_mask;
+
+	l3_rdev_count = 0;
+	rswitch_for_all_ports(priv, rdev) {
+		if (rdev_for_l3_offload(rdev)) {
+			l3_rdev_count++;
+			l3_ports_mask &= ~BIT(rdev->port);
+		}
+	}
+
+	l3_offload_enable_cond = (l3_rdev_count >= 2);
+
+#define FWPC0_L3_MASK (FWPC0_LTHTA | FWPC0_IP4UE | FWPC0_IP4TE | FWPC0_IP4OE)
+	rswitch_for_all_ports(priv, rdev) {
+		if (rdev_for_l3_offload(rdev) && l3_offload_enable_cond) {
+			/* Update allowed offload destinations even for ports
+			 * with l3 offload enabled earlier.
+			 *
+			 * Allow offload routing to self for hw port.
+			 */
+			rswitch_modify(priv->addr, FWPC1(rdev->port),
+				       FWPC1_LTHFW_MASK,
+				       FIELD_PREP(FWPC1_LTHFW_MASK, l3_ports_mask));
+			if (!rdev->l3_offload_enabled) {
+				rswitch_modify(priv->addr, FWPC0(rdev->port),
+					       0,
+					       FWPC0_L3_MASK);
+				rdev->l3_offload_enabled = 1;
+				netdev_info(rdev->ndev, "starting l3 offload\n");
+			}
+		} else if (rdev->l3_offload_enabled) {
+			rswitch_modify(priv->addr, FWPC0(rdev->port),
+				       FWPC0_L3_MASK,
+				       0);
+			rswitch_modify(priv->addr, FWPC1(rdev->port),
+				       FWPC1_LTHFW_MASK,
+				       FIELD_PREP(FWPC1_LTHFW_MASK, all_ports_mask));
+
+			rdev->l3_offload_enabled = 0;
+
+			/* cleanup any offloads at disable */
+			rmon_cleanup_ipv4_offloads_all(&rdev->rmon);
+
+			netdev_info(rdev->ndev, "stopping l3 offload\n");
+		}
+	}
+#undef FWPC0_L3_MASK
+}
+
+static bool rswitch_l23update_matches_spec(struct rswitch_l23update *update,
+					   struct rswitch_l23update_spec *spec)
+{
+	return ether_addr_equal(update->spec.dst_mac, spec->dst_mac);
+}
+
+static bool rswitch_l23update_hw_op(struct rswitch_private *priv,
+				    struct rswitch_l23update *update,
+				    bool install)
+{
+	u8 *dst_mac = update->spec.dst_mac;
+	u32 val;
+	int ret;
+
+	val = FIELD_PREP(FWL23URL0_RN, update->index) |
+	      FIELD_PREP(FWL23URL0_PV,
+			 install ? GENMASK(RSWITCH_NUM_AGENTS - 1, 0) : 0);
+	iowrite32(val, priv->addr + FWL23URL0);
+
+	val = FWL23URL1_TTLU |
+	      FWL23URL1_MSAU |
+	      FWL23URL1_MDAU |
+	      (dst_mac[0] << 8) | (dst_mac[1] << 0);
+	iowrite32(val, priv->addr + FWL23URL1);
+
+	val = (dst_mac[2] << 24) | (dst_mac[3] << 16) |
+	      (dst_mac[4] << 8)  | (dst_mac[5] << 0);
+	iowrite32(val, priv->addr + FWL23URL2);
+
+	iowrite32(0, priv->addr + FWL23URL3);
+
+	/* Rule write starts after writing to FWL23URL3 */
+
+	ret = rswitch_reg_wait(priv->addr, FWL23URLR, FWL23URLR_L, 0);
+	if (ret) {
+		dev_err(&priv->pdev->dev, "timeout writing l23_update\n");
+		return false;
+	}
+
+	val = ioread32(priv->addr + FWL23URLR) & (FWL23URLR_LSF | FWL23URLR_LF);
+	if (val) {
+		dev_err(&priv->pdev->dev,
+			"writing l23_update failed (err %d)\n", val);
+		return false;
+	}
+
+	return true;
+}
+
+static struct rswitch_private *
+rmon_to_rswitch_private(struct rswitch_route_monitor *rmon)
+{
+	struct rswitch_device *rdev;
+
+	if (is_rdev(rmon->ndev)) {
+		rdev = netdev_priv(rmon->ndev);
+		return rdev->priv;
+	}
+
+	WARN_ONCE(1, "net device not initialized, further operation unreliable");
+
+	return NULL;
+}
+
+static bool rmon_ipv4_dst_offload_hw_op(struct rswitch_route_monitor *rmon,
+					struct rmon_ipv4_dst_offload *offload,
+					u8 frame_type, bool install)
+{
+	struct rswitch_private *priv = rmon_to_rswitch_private(rmon);
+	const char *frame_type_name[] = {
+		[RSWITCH_FRAME_TYPE_IPV4_TCP] = "TCP",
+		[RSWITCH_FRAME_TYPE_IPV4_UDP] = "UDP",
+		[RSWITCH_FRAME_TYPE_IPV4_OTHER] = "OTHER",
+	};
+	char target[16] = "<undefined>";
+	u32 val, err_flags, collisions;
+	struct rswitch_device *rdev;
+	int ret;
+
+	if (!priv)
+		return false;
+
+	spin_lock(&priv->l3_lock);
+
+	val = (install ? 0 : FWLTHTL0_ED) | frame_type;
+	iowrite32(val, priv->addr + FWLTHTL0);
+	iowrite32(0, priv->addr + FWLTHTL1);
+	iowrite32(0, priv->addr + FWLTHTL2);
+	iowrite32(0, priv->addr + FWLTHTL3);
+	val = be32_to_cpu(offload->addr);
+	iowrite32(val, priv->addr + FWLTHTL4);
+
+	/* accept from all ports in the table entry
+	 * (non-particilating ports have l3 table disabled)
+	 */
+	val = FIELD_PREP(FWLTHTL7_SLV,
+			 GENMASK(RSWITCH_NUM_AGENTS - 1, 0)) |
+			 FWLTHTL7_RV |
+			 FIELD_PREP(FWLTHTL7_RN, offload->update->index);
+	iowrite32(val, priv->addr + FWLTHTL7);
+
+	if (is_rdev(rmon->ndev)) {
+		rdev = netdev_priv(rmon->ndev);
+		snprintf(target, sizeof(target), "port %d", rdev->port);
+
+		iowrite32(0, priv->addr + FWLTHTL8(0));
+		iowrite32(0, priv->addr + FWLTHTL8(1));
+
+		val = FIELD_PREP(FWLTHTL9_DV,
+				 BIT(rdev->port));
+		iowrite32(val, priv->addr + FWLTHTL9);
+	}
+
+	/* Table entry write starts after writing to FWLTHTL9 */
+
+	ret = rswitch_reg_wait(priv->addr, FWLTHTLR, FWLTHTLR_L, 0);
+	val = ioread32(priv->addr + FWLTHTLR);
+	err_flags = val & (FWLTHTLR_LEF | FWLTHTLR_LSF | FWLTHTLR_LF);
+	collisions = FIELD_GET(FWLTHTLR_LCN, val);
+
+	spin_unlock(&priv->l3_lock);
+
+	if (ret) {
+		dev_err(&priv->pdev->dev,
+			"timeout writing l3 table entry\n");
+		return false;
+	}
+
+	if (err_flags) {
+		dev_err(&priv->pdev->dev,
+			"writing l3 table entry failed (flags %d)\n",
+			err_flags);
+		return false;
+	}
+
+	if (install)
+		offload->types_offloaded |= BIT(frame_type);
+	else
+		offload->types_offloaded &= ~BIT(frame_type);
+
+	dev_info(&priv->pdev->dev,
+		 "%s IPv4/%s forwarding %pI4b -> %s, mac %pM; table collisions: %u\n",
+		 install ? "added" : "removed",
+		 frame_type_name[frame_type],
+		 &offload->addr,
+		 target,
+		 offload->update->spec.dst_mac,
+		 collisions);
+
+	return true;
+}
+
+static struct rswitch_l23update *rswitch_get_l23update(struct rswitch_private *priv,
+						       struct rswitch_l23update_spec *spec)
+{
+	struct rswitch_l23update *update;
+
+	spin_lock(&priv->l3_lock);
+
+	list_for_each_entry(update, &priv->l23_update_list, list) {
+		if (rswitch_l23update_matches_spec(update, spec)) {
+			update->use_count++;
+			goto out;
+		}
+	}
+
+	update = kzalloc(sizeof(*update), GFP_ATOMIC);
+	if (!update)
+		goto out;
+
+	update->use_count = 1;
+	update->spec = *spec;
+	update->index = find_first_zero_bit(priv->l23_update_bitmap,
+					    RSWITCH_MAX_NUM_RRULE);
+	if (update->index == RSWITCH_MAX_NUM_RRULE) {
+		dev_err_ratelimited(&priv->pdev->dev,
+				    "out of l23_update entries\n");
+		/* FIXME: trigger expire? */
+		goto no_free_bit;
+	}
+	set_bit(update->index, priv->l23_update_bitmap);
+
+	if (!rswitch_l23update_hw_op(priv, update, true))
+		goto hw_op_failed;
+
+	list_add(&update->list, &priv->l23_update_list);
+out:
+	spin_unlock(&priv->l3_lock);
+
+	return update;
+
+hw_op_failed:
+	clear_bit(update->index, priv->l23_update_bitmap);
+no_free_bit:
+	kfree(update);
+	update = NULL;
+	goto out;
+}
+
+static void rswitch_put_l23update(struct rswitch_private *priv,
+				  struct rswitch_l23update *update)
+{
+	spin_lock(&priv->l3_lock);
+
+	update->use_count--;
+	if (update->use_count == 0) {
+		list_del(&update->list);
+		rswitch_l23update_hw_op(priv, update, false);
+		clear_bit(update->index, priv->l23_update_bitmap);
+		kfree(update);
+	}
+
+	spin_unlock(&priv->l3_lock);
+}
+
+static inline bool addr4_in_range(__be32 addr, __be32 range_addr,
+				  __be32 range_mask)
+{
+	return (addr & range_mask) == (range_addr & range_mask);
+}
+
+static inline bool addr4_ranges_intersect(__be32 addr1, __be32 mask1,
+					  __be32 addr2, __be32 mask2)
+{
+	/* Two addr/mask ranges intersect when their addrs ANDed
+	 * with wider mask (=one with more zeroes) are the same
+	 */
+	__be32 wider_mask = mask1 & mask2;
+
+	return (addr1 & wider_mask) == (addr2 & wider_mask);
+}
+
+/* called under rmon lock (for rmon owning the list) */
+static inline bool addr4_in_exception_list(__be32 addr, struct list_head *list)
+{
+	struct rmon_ipv4_route_exception *entry;
+
+	list_for_each_entry(entry, list, list) {
+		if (entry->addr == addr)
+			return true;
+	}
+
+	return false;
+}
+
+/* called under rmon lock */
+static struct rmon_ipv4_route *
+rmon_lookup_ipv4_ucast_route(struct rswitch_route_monitor *rmon, __be32 addr)
+{
+	struct rmon_ipv4_route *route;
+
+	list_for_each_entry(route, &rmon->ipv4_ucast_route_list, list) {
+		if (addr4_in_range(addr, route->addr, route->mask))
+			return route;
+	}
+
+	return NULL;
+}
+
+/* called under rmon lock (for rmon owning the route) */
+static struct rmon_ipv4_dst_offload *
+rmon_lookup_ipv4_dst_offload(struct rmon_ipv4_route *route, __be32 addr)
+{
+	struct rmon_ipv4_dst_offload *offload;
+
+	list_for_each_entry(offload, &route->offload_list, list) {
+		if (offload->addr == addr)
+			return offload;
+	}
+
+	return NULL;
+}
+
+/* called under rmon lock (for rmon owning the route) */
+static struct rmon_ipv4_dst_offload *
+rmon_add_ipv4_dst_offload(struct rswitch_route_monitor *rmon,
+			  struct rmon_ipv4_route *route,
+			  __be32 addr,
+			  struct rswitch_l23update_spec *spec)
+{
+	struct rswitch_private *priv = rmon_to_rswitch_private(rmon);
+	struct rmon_ipv4_dst_offload *offload;
+
+	if (!priv)
+		return NULL;
+
+	offload = kzalloc(sizeof(*offload), GFP_ATOMIC);
+	if (!offload)
+		return NULL;
+
+	offload->update = rswitch_get_l23update(priv, spec);
+	if (!offload->update) {
+		kfree(offload);
+		return NULL;
+	}
+
+	offload->addr = addr;
+	list_add_tail(&offload->list, &route->offload_list);
+	return offload;
+}
+
+/* called under rmon lock */
+static void rmon_remove_ipv4_dst_offload(struct rswitch_route_monitor *rmon,
+					 struct rmon_ipv4_route *route,
+					 struct rmon_ipv4_dst_offload *offload)
+{
+	struct rswitch_private *priv = rmon_to_rswitch_private(rmon);
+	unsigned long types_offloaded = offload->types_offloaded;
+	u8 frame_type;
+
+	if (!priv)
+		return;
+
+	for_each_set_bit(frame_type, &types_offloaded, BITS_PER_LONG) {
+		rmon_ipv4_dst_offload_hw_op(rmon, offload, frame_type, false);
+	}
+	if (offload->types_offloaded) {
+		/* FIXME: possible? what to do? rebuild l3 table? */
+		netdev_err(rmon->ndev, "further operation unreliable\n");
+	}
+
+	list_del(&offload->list);
+	rswitch_put_l23update(priv, offload->update);
+	kfree(offload);
+}
+
+/* called under rmon lock */
+void rmon_handle_l3_learning(struct rswitch_route_monitor *rmon,
+			     struct sk_buff *skb)
+{
+	struct ethhdr *ethhdr = (struct ethhdr *)skb->data;
+	struct rmon_ipv4_dst_offload *offload;
+	struct rmon_ipv4_route *route;
+	__be32 src_addr, dst_addr;
+	struct iphdr *iphdr;
+	u8 frame_type;
+
+	if (ethhdr->h_proto != cpu_to_be16(ETH_P_IP))
+		return;
+	iphdr = (struct iphdr *)(ethhdr + 1);
+	src_addr = iphdr->saddr;
+	dst_addr = iphdr->daddr;
+
+	/* Packets from local address are not subject for learning */
+	if (addr4_in_exception_list(src_addr, &rmon->ipv4_local_route_list))
+		return;
+
+	/* Packet to local address? Why? */
+	if (addr4_in_exception_list(dst_addr, &rmon->ipv4_local_route_list))
+		return;
+
+	/* Packets to broadcast destination are not subject for learning */
+	if (addr4_in_exception_list(dst_addr, &rmon->ipv4_bcast_route_list))
+		return;
+
+	/* Lookup route to learn for */
+	route = rmon_lookup_ipv4_ucast_route(rmon, dst_addr);
+	if (!route)
+		return;
+
+	/* Packet is candidate for offload (and not offloaded yet) */
+
+	offload = rmon_lookup_ipv4_dst_offload(route, dst_addr);
+
+	if (offload) {
+		/* TODO: verify that ethhdr->h_dest matches offload's */
+	} else {
+		/* TODO: verify that ethhdr->h_dest matches neighbor table
+		 *       for route->gw_addr (if defined) or dst_addr
+		 */
+		struct rswitch_l23update_spec spec;
+
+		ether_addr_copy(spec.dst_mac, ethhdr->h_dest);
+		offload = rmon_add_ipv4_dst_offload(rmon, route,
+						    dst_addr, &spec);
+		if (!offload)
+			return;
+	}
+
+	if (iphdr->protocol == IPPROTO_TCP)
+		frame_type = RSWITCH_FRAME_TYPE_IPV4_TCP;
+	else if (iphdr->protocol == IPPROTO_UDP)
+		frame_type = RSWITCH_FRAME_TYPE_IPV4_UDP;
+	else
+		frame_type = RSWITCH_FRAME_TYPE_IPV4_OTHER;
+
+	if (offload->types_offloaded & BIT(frame_type))
+		return;
+
+	if (!rmon_ipv4_dst_offload_hw_op(rmon, offload, frame_type, true)) {
+		/* FIXME: what to do if failed? rebuild l3 table? */
+		netdev_err(rmon->ndev, "further operation unreliable\n");
+	}
+}
+
+/* called under rmon lock */
+static void rmon_cleanup_ipv4_route_offloads(struct rswitch_route_monitor *rmon,
+					     struct rmon_ipv4_route *route,
+					     __be32 addr, __be32 mask)
+{
+	struct rmon_ipv4_dst_offload *offload, *tmp;
+
+	list_for_each_entry_safe(offload, tmp, &route->offload_list, list) {
+		if (addr4_in_range(offload->addr, addr, mask))
+			rmon_remove_ipv4_dst_offload(rmon, route, offload);
+	}
+}
+
+/* called under rmon lock */
+static void rmon_cleanup_ipv4_offloads_from(struct rswitch_route_monitor *rmon,
+					    struct list_head *pos,
+					    __be32 addr, __be32 mask)
+{
+	struct rmon_ipv4_route *route;
+
+	while (pos != &rmon->ipv4_ucast_route_list) {
+		route = list_entry(pos, typeof(*route), list);
+		if (addr4_ranges_intersect(addr, mask,
+					   route->addr, route->mask))
+			rmon_cleanup_ipv4_route_offloads(rmon, route,
+							 addr, mask);
+		pos = pos->next;
+	}
+}
+
+/* called under rmon lock */
+static void rmon_cleanup_ipv4_offloads_addr(struct rswitch_route_monitor *rmon,
+					    __be32 addr)
+{
+	rmon_cleanup_ipv4_offloads_from(rmon,
+					rmon->ipv4_ucast_route_list.next,
+					addr, 0xffffffff);
+}
+
+void rmon_cleanup_ipv4_offloads_all(struct rswitch_route_monitor *rmon)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&rmon->lock, flags);
+	rmon_cleanup_ipv4_offloads_from(rmon,
+					rmon->ipv4_ucast_route_list.next,
+					0, 0);
+	spin_unlock_irqrestore(&rmon->lock, flags);
+}
+
+/* called under rmon lock */
+static void rmon_update_ipv4_route(struct rswitch_route_monitor *rmon,
+				   __be32 addr, __be32 mask,
+				   __be32 gw_addr, bool keep)
+{
+	struct rmon_ipv4_route *route;
+	struct list_head *pos;
+	bool found = false;
+
+	/* Find the route in the list, and/or location for the route */
+	list_for_each(pos, &rmon->ipv4_ucast_route_list) {
+		route = list_entry(pos, typeof(*route), list);
+		if (route->addr == addr && route->mask == mask) {
+			found = true;
+			break;
+		}
+
+		/* stop if got more generic masks */
+		if (route->mask != mask && (route->mask & mask) == route->mask)
+			break;
+	}
+
+	if (!found && !keep)
+		return;
+
+	rmon_cleanup_ipv4_offloads_from(rmon, pos, addr, mask);
+
+	if (found && !keep) {
+		if (!list_empty(&route->offload_list)) {
+			WARN_ONCE(1, "route found in offload list can't remove!");
+			return;
+		}
+		list_del(&route->list);
+		kfree(route);
+		return;
+	}
+
+	if (!found) {
+		route = kzalloc(sizeof(*route), GFP_ATOMIC);
+		if (!route) {
+			/* FIXME: what to do? disable l3 offload? */
+			netdev_err(rmon->ndev,
+				   "allocation failure, further operation unreliable\n");
+			return;
+		}
+		INIT_LIST_HEAD(&route->offload_list);
+		list_add(&route->list, pos);
+	}
+
+	route->addr = addr;
+	route->mask = mask;
+	route->gw_addr = gw_addr;
+}
+
+/* called under rmon lock */
+static void rmon_update_ipv4_route_exception(struct rswitch_route_monitor *rmon,
+					     struct list_head *list, __be32 addr,
+					     bool keep)
+{
+	struct rmon_ipv4_route_exception *entry;
+
+	list_for_each_entry(entry, list, list) {
+		if (entry->addr == addr) {
+			if (!keep) {
+				list_del(&entry->list);
+				kfree(entry);
+			}
+			/* there is/was entry => addr is not in any offloads */
+			return;
+		}
+	}
+
+	if (keep) {
+		entry = kzalloc(sizeof(*entry), GFP_ATOMIC);
+		if (!entry) {
+			/* FIXME: what to do? disable l3 offload? */
+			netdev_err(rmon->ndev,
+				   "allocation failure, further operation unreliable\n");
+			return;
+		}
+
+		entry->addr = addr;
+		list_add_tail(&entry->list, list);
+
+		/* addr could be in existing offload */
+		rmon_cleanup_ipv4_offloads_addr(rmon, addr);
+	}
+}
+
+static void rmon_ipv4_fib_update(struct rswitch_route_monitor *rmon,
+				 struct fib_notifier_info *info, bool keep)
+{
+	struct fib_entry_notifier_info *feni =
+			container_of(info, typeof(*feni), info);
+	struct fib_info *fib = feni->fi;
+	struct fib_nh *fib_nh;
+	unsigned long flags;
+
+	/* FIXME: the below is far incomplete against what is possible */
+
+	if (fib->fib_nhs != 1 || fib->nh)
+		return;		/* FIXME: what to do? */
+	fib_nh = &fib->fib_nh[0];
+	if (rmon->ndev != fib_nh->fib_nh_dev)
+		return;		/* destination not on rmon's ndev */
+
+	spin_lock_irqsave(&rmon->lock, flags);
+
+	if (fib->fib_type == RTN_UNICAST) {
+		__be32 addr = cpu_to_be32(feni->dst);
+		__be32 mask = cpu_to_be32(0xffffffff << (32 - feni->dst_len));
+		__be32 gw_addr = fib_nh->fib_nh_gw4;
+
+		netdev_info(rmon->ndev,
+			    "%s ucast route info: addr %pI4b mask %pI4b gw %pI4b\n",
+			    keep ? "set" : "unset", &addr, &mask, &gw_addr);
+		rmon_update_ipv4_route(rmon, addr, mask, gw_addr, keep);
+	} else if (fib->fib_type == RTN_LOCAL) {
+		__be32 addr = cpu_to_be32(feni->dst);
+
+		netdev_info(rmon->ndev, "%s local route info: addr %pI4b\n",
+			    keep ? "set" : "unset", &addr);
+		rmon_update_ipv4_route_exception(rmon,
+						 &rmon->ipv4_local_route_list,
+						 addr, keep);
+	} else if (fib->fib_type == RTN_BROADCAST) {
+		__be32 addr = cpu_to_be32(feni->dst);
+
+		netdev_info(rmon->ndev, "%s bcast route info: addr %pI4b\n",
+			    keep ? "set" : "unset", &addr);
+		rmon_update_ipv4_route_exception(rmon,
+						 &rmon->ipv4_bcast_route_list,
+						 addr, keep);
+	}
+
+	spin_unlock_irqrestore(&rmon->lock, flags);
+}
+
+static int rmon_fib_event(struct notifier_block *nb,
+			  unsigned long event, void *ptr)
+{
+	struct rswitch_route_monitor *rmon =
+				container_of(nb, typeof(*rmon), fib_nb);
+	struct fib_notifier_info *info = ptr;
+
+	/* Handle only IPv4 for now */
+	if (info->family == AF_INET) {
+		if (event == FIB_EVENT_ENTRY_REPLACE)
+			rmon_ipv4_fib_update(rmon, info, true);
+		else if (event == FIB_EVENT_ENTRY_DEL)
+			rmon_ipv4_fib_update(rmon, info, false);
+	}
+
+	return NOTIFY_DONE;
+}
+
+int rmon_init(struct rswitch_route_monitor *rmon,
+	      struct net_device *ndev)
+{
+	int ret;
+
+	if (WARN_ON(!is_rdev(ndev)))
+		return -EOPNOTSUPP;
+
+	rmon->ndev = ndev;
+	INIT_LIST_HEAD(&rmon->ipv4_local_route_list);
+	INIT_LIST_HEAD(&rmon->ipv4_bcast_route_list);
+	INIT_LIST_HEAD(&rmon->ipv4_ucast_route_list);
+
+	spin_lock_init(&rmon->lock);
+
+	rmon->fib_nb.notifier_call = rmon_fib_event;
+	ret = register_fib_notifier(&init_net, &rmon->fib_nb, NULL, NULL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+void rmon_cleanup(struct rswitch_route_monitor *rmon)
+{
+	/* Per experiment, on module unload path the route lists are not
+	 * cleaned up via fib events. Thus have to clean explicitly.
+	 *
+	 * This runs when fib_notifier is already unregistered, which includes
+	 * synchronization. No parallel route lists manipulation should be
+	 * possible. Thus no locking needed.
+	 */
+
+	struct rmon_ipv4_route_exception *exception, *tmp_expection;
+	struct rmon_ipv4_route *route, *tmp_route;
+	unsigned long flags;
+
+	unregister_fib_notifier(&init_net, &rmon->fib_nb);
+
+	/* Notifier unregister does not send any cleanup events, so clean up
+	 * gathered information manually.
+	 *
+	 * For paranoid safety, still take the lock
+	 */
+
+	spin_lock_irqsave(&rmon->lock, flags);
+
+	list_for_each_entry_safe(exception, tmp_expection,
+				 &rmon->ipv4_local_route_list, list) {
+		list_del(&exception->list);
+		kfree(exception);
+	}
+
+	list_for_each_entry_safe(exception, tmp_expection,
+				 &rmon->ipv4_bcast_route_list, list) {
+		list_del(&exception->list);
+		kfree(exception);
+	}
+
+	list_for_each_entry_safe(route, tmp_route,
+				 &rmon->ipv4_ucast_route_list, list) {
+		/* offloads must have been cleared at netdev close time */
+		WARN_ON(!list_empty(&route->offload_list));
+
+		list_del(&route->list);
+		kfree(exception);
+	}
+
+	spin_unlock_irqrestore(&rmon->lock, flags);
+}
diff --git a/drivers/net/ethernet/renesas/rswitch_l3.h b/drivers/net/ethernet/renesas/rswitch_l3.h
new file mode 100644
index 000000000000..10866883220b
--- /dev/null
+++ b/drivers/net/ethernet/renesas/rswitch_l3.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Renesas Ethernet Switch device driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#ifndef __RSWITCH_L3_H__
+#define __RSWITCH_L3_H__
+
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/spinlock.h>
+
+void rswitch_update_l3_offload(struct rswitch_private *priv);
+
+void rmon_handle_l3_learning(struct rswitch_route_monitor *rmon,
+			     struct sk_buff *skb);
+void rmon_cleanup_ipv4_offloads_all(struct rswitch_route_monitor *rmon);
+
+int rmon_init(struct rswitch_route_monitor *rmon, struct net_device *ndev);
+
+void rmon_cleanup(struct rswitch_route_monitor *rmon);
+
+#endif	/* #ifndef __RSWITCH3_L3_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index e92b5cdffd10..8d56ef037a8d 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -29,8 +29,9 @@
 
 #include "rswitch.h"
 #include "rswitch_l2.h"
+#include "rswitch_l3.h"
 
-static int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected)
+int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected)
 {
 	u32 val;
 
@@ -118,6 +119,7 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 	u32 all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
 	unsigned int i;
 	u32 reg_val;
+	int ret;
 
 	/* Start with empty configuration */
 	for (i = 0; i < RSWITCH_NUM_AGENTS; i++) {
@@ -162,7 +164,49 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 	/* Initialize MAC hash table */
 	iowrite32(FWMACTIM_MACTIOG, priv->addr + FWMACTIM);
 
-	return rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);
+	ret = rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);
+	if (ret)
+		return ret;
+
+	/* Initialize hardware L3 forwarding */
+
+	/* Allow entire stream table to be used for "non-secure" entries */
+	rswitch_modify(priv->addr, FWLTHHEC, FWLTHHEC_HMUE,
+		       FIELD_PREP(FWLTHHEC_HMUE, 1 << RSWITCH_LTH_STREAM_W));
+
+	/* Include only dst_ip (and frame type) in ipv4 stream id */
+	iowrite32(FWIP4SC_IIDS, priv->addr + FWIP4SC);
+
+	/* Initialize stream hash table */
+	iowrite32(FWLTHTIM_TIOG, priv->addr + FWLTHTIM);
+	ret = rswitch_reg_wait(priv->addr, FWLTHTIM, FWLTHTIM_TR, FWLTHTIM_TR);
+	if (ret)
+		return ret;
+
+	/* Allow access to frame update rules from "non-secure" APB */
+	iowrite32(0xffffffff, priv->addr + FWSCR34);
+#if RSWITCH_LTH_RRULE_W >= 6
+	iowrite32(0xffffffff, priv->addr + FWSCR33);
+#endif
+#if RSWITCH_LTH_RRULE_W >= 7
+	iowrite32(0xffffffff, priv->addr + FWSCR32);
+	iowrite32(0xffffffff, priv->addr + FWSCR31);
+#endif
+#if RSWITCH_LTH_RRULE_W >= 8
+	iowrite32(0xffffffff, priv->addr + FWSCR30);
+	iowrite32(0xffffffff, priv->addr + FWSCR29);
+	iowrite32(0xffffffff, priv->addr + FWSCR28);
+	iowrite32(0xffffffff, priv->addr + FWSCR27);
+#endif
+
+	/* Initialize frame update rules table */
+	iowrite32(FWL23UTIM_TIOG, priv->addr + FWL23UTIM);
+	ret = rswitch_reg_wait(priv->addr, FWL23UTIM, FWL23UTIM_TR, FWL23UTIM_TR);
+	if (ret)
+		return ret;
+
+	return 0;
+
 }
 
 /* Gateway CPU agent block (GWCA) */
@@ -1644,6 +1688,9 @@ static int rswitch_open(struct net_device *ndev)
 	if (rdev->brdev)
 		rswitch_update_l2_offload(rdev->priv);
 
+	if (!netdev_has_any_upper_dev(ndev))
+		rswitch_update_l3_offload(rdev->priv);
+
 	return 0;
 }
 
@@ -1669,6 +1716,9 @@ static int rswitch_stop(struct net_device *ndev)
 	if (rdev->brdev)
 		rswitch_update_l2_offload(rdev->priv);
 
+	if (!netdev_has_any_upper_dev(ndev))
+		rswitch_update_l3_offload(rdev->priv);
+
 	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
 
@@ -1757,9 +1807,15 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	netdev_tx_t ret = NETDEV_TX_OK;
 	struct rswitch_ext_desc *desc;
 	unsigned int i, nr_desc;
+	unsigned long flags;
 	u8 die_dt;
 	u16 len;
 
+	spin_lock_irqsave(&rdev->rmon.lock, flags);
+	if (rdev->l3_offload_enabled)
+		rmon_handle_l3_learning(&rdev->rmon, skb);
+	spin_unlock_irqrestore(&rdev->rmon.lock, flags);
+
 	nr_desc = (skb->len - 1) / RSWITCH_DESC_BUF_SIZE + 1;
 	if (rswitch_get_num_cur_queues(gq) >= gq->ring_size - nr_desc) {
 		netif_stop_subqueue(ndev, 0);
@@ -2024,6 +2080,10 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	if (err < 0)
 		goto out_get_params;
 
+	err = rmon_init(&rdev->rmon, ndev);
+	if (err < 0)
+		goto out_rmon_init;
+
 	err = rswitch_rxdmac_alloc(ndev);
 	if (err < 0)
 		goto out_rxdmac;
@@ -2039,6 +2099,7 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 out_txdmac:
 	rswitch_rxdmac_free(ndev);
 
+out_rmon_init:
 out_rxdmac:
 out_get_params:
 	of_node_put(rdev->np_port);
@@ -2054,6 +2115,7 @@ static void rswitch_device_free(struct rswitch_private *priv, unsigned int index
 	struct net_device *ndev = rdev->ndev;
 
 	list_del(&rdev->list);
+	rmon_cleanup(&rdev->rmon);
 	rswitch_txdmac_free(ndev);
 	rswitch_rxdmac_free(ndev);
 	of_node_put(rdev->np_port);
@@ -2187,6 +2249,9 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	spin_lock_init(&priv->lock);
+	spin_lock_init(&priv->l3_lock);
+
+	INIT_LIST_HEAD(&priv->l23_update_list);
 
 	priv->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->clk))

-- 
2.43.0


