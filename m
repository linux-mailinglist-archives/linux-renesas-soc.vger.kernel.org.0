Return-Path: <linux-renesas-soc+bounces-34814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A5iKMdkSTWqPugEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:53:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3053E71CDE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:53:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=J9coqu1J;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A77F4309D651
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B600742F6F0;
	Tue,  7 Jul 2026 14:36:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C93F42CB15
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435015; cv=none; b=ixMRf5Xx6hbxPd+gHki0R2J07ylUKGWvUXzRV66EeN4mDpIDjTf/S5Bhrvb8QuPPOpnh3n+d8PU3x16fuUUlFUhSDQVFHIBrsL+kfqIbk/VRCerXmcR57QzNDVT4clszKlksNsJ4fYOLE25K97qv1gDqVHOzSZVJLeZxhMJCzrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435015; c=relaxed/simple;
	bh=Rttz1SPB/z2h4VMrAC1qoI6JnKopExzMgpRmflittlc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1UC+GsqJJU8soYvGMk8ExHV34NAYY2y95E/cGGS6DVgp6ht8XSr/KZH7l+mUjrZRs+vfy0RuxiCYNnPtSTmVvsjtfmi5RErZ7FyHcxz0k71JwFMJCprECpVVPkFYK0IBuIPmV6zCmvr7TFvTYN1hOtQP2SYaE/EXxAMfCOxnpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9coqu1J; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1587415f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435012; x=1784039812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LC0soLCuMtBfN6/za3UxVxyIt+5Dqhpc6U0ZaPutI0g=;
        b=J9coqu1J4Sm8riq8ZTs6coWVxIbnRjeee6h07n/yBPBnAqvjYqH2QqIFWyI5EGvMJa
         JjBUtkdhQrZ/sB+ksJZgqjbhaIvnoiZYZPGZ1PhgxlbJkOi69Jh4MGyMjLAZ/tBwSN3Q
         AHm8gyKSWATZnjrhSXzmKfsYz3ijaXCz3MgamthgDO+KjNRii89gc2dz7OWgrepVDWnD
         RgsrbrRoPm10whKEN1AwLfrySdPypqBSW5zgVdl75ubwrPneGYtyBBABmX7+Z2sdkxVE
         8fqB+wDUrl6H7fhulJgu4+vaiAnHDhMKkyJcDcP/tLUDpnxfa1RbjCttOMlJIBzVfhIn
         vu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435012; x=1784039812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LC0soLCuMtBfN6/za3UxVxyIt+5Dqhpc6U0ZaPutI0g=;
        b=B3t3s4bbksS97Lfg07dI/GWVlD884PS7E3o+t65UDrMEzTsjMHDgIhZbh45XKsH+X7
         hc3DupsdMwmMFmxZRSP+NRRv0NEMchicFUK+jicqJt25b8YPiSOxFtovP9gRhc3ZMyPu
         8yOrr41/a77ZBLBRZAP5ftwlJ0nRXra30GXjCYtL/mIRSFEQno1a9+Ywz8UlmxPJf27D
         QyLo6zKU1BrjI5tvoQWGymDJw4B6xsip3NLgAiYGLsW6psiA8SYfrY423CQDgdTUaHNA
         ynGsea1SyVa6KSLaqrIZzpW3aRPBktHpq8ltwvRuKSlWDJVMhDNXYr0JFVp54pc5XNFy
         oaQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrq9qs1XqmIP9UTdTjlRUZxl4XmPgV5JI4rOYhpenFLxc2akrHFQKtveZMPFAIB9NDIqKO073Sz8xSFZdr5E82pcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNJFEJeLZTYzwAug4Xafl2ji9//RtQimdjmrpxynKYHukENbfV
	jHYhPqp03jtnvAU/UumbFB+09F62vPz7tXA9haNuzLKsJK99jjOUzz+v
X-Gm-Gg: AfdE7cmmdRsINzdMGwJam+4KkpF4+YHDMrkWD93Y8Fw+7SyJ3yQ7vItIO4BATJIWdGR
	FAvmXHhSzEbMTViCrLAGPX2drAfgF2PJ1ClOM+zXJTBSdz5zq0tWAOnNGVn2cIVDMXWD6+jcRv7
	YtLiN77Calosd2YmlsZhaiqRK1yli2waxPnHbOTbCchu1HjOxN1Ny6Qg6fo8x+Sp7xhQQZv922W
	D4ENr1cbs3jLcQSKG6o7pvGEx3vws4wirlazgz0sn5ciq22Efk6YDUW5BBKALmrx6O+Ry0Z847w
	2nCdKCco5Jz/lOUtBvtJgRGNXiqP4iBqGXk+H16uAlkHLST3f2Q1T+9Om86vpbf9W23nr8vVqiU
	5mg1Rp6L/YGduqxSbiXpb/8uTTGJxLnqLwuvxljUpGH/1Ya1uRbVWfywig6s4pblDP25GwTH06P
	93UPWKBbjT3g3xDICNni92KzWPIY68XpTHm7aKMYgjcDZHqT7L
X-Received: by 2002:a05:6000:4b0f:b0:47d:ee7a:9306 with SMTP id ffacd0b85a97d-47dee7a93fbmr306931f8f.61.1783435011654;
        Tue, 07 Jul 2026 07:36:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:51 -0700 (PDT)
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
Subject: [PATCH v3 3/9] reset: rzg2l-usbphy-ctrl: Introduce info struct for match data
Date: Tue,  7 Jul 2026 15:36:35 +0100
Message-ID: <20260707143646.245177-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34814-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3053E71CDE1

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
v2->v3:
  No change.
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


