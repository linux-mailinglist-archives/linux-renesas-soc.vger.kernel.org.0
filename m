Return-Path: <linux-renesas-soc+bounces-30418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCLjMb1AxmlRIAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:33:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCDD341090
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6925B30A9B1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86ED63DDDDF;
	Fri, 27 Mar 2026 08:28:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3A33DC4CA;
	Fri, 27 Mar 2026 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600115; cv=none; b=S3hRc/brZXh8sRwyUGwrBELrZcGyH5TwaLKVxOW3OUIk5Ja0ugfc2LPUOClqqtbsb8WAjv5oaq975Hyz+60Qb16STPJXnuF9beFaN6WcwcjYnjk88twRaTP5eyBD5FhELfYSlwCDCpmrMUt8MPXwrLLcTdvYtM//N4lUlT1JbSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600115; c=relaxed/simple;
	bh=z4pxeiYEVN/vlA6O2fjcSkb0WUjIMAbPsZLHy9ATS4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M/O+UAgLRmhuvT8zn6w/NrPf6GpxZfIFXUPnA302S/1TKyihmee5fJUKJ8MS5onO5CNspNSVBNxWqJ3yJjRdTqDuWNOURZrr6hKJaonJHvYjVVSExRyVYjSR3wRjpAywoeumzUsmz7ogtXRAUOMXveVzuSaH7fkrNEiT/ywWlpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: m7/Siwh0QPWwIsVoM1YTxg==
X-CSE-MsgGUID: UHKICGU3RSSPmSCYXhpxhQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Mar 2026 17:28:25 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 39B174012274;
	Fri, 27 Mar 2026 17:28:22 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 27 Mar 2026 09:27:43 +0100
Subject: [PATCH net-next v2 13/13] net: renesas: rswitch: add vlan aware
 switching
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rswitch_add_vlans-v2-13-d7f4358ca57a@renesas.com>
References: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
In-Reply-To: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774600062; l=15012;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=z4pxeiYEVN/vlA6O2fjcSkb0WUjIMAbPsZLHy9ATS4I=;
 b=5vgZ8P9JCSJhwnPg9x/omhXBpxll1tp3Aaq2lcNWfBPZKV9aSv3CNdLKEXs7qItCHFrXfy7yM
 aN9FuUUDIP2At9JnAP923u05gyI2JjMDQHY6RMBwVUSY+WF+u82s333
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30418-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DCDD341090
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add vlan support to L2 HW bridge.

On R-Car S4 there is limited vlan support, which is not fully
802.1Q compliant. The aim of this driver addition is to get as
close as possible to the correct behavior. Limitations are:
- all ports should be in the same default vlan
- default vlans are not stripped on egress.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 406 ++++++++++++++++++++++++++----
 1 file changed, 357 insertions(+), 49 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index ea95a87ed234..ebd9d8d71a53 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -7,6 +7,7 @@
 #include <linux/err.h>
 #include <linux/etherdevice.h>
 #include <linux/if_bridge.h>
+#include <linux/if_vlan.h>
 #include <linux/kernel.h>
 #include <net/switchdev.h>
 
@@ -173,22 +174,6 @@ static void rswitch_port_update_brdev(struct net_device *ndev,
 	rswitch_update_offload_brdev(rdev->priv);
 }
 
-static int rswitch_port_update_stp_state(struct net_device *ndev, u8 stp_state)
-{
-	struct rswitch_device *rdev;
-
-	if (!is_rdev(ndev))
-		return -ENODEV;
-
-	rdev = netdev_priv(ndev);
-	rdev->learning_requested = (stp_state == BR_STATE_LEARNING ||
-				    stp_state == BR_STATE_FORWARDING);
-	rdev->forwarding_requested = (stp_state == BR_STATE_FORWARDING);
-	rswitch_update_l2_offload(rdev->priv);
-
-	return 0;
-}
-
 static int rswitch_netdevice_event(struct notifier_block *nb,
 				   unsigned long event,
 				   void *ptr)
