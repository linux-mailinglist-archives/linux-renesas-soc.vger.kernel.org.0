Return-Path: <linux-renesas-soc+bounces-32974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJaJKjRJEGrzVgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:16:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FAA5B3B82
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:16:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 694993082FA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0B637FF54;
	Fri, 22 May 2026 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TYGPV4uI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F221537F74B;
	Fri, 22 May 2026 12:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451992; cv=fail; b=MhSrlIV4N7eoAGIZt70g+9HcOyHiqINwz657JpMQejG89w1Q3ojzLPOPd83lyn5u8isJY5ZXpFK1sayKcqDlvBs0evsjxdEvEhCVXwZ2qhlRr5DovyKxUt9Cht1N7NzG5FO+GPRqbz7myWWNLSltINy3NuUmFqaUHXmtl/TW48c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451992; c=relaxed/simple;
	bh=U5rfpzwdAgxd+/UtqO18msfinPYCeNmVzRqIZkZ3gaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZg2og5BfLEdO0PY9lqVXNoGD0CyMY1L8AeOMtuFUBPjw+d+1gEwlzZ5zwHVd7NOGj6DmITVJlXGMxZHm05FQWxpEumNRGDMKTE9nt6J/Cg87G2A/FBP0Zy7JLLVM7/YAWj7OP+V4/nSO2DPNfDqGInUk7ejFp93aVWweckLY7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TYGPV4uI; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiXh3a3ScX3/xZCzuadybp0ywziyUfbK+RB12I7iSO9lan0VKNGDML/KZs3BZCBvDzQqrbgNbZFYDvNGWzoUCUnRW0WmPfcNKGk1chrN5H4HfREXBBBWptXtCGw2D4xJTxMTbYPmylUQOvBHkOxZf6fmCyhyncBHN1wAWz5HctBpY1laAvgu85eIaL7xZZhGNPqVGAaw9wYVjli9dGH+akY7QihNqYdECaXbNmTR6y/SI7lCpSIc4mKGNUja4nb+Lz24oX7Kh2Kc8X+hkMJHoEKbByLC7xG/PtIOl5Hq1rSDlrah2QTa8Pu+ek8ZrqEVUyvn+kJXVppzSBSs9yqi3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx+uBsgTrOKA8HS5+bNuV6+K9/HQsGaJdOFjF+BsPO4=;
 b=ToIoIP3+jemHi7pm8P+J2bCi8wHMzNJlJnruwrPujcThYk5G+l5TVL4DR90+ayW1R+JorDWxX65AK3511SDs3MmXm4zPLf2oHWx1q1p+JpaGXsP1XXeF51hafy98kIiBYrzYriMXu0lIN2F/NQaPSVXLEPvOXYJSFGE/6mtHSkL1GU9hlc6k0LzRLMc/X6P6cMoVzr6YXtlPyU7C1kDbqtY/Nq1C98IU4HPdPoQ+08rhpChwxtRgcZGtVS+ozC4//27YcuCIUub0DZeXAOYok3aJdq2/nOWZm23MxZBWy9bHd598zTA9Ih1CMaGijIVhUIG2KICxRQfa8FfJfMYLDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx+uBsgTrOKA8HS5+bNuV6+K9/HQsGaJdOFjF+BsPO4=;
 b=TYGPV4uI0XoOkkRf+MKK7UJLLQJu9t+YC/1SgnNSCaDhmXcWVTDDmhoC+Fiaap8V6AeO7zEx2+eUsvw8+8uTxjnk1Ek4xU6ZsaNDw79Ye2ssdPE/KJH783aIdmw0h6lcIChrjCtVflZLcVhUba5FnZxhblgRrqscIR9XTzQ4nYY=
