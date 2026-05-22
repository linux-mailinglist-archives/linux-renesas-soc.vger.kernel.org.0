Return-Path: <linux-renesas-soc+bounces-32938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O4XOqUuEGrIUgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:23:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9153F5B1FF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B3794302FC11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 10:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7158D3D75D5;
	Fri, 22 May 2026 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFr2qy3P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBF433987F;
	Fri, 22 May 2026 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445126; cv=none; b=oVTXyAprasyJ6QrJ3Sw88lhrTg3xRLMpKx73VTbC+0g97pTBo/iv8yXQL4D9zNd1Y9UlVLotf7NS1oEapZEdDd1yFVmxChg1CSH/HHdEcZmq1hyh32+iez4nv4t9DsPFSYKzqAGCBVFw1E1I4961qzkYK/CrnocbC0AhwZ1gksI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445126; c=relaxed/simple;
	bh=uf1sdahMWZZTQPeP17kiWLU0YKQLwyootUhMWZpohY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ye4zONdpCeD/Z61Lewi/pwFy4URYKzicodjVdo5WLqzuO4uVWocrSWtCMKjB+drWz5dGrgU9xdUeQwhMpcEcbo+0vnGC/3QfKLMsg8GPt/XAqchJXa5tDAcaCqDm3WuGeQOIsSIgF7saON2VGnTZ/TcAF1SK9krfcktylFouQik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFr2qy3P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394221F000E9;
	Fri, 22 May 2026 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445125;
	bh=dH5gWDSmYByXyG2JuND8wj6TGzWAjvFonp0Pwdsi5N8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mFr2qy3P5R7exMaryITydrGH+J4pFwwf1e9wdQYYKKQT+w+g71bdQZTiNmFfH3IvG
	 +N78wUfzAawz7H47mzSJvAphKt9jJx8rg7v2+XRW56KxMalTnr1MLFNEw4qJCcdV2S
	 WBBpNFr34AFwKztaY7OHel85v4VYtBdj2dmj956cm/xYRzhUU6Xf1GTzYFN0YBSKlm
	 D5SRPHUlRDkO51zXD4vnZ3TWaEhnB59mib9SxrILTs7rAX1vuJoyj5YvqC9WHP31x6
	 orhcOJZAWtruCtrOQGZPWYNoLtp5iNRpHS9m7yHDLEgj7WyQjhhKwaNf16zOwBqwdm
	 o7qq+b4i/pv8A==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH 07/17] i3c: renesas: Perform Dynamic Address Assignment on resume
Date: Fri, 22 May 2026 13:18:05 +0300
Message-ID: <20260522101815.1722909-8-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
References: <20260522101815.1722909-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32938-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9153F5B1FF4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC supports a power saving mode where power to most
SoC components, including I3C, is turned off.

On systems where the I3C devices also loses power during suspend (e.g. NXP
P3T1085UK-ARD connected to the PMOD1_6A connector of the RZ SMARC Carrier
2 + Renesas RZ/G3S SMARC SOM), the devices becomes unreachable after
resume.

Running DAA in the controller resume path restores communication. However,
DAA relies on interrupts for TX/RX, which are not available in the noirq
suspend/resume phase (unless they are wakeup interrupts). For this, the
suspend/resume callbacks were moved out of the noirq phase. Currently,
there is no identified use case on either the Renesas RZ/G3S or Renesas
RZ/G3E SoCs that requires the controller suspend/resume hooks to be part of
the noirq suspend/resume phase.

Along with this, struct renesas_i3c::DATBASn and its usage were removed,
as they are no longer needed.

Fixes: e7218986319b ("i3c: renesas: Add suspend/resume support")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 34 ++++++++++++--------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 2f3c6ddf75c0..c009d0de6a2b 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -265,7 +265,6 @@ struct renesas_i3c {
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
-	u32 *DATBASn;
 	struct clk_bulk_data *clks;
 	struct reset_control *presetn;
 	struct reset_control *tresetn;
@@ -1400,12 +1399,6 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	i3c->maxdevs = RENESAS_I3C_MAX_DEVS;
 	i3c->free_pos = GENMASK(i3c->maxdevs - 1, 0);
 
-	/* Allocate dynamic Device Address Table backup. */
-	i3c->DATBASn = devm_kzalloc(&pdev->dev, sizeof(u32) * i3c->maxdevs,
-				    GFP_KERNEL);
-	if (!i3c->DATBASn)
-		return -ENOMEM;
-
 	return i3c_master_register(&i3c->base, &pdev->dev, &renesas_i3c_ops, false);
 }
 
@@ -1416,17 +1409,13 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
-static int renesas_i3c_suspend_noirq(struct device *dev)
+static int renesas_i3c_suspend(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
-	int i, ret;
+	int ret;
 
 	i2c_mark_adapter_suspended(&i3c->base.i2c);
 
-	/* Store Device Address Table values. */
-	for (i = 0; i < i3c->maxdevs; i++)
-		i3c->DATBASn[i] = renesas_readl(i3c->regs, DATBAS(i));
-
 	ret = reset_control_assert(i3c->presetn);
 	if (ret)
 		goto err_mark_resumed;
@@ -1447,10 +1436,10 @@ static int renesas_i3c_suspend_noirq(struct device *dev)
 	return ret;
 }
 
-static int renesas_i3c_resume_noirq(struct device *dev)
+static int renesas_i3c_resume(struct device *dev)
 {
 	struct renesas_i3c *i3c = dev_get_drvdata(dev);
-	int i, ret;
+	int ret;
 
 	ret = reset_control_deassert(i3c->tresetn);
 	if (ret)
@@ -1476,15 +1465,19 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 	renesas_writel(i3c->regs, MSDVAD, MSDVAD_MDYADV |
 		       MSDVAD_MDYAD(i3c->dyn_addr));
 
-	/* Restore Device Address Table values. */
-	for (i = 0; i < i3c->maxdevs; i++)
-		renesas_writel(i3c->regs, DATBAS(i), i3c->DATBASn[i]);
-
 	/* I3C hw init. */
 	renesas_i3c_hw_init(i3c);
 
 	i2c_mark_adapter_resumed(&i3c->base.i2c);
 
+	ret = i3c_master_do_daa_ext(&i3c->base, true);
+	if (ret)
+		dev_err(dev, "DAA failed on resume, ret=%d", ret);
+
+	/*
+	 * I3C devices may have retained their dynamic address anyway. Do not
+	 * fail the resume because of DAA error.
+	 */
 	return 0;
 
 err_clks_disable:
@@ -1497,8 +1490,7 @@ static int renesas_i3c_resume_noirq(struct device *dev)
 }
 
 static const struct dev_pm_ops renesas_i3c_pm_ops = {
-	NOIRQ_SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend_noirq,
-				  renesas_i3c_resume_noirq)
+	SYSTEM_SLEEP_PM_OPS(renesas_i3c_suspend, renesas_i3c_resume)
 };
 
 static const struct of_device_id renesas_i3c_of_ids[] = {
-- 
2.43.0