@@ -212,61 +197,395 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static int rswitch_update_ageing_time(struct net_device *ndev, clock_t time)
+static int rswitch_port_update_stp_state(struct net_device *ndev, u8 stp_state)
 {
-	struct rswitch_device *rdev = netdev_priv(ndev);
-	u32 reg_val;
+	struct rswitch_device *rdev;
 
 	if (!is_rdev(ndev))
 		return -ENODEV;
 
+	rdev = netdev_priv(ndev);
+	rdev->learning_requested = (stp_state == BR_STATE_LEARNING ||
+				    stp_state == BR_STATE_FORWARDING);
+	rdev->forwarding_requested = (stp_state == BR_STATE_FORWARDING);
+	rswitch_update_l2_offload(rdev->priv);
+
+	return 0;
+}
+
+static int rswitch_update_ageing_time(struct rswitch_private *priv, clock_t time)
+{
+	u32 reg_val;
+
 	if (!FIELD_FIT(FWMACAGC_MACAGT, time))
 		return -EINVAL;
 
 	reg_val = FIELD_PREP(FWMACAGC_MACAGT, time);
 	reg_val |= FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
-	iowrite32(reg_val, rdev->priv->addr + FWMACAGC);
+	iowrite32(reg_val, priv->addr + FWMACAGC);
 
 	return 0;
 }
 
