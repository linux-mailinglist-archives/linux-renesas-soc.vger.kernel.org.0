Return-Path: <linux-renesas-soc+bounces-30842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BNsMxaiz2nDyAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:18:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 359963939C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:18:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6936A3002297
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 11:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEB0364958;
	Fri,  3 Apr 2026 11:18:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A43B30ACF6;
	Fri,  3 Apr 2026 11:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215096; cv=none; b=WXs+0SXg6huCffeSzNy7a/I0iVJ9U88YkbnQWqEq/KkBA5YyEio5m5og3AIWteCBRDq3Nw4q712+91JPZ91ZgyUB8xkS1n8Q22OxO21HTloZjMBK5sbVBHc/ZiKxieeWl+7EtjehodKEU6Ah7cHCCBd17RGUlC5i3xsERyiqrls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215096; c=relaxed/simple;
	bh=0WYBgKMTlXkgYogwKOIICSopEf2A8gdXNbk8ZkLLbaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XVA5hZIuc5peL6y/ijStp1w/YxI+tmgavt/XT7BTJC/CX52Rkdq+hzYArRCr/Iivuspk2MgAywDC4eyPZM6QSPGxI2UujOaElLsH4UhjfhERDSY9FWyIbkTbyyMOSrXj/QCljTOzhcNvAZfhk93fSbwEbkvKMEod36Ek0cS49kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: mT98Qk6rSySVCJ8LWFNc7Q==
X-CSE-MsgGUID: OTICCFi5Qp2oAkEINyfu6w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2026 20:18:07 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.192])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3B57B401A654;
	Fri,  3 Apr 2026 20:18:03 +0900 (JST)
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
Subject: [PATCH net] net: phy: micrel: Fix MMD register access during SPD in ksz9131_resume()
Date: Fri,  3 Apr 2026 11:17:38 +0000
Message-ID: <20260403111738.37749-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30842-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 359963939C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During system suspend, phy_suspend() puts the PHY into Software Power-Down
(SPD) by setting the BMCR_PDOWN bit in MII_BMCR. According to the KSZ9131
datasheet, MMD register access is restricted during SPD:

  - Only access to the standard registers (0 through 31) is supported.
  - Access to MMD address spaces other than MMD address space 1 is
    possible if the spd_clock_gate_override bit is set.
  - Access to MMD address space 1 is not possible.

However, ksz9131_resume() calls ksz9131_config_rgmii_delay() before
kszphy_resume() clears BMCR_PDOWN. This means MMD registers are accessed
while the PHY is still in SPD, contrary to the datasheet.

Additionally, on platforms where the PHY loses power during suspend
(e.g. RZ/G3E), all settings from ksz9131_config_init(), not just the
RGMII delays, are lost and need to be restored. When the MAC driver
sets mac_managed_pm (e.g. stmmac), mdio_bus_phy_resume() is skipped,
so phy_init_hw() (which calls config_init to restore all PHY settings)
is never invoked during resume.

Fix this by replacing the RGMII delay restoration with a call to
phy_init_hw(), which takes the PHY out of SPD and performs full
reinitialization.

Fixes: f25a7eaa897f ("net: phy: micrel: Add ksz9131_resume()")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/net/phy/micrel.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 2aa1dedd21b8..4236dbf4ad6b 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -6016,8 +6016,13 @@ static int lan8841_suspend(struct phy_device *phydev)
 
 static int ksz9131_resume(struct phy_device *phydev)
 {
-	if (phydev->suspended && phy_interface_is_rgmii(phydev))
-		ksz9131_config_rgmii_delay(phydev);
+	int ret;
+
+	if (phydev->suspended) {
+		ret = phy_init_hw(phydev);
+		if (ret)
+			return ret;
+	}
 
 	return kszphy_resume(phydev);
 }
-- 
2.51.0


