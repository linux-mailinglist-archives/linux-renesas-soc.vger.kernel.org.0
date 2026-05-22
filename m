Return-Path: <linux-renesas-soc+bounces-32977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHBNKQ9KEGpvVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:20:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 407DC5B3CC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5DE730BE88D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6C037D128;
	Fri, 22 May 2026 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VFwHsB1v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628FC37D12C;
	Fri, 22 May 2026 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452005; cv=fail; b=nDpzexqGE7qYCtRnkC1PrKr7SSdnJGrhwAXWJ0fGtWNq96QJa3sRfk9KS8LNjeDO5FRsefqVp34jiAg8b4huHBsTc0SM8n7ZmotdiV0VHqdKrWrr68791b654vxGpS2zF8/fwXVX21OVyCs0AwIFBbVT4AI/G3/jcCfyd96rqiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452005; c=relaxed/simple;
	bh=L5A+k6CIbmBkuqAQOuGKl0/4bkKhi7+/nZpQtdsi6nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nn9ucC6hsSqjjepbKzNka/kAhBifLN6z7hNydAQMcXgTVYL2XU9nbsvg0F1RoIMQ8uxNqdKzVJuiQza93aBFbTji/stE7EZ7zzq2Ejcw5+lwbJgf3p+1TWN9PVzX80h17gviR5GnLtCXrI+GuPtD1nBiOFRyUyo/AnlAdv2V0LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VFwHsB1v; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7HAT0Myyj4rp5Z0c9OygnJTOeYeu16fZo4Grcom5OOSgK+HtVFT86rrudGHG1rNTuPpFku8J0S25q5J9zIKgl48pPJCAtAvpuMgzaxFJ93UAXfAbDnEYZnRUYda0nzUzGE8rX+3rmH5UBAKq6n+HXKYkniTNaU0m6DUZpSHzBe04o/zdtUorAtUp/qsxeEw15V34Ht2bv0i/zgiiR5jXsFyDI6Pba4ICX2rt5E4G2fBNKlKKywriipG6Q4KbirHwmzKAfM40jYy5eseGh9Jrzz0YX2axbUFQA07eImZa1rDfCPCAFdE97aHfWwZFYwc5bnteTPOGztEgGbHj/MevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISKwiBGKkv4gruxtXxWZdCE/xm6BQ211gLgFnOg7x54=;
 b=anyfYqgVaMJ9xSFUJY1/4vcvZIS5yl3n3xGY8NxoGZAmgAPRhEwwolBzXlh0Qzm3b0kbAA7B6w9Jo4WbaZdzVZl8/O0/MDwCN+rRwLQSHOL5uxsuN7whu/CGTnxozVo5CeDBAh3J5iJNcBloShTTT+RxJc1rtnE6n58yfRMVhH8FC39j9r1Tbi2PpYOzvZkTj9O9427G52QxPb1F1xwLXxnVspaOMW+KfBfbT2f6HLttv8lI8Io4Tx98GmTsJUDfOOLeqdxOzDXaZxsuDo4JqtzcKUFnn52XLuNCZbVItiSyXM4f7S0MyCpsAFCqYvmNtvOt423w+bIbtxItTttCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISKwiBGKkv4gruxtXxWZdCE/xm6BQ211gLgFnOg7x54=;
 b=VFwHsB1vpt7uxB6w7Q4BBEV++5VCiH6ZlTa64jMIdesHQGY5+S+KRNoZRverrrbQenjHdGII0CbPe/7naG8F0rdaHhg65bZA2CVJWVxdyh6U20AEsZ9f3H8Z7sWNvmtJC+Lq/94p4ptMPMAMc5LQ5KlGnFkCQ/jfYWodI2aCtGc=