-static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
-				 const struct switchdev_attr *attr,
-				 struct netlink_ext_ack *extack)
+static void rswitch_update_vlan_filtering(struct rswitch_private *priv,
+					  bool vlan_filtering)
 {
+	if (vlan_filtering)
+		rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
+			       0, FWPC0_VLANSA | FWPC0_VLANRU);
+	else
+		rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
+			       FWPC0_VLANSA | FWPC0_VLANRU, 0);
+}
+
+static int rswitch_handle_port_attr_set(struct net_device *ndev,
+					struct notifier_block *nb,
+					struct switchdev_notifier_port_attr_info *info)
+{
+	const struct switchdev_attr *attr = info->attr;
+	struct rswitch_private *priv;
+	int err = 0;
+
+	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_blocking_nb);
+
 	switch (attr->id) {
 	case SWITCHDEV_ATTR_ID_PORT_STP_STATE:
-		return rswitch_port_update_stp_state(ndev, attr->u.stp_state);
+		err = rswitch_port_update_stp_state(ndev, attr->u.stp_state);
+
+		break;
 	case SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME:
-		return rswitch_update_ageing_time(ndev, attr->u.ageing_time);
+		err = rswitch_update_ageing_time(priv, attr->u.ageing_time);
+
+		break;
+	case SWITCHDEV_ATTR_ID_BRIDGE_VLAN_FILTERING:
+		rswitch_update_vlan_filtering(priv, attr->u.vlan_filtering);
+
+		break;
+	case SWITCHDEV_ATTR_ID_BRIDGE_MC_DISABLED:
+
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	if (err < 0)
+		return err;
+
+	info->handled = true;
+
+	return NOTIFY_DONE;
+}
+
+static int rswitch_read_vlan_table(struct rswitch_private *priv, u16 vid,
+				   u32 *vlanslvs, u32 *vlandvs)
+{
+	int err;
+
+	iowrite32(FIELD_PREP(VLANVIDS, vid), priv->addr + FWVLANTS);
+	err = rswitch_reg_wait(priv->addr, FWVLANTSR0, VLANTS, 0);
+	if (err < 0)
+		return err;
+
+	/* check if vlans are present in table */
+	if (!(ioread32(priv->addr + FWVLANTSR0) & VLANSNF)) {
+		*vlanslvs = (ioread32(priv->addr + FWVLANTSR1) & VLANSLVS);
+		*vlandvs = (ioread32(priv->addr + FWVLANTSR3) & VLANDVS);
+	}
+
+	return 0;
+}
+
+static int rswitch_write_vlan_table(struct rswitch_private *priv, u16 vid, u32 index)
+{
+	u32 vlancsdl = priv->gwca.l2_shared_rx_queue->index;
+	u32 vlanslvs = 0, vlandvs = 0;
+	int err;
+
+	err = rswitch_read_vlan_table(priv, vid, &vlanslvs, &vlandvs);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(priv->addr, FWVLANTL0, VLANED, 0);
+	iowrite32(FIELD_PREP(VLANVIDL, vid), priv->addr + FWVLANTL1);
+
+	vlanslvs |= BIT(index);
+	vlandvs  |= BIT(index);
+	iowrite32(FIELD_PREP(VLANSLVL, vlanslvs), priv->addr + FWVLANTL2);
+	iowrite32(FIELD_PREP(VLANCSDL, vlancsdl), priv->addr + FWVLANTL3(GWCA_INDEX));
+	iowrite32(FIELD_PREP(VLANDVL, vlandvs), priv->addr + FWVLANTL4);
+
+	return rswitch_reg_wait(priv->addr, FWVLANTLR, VLANTL, 0);
+}
+
+static int rswitch_erase_vlan_table(struct rswitch_private *priv, u16 vid, u32 index)
+{
+	u32 vlanslvs = 0, vlandvs = 0;
+	int err;
+
+	err = rswitch_read_vlan_table(priv, vid, &vlanslvs, &vlandvs);
+	if (err < 0)
+		return err;
+
+	vlanslvs &= ~BIT(index);
+	vlandvs  &= ~BIT(index);
+
+	/* only erase empty vlan table entries */
+	if (vlanslvs == 0)
+		rswitch_modify(priv->addr, FWVLANTL0, 0, VLANED);
+
+	iowrite32(FIELD_PREP(VLANVIDL, vid), priv->addr + FWVLANTL1);
+	iowrite32(FIELD_PREP(VLANSLVL, vlanslvs), priv->addr + FWVLANTL2);
+	iowrite32(FIELD_PREP(VLANDVL, vlandvs), priv->addr + FWVLANTL4);
+
+	return rswitch_reg_wait(priv->addr, FWVLANTLR, VLANTL, 0);
+}
+
+static int rswitch_port_set_vlan_tag(struct rswitch_etha *etha,
+				     struct switchdev_obj_port_vlan *p_vlan,
+				     bool delete)
+{
+	u32 err, vem_val;
+
+	err = rswitch_etha_change_mode(etha, EAMC_OPC_CONFIG);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(etha->addr, EAVCC, VIM, 0);
+
+	if (((ioread32(etha->addr + EAVTC) & CTV) == p_vlan->vid) && delete) {
+		rswitch_modify(etha->addr, EAVTC, CTV, 0);
+		rswitch_modify(etha->addr, EAVCC, VEM, 0);
+	} else if (!delete) {
+		if ((p_vlan->flags & BRIDGE_VLAN_INFO_PVID) &&
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED))
+			vem_val = FIELD_PREP(VEM, C_TAG_VLAN);
+		else if (p_vlan->flags & BRIDGE_VLAN_INFO_PVID)
+			vem_val = FIELD_PREP(VEM, HW_C_TAG_VLAN);
+		else
+			vem_val = 0;
+		rswitch_modify(etha->addr, EAVCC, VEM, vem_val);
+		rswitch_modify(etha->addr, EAVTC, CTV, FIELD_PREP(CTV, p_vlan->vid));
+	}
+
+	return rswitch_etha_change_mode(etha, EAMC_OPC_OPERATION);
+}
+
+static int rswitch_gwca_set_vlan_tag(struct rswitch_private *priv,
+				     struct switchdev_obj_port_vlan *p_vlan,
+				     bool delete)
+{
+	u32 err, vem_val;
+
+	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(priv->addr, GWVCC, VIM, 0);
+
+	if (((ioread32(priv->addr + GWVTC) & CTV) == p_vlan->vid) && delete) {
+		rswitch_modify(priv->addr, GWVTC, CTV, 0);
+		rswitch_modify(priv->addr, GWVCC, VEM, 0);
+	} else  if (!delete) {
+		if ((p_vlan->flags & BRIDGE_VLAN_INFO_PVID) &&
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED))
+			vem_val = FIELD_PREP(VEM, C_TAG_VLAN);
+		else if (p_vlan->flags & BRIDGE_VLAN_INFO_PVID)
+			vem_val = FIELD_PREP(VEM, HW_C_TAG_VLAN);
+		else
+			vem_val = 0;
+		rswitch_modify(priv->addr, GWVCC, VEM, vem_val);
+		rswitch_modify(priv->addr, GWVTC, CTV, FIELD_PREP(CTV, p_vlan->vid));
+	}
+
+	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
+}
+
+static int rswitch_port_obj_do_add(struct net_device *ndev,
+				   struct switchdev_obj_port_vlan *p_vlan)
+{
+	struct rswitch_device *rdev = netdev_priv(ndev);
+	struct rswitch_private *priv = rdev->priv;
+	struct rswitch_etha *etha = rdev->etha;
+	int err;
+
+	/* Set Rswitch VLAN mode */
+	iowrite32(br_vlan_enabled(rdev->brdev) ? FIELD_PREP(FWGC_SVM, C_TAG) : 0,
+		  priv->addr + FWGC);
+
+	err = rswitch_write_vlan_table(priv, p_vlan->vid, etha->index);
+	if (err < 0)
+		return err;
+
+	/* If the default vlan for this port has been set, don't overwrite it. */
+	if (ioread32(etha->addr + EAVCC))
+		return NOTIFY_DONE;
+
+	if (br_vlan_enabled(rdev->brdev))
+		rswitch_modify(priv->addr, FWPC0(etha->index), 0, FWPC0_VLANSA | FWPC0_VLANRU);
+
+	rswitch_modify(priv->addr, FWPC2(AGENT_INDEX_GWCA),
+		       FIELD_PREP(FWPC2_LTWFW, BIT(etha->index)),
+		       0);
+
+	return rswitch_port_set_vlan_tag(etha, p_vlan, false);
+}
+
+static int rswitch_port_obj_do_add_gwca(struct net_device *ndev,
+					struct rswitch_private *priv,
+					struct switchdev_obj_port_vlan *p_vlan)
+{
+	int err;
+
+	if (!(p_vlan->flags & BRIDGE_VLAN_INFO_BRENTRY))
+		return NOTIFY_DONE;
+
+	/* Set Rswitch VLAN mode */
+	iowrite32(br_vlan_enabled(ndev) ? FIELD_PREP(FWGC_SVM, C_TAG) : 0, priv->addr + FWGC);
+
+	err = rswitch_write_vlan_table(priv, p_vlan->vid, AGENT_INDEX_GWCA);
+	if (err < 0)
+		return err;
+
+	/* If the default vlan for this port has been set, don't overwrite it. */
+	if (ioread32(priv->addr + GWVCC))
+		return NOTIFY_DONE;
+
+	return rswitch_gwca_set_vlan_tag(priv, p_vlan, false);
+}
+
+static int rswitch_port_obj_do_del(struct net_device *ndev,
+				   struct switchdev_obj_port_vlan *p_vlan)
+{
+	struct rswitch_device *rdev = netdev_priv(ndev);
+	struct rswitch_private *priv = rdev->priv;
+	struct rswitch_etha *etha = rdev->etha;
+	u32 err;
+
+	err = rswitch_port_set_vlan_tag(etha, p_vlan, true);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(priv->addr, FWPC0(etha->index), FWPC0_VLANSA | FWPC0_VLANRU, 0);
+	rswitch_modify(priv->addr, FWPC2(AGENT_INDEX_GWCA), 0,
+		       FIELD_PREP(FWPC2_LTWFW, BIT(etha->index)));
+	rswitch_modify(priv->addr, FWPC2(rdev->port),
+		       0, FIELD_PREP(FWPC2_LTWFW, GENMASK(RSWITCH_NUM_AGENTS - 1, 0)));
+
+	return rswitch_erase_vlan_table(priv, p_vlan->vid, etha->index);
+}
+
+static int rswitch_port_obj_do_del_gwca(struct net_device *ndev,
+					struct rswitch_private *priv,
+					struct switchdev_obj_port_vlan *p_vlan)
+{
+	int err;
+
+	err = rswitch_gwca_set_vlan_tag(priv, p_vlan, true);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
+		       FWPC0_VLANSA | FWPC0_VLANRU,
+		       0);
+
+	return rswitch_erase_vlan_table(priv, p_vlan->vid, AGENT_INDEX_GWCA);
+}
+
+static int rswitch_handle_port_obj_add(struct net_device *ndev,
+				       struct notifier_block *nb,
+				       struct switchdev_notifier_port_obj_info *info)
+{
+	struct switchdev_obj_port_vlan *p_vlan = SWITCHDEV_OBJ_PORT_VLAN(info->obj);
+	struct rswitch_private *priv;
+	int err;
+
+	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_blocking_nb);
+
+	if ((p_vlan->flags & BRIDGE_VLAN_INFO_MASTER) ||
+	    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_BEGIN) ||
+	    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_END) ||
+	    (p_vlan->flags & BRIDGE_VLAN_INFO_ONLY_OPTS))
+		return NOTIFY_DONE;
+
+	switch (info->obj->id) {
+	case SWITCHDEV_OBJ_ID_PORT_VLAN:
+		if (!is_rdev(ndev))
+			err = rswitch_port_obj_do_add_gwca(ndev, priv, p_vlan);
+		else
+			err = rswitch_port_obj_do_add(ndev, p_vlan);
+
+		if (err < 0)
+			return err;
+
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	info->handled = true;
+
+	return NOTIFY_DONE;
+}
+
+static int rswitch_handle_port_obj_del(struct net_device *ndev,
+				       struct notifier_block *nb,
+				       struct switchdev_notifier_port_obj_info *info)
+{
+	struct switchdev_obj_port_vlan *p_vlan = SWITCHDEV_OBJ_PORT_VLAN(info->obj);
+	struct rswitch_private *priv;
+	int err;
+
+	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_blocking_nb);
+
+	if ((p_vlan->flags & BRIDGE_VLAN_INFO_MASTER) ||
+	    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_BEGIN) ||
+	    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_END) ||
+	    (p_vlan->flags & BRIDGE_VLAN_INFO_ONLY_OPTS))
+		return NOTIFY_DONE;
+
+	switch (info->obj->id) {
+	case SWITCHDEV_OBJ_ID_PORT_VLAN:
+		if (!is_rdev(ndev))
+			err = rswitch_port_obj_do_del_gwca(ndev, priv, p_vlan);
+		else
+			err = rswitch_port_obj_do_del(ndev, p_vlan);
+
+		if (err < 0)
+			return err;
+
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	info->handled = true;
+
+	return NOTIFY_DONE;
 }
 
 static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