Received: from TYCPR01CA0055.jpnprd01.prod.outlook.com (2603:1096:405:2::19)
 by TYVPR01MB10735.jpnprd01.prod.outlook.com (2603:1096:400:298::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:06 +0000
Received: from TYO1EPF00005026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2:cafe::91) by TYCPR01CA0055.outlook.office365.com
 (2603:1096:405:2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005026.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:06 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id B5ED03000458;
	Fri, 22 May 2026 21:13:02 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:34 +0200
Subject: [PATCH net-next v5 05/14] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-5-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-0-53589d944a9f@renesas.com>
In-Reply-To: <20260522-rswitch_add_vlans-v5-0-53589d944a9f@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=8948;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=U5rfpzwdAgxd+/UtqO18msfinPYCeNmVzRqIZkZ3gaw=;
 b=u1rqhWSJ63YBODAU56b5/iGyJdeRI0Kl1OElbLN/J9Iw1N0+dWsozpK50eSG7j0UpfQSXWSL3
 5NgOBtNofaADy+dMLSvWZtB1L6IU2Pp07LTRG+f9ea3FeSQWiz9erXu
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005026:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: eec712dd-5813-45cb-eea1-08deb7fb7afd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	oQmI7XVFWACb04s7Nqs4wkz/7BriTdCYhY/zFepdVBJ5TQggPaFqGLwEKNKYM3aQPfd7YXqQtFFyLHVJQwsSNtISxIvtXKCN5P0CjOicOecz3BGMEQWGsvZBbQSgT4t+AmwRXt/ooBNyN0NscJOQjVGSHgdhE9nB0VDuotz9sqRztH+v13qQDfUS3LtL3qAwBXnDd8TeQL9HcmPZw03UXnoQWcYuOUBuWaxnDF1eIvoeJ1Mn4e9PgMl1VU5saFJTHdq3LDnozVTq/h5FJlQBPgEL62/XpLtPnS8rGdZedbpAs3ap3h5Wy58xy1QRRZNSUnn2TA7XsRRFB95xxdcjwsRD/4FdnZ1EaLD7EgwB1tPq5qyzYPYpYKXo3UCCkayzj1SLAzcUftLXXHE+WkKSBR0XYnP/5htVFY+vZTNufAPzbE2RTrLfzakbVlv9cgFOy7LsHjijiTza781/F1f24N5fnWEB1/fBvNwyS8YDozcKBlrRVlj22YHgZWJTdZWfELrE+fHOGaj3CsY6R7l4GUu4dCfK//AFYCAfiPK+v+AItv5E3A8zn5LpP+GxikRdVj34jbo6ymySK51O7yk0R2nUvDqJp3/TTorVhmrTDXfEizsKyKiZpz4gAj6t/18K7/OY71W1runCtGDx1b7BKEl+YMREsHtIKlemAWkwfHqRncNfrLIs5xv8KsVBf2LIbD8G1ZS5k3Ed9MlTTVowqrPnOt88XydfdF43ZrzkOqk=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hNrwDfpZXYrFjslOsa5+qbN0or5px00y8rlxWsmofQleJyBrOlMR7min3BybXG2FBX+Y5YmRkb6x63rDhdDMtl1FLQiGmKaf2GfBrJX+6du+LYAhR+rGHpJw8azySwKrxYV7gFYqfORxwJH5ai8LCK4VLSZsNHaufSPx4mb53e3cN5KxBlI3HDrnWRHQT28BKYzW3pnpeP6SlWeNqbOUljQMyQGrQZRHsAXV13JW9GqAHE3/tlhS6T1/rpiGUL3myHz3d6EFimgEyITy5fyxvUxB9mW+n41VBpO4EiFbHnxx3otG7VH3wLChNy9bRMxA/R5vjAH3nbBC5K4JqAC6M1mgSlUf0Zx4q7EUOtC28u0wFxDgBiGSczjYveO/opkEMfrQ0CwgM/OVvzIuTuqfLri+qlk8JYjFoSNI8Q9fIsc1MpJBBxxH4zaSD2HN7g1e
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:06.0822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eec712dd-5813-45cb-eea1-08deb7fb7afd
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005026.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32974-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39FAA5B3B82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Packets with unknown MAC address cannot be handled by the HW forwarding.
These need to be forwarded, via an exception path, to the network driver.

Creates a queue for the exeption path. Packets received with unknown
src/dst address need to be passed to the CPU. The received packet does not
have the correct source port information, this is derived from the
descriptor and added to the new queue. The received packet is added to the
new queue and sent to the CPU for MAC learning. The CPU will broadcast the
received packet, to all ports. This is how the HW learns the new MAC
address.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |   2 +
 drivers/net/ethernet/renesas/rswitch_main.c | 103 ++++++++++++++++++++++++++--
 2 files changed, 98 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index e56c15dd4ecd..8415f52a239e 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1148,6 +1148,7 @@ struct rswitch_gwca {
 	struct rswitch_gwca_queue *queues;
 	int num_queues;
 	struct rswitch_gwca_queue ts_queue;
+	struct rswitch_gwca_queue *l2_shared_rx_queue;
 	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
 	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
 	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
@@ -1162,6 +1163,7 @@ struct rswitch_device {
 	void __iomem *addr;
 	struct rswitch_gwca_queue *tx_queue;
 	struct rswitch_gwca_queue *rx_queue;
+	struct rswitch_gwca_queue *rx_old_queue;
 	struct sk_buff *ts_skb[TS_TAGS_PER_PORT];
 	DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
 	bool disabled;
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 9510bcdf9e83..1f4ec65f6f9b 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -688,6 +688,38 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
 	return rswitch_gwca_queue_ext_ts_format(ndev->dev.parent, priv, rdev->rx_queue);
 }
 
+static void rswitch_shared_rx_queue_free(struct rswitch_private *priv)
+{
+	struct rswitch_gwca *gwca = &priv->gwca;
+
+	rswitch_gwca_put(priv, gwca->l2_shared_rx_queue);
+	rswitch_gwca_queue_free(&priv->pdev->dev, gwca->l2_shared_rx_queue);
+}
+
+static int rswitch_shared_rx_queue_alloc(struct rswitch_private *priv)
+{
+	struct rswitch_gwca *gwca = &priv->gwca;
+	struct device *dev = &priv->pdev->dev;
+
+	int err;
+
+	gwca->l2_shared_rx_queue = rswitch_gwca_get(priv);
+	if (!gwca->l2_shared_rx_queue)
+		return -EBUSY;
+
+	err = rswitch_gwca_queue_alloc(NULL, priv, gwca->l2_shared_rx_queue, false, RX_RING_SIZE);
+	if (err < 0) {
+		rswitch_gwca_put(priv, gwca->l2_shared_rx_queue);
+		return err;
+	}
+
+	err = rswitch_gwca_queue_ext_ts_format(dev, priv, gwca->l2_shared_rx_queue);
+
+	if (err < 0)
+		rswitch_shared_rx_queue_free(priv);
+	return err;
+}
+
 static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 {
 	unsigned int i;
@@ -725,6 +757,10 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 			return err;
 	}
 
+	err = rswitch_shared_rx_queue_alloc(priv);
+	if (err < 0)
+		return err;
+
 	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
 }
 
@@ -736,6 +772,8 @@ static int rswitch_gwca_hw_deinit(struct rswitch_private *priv)
 	if (err < 0)
 		return err;
 
+	rswitch_shared_rx_queue_free(priv);
+
 	return rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
 }
 
