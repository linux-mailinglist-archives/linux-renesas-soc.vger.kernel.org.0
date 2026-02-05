Return-Path: <linux-renesas-soc+bounces-27945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGBnIbmchGmI3wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:35:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C90F3588
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 14:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C04423002526
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 13:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC7122541B;
	Thu,  5 Feb 2026 13:35:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB833B2BA;
	Thu,  5 Feb 2026 13:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770298548; cv=none; b=H5SEpDVXpVsAzWKGKrnVN4pZ3j8HaNHx+Rm2LRyT/cF7ZMy1wolDkZ6hRn8cJWqtAmk2JJdXtU7dRmNbQEHet8aoPtzVONP3wZ2W0FiZ278hC6fRkyzv//qncFrPgA3FZIxbGOnhiU32kXetPfkAyAgLh+ka0KhWpRI54y3fang=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770298548; c=relaxed/simple;
	bh=dD/HTcR9V7UPhs+GBDDGvQ7kDxPOqqSZVrvRKS7V1Ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oBAJ/OfAoQC4Zp468JZqEOJh4xI1c4yawJEpmouSeCwEQGg2BsqjEVnlCj30ioBBcfCqRyaDBELkJbkz0s4hZRA1VcMsMDPe5qDN7C03IU/2QTfWP/ZlU4WdW5Mv/icNaX3ljg6ytCHWrsGOXn5wB8zt2ZFsKOJI/K7VMq39rhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: tgbu/h+NQUGxTpd4o1IU7w==
X-CSE-MsgGUID: boqrwSudRNuHRjL0DRTFRw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Feb 2026 22:35:45 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 81B25425CDD0;
	Thu,  5 Feb 2026 22:35:42 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 05 Feb 2026 14:35:21 +0100
Subject: [PATCH net v2] net: renesas: rswitch: fix forwarding offload
 statemachine
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260205-fix-offloading-statemachine-v2-1-fafcf0c6eb1d@renesas.com>
X-B4-Tracking: v=1; b=H4sIAJichGkC/42NTQrCQAxGryJZG8lMfxBX3kO6CJ20DdgZmZSil
 N7dsSdw+R4f79vAJKsY3E4bZFnVNMUC/nyCfuI4CmooDJ58S54aHPSNaRieiYPGEW3hRWbuJ42
 CLlTk2oqYrgFK4ZWlzI/6oys8qS0pf46z1f3sf93VocO2Ju9rbioX6J4lirFd+jRDt+/7FxKWE
 IPIAAAA
X-Change-ID: 20260205-fix-offloading-statemachine-1d301630a08d
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770298541; l=3394;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=dD/HTcR9V7UPhs+GBDDGvQ7kDxPOqqSZVrvRKS7V1Ko=;
 b=HZovnlAcJL5HpmhL2DNGIgLLC4Droel1AEuSaO/D55pklPt3uBq2IsRdLxQ2fsA6VAJ57FK9f
 5eQVoGLQWeiCt7zH8Z2lU1XZVeweV+qhbGioAc2nhCpIPIw25i73E92
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27945-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,davemloft.net:email,cogentembedded.com:email]
X-Rspamd-Queue-Id: 71C90F3588
X-Rspamd-Action: no action

A change of the port state of one port, caused the state of another
port to change. This behvior was unintended.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
A change of the port state of one port, caused the state of another
port to change. This behvior was unintended.

Fixes: b7502b1043de86967ff341819d05e09a8dbe8b2b ("net: renesas: rswitch: add offloading for L2 switching")

Changes in v2:
- Implemented suggested improvements to the function.
- Addded missing condition to an if statement.
- introduced bool variable, to reduce the the logic in the if
  statements.
- Link to v1: https://lore.kernel.org/r/20260205-fix-offloading-statemachine-v1-1-640224a531d0@renesas.com
---
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Michael Dege <michael.dege@renesas.com>
Cc: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 4a69ec77d69c..9433cd8adced 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2025 Renesas Electronics Corporation
+ * Copyright (C) 2025 - 2026 Renesas Electronics Corporation
  */
 
 #include <linux/err.h>
@@ -60,6 +60,7 @@ static void rswitch_update_l2_hw_learning(struct rswitch_private *priv)
 static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 {
 	struct rswitch_device *rdev;
+	bool new_forwarding_offload;
 	unsigned int fwd_mask;
 
 	/* calculate fwd_mask with zeroes in bits corresponding to ports that
@@ -73,8 +74,9 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 	}
 
 	rswitch_for_all_ports(priv, rdev) {
-		if ((rdev_for_l2_offload(rdev) && rdev->forwarding_requested) ||
-		    rdev->forwarding_offloaded) {
+		new_forwarding_offload = (rdev_for_l2_offload(rdev) && rdev->forwarding_requested);
+
+		if (new_forwarding_offload || rdev->forwarding_offloaded) {
 			/* Update allowed offload destinations even for ports
 			 * with L2 offload enabled earlier.
 			 *
@@ -84,13 +86,10 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 				  priv->addr + FWPC2(rdev->port));
 		}
 
-		if (rdev_for_l2_offload(rdev) &&
-		    rdev->forwarding_requested &&
-		    !rdev->forwarding_offloaded) {
+		if (new_forwarding_offload && !rdev->forwarding_offloaded)
 			rswitch_change_l2_hw_offloading(rdev, true, false);
-		} else if (rdev->forwarding_offloaded) {
+		else if (!new_forwarding_offload && rdev->forwarding_offloaded)
 			rswitch_change_l2_hw_offloading(rdev, false, false);
-		}
 	}
 }
 

---
base-commit: f14faaf3a1fb3b9e4cf2e56269711fb85fba9458
change-id: 20260205-fix-offloading-statemachine-1d301630a08d

Best regards,
-- 
Michael Dege <michael.dege@renesas.com>


