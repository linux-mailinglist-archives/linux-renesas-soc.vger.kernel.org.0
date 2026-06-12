Return-Path: <linux-renesas-soc+bounces-33933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oxbqFogYLGpCLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:32:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF4B67A336
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:32:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=C0k3Npvx;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B4B983006D71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5773E3A7F40;
	Fri, 12 Jun 2026 14:31:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2260394798
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:30:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274661; cv=none; b=NOXhMjKZKW82RIueD9AuGts0iXhNJAxYAbz0Rf9dMeMVmKf2c9kWMTDBtV3SGrmuzdHfIJ6cEXnBZ8gI5tGC+CCAlkcvmrP6IVpkPeg54Hy9/v8uwvHaLGtj85MfUChUiAR3b8JEEOpc8ZGM4wM0zjOMm9vVG04oFnlraYT3JN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274661; c=relaxed/simple;
	bh=o16FdZkLpgpjGm3cXc5Y8RdEBCqXZNgENwMFXRRpkNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sLnBhdzsypK1MHGFb9Coex+wb+szs/S/xG4dQQrz/is0QWFY9LyPj9gMWbG/UT/64DK8DXlHMKAzMEatqlIHfCRectCEfLw3UfS6uSDaz+kwoATUJPenhHzsF4o1dD3xl8pyELahJscciyLIuKC+mpgLPt42EXBp2tgc3vCDh6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0k3Npvx; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eee266c6cso935866f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274658; x=1781879458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FDKMOIxKn4AoGs1v789cKRGd16F8QDM2JHSO79Z/OU=;
        b=C0k3NpvxVCIDES4sUltUYMKt5v9GmVgzmq48sBKAwi0MPFxnNGoHraxnNU51luE8+N
         TyicxF6BA0dgncZjnE8G+ObAzvH9tmUCFQRSR+SBKgErVvxxZ1AA36BlTGksJAwK4X7d
         bol4VqM+3narAkwjvrVbvz+NCQSpZn12lQEgk1Cko6u7lVeQT7W9Oa7el6RNV5uQzH1L
         TKMTPnZoKp8RWcpX17Zvw5AfltCAVvic7P1JAVIc1My7ALvs59rAQKwwQjlPlz9E43tP
         9izequniymEagOWoy2QwF+ZF64Hkfs8m4NqOSwBWmU3WJYUFbEVQL3D4RcXsIomhKFV+
         n5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274658; x=1781879458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0FDKMOIxKn4AoGs1v789cKRGd16F8QDM2JHSO79Z/OU=;
        b=WUYHDEPE2GvjBcR3jMO7EPL1e4nC2ICQNtNMoMjlSZi/2MRp+RDPbB3uKtK5PuR8h/
         dMWozy4pgKQPW6/5wh6l8Etj8nD+nNMKdHT/P5Vcu8JHCglc8kqx8X1CNI+ZMn8C2oMs
         X3Da4PEgUlcMJG5YIpe4qgtYSGoe/SV/K1CRt4sX3NCHyXcEJ9ax4OcJKBSMMP3wfipk
         7/P/sClXamyT7fAZ6FOOHeX3WiMGoeoO6yCcIm0MOSco9Ycz48JBjfP3v3RerUkXmk3O
         ejMo2TDu+89Z1J+MIsGh5dIFslpFp0pheFwuyRwPcax++idd05j+SAnBzID8n/uAQM/5
         Nl3Q==
X-Forwarded-Encrypted: i=1; AFNElJ99nqZKs54Qc5ZmQBm6O33DUxcBQnzIR+h4Xno/7nXTgBwv0RrHRNJ2GWWEH8OIH6tx4SNgMy6k0hewr99mb7Y0Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZ/BAyqwPZRvNhxu0Qidn3Ow5T5rtCLv0lymZ9ZXheDhSk2ZK
	iTMLXsjFiIwzyPuI390yAhEJTIWBBitTi39iTQwkYkw4ZM1UOEPj9DP4
X-Gm-Gg: Acq92OEOb1Ozn8oB/kcR9p4PYBWXBMMjIW74IHOu+yDWH+PKW+/0wQ96DBAvhcrQoj2
	ecQJZkNzFrEqut7W5sZzk6MLHxZK+mht4tVFkgNIhVr53S335KAJvadXRbvacOru1uyN1BXJMAC
	MAPp+wRDymUv5EyshW3PmnoQJd+B8tAl9a4+vdAPtatzDJzotMaR5rpVAoPmb8qQ/3n3PNBmRC+
	R3IyVH0Sp5A8dhF2y0k8R7sy+MJBnNaCOCPBZ2xV3hw7kdrVhFHHVoGJ2yOGFW7q05ACuL9xxtI
	zqvQuN3A/xSZlmAoJzHnt6Ffu61cmKxRqsUPlitb0Itqyg/fehKS9qbw5pP6xeoMK3Nh5RJ5LOz
	cxGbysVkZ3z62rynsrT7lC5v6CPJ4btUFjmV1wR//C73tzld7OoglfelC2KNPJZ7X2fLVvcUFnL
	xvBZ491w84yqBEiW17Gwjz3442wPI6ORutxoeCZe8bxRi3+jed