@@ -944,10 +982,15 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 
 	if (napi_complete_done(napi, budget - quota)) {
 		spin_lock_irqsave(&priv->lock, flags);
+		if (rdev->rx_old_queue) {
+			rdev->rx_queue = rdev->rx_old_queue;
+			rdev->rx_old_queue = NULL;
+		}
 		if (test_bit(rdev->port, priv->opened_ports)) {
 			rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
 			rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
 		}
+		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, true);
 		spin_unlock_irqrestore(&priv->lock, flags);
 	}
 
@@ -960,15 +1003,41 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 	return 0;
 }
 
-static void rswitch_queue_interrupt(struct net_device *ndev)
+static void rswitch_queue_interrupt(struct rswitch_private *priv, struct rswitch_gwca_queue *gq)
 {
-	struct rswitch_device *rdev = netdev_priv(ndev);
+	struct rswitch_ext_ts_desc *desc;
+	struct rswitch_device *rdev;
+	struct net_device *ndev;
+	unsigned long flags;
+	u32 spn;
+
+	/* If we receive a shared queue through the exception path, it will be missing the ndev
+	 * pointer. This needs to be added to be able to determine from which port the packet was
+	 * received. Then we temporarily exchange the rx_queue pointer in rdev. This will be
+	 * restored after the packet has been processed.
+	 */
+
+	if (gq->index == priv->gwca.l2_shared_rx_queue->index) {
+		desc = &gq->rx_ring[gq->cur];
+		spn = FIELD_GET(SPN, le64_to_cpu(desc->info1));
+		ndev = priv->rdev[spn]->ndev;
+		rdev = netdev_priv(ndev);
+		gq->ndev = ndev;
+		/* store original rx_queue */
+		spin_lock_irqsave(&priv->lock, flags);
+		rdev->rx_old_queue = rdev->rx_queue;
+		rdev->rx_queue = gq;
+		spin_unlock_irqrestore(&priv->lock, flags);
+	} else {
+		rdev = netdev_priv(gq->ndev);
+	}
 
 	if (napi_schedule_prep(&rdev->napi)) {
-		spin_lock(&rdev->priv->lock);
-		rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
-		rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
-		spin_unlock(&rdev->priv->lock);
+		spin_lock(&priv->lock);
+		rswitch_enadis_data_irq(priv, rdev->tx_queue->index, false);
+		rswitch_enadis_data_irq(priv, rdev->rx_queue->index, false);
+		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, false);
+		spin_unlock(&priv->lock);
 		__napi_schedule(&rdev->napi);
 	}
 }