Received: from OSTPR01CA0080.jpnprd01.prod.outlook.com (2603:1096:604:218::16)
 by OS3PR01MB10359.jpnprd01.prod.outlook.com (2603:1096:604:1fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:18 +0000
Received: from OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:218:cafe::3e) by OSTPR01CA0080.outlook.office365.com
 (2603:1096:604:218::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D215.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:17 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id D63043000466;
	Fri, 22 May 2026 21:13:13 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:37 +0200
Subject: [PATCH net-next v5 08/14] net: renesas: rswitch: add locking for
 agent clock control
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-8-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=3336;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=L5A+k6CIbmBkuqAQOuGKl0/4bkKhi7+/nZpQtdsi6nc=;
 b=iB1RxnhanzWLkWBXG+1/iZj4kg8vAliMb5Or1bFueqaqjnoAQW1gFIGiGxR8AoelXiPEz0ta4
 LrOfDSDYFQLCSkblN40br2mck2yhstZPgTgvNzJ7+t610aNP5DVy4FH
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D215:EE_|OS3PR01MB10359:EE_
X-MS-Office365-Filtering-Correlation-Id: c3141a53-db75-41d2-b486-08deb7fb81be
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	t0Cwp9JtCrFzop0mwnWFwX64xRzPGjIIt5HaCEzM0ZWHY1IpFRMGi/3ZBNZhoOXSdZb/+2vJCMMKDWbPfPCjGCt47mzdvf6oMMELrnrgtHBnf1HLbKuLHKmoiEeG3pOb83jvGQfIyqbwJypDEGz1DdKlE/CV7zZFGWKPIl7cw84QvK4GfZOzc+eZ1TE+uHFeNkflCRu9GsUpx4LY5YCrECgskRgolhbZeDqkbt8HriN2IAukbH3tVM4tMFnaPzdxtI86tOya1HnmLluaaqbKI+7cQXpb6sxPXKhgrkU5/SX12oPDzdET48g/1NxRz+kmLbHQNkS7SRd3yeSYAUDEPKAEPHBWmlOAjXFBii1jhihkgHAmV9beDOeoQiz3g7dtVl8TN7/KEuFP0DUim2d9yfZ3CbgdPIY8uhxG6NMEYHYbI1T3KY++vh3KSF05Db/yOGR10Ziudadgn5bQYc6zCDJgft37CxH6eVsl6NlcpBCfeFKDQt9XfxMYwsYspiEoQr/b0aWO3AY97YVCOJDmmxLwPs2oC4ZDihsdO7qECTBBkorrycSAzVjRpPgKdnx/ao9+Opu8pTF8ttId+ik6YSlr3zmIDxEby42RTwWvPTaW7LFW3wMNOiSaGSsFAVZAd6A+aDJwWTIlYoza4VdmsCo+6FXBGiKAiAia51V1u78fXPoyJ8dmYWI3Iz+NMl0E6foDHX43HuCfh1hZOMYgqLzAuPtE+q35llb8qUWATOg=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JitzOomDq0cmqbHA8+ahT7X6iZZh+gfpQKes5mX7LXK3IlnPZxUCbYp2iAdlzE3ESaUdQPFzBhoWWcWGE6BkBsAjQGj5ZpoAvmbPin8GNSYYqwsgCTu4ALVP+pjSfoNoWiOu6MrG1P9GbmGjNAhz5ofidFkIff8FWff8bmpxiQ23w4OMWabGHc3Iqocp2v29fs+moCkDZ8GLTZuxfUXhZP03yYaDcUyG3rqyH/yR54DDQx9lYqGd8lgWKGLZEu5mlU2Wfm9DCystjjCbAvdrIvmSThAxGjxrJKP8g7k1dFnKZv5s2Kh9hDYw8DKM5VeaD9YyyVhIawMlijyMMmNZ2lYRfLZu9/+hCTGW7RqelIQ5eRUSvTW7Km/ivjIA/cHmulqVZ8WRAYonTMDwqP6MfISzhtr4rQ/W0giQbIRI5WMxkMSSuagydNaespYzIX0w
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:17.3786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3141a53-db75-41d2-b486-08deb7fb81be
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D215.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10359
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32977-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,renesas.com:mid,renesas.com:dkim];
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
X-Rspamd-Queue-Id: 407DC5B3CC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RCEC and RCDC clock registers are shared by all ports (ETHA and GWCA),
there is a potential risk of a race condition leading to an undefined
state.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  3 +++
 drivers/net/ethernet/renesas/rswitch_main.c | 17 +++++++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 5feeb555e9a8..f85dd96a9bfb 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1089,6 +1089,7 @@ struct rswitch_etha {
 	unsigned int index;
 	void __iomem *addr;
 	void __iomem *coma_addr;
+	struct rswitch_private *priv;
 	bool external_phy;
 	struct mii_bus *mii;
 	phy_interface_t phy_interface;
@@ -1207,6 +1208,8 @@ struct rswitch_private {
 	struct list_head port_list;
 
 	spinlock_t lock;	/* lock interrupt registers' control */
+	spinlock_t agent_lock;	/* rswitch agent clock control */
+
 	struct clk *clk;
 
 	bool etha_no_runtime_change;
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 20ac8f3b9357..fc80c65c2131 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -173,8 +173,12 @@ int rswitch_gwca_change_mode(struct rswitch_private *priv,
 {
 	int ret;
 
-	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
+	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index)) {
+		spin_lock(&priv->agent_lock);
 		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
+		spin_lock(&priv->agent_lock);
+	}
+
 	iowrite32(GWMC_OPC_DISABLE, priv->addr + GWMC);
 
 	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, GWMC_OPC_DISABLE);
@@ -182,7 +186,9 @@ int rswitch_gwca_change_mode(struct rswitch_private *priv,
 		return ret;
 
 	if (mode == GWMC_OPC_DISABLE) {
+		spin_lock(&priv->agent_lock);
 		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 0);
+		spin_unlock(&priv->agent_lock);
 
 		return ret;
 	}
@@ -1183,15 +1189,21 @@ int rswitch_etha_change_mode(struct rswitch_etha *etha,
 {
 	int ret;
 
-	if (!rswitch_agent_clock_is_enabled(etha->coma_addr, etha->index))
+	if (!rswitch_agent_clock_is_enabled(etha->coma_addr, etha->index)) {
+		spin_lock(&etha->priv->agent_lock);
 		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 1);
+		spin_unlock(&etha->priv->agent_lock);
+	}
+
 	iowrite32(EAMC_OPC_DISABLE, etha->addr + EAMC);
 	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, EAMC_OPC_DISABLE);
 	if (ret < 0)
 		return ret;
 
 	if (mode == EAMC_OPC_DISABLE) {
+		spin_lock(&etha->priv->agent_lock);
 		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 0);
+		spin_unlock(&etha->priv->agent_lock);
 
 		return ret;
 	}
@@ -2010,6 +2022,7 @@ static void rswitch_etha_init(struct rswitch_private *priv, unsigned int index)
 	etha->index = index;
 	etha->addr = priv->addr + RSWITCH_ETHA_OFFSET + index * RSWITCH_ETHA_SIZE;
 	etha->coma_addr = priv->addr;
+	etha->priv = priv;
 
 	/* MPIC.PSMCS = (clk [MHz] / (MDC frequency [MHz] * 2) - 1.
 	 * Calculating PSMCS value as MDC frequency = 2.5MHz. So, multiply

-- 
2.43.0


