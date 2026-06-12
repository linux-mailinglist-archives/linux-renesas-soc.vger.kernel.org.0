Return-Path: <linux-renesas-soc+bounces-33930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YaAqNUQYLGorLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:31:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8CA67A315
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:31:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nZYkZ7bg;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61EFB30098A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97163921E6;
	Fri, 12 Jun 2026 14:30:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEB538F659
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:30:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274658; cv=none; b=kqwGZej4/3exeouiq+BRWM1N8zgkJePEjnPwftwGY2GzK7lPkee/F+exgbA2anhttckiap5oG0OHqie6ffdViKMpg460bnGE8H0YZMMMsTT0WpHqzdZIDg6aqOv0HrziJ6EuXYhD67Rqncxzf2KFakFlsDsG0ZZjc6qKR5J2qno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274658; c=relaxed/simple;
	bh=prPb77bzuFsgEVbCEdzCjbQqs2oYnaC88EXn5aG0U/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FR1NgfE1K56MRl3wAopFAZjjjiPhyJDmmVa9KnxEcxIG75+xAmBTSF+zqq+ntzxsosf68uv90OFlI2Zl67pGKlTc0wAMC1J7gPFqNSuWjo80puOWW9F9324bZIMtswkh+nOpZyvWp3TXl5xn9Sfr+5puO7HQJknNAlBe6LLlaWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZYkZ7bg; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef779c1c2so805153f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274656; x=1781879456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO4p8825Nx3gt/7ueyQ1mfnwrroXv2HPDHtunohJUpA=;
        b=nZYkZ7bgmFSmDEQAa3ut/k5hvYHVcFoR0x7HI1BJcfm1Gq028Lov8O/jGWQBSb+mZC
         KG2bGTi+vI3yIh7DzxMzPuvgJIlRyaezhGW2hSj4KVVR9519eR5MmBCjRnfZjDNxI0Qh
         BlklGj65bIbcAXoRtoksA4YtVEn/scC5zleyDrvfxD7HHTQAgWA6LlZMZTnHfkvmHE+E
         8JncGpRL+tPNILULTInx6o9Ow0JLioU4YSIHE3p44OXPoUv0nO0sSeh9cc7pl0hiqwij
         QH7+l8BH6a24HVGx0QbV9LlGUoXQ6Z70lEKpDQTL943Y5xUmoAoTArL5Lff4nXtEEfN8
         VfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274656; x=1781879456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YO4p8825Nx3gt/7ueyQ1mfnwrroXv2HPDHtunohJUpA=;
        b=kDjvqR7sOqvNyXbrR1U1x+sTO38k/jAEJCn4nDQrBO/pY+IGIYQbEsk2s30qSmivXv
         yrcLAHcYXhmB2BvxGN7DUyapJ87uRCZ0j8/wLSjQaGSMj06CJKLXigiLebmclJxWnc+l
         rnYNAwWwwZ3jjCc+PNi5Qw0RxAzWC1k6bsGNQlKBBOS7iXh8a/xJoroB5HcGZdAcZU/L
         UXT4aARSGep6GdPEwHpMIvtjrgBh7tvwpWxur/+gMOycbOcI9/Vv7ltfT878exAUe1da
         tPcyW22FD/rOxp8QUoXi4DW977XxIQPpwnCZ8HauRMy6hpISIh89lzvCx3Mroine6ThK
         3r8g==
X-Forwarded-Encrypted: i=1; AFNElJ+AOtObK7x7JSu4stPt2BFk4W9FuiNcNnzGco0p7ugAnKxPXLjjtjTHIuw+hwgtxs8BMMOUj7wr9QCLszIPetMYJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQs0JUJDwno2qgoXAT37zGbvTHflBoVqQnDrmI9LUbimdJTGgo
	uy/fke+Xdo2bhB1eSzqqVbhek92dwSUpc2O9QVc+rTurM1iaHzbEoZi/