@@ -986,7 +1055,7 @@ static irqreturn_t rswitch_data_irq(struct rswitch_private *priv, u32 *dis)
 			continue;
 
 		rswitch_ack_data_irq(priv, gq->index);
-		rswitch_queue_interrupt(gq->ndev);
+		rswitch_queue_interrupt(priv, gq);
 	}
 
 	return IRQ_HANDLED;
@@ -1523,6 +1592,14 @@ static int rswitch_serdes_set_params(struct rswitch_device *rdev)
 	return phy_set_speed(rdev->serdes, rdev->etha->speed);
 }
 
+static void rswitch_etha_set_exception_path(struct rswitch_private *priv)
+{
+	iowrite32(FDMACUFEF, priv->addr + FWCEPRC2);
+	iowrite32(FIELD_PREP(EPCS, GWCA_INDEX) |
+		  FIELD_PREP(EPCSD, priv->gwca.l2_shared_rx_queue->index),
+		  priv->addr + FWCEPTC);
+}
+
 static int rswitch_ether_port_init_one(struct rswitch_device *rdev)
 {
 	int err;
@@ -1576,6 +1653,8 @@ static int rswitch_ether_port_init_all(struct rswitch_private *priv)
 	unsigned int i;
 	int err;
 
+	rswitch_etha_set_exception_path(priv);
+
 	rswitch_for_each_enabled_port(priv, i) {
 		err = rswitch_ether_port_init_one(priv->rdev[i]);
 		if (err)
@@ -1626,6 +1705,7 @@ static int rswitch_open(struct net_device *ndev)
 	bitmap_set(rdev->priv->opened_ports, rdev->port, 1);
 	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, true);
 	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, true);
+	rswitch_enadis_data_irq(rdev->priv, rdev->priv->gwca.l2_shared_rx_queue->index, true);
 	spin_unlock_irqrestore(&rdev->priv->lock, flags);
 
 	phy_start(ndev->phydev);
@@ -1653,6 +1733,11 @@ static int rswitch_stop(struct net_device *ndev)
 	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
 	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
 	bitmap_clear(rdev->priv->opened_ports, rdev->port, 1);
+	if (bitmap_empty(rdev->priv->opened_ports, 1))
+		rswitch_enadis_data_irq(rdev->priv,
+					rdev->priv->gwca.l2_shared_rx_queue->index,
+					false);
+
 	spin_unlock_irqrestore(&rdev->priv->lock, flags);
 
 	napi_disable(&rdev->napi);
@@ -1959,6 +2044,7 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	rdev->port = index;
 	rdev->etha = &priv->etha[index];
 	rdev->addr = priv->addr;
+	rdev->rx_old_queue = NULL;
 
 	ndev->base_addr = (unsigned long)rdev->addr;
 	snprintf(ndev->name, IFNAMSIZ, "tsn%d", index);
@@ -2176,6 +2262,9 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	priv->gwca.index = AGENT_INDEX_GWCA;
 	priv->gwca.num_queues = min(RSWITCH_NUM_PORTS * NUM_QUEUES_PER_NDEV,
 				    RSWITCH_MAX_NUM_QUEUES);
+	/* One extra queue for L2 switch reception */
+	priv->gwca.num_queues = min(priv->gwca.num_queues + 1,
+				    RSWITCH_MAX_NUM_QUEUES);
 	priv->gwca.queues = devm_kcalloc(&pdev->dev, priv->gwca.num_queues,
 					 sizeof(*priv->gwca.queues), GFP_KERNEL);
 	if (!priv->gwca.queues)

-- 
2.43.0


