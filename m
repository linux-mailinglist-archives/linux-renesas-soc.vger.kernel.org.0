Return-Path: <linux-renesas-soc+bounces-31072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MMvA2h412nTOAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:59:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA33B3C8D45
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5815230562BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 09:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294173B8D78;
	Thu,  9 Apr 2026 09:57:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5003F3B637E;
	Thu,  9 Apr 2026 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728629; cv=none; b=Z6R6FtqRMXfW3gnJ1OmZqBEfqosV07WN6P3TUnLQXwP58r/kvFykiRY06OJecmKouUy6PfEvjn0bEFRO12xKI8PJVFr/tzuhE6sok5uYNwV1k8YryM6i2omc8+J6cU6CtZcsbaFQkPkQvVF/4LKFU119TIZ+ZASrYcdASB954OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728629; c=relaxed/simple;
	bh=A/0hopx7RPUOgvgY6Q+Yk+HyBJYbhqsMarxcVlu9wHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YgiNuXbflICb3lhRkbtlIH6SH0Ga1RjFBnQ6ZPg62DgHbetJSHrl95IisopBiVxjZ+71Ysr6LSjyVEPrZuraml2D60xEu+qAtXfxiOzS70aYxE4iQpFmGAvSXL8vn2l4vAazavpuAuG5UbvZI9KBvAPbdBGzv1obnrRfKVfdPts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 9ku+z2odQZu7eLVk11Y5zA==
X-CSE-MsgGUID: w1tZX8T8RuOCt4IKL2A0dQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Apr 2026 18:57:07 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.4])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 31D434173838;
	Thu,  9 Apr 2026 18:57:02 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	biju.das.jz@bp.renesas.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v2 2/2] net: phy: micrel: remove ksz9131_resume()
Date: Thu,  9 Apr 2026 09:56:33 +0000
Message-ID: <20260409095633.70973-3-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
References: <20260409095633.70973-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31072-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: AA33B3C8D45
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ksz9131_resume() was added to restore RGMII delays on resume for platforms
where the PHY loses power during suspend to RAM. However, for s2idle, the
PHY stays in Software Power-Down (SPD) during resume. In that case,
ksz9131_config_rgmii_delay() accesses MMD registers before kszphy_resume()
clears BMCR_PDOWN. The KSZ9131 datasheet states that during SPD, access to
the MMD registers is restricted:

  - Only access to the standard registers (0 through 31) is supported.
  - Access to MMD address spaces other than MMD address space 1 is
    possible if the spd_clock_gate_override bit is set.
  - Access to MMD address space 1 is not possible.

Additionally, only RGMII delays were restored, while other settings
from ksz9131_config_init() were not.

Now that the preceding commit ("net: phylink: call phy_init_hw() in
phylink resume path") performs a phy_init_hw() during phylink resume,
ksz9131_resume() is no longer needed.

Remove it and use kszphy_resume() directly.

Fixes: f25a7eaa897f ("net: phy: micrel: Add ksz9131_resume()")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/net/phy/micrel.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 2aa1dedd21b8..f2513109865a 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -6014,14 +6014,6 @@ static int lan8841_suspend(struct phy_device *phydev)
 	return kszphy_generic_suspend(phydev);
 }
 
-static int ksz9131_resume(struct phy_device *phydev)
-{
-	if (phydev->suspended && phy_interface_is_rgmii(phydev))
-		ksz9131_config_rgmii_delay(phydev);
-
-	return kszphy_resume(phydev);
-}
-
 #define LAN8842_PTP_GPIO_NUM 16
 
 static int lan8842_ptp_probe_once(struct phy_device *phydev)
@@ -6929,7 +6921,7 @@ static struct phy_driver ksphy_driver[] = {
 	.get_strings	= kszphy_get_strings,
 	.get_stats	= kszphy_get_stats,
 	.suspend	= kszphy_suspend,
-	.resume		= ksz9131_resume,
+	.resume		= kszphy_resume,
 	.cable_test_start	= ksz9x31_cable_test_start,
 	.cable_test_get_status	= ksz9x31_cable_test_get_status,
 	.get_features	= ksz9477_get_features,
-- 
2.34.1