X-Gm-Gg: Acq92OHvkEYogh+jsOTWp2mULhXhahqtkhPZiPhGEOVBVitfh37UJ81fFuebgYf2wmN
	dQdAXbY2B0/oYAizi/q4w2p6xCMVk0aVkePfCRxhPINjdnwFHEWs6xABD7Xx99aumLLHWp0d9Qu
	dE+gXJlSTMahkd4ESs99WAySpUdg1ob4A9g9qxLrp6UkMUCtDL+kjGktEntarGOkiz3YFV6DOwG
	hX5LXhqsu+Bthx/PXgnIQSJJqzZMfC+jrVCpMmY4JrnJ6Ooi5Bz1azFjyOdr99QV4o+WA15Wz44
	azJ463uDTHu8BcfCxY+gco90jkNUAsCzdLnBz734TgifIea0ZZWsBuUbgx90CmP2cQtKoKQbT/S
	XA/rmm9M2I5TW1DRR+uWBLZLno61k80n/motE4fvsLo406EQCbfksfzShV5sih656mitRZyTLqi
	rL6DJImc9HEuJ3JS6wjP04tFXTSj4TVt+75H09ircm5ZDPNdRD
X-Received: by 2002:a05:6000:2dc2:b0:460:30bd:4dca with SMTP id ffacd0b85a97d-4606dba0652mr4141912f8f.30.1781274655581;
        Fri, 12 Jun 2026 07:30:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:55 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 04/11] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Fri, 12 Jun 2026 15:30:32 +0100
Message-ID: <20260612143048.317907-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33930-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B8CA67A315

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the integer flag RZG2L_USBPHY_CTRL_PWRRDY with a structured
rzg2l_usbphy_ctrl_info type to hold per-compatible configuration data.

The new struct carries the regulator driver name and a pwr_rdy flag,
allowing the probe function to conditionally call
rzg2l_usbphy_ctrl_pwrrdy_init() based on the matched device data rather
than casting match data to an integer.

This restructuring makes it easier to extend per-variant configuration
in a follow-up patch to support the RZ/G3L SoC, which has 2 VBUS
regulators.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 38 +++++++++++++++----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index fd75d9601a3b..1c4c8aae0e80 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -41,6 +41,11 @@ struct rzg2l_usbphy_ctrl_priv {
 	spinlock_t lock;
 };
 
+struct rzg2l_usbphy_ctrl_info {
+	const char *regulator_driver_name;
+	bool pwrrdy;
+};
+
 #define rcdev_to_priv(x)	container_of(x, struct rzg2l_usbphy_ctrl_priv, rcdev)
 
 static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
@@ -106,14 +111,18 @@ static void rzg2l_usbphy_ctrl_init(struct rzg2l_usbphy_ctrl_priv *priv)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
-#define RZG2L_USBPHY_CTRL_PWRRDY	1
+static const struct rzg2l_usbphy_ctrl_info rzg2l_info = {
+	.regulator_driver_name = "rzg2l-usb-vbus-regulator",
+};
+
+static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
+	.regulator_driver_name = "rzg2l-usb-vbus-regulator",
+	.pwrrdy = true,
+};
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
-	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
-	{
-		.compatible = "renesas,r9a08g045-usbphy-ctrl",
-		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
-	},
+	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
+	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
@@ -153,14 +162,9 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 {
 	struct reg_field field;
 	struct regmap *regmap;
-	const int *data;
 	u32 args[2];
 	int ret;
 
-	data = device_get_match_data(dev);
-	if ((uintptr_t)data != RZG2L_USBPHY_CTRL_PWRRDY)
-		return 0;
-
 	regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node,
 						      "renesas,sysc-pwrrdy",
 						      ARRAY_SIZE(args), args);
@@ -188,6 +192,7 @@ static int rzg2l_usbphy_ctrl_pwrrdy_init(struct device *dev,
 
 static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 {
+	const struct rzg2l_usbphy_ctrl_info *info;
 	struct device *dev = &pdev->dev;
 	struct rzg2l_usbphy_ctrl_priv *priv;
 	struct platform_device *vdev;
@@ -206,9 +211,12 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
-	if (error)
-		return error;
+	info = device_get_match_data(dev);
+	if (info->pwrrdy) {
+		error = rzg2l_usbphy_ctrl_pwrrdy_init(dev, priv);
+		if (error)
+			return error;
+	}
 
 	priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->rstc))
@@ -241,7 +249,7 @@ static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev)
 	if (error)
 		goto err_pm_runtime_put;
 
-	vdev = platform_device_alloc("rzg2l-usb-vbus-regulator", pdev->id);
+	vdev = platform_device_alloc(info->regulator_driver_name, pdev->id);
 	if (!vdev) {
 		error = -ENOMEM;
 		goto err_pm_runtime_put;
-- 
2.43.0