X-Received: by 2002:a05:6000:987:b0:43d:69ff:6898 with SMTP id ffacd0b85a97d-4606da5e648mr4634724f8f.9.1781274657908;
        Fri, 12 Jun 2026 07:30:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 07/11] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Fri, 12 Jun 2026 15:30:35 +0100
Message-ID: <20260612143048.317907-8-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33933-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CF4B67A336

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for registering two USB VBUS regulators for the RZ/G3L
(r9a08g046) SoC, which has 2 OTG controllers unlike RZ/G3S which has one.

Add a second regulator descriptor rzg2l_usb_vbus_rdesc1 for the second
USB port (regulator1-vbus, enable_mask BIT(1)) alongside the existing
rzg2l_usb_vbus_rdesc (regulator-vbus, enable_mask BIT(0)).

Introduce a common probe helper rzg2l_usb_vbus_regulator_common_probe()
with a multi_regulator parameter, and a dedicated
rzg3l_usb_vbus_regulator_probe() and platform driver
rzg3l-usb-vbus-regulator for RZ/G3L.

The existing rzg2l_usb_vbus_regulator_probe() continues to register only
regulator-vbus for other SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../regulator/renesas-usb-vbus-regulator.c    | 46 +++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 511631a788c2..ea04d29bb9c9 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -31,6 +31,19 @@ static const struct regulator_desc rzg2l_usb_vbus_rdesc = {
 	.n_voltages	= 1,
 };
 
+static const struct regulator_desc rzg2l_usb_vbus_rdesc1 = {
+	.name = "vbus1",
+	.of_match = of_match_ptr("regulator1-vbus"),
+	.ops = &rzg2l_usb_vbus_reg_ops,
+	.type = REGULATOR_VOLTAGE,
+	.owner = THIS_MODULE,
+	.enable_reg  = 0,
+	.enable_mask = BIT(1),
+	.enable_is_inverted = true,
+	.fixed_uV	= 5000000,
+	.n_voltages	= 1,
+};
+
 static int rzg2l_usb_vbus_regulator_register(struct device_node *np,
 					     const char *name,
 					     const struct regulator_desc *desc,
@@ -50,10 +63,12 @@ static int rzg2l_usb_vbus_regulator_register(struct device_node *np,
 	return 0;
 }
 
-static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
+static int rzg2l_usb_vbus_regulator_common_probe(struct platform_device *pdev,
+						 bool multi_regulator)
 {
 	struct regulator_config config = { };
 	struct device *dev = &pdev->dev;
+	int ret;
 
 	config.regmap = dev_get_regmap(dev->parent, NULL);
 	if (!config.regmap)
@@ -61,8 +76,24 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 
 	config.dev = dev;
 
-	return rzg2l_usb_vbus_regulator_register(dev->parent->of_node, "regulator-vbus",
-						 &rzg2l_usb_vbus_rdesc, &config);
+	ret = rzg2l_usb_vbus_regulator_register(dev->parent->of_node, "regulator-vbus",
+						&rzg2l_usb_vbus_rdesc, &config);
+
+	if (ret || !multi_regulator)
+		return ret;
+
+	return rzg2l_usb_vbus_regulator_register(dev->parent->of_node, "regulator1-vbus",
+						 &rzg2l_usb_vbus_rdesc1, &config);
+}
+
+static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
+{
+	return rzg2l_usb_vbus_regulator_common_probe(pdev, false);
+}
+
+static int rzg3l_usb_vbus_regulator_probe(struct platform_device *pdev)
+{
+	return rzg2l_usb_vbus_regulator_common_probe(pdev, true);
 }
 
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
@@ -74,6 +105,15 @@ static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 };
 module_platform_driver(rzg2l_usb_vbus_regulator_driver);
 
+static struct platform_driver rzg3l_usb_vbus_regulator_driver = {
+	.probe = rzg3l_usb_vbus_regulator_probe,
+	.driver	= {
+		.name = "rzg3l-usb-vbus-regulator",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(rzg3l_usb_vbus_regulator_driver);
+
 MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
 MODULE_DESCRIPTION("Renesas RZ/G2L USB Vbus Regulator Driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0


