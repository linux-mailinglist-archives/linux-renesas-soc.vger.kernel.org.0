Return-Path: <linux-renesas-soc+bounces-34816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y9xNEk0PTWqMuQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:38:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE56871CB81
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 16:38:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ck5jd6a6;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E4B11300A49A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 14:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA7F430312;
	Tue,  7 Jul 2026 14:36:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D242EEA2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435017; cv=none; b=DNi1SsmXK6eWWzzbyF2hcSN2sT0wHvCR5+PLCoEWQBgTWht5+EG/8qz9xH2K1W/VGfqNVPNvX3iNxmdx8Dr/nWfjLA3qJ8+kYdXq6Gjt9DNnm9sXn5vhzRZsUwPXUxekfifSlI/a+TeJnCOfmhqSl50ekB9SB4tXCIgSjm0nU4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435017; c=relaxed/simple;
	bh=zwGCwlSxrj3qgqplQ9kUaEOoXp+99saqG2hiii2WojA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsuTK768T8bBOSc+Pg+OwJm1bK6dA2RxGYTQ29io6e+iohCgv9124CQ8y1Y1IS42OcEGmnD9j4CNSUZgBXwTnr2+nP4nuGyOhPsiO8gDt3XxjQ+4F04KEvdP2+v+Zg3dJWxoS/j4vFhNHQeWE2bGk+cLlMBncT1gNQxMs3j1QW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ck5jd6a6; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b786d6c0so23339875e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435013; x=1784039813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ykPJe2AHQmB62/tEd3K2wCP42YCESPl2iZIzoRZMqk4=;
        b=Ck5jd6a6HrvQ4y+zu6RPpVVBtZwmWzCIuO6t/IJvbZP8T02cGINt06cR/2cfvL8waZ
         S6fWBZewrV1grD3P0VWMutEAQQ83P8GgluC1z6zv5ptSYQvgz9DxKeQN2m7+VBVZlVAE
         b6xF/V4A/oF9iW6C+HVpK5XmzBzbyFyQfrwT5P1Yn4a7ra+5/VN430tXBQSXCJZGPJzY
         OmoMa21RF2ypyDNqTpQQjmGvnab1fJ+RbZG5X5cL7F2/+ZzBpxryd22pL90FCjEZ9HXD
         iy8oIX+nXl2mu0LeVBtfrtBG/azSLimDRw9hUhINpCm7dzFxVolVBvbJldIhPHcyOOoI
         oCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435013; x=1784039813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ykPJe2AHQmB62/tEd3K2wCP42YCESPl2iZIzoRZMqk4=;
        b=NrP7l1pcPqsCUqEiWEuWMKl7WuNtlYW3Vl9WmyeDm+iHElKGpzxoZvZk4RujXYknnA
         D5+7ifIO222bRXjPeVx2Ly1Et4D7rhoPkSvdo0Udga+pT1uCBi3u/L1a0w/cUj7JZMuw
         Sx01II6PAi4FMZ3CXREvB8PiC0m6oHC+SQIa2p3VTuQAuhcJL35Dxk+tF+6dMrAUgwFK
         nBm/hxjJKqI48YcNT30ymkynalcf3lDnabwElr7RMlyB/oA21bCDCTzanAucYh0/WMMz
         XhC1EERnew8cF5w+lf8+o2MfvbxgqcdRaI74zIQa3w/Nr4VgkQzHd7+SYICLNa7RJcn+
         zmNw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+OnYneGQcvZtvbNGkuwJJv2L8yXayFlBrt+JYxlaan50Zyur6YsMuqLSMx+XEtKjcP0qSxFr7h2QojBmuvurJUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5JgxFNbH1uZORMaxbAGmfPl+DvEyezr5H7NGwUEp96uMhgjNE
	s1Ym7ytNli5xGdSsRjVz/Z7q9/KFmOm4PK8lI/oXgwCYf+bFiVlFFTuW
