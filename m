Return-Path: <linux-renesas-soc+bounces-31071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGtkKf5312nTOAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31071-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:57:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 770643C8CB4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6F59301974C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 09:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747BA3B7767;
	Thu,  9 Apr 2026 09:57:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9343B6C00;
	Thu,  9 Apr 2026 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728625; cv=none; b=rLhuDcKZoxfXFWkTD5Iu68CSpM324ZTQsA4Ivm6TzOE037mYLHBJ/PDXIJ4vr+F2TfMNIM3iNA4ag3yRlmaVFpTsotLh15cNPKbpm/KK+QtyH+QHWXBip70uvvuKjCI/4edEX3XwXZOBDRdxQ9/WiiG83Pra+O+RZLiyLT2YHy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728625; c=relaxed/simple;
	bh=GZBta3BQ/b5aL28vR3RYgBxHpNPSzqNcDqldZ4xdGuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D/giwGvajAiGt9F79wrr4eHb9KU9lImlNojen7IOuRKqN1HmG1lwc0XuLY8tHMPbPjCpCLHNKpX6wyUvF223EYUAthPIq7BCz7tcVNMA4TaSfxNbTGABZoNPdX/zk39/S2gS11+z+qOaaLHE7dO5kcVxLm3p6diA9P2P/+VqXic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: wJJDMafHR0GL1ViU3APETQ==
X-CSE-MsgGUID: H4iSYUz/Sm6uA4KKukD4LQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Apr 2026 18:57:02 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.4])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D8E894173838;
	Thu,  9 Apr 2026 18:56:58 +0900 (JST)
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
Subject: [PATCH net v2 1/2] net: phylink: call phy_init_hw() in phylink resume path
Date: Thu,  9 Apr 2026 09:56:32 +0000
Message-ID: <20260409095633.70973-2-ovidiu.panait.rb@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,armlinux.org.uk,davemloft.net,google.com,kernel.org,redhat.com,bp.renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31071-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.982];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 770643C8CB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When mac_managed_pm flag is set, mdio_bus_phy_resume() is skipped,
so phy_init_hw(), which performs soft_reset and config_init, is not
called during resume.

This is inconsistent with the non-mac_managed_pm path, where
mdio_bus_phy_resume() calls phy_init_hw() before phy_resume()
on every resume.

Add phy_init_hw() calls in both phylink_prepare_resume() and
phylink_resume(), to ensure that the PHY state is the same as
when the PHY is resumed via the MDIO bus.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/net/phy/phylink.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 087ac63f9193..c302126009f6 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2669,8 +2669,10 @@ void phylink_prepare_resume(struct phylink *pl)
 	 * then resume the PHY. Note that 802.3 allows PHYs 500ms before
 	 * the clock meets requirements. We do not implement this delay.
 	 */
-	if (pl->config->mac_requires_rxc && phydev && phydev->suspended)
+	if (pl->config->mac_requires_rxc && phydev && phydev->suspended) {
+		phy_init_hw(phydev);
 		phy_resume(phydev);
+	}
 }
 EXPORT_SYMBOL_GPL(phylink_prepare_resume);
 
@@ -2683,6 +2685,8 @@ EXPORT_SYMBOL_GPL(phylink_prepare_resume);
  */
 void phylink_resume(struct phylink *pl)
 {
+	struct phy_device *phydev = pl->phydev;
+
 	ASSERT_RTNL();
 
 	if (phylink_phy_pm_speed_ctrl(pl))
@@ -2712,6 +2716,9 @@ void phylink_resume(struct phylink *pl)
 		/* Re-enable and re-resolve the link parameters */
 		phylink_enable_and_run_resolve(pl, PHYLINK_DISABLE_MAC_WOL);
 	} else {
+		if (phydev && phydev->suspended)
+			phy_init_hw(phydev);
+
 		phylink_start(pl);
 	}
 }
-- 
2.34.1


