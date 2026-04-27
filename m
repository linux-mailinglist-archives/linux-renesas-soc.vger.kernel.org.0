Return-Path: <linux-renesas-soc+bounces-31686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IWjC6W+72kdFgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31686-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 21:53:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0544798DD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 21:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C14D9300BB85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 19:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECB041C2F1;
	Mon, 27 Apr 2026 19:53:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF39D3ED113;
	Mon, 27 Apr 2026 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777319586; cv=none; b=VTF//sM6IeeqqEMgx7SOube1h8KlwuF1h84CpQ8tx5DJSjQPyJI/8nLXx8PxTKBvOlbynmcKQ0miRUXVQ0SrPQZOjQcRglSM/k59WAI7PdlnnTn6uEMNrXO4jyv67p1JZ0oQDmMlNJbzJhYQHf3bILxmx72PhSimeKogj2WxcbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777319586; c=relaxed/simple;
	bh=rrCTkf0YrcIjR4xCQNu3mBHY7Oi7PjSHPQSAD2y1jZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LHwdNsYc6uyQiwLxjYtmMzqLs04NpFGqXMECvmIBsHaxldrwbwF9FAEfsSdj1pkzxMto8ykdGDETjhLrgTgnhgzKW75lcdCGHBFeVgkhVYXrehsajE7v27Sz5IgWAAE20FmGgNpPd6jQCIxQdVvgA4BT7DRSDN482NEhePlFg3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: g1R6AtjKSc6XXZDk9QyuEQ==
X-CSE-MsgGUID: V/1qxHOeQ2yp2jX/DEtgfw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Apr 2026 04:47:55 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.8])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id AA95B4001B5C;
	Tue, 28 Apr 2026 04:47:52 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow during suspend
Date: Mon, 27 Apr 2026 19:47:41 +0000
Message-ID: <20260427194741.161533-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BC0544798DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31686-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.901];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:mid,renesas.com:email]

On the Renesas RZ/V2H platform, if the xhcd driver is unbound and the
system is suspended afterwards, a PM underflow error will occur:

 # echo 15850000.usb > /sys/bus/platform/drivers/xhci-renesas-hcd/unbind
 # systemctl suspend
 15870000.usb-phy: PM: dpm_run_callback(): genpd_resume_noirq returns -13
 15870000.usb-phy: PM: failed to resume noirq: error -13
 15870000.usb-phy: Runtime PM usage count underflow!

Since the PHY framework is managing the runtime PM of the PHY via
phy_power_on()/phy_power_off(), there is no need for the PHY driver to
manipulate the runtime PM state during suspend.

To fix this, remove the runtime PM calls from the suspend/resume paths
and add a get/put pair inside rzg3e_phy_usb3_init_helper() to make sure
the clock is enabled during init, even when there is no consumer for
the PHY.

Also, change the suspend ops from NOIRQ_SYSTEM_SLEEP_PM_OPS to
SYSTEM_SLEEP_PM_OPS because runtime PM is disabled during the noirq phase
and pm_runtime_resume_and_get() would not actually enable the device clock.

Fixes: ee5f1a3f90a4 ("phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
 drivers/phy/renesas/phy-rzg3e-usb3.c | 31 ++++++++++++++++------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/renesas/phy-rzg3e-usb3.c b/drivers/phy/renesas/phy-rzg3e-usb3.c
index 6b3453ea0004..055775e1a0f7 100644
--- a/drivers/phy/renesas/phy-rzg3e-usb3.c
+++ b/drivers/phy/renesas/phy-rzg3e-usb3.c
@@ -64,6 +64,7 @@
 #define USB3_TEST_LANECONFIG0_DEFAULT		(0xd)
 
 struct rz_usb3 {
+	struct device *dev;
 	void __iomem *base;
 	struct reset_control *rstc;
 	bool skip_reinit;
@@ -130,11 +131,21 @@ static int rzg3e_phy_usb3test_phy_init(void __iomem *base)
 	return 0;
 }
 
-static int rzg3e_phy_usb3_init_helper(void __iomem *base)
+static int rzg3e_phy_usb3_init_helper(struct rz_usb3 *r)
 {
-	rzg3e_phy_usb2test_phy_init(base);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(r->dev);
+	if (ret)
+		return ret;
+
+	rzg3e_phy_usb2test_phy_init(r->base);
 
-	return rzg3e_phy_usb3test_phy_init(base);
+	ret = rzg3e_phy_usb3test_phy_init(r->base);
+
+	pm_runtime_put_sync(r->dev);
+
+	return ret;
 }
 
 static int rzg3e_phy_usb3_init(struct phy *p)
@@ -143,7 +154,7 @@ static int rzg3e_phy_usb3_init(struct phy *p)
 	int ret = 0;
 
 	if (!r->skip_reinit)
-		ret = rzg3e_phy_usb3_init_helper(r->base);
+		ret = rzg3e_phy_usb3_init_helper(r);
 
 	return ret;
 }
@@ -187,6 +198,7 @@ static int rzg3e_phy_usb3_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, r);
 	phy_set_drvdata(phy, r);
+	r->dev = dev;
 
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(provider))
@@ -199,7 +211,6 @@ static int rzg3e_phy_usb3_suspend(struct device *dev)
 {
 	struct rz_usb3 *r = dev_get_drvdata(dev);
 
-	pm_runtime_put(dev);
 	reset_control_assert(r->rstc);
 	r->skip_reinit = false;
 
@@ -215,27 +226,21 @@ static int rzg3e_phy_usb3_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = pm_runtime_resume_and_get(dev);
+	ret = rzg3e_phy_usb3_init_helper(r);
 	if (ret)
 		goto reset_assert;
 
-	ret = rzg3e_phy_usb3_init_helper(r->base);
-	if (ret)
-		goto pm_put;
-
 	r->skip_reinit = true;
 
 	return 0;
 
-pm_put:
-	pm_runtime_put(dev);
 reset_assert:
 	reset_control_assert(r->rstc);
 	return ret;
 }
 
 static const struct dev_pm_ops rzg3e_phy_usb3_pm = {
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend, rzg3e_phy_usb3_resume)
+	SYSTEM_SLEEP_PM_OPS(rzg3e_phy_usb3_suspend, rzg3e_phy_usb3_resume)
 };
 
 static const struct of_device_id rzg3e_phy_usb3_match_table[] = {
-- 
2.34.1


