Return-Path: <linux-renesas-soc+bounces-30483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ+mIc3axmkoPQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:30:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F34D434A265
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 95C6030D3E7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FF9372ED5;
	Fri, 27 Mar 2026 19:25:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CD72C08C4;
	Fri, 27 Mar 2026 19:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639534; cv=none; b=ZuGKC6vtkKKqbbvDHqyaV3iT28yVDtV9ioru9f75TE9Ah6wHjdVyClkWXZcgqi4LyEMlJYDwnGKnvac0frRNSUsdSy1ttPKVep+taaFv6k17kwyjWL3Y8j0X8zP8qxVShf32GDKRsObyjjfKRIGCCad95hJiEL7+ZKSXi42zOe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639534; c=relaxed/simple;
	bh=C8UOKn2Aaay6QDnHkkKDWhYI4S0mNqduFiz3PCnt7Ws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XtETYBHja0ZcE9K1Du18LxmGQvzLuhAwQyaycYlU9scEuaL0XNmhVj03JZp0y2dzpRTtXUStvjr0kOAEYhgn45d1N1/tn4hWok0R2f2gb1SebhM/PFJmMDEhRdeU0kjQP1l/sKTjRoDm5YDYFWrdr9u5/XbYwRaBlbWCwqJG44M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: o0hheJO/TgabA47BVGm9Rw==
X-CSE-MsgGUID: DMMOtvOCS8ivCTg9g1S2Rg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Mar 2026 04:25:31 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 295144015D6E;
	Sat, 28 Mar 2026 04:25:25 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH 02/11] mfd: rz-mtu3: use device-managed reset deassert
Date: Fri, 27 Mar 2026 21:24:16 +0200
Message-ID: <20260327192425.438263-3-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327192425.438263-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260327192425.438263-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30483-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F34D434A265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace devm_reset_control_get_exclusive() and the manual
reset_control_deassert()/reset_control_assert() with handling by
devm_reset_control_get_exclusive_deasserted().

While at it, remove struct rz_mtu3_priv::rstc and use a local variable
for it as it is not needed inside rz_mtu3_reset_assert().

Rename rz_mtu3_reset_assert() to rz_mtu3_mfd_remove() to accurately
describe its usage since it no longer calls reset_control_assert().

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/mfd/rz-mtu3.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 9cdfef610398..6b9c6831dffa 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -21,7 +21,6 @@
 
 struct rz_mtu3_priv {
 	void __iomem *mmio;
-	struct reset_control *rstc;
 	spinlock_t lock;
 };
 
@@ -301,13 +300,9 @@ void rz_mtu3_disable(struct rz_mtu3_channel *ch)
 }
 EXPORT_SYMBOL_GPL(rz_mtu3_disable);
 
-static void rz_mtu3_reset_assert(void *data)
+static void rz_mtu3_mfd_remove(void *data)
 {
-	struct rz_mtu3 *mtu = dev_get_drvdata(data);
-	struct rz_mtu3_priv *priv = mtu->priv_data;
-
 	mfd_remove_devices(data);
-	reset_control_assert(priv->rstc);
 }
 
 static const struct mfd_cell rz_mtu3_devs[] = {
@@ -321,6 +316,7 @@ static const struct mfd_cell rz_mtu3_devs[] = {
 
 static int rz_mtu3_probe(struct platform_device *pdev)
 {
+	struct reset_control *rstc;
 	struct rz_mtu3_priv *priv;
 	struct rz_mtu3 *ddata;
 	unsigned int i;
@@ -340,15 +336,14 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->mmio))
 		return PTR_ERR(priv->mmio);
 
-	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(priv->rstc))
-		return PTR_ERR(priv->rstc);
+	rstc = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(rstc))
+		return PTR_ERR(rstc);
 
 	ddata->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(ddata->clk))
 		return PTR_ERR(ddata->clk);
 
-	reset_control_deassert(priv->rstc);
 	spin_lock_init(&priv->lock);
 	platform_set_drvdata(pdev, ddata);
 
@@ -361,14 +356,10 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 	ret = mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
 			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
 	if (ret < 0)
-		goto err_assert;
+		return ret;
 
-	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
+	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_mfd_remove,
 					&pdev->dev);
-
-err_assert:
-	reset_control_assert(priv->rstc);
-	return ret;
 }
 
 static const struct of_device_id rz_mtu3_of_match[] = {
-- 
2.53.0


