Return-Path: <linux-renesas-soc+bounces-31154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIMnHmYn2WkPmwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:37:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E33DA7BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 18:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EEA93018193
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB0A3DE431;
	Fri, 10 Apr 2026 16:36:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAC33DDDAE;
	Fri, 10 Apr 2026 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839014; cv=none; b=HTjfYpWmK9G4RSOIypTry+tuDEwaFhJuY2S1BcZ4G/fJOI55WlIWltjeZ+KFsTjdRVQbI6RSFavHNP9farXrwgVKVi9aXbSnvKJfrAJtts3p5R5YYMbf5oFsIk6uJSYHaqrt+oXbuqZBG4beQA6IOnftqQMuCE8DaxxSf+r41P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839014; c=relaxed/simple;
	bh=B4hUufRNFgQN0hy0TRy8xXHLJ43QbL4CrUuOnv7iVjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=St/qU5Duf9ZOcMt3D/jwhYxJbpWpgL/X6+/gvbsdouDghOwvmGqby8iL5sY4cFIth8iaY2X5JIWzPmWpfI3uvQWvDjsTpx5+CTsaiZ7B3nvGjEj8talPcWaZHm0ag9v//SBFivYmmZWMeGIOx7ohs5QUR2C/zBMRt9R5OWCklyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: QmbUTCxfRjSVsz9bQsQa/w==
X-CSE-MsgGUID: RtP9fG2wSymjKuJlgeG4+A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Apr 2026 01:36:49 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.85])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8DCEC400CD4C;
	Sat, 11 Apr 2026 01:36:43 +0900 (JST)
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
Subject: [PATCH v2 04/10] mfd: rz-mtu3: store &pdev->dev in local variable
Date: Fri, 10 Apr 2026 19:35:24 +0300
Message-ID: <20260410163530.383818-5-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31154-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 237E33DA7BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

&pdev->dev is accessed multiple times during probe. Store it in a local
variable and use that to simplify the code.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * no changes

 drivers/mfd/rz-mtu3.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
index 3be6f6c900b82..37d12030e069c 100644
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

