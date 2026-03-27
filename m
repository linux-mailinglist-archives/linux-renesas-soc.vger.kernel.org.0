Return-Path: <linux-renesas-soc+bounces-30485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFhiIAXaxmkoPQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:27:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7734A179
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 20:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BD65306C845
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 19:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E37337C11E;
	Fri, 27 Mar 2026 19:25:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BB235CB6C;
	Fri, 27 Mar 2026 19:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774639546; cv=none; b=r9ib/3p1vvzdz5f1Q7VSaOezIlzZAqzfhsh9nly6OhrN7r3fLz1dbHj+j9GS/8gGDCA9zcj6ZceRmu0ovjdzHQN7UaqeeaHJsbwSAWRF5rCoIN/tbkdz5DglAj4YhBL/QN+b5cjO1Fx1g0n31g4doM5BB9jNL0P6gLIA/uQcDWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774639546; c=relaxed/simple;
	bh=3ICLqsC4q9QDP/KBX/AS8XVL3ois5jovdQ/OyC7baBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SRKJZW7fW0pzia/WGXWhGPyb/hFt4dAGuHETeNghUenVmbHHcqWdi/NlYrZcdx2HZL7qD4VhSyCQyO1rysNVIj9pvzXyHRx5YO5oatF8Y64VB9r9bIXBJP137cMvM7HomDlaADZvSugLqm+hThhyc//IDmkaF9Jw/ly2VVE38IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 056kSbUGSpyXuKTxXDUr3Q==
X-CSE-MsgGUID: 8gaBk8mPS664cn5T5cJa8Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Mar 2026 04:25:44 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E07DC4015D6E;
	Sat, 28 Mar 2026 04:25:38 +0900 (JST)
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
Subject: [PATCH 04/11] mfd: rz-mtu3: store &pdev->dev in local variable
Date: Fri, 27 Mar 2026 21:24:18 +0200
Message-ID: <20260327192425.438263-5-cosmin-gabriel.tanislav.xa@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30485-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19F7734A179
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

&pdev->dev is accessed multiple times during probe. Store it in a local
variable and use that to simplify the code.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/mfd/rz-mtu3.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 3be6f6c900b8..37d12030e069 100644
--- a/drivers/mfd/rz-mtu3.c
+++ b/drivers/mfd/rz-mtu3.c
@@ -311,16 +311,17 @@ static const struct mfd_cell rz_mtu3_devs[] = {
 
 static int rz_mtu3_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct reset_control *rstc;
 	struct rz_mtu3_priv *priv;
 	struct rz_mtu3 *ddata;
 	unsigned int i;
 
-	ddata = devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
+	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
 	if (!ddata)
 		return -ENOMEM;
 
-	ddata->priv_data = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	ddata->priv_data = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!ddata->priv_data)
 		return -ENOMEM;
 
@@ -330,11 +331,11 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->mmio))
 		return PTR_ERR(priv->mmio);
 
-	rstc = devm_reset_control_get_exclusive_deasserted(&pdev->dev, NULL);
+	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return PTR_ERR(rstc);
 
-	ddata->clk = devm_clk_get(&pdev->dev, NULL);
+	ddata->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(ddata->clk))
 		return PTR_ERR(ddata->clk);
 
@@ -347,7 +348,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
 		mutex_init(&ddata->channels[i].lock);
 	}
 
-	return devm_mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
+	return devm_mfd_add_devices(dev, 0, rz_mtu3_devs,
 				    ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
 }
 
-- 
2.53.0


