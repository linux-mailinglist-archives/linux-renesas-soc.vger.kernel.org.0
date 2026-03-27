Return-Path: <linux-renesas-soc+bounces-30411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFAHFhJAxmm7HgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:30:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CF4340FC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D94E53069351
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAAA33D904C;
	Fri, 27 Mar 2026 08:28:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044E035B639;
	Fri, 27 Mar 2026 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600089; cv=none; b=b86NB9RjCosJtrmlBdgH6IIpP0dOBZfMMeU0FoJC02e4mVHQaHUfpR3bsbm073mAcds7HbYK3pUxBF7PPpb8ceAdckDy3pkhfwjQ1Wx1jgkgNVXd9JrNPkS3r0xvOGbQN2XIKLQ6F/wxWvKLH60uhDdTBkTQOfKiUEWcdkEa5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600089; c=relaxed/simple;
	bh=iNxe+78/8LfJp0QgyF9JQQuVKOLxeDUsKgyPSJLqbQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oa3Fw2M2qMHD7HD0C+gujQdEiGaxZBZarYX4EGetiJ8WAhsfPD/Mq+f1U2ulD8YBrjTGpTgjDoPiV73yUvvEgaZ6Ff1kqQ/ZIzAfrSIBJoVuRpwZXeG9EPVD+yn/unbFUT9HoljIKHFLcVS652KcDqt7atbhyPVklMBEluAAh14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: zjxkYi8yRzC33/52d+MLxA==
X-CSE-MsgGUID: CrFusHGcRPq1FC03xxPO7w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Mar 2026 17:28:04 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A9CCA401227C;
	Fri, 27 Mar 2026 17:28:01 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 27 Mar 2026 09:27:36 +0100
Subject: [PATCH net-next v2 06/13] net: renesas: rswitch: add forwarding
 rules for gwca
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rswitch_add_vlans-v2-6-d7f4358ca57a@renesas.com>
References: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
In-Reply-To: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774600062; l=1614;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=iNxe+78/8LfJp0QgyF9JQQuVKOLxeDUsKgyPSJLqbQ0=;
 b=COaDWxwisaMSKOPBa0AwjDSF53/HrPncfgOxQGZysmuYC/er+01R0PHtE8CH8R+fBbF5VPwwh
 2gn/bh1v13mCsEAetGhWeVcfongKWFMJlkoicNky1riNyyKzTJqhEW9
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30411-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: C7CF4340FC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add rules to forward packets from the Ethernet ports to the CPU port (GWCA)
using L2 forwarding instead of port forwarding.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 709524c8a5c4..cabf1f92ad0c 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -93,10 +93,32 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 	}
 }
 
+static void rswitch_update_l2_hw_forwarding_gwca(struct rswitch_private *priv)
+{
+	struct rswitch_device *rdev;
+	u32 fwpc0_set, fwpc0_clr, fwpc2_set, fwpc2_clr;
+
+	fwpc0_clr = FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA;
+	fwpc0_set = fwpc0_clr;
+	fwpc2_clr = FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA));
+	fwpc2_set = fwpc2_clr;
+
+	(priv->offload_brdev) ? (fwpc0_clr = 0, fwpc2_set = 0)
+			      : (fwpc0_set = 0, fwpc2_set = 0);
+
+	rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA), fwpc0_clr, fwpc0_set);
+
+	rswitch_for_all_ports(priv, rdev) {
+		rswitch_modify(priv->addr, FWPC2(rdev->etha->index),
+			       fwpc2_clr, fwpc2_set);
+	}
+}
+
 void rswitch_update_l2_offload(struct rswitch_private *priv)
 {
 	rswitch_update_l2_hw_learning(priv);
 	rswitch_update_l2_hw_forwarding(priv);
+	rswitch_update_l2_hw_forwarding_gwca(priv);
 }
 
 static void rswitch_update_offload_brdev(struct rswitch_private *priv)

-- 
2.43.0