-					    unsigned long event, void *ptr)
+					    unsigned long event,
+					    void *ptr)
 {
 	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
-	int ret;
+	int err;
 
 	switch (event) {
 	case SWITCHDEV_PORT_OBJ_ADD:
-		return -EOPNOTSUPP;
+		err = rswitch_handle_port_obj_add(ndev, nb, ptr);
+
+		return notifier_from_errno(err);
 	case SWITCHDEV_PORT_OBJ_DEL:
-		return -EOPNOTSUPP;
+		err = rswitch_handle_port_obj_del(ndev, nb, ptr);
+
+		return notifier_from_errno(err);
 	case SWITCHDEV_PORT_ATTR_SET:
-		ret = switchdev_handle_port_attr_set(ndev, ptr,
-						     is_rdev,
-						     rswitch_port_attr_set);
-		break;
-	default:
-		if (!is_rdev(ndev))
-			return NOTIFY_DONE;
-		ret = -EOPNOTSUPP;
+		err = rswitch_handle_port_attr_set(ndev, nb, ptr);
+
+		return notifier_from_errno(err);
 	}
 
-	return notifier_from_errno(ret);
+	return NOTIFY_DONE;
 }
 
 static int rswitch_gwca_write_mac_address(struct rswitch_private *priv, const u8 *mac)
@@ -389,7 +708,6 @@ static int rswitch_switchdev_event(struct notifier_block *nb,
 	struct switchdev_notifier_fdb_info *fdb_info;
 	struct switchdev_notifier_info *info = ptr;
 	struct rswitch_private *priv;
-	int err;
 
 	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_nb);
 
@@ -424,16 +742,6 @@ static int rswitch_switchdev_event(struct notifier_block *nb,
 		queue_work(system_long_wq, &switchdev_work->work);
 
 		break;
-	case SWITCHDEV_PORT_ATTR_SET:
-		err = switchdev_handle_port_attr_set(ndev, ptr,
-						     is_rdev,
-						     rswitch_port_attr_set);
-		return notifier_from_errno(err);
-
-		if (!is_rdev(ndev))
-			return NOTIFY_DONE;
-
-		return notifier_from_errno(-EOPNOTSUPP);
 	}
 
 	return NOTIFY_DONE;

-- 
2.43.0