X-Gm-Gg: AfdE7cnsDtef59wZCx7DxlTQi4asJ0+jxSmpgrz5lbMlJYIVT+yO9AUL8uU4yUEQwTp
	MzykqCMe7+UoTg8+WJ/IcuNG6J4I+UP7b4SGCMiwx2+wdDs1JfbQu7W6rVVprCRtHOvxrArVwQG
	WYkLlDKAx8SmFxovf5usp/ELHosxazKJwWnXxuz3ehc2y4DIBj+YQTSYI3XO3lcLH8ZWQLoa/mP
	socDA2FncvWlA80s68CV6ePqk1URiQVUMWF7G/TS4QQACnDwHcC3EtyCrKDaHm64/IunNLjFQeF
	acAwR+VAY96j6glzlShJECwxEIACyEmE0MTbWxll4eIB0qRYMWHFE1dm5rXEunJIWcgZIo1MYcJ
	HYM9AVhBQDagnd91LC9vysXGPY+RCQRtqqYQ234G2HNnHI/UoCqVoaGi1BREkhK9vF1G6RVrTM/
	lOR21kyktwv1suyvBmaoXfGbycHDwx431wWGqu9g==
X-Received: by 2002:a05:600c:3153:b0:493:bc4a:fb56 with SMTP id 5b1f17b1804b1-493df09fd08mr65171815e9.39.1783435013326;
        Tue, 07 Jul 2026 07:36:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:52 -0700 (PDT)
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
Subject: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Tue,  7 Jul 2026 15:36:37 +0100
Message-ID: <20260707143646.245177-6-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34816-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE56871CB81

From: Biju Das <biju.das.jz@bp.renesas.com>

Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC, which
has two OTG controllers (one per port), unlike RZ/G3S which has only one.

Introduce a RZG3L_USB_VBUS_REG macro and a rzg3l_usb_vbus_regulators
array with two descriptors: vbus0 (BIT(0)) and vbus1 (BIT(1)), both
sourced from a regulators sub-node as defined in the binding. Add a
dedicated rzg3l_usb_vbus_regulator_probe() that iterates over the array
and registers both regulators using devm_regulator_register(). Register
a separate rzg3l-usb-vbus-regulator platform driver backed by this probe
function.

The existing rzg2l_usb_vbus_regulator_probe() and its platform driver
are unchanged and continue to handle the single regulator-vbus case for
all other SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Passing pointer to an array of regulators to make it scalable.
 * Updated commit description.
---
 .../regulator/renesas-usb-vbus-regulator.c    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..902834000874 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -55,6 +55,50 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#define RZG3L_USB_VBUS_REG(rname, en_mask)				\
+	{								\
+		.name			= #rname,			\
+		.of_match		= of_match_ptr(#rname),		\
+		.regulators_node	= of_match_ptr("regulators"),	\
+		.type			= REGULATOR_VOLTAGE,		\
+		.owner			= THIS_MODULE,			\
+		.ops			= &rzg2l_usb_vbus_reg_ops,	\
+		.enable_reg		= 0,				\
+		.enable_mask		= (en_mask),			\
+		.enable_is_inverted	= true,				\
+		.fixed_uV		= 5000000,			\
+		.n_voltages		= 1,				\
+	}
+
+static const struct regulator_desc rzg3l_usb_vbus_regulators[] = {
+	RZG3L_USB_VBUS_REG(vbus0, BIT(0)),
+	RZG3L_USB_VBUS_REG(vbus1, BIT(1)),
+};
+
+static int rzg3l_usb_vbus_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { };
+	struct device *dev = &pdev->dev;
+	struct regulator_dev *rdev;
+
+	config.dev = pdev->dev.parent;
+	config.regmap = dev_get_regmap(dev->parent, NULL);
+	if (!config.regmap)
+		return dev_err_probe(dev, -ENOENT, "Failed to get regmap\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(rzg3l_usb_vbus_regulators); i++) {
+		rdev = devm_regulator_register(dev, &rzg3l_usb_vbus_regulators[i],
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(dev, "failed to register %s regulator\n",
+				rzg3l_usb_vbus_regulators[i].name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 	.probe = rzg2l_usb_vbus_regulator_probe,
 	.driver	= {
@@ -64,6 +108,15 @@ static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
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


