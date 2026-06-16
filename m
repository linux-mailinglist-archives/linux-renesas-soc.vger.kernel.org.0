Return-Path: <linux-renesas-soc+bounces-34067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CbzxFMkpMWrzcwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:47:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F3468E721
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:47:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HpcXbpIq;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34067-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A00BB3169F9B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 10:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033EF43C054;
	Tue, 16 Jun 2026 10:45:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0B436367
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606715; cv=none; b=DL66vHxjZlZuA7Imda9SHxJOIsiTRRwg/8dstCPrLwzorXHKMCj3Pq+H7cCm8EeIOs3Z2QnZJ3qrN55Ju296gEWv58uqZNyVRxq4nuvo61nAHP29hWRGy4I8cIfBOBz6NxY7pejafWwbEpS7cDYd1JV1rG89y/xLz9C6mMo0wEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606715; c=relaxed/simple;
	bh=w3J9KqiQCykUGZiPgDXXUsjftYPqpgvKG4WicPfgWV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hj5TH2YpfIbo03wC8sdiJpznAOsDWHB1613WJWT1joQeHNHZCPxQrIe1CsTiK8INVOFmmf9p+2UWQHtTFh8WMSP/cxfxJS1tTb9h4lBoOHlQbjWd4e22VyjKqXAUDKPvAJ5XLYmesy0qezKcaQ/7GkuIMysxB3rqK80OX2WjAik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpcXbpIq; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490c1915793so37426305e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606707; x=1782211507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EFnNWdby79NbeR1N2gYccq9ciWH9Vvhj+R5i4xBY58=;
        b=HpcXbpIq2JpiDnW5e1pGW+ynj/dLYAY4hrWnVEWWWw+CelZZS6AoMq3CMxiZt54BFK
         rOfv0/29C+BBkjl5TzHlL/2Q+NtOoYprbB6n+QVYdatEwKcvOBCa9Hd5amAdvWWypDUK
         JHIx3tDt6iRqCLssflhDrV+4nRpkiY3xkZx/Yf8lMRiLWow1AdHHHkhlKFsA2bvIY00G
         KyfOoo1vr9fPFvvrq6htFFp70gVy8w8YMRPvwdNB4q9s4v2yM86c7SOmMgrbF8RmHWqH
         Y6oHWHeU+e8+Ic3kvteX6U3qPH8rzZv0bN8iwTQg8ybdIt44SzCMRkJGyz8NPI1ZryTI
         bedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606707; x=1782211507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2EFnNWdby79NbeR1N2gYccq9ciWH9Vvhj+R5i4xBY58=;
        b=PJFjafQehN4mi6F0Nvrtk20shSrIvQGmYnvkG8E0WR/oDKONjtP4g8KhK/UR+MnPgG
         a33Qn+ON5QAS7mgxJQ6XoMMuPVF+C268BBdjus7yx2/3W+iNs4AWi7bPGr8tFAqMzAVd
         y3N5H4qBO01Mp6vvEX561Qr3cSOJAsppvwSzzGHy2mBvh76w3zJOp0cOORvMgRsyLe6i
         b98AeGKwtkqjh2nwYWujbge/Gy2gPkFB6JS1Jk002ERAltREPzWQO6lEC+3GawQ0Gclq
         bo44/VGyJxMIuYQj4ggdMh9Z5s4+HoesGX5Ze7J+TNAQ3uG9qKfvxz67GukaHR1tMfGX
         1Idw==
X-Forwarded-Encrypted: i=1; AFNElJ8Q+jcUY6FNkXjPI63WEtuax6Ju71um6w7HNHMNQe7IO8WP7QW+Xo+gI1hrwo564/WP/CygfE/bI3rCefJmmXRxmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2Nyq3A+eDJ+lOZjKEnP24iOh90gzXHY63EIxqasZBiIhERbm
	0cEAg+awy3JpDO0Arvpqq9/nmwl3Lwd5yzN3uu+VwJRssLQ5BV7pNJHc
X-Gm-Gg: Acq92OGcA1uhQBkteOk8i7lqIY3AkMRakh73blNEWGs4Bn8gO9x6QIWj5HXjIFDO7AL
	B4BoDz3dPpe8hhkNUaZgM5x3ZUaIgU61UTN1PUzOdJhKK3Jf0Z0mGFZgCgMXTOkRwYY72gTI4zR
	7/M9Pg0G3j05xuzve09jLrVonUgNS3IHCFepJVMTWnD0W5vri0VrekM9j8mJ09MZ5E+oLbuhavu
	WG2NnsE3o898b+quMa3lkRWtEn0k2lGxlCAD1bfQ+niNBPGfbAzVnvDnW9PshfzK3Kum4F+Jc6h
	MtVnMUxIwf/Xwh8XLmRQl9x7dIfeTCRvitw3yhePTnaFE6ezYNO5l5zp/3noKl5Ph1Pr5U+daab
	LaM36Nn8ATdMLoUM4jGIPQL3F8EUFxyHUyy11XKVAAKIZMhwbD+pkvEB6B2Jxa8luPlQeo3XtwK
	A6SYdNNiOhMNil/64PAROvJg3cu1ROWYbz2OVC4rt+fuMpczGt
X-Received: by 2002:a05:600c:820c:b0:490:4b89:5361 with SMTP id 5b1f17b1804b1-490ec4c5984mr242363675e9.7.1781606706702;
        Tue, 16 Jun 2026 03:45:06 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:06 -0700 (PDT)
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
Subject: [PATCH v2 04/10] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Tue, 16 Jun 2026 11:44:46 +0100
Message-ID: <20260616104459.410743-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34067-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0F3468E721

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the integer flag RZG2L_USBPHY_CTRL_PWRRDY with a structured
rzg2l_usbphy_ctrl_info type to hold per-compatible configuration data.

The new struct carries a regulator_driver_name string and a pwrrdy
boolean. The probe function now retrieves this struct via
device_get_match_data() and conditionally calls
rzg2l_usbphy_ctrl_pwrrdy_init() based on the pwrrdy flag, removing
the previous integer cast approach.

This refactoring prepares the driver for RZ/G3L (r9a08g046) support,
which requires a different regulator configuration with two per-port
VBUS regulators.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description.
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


