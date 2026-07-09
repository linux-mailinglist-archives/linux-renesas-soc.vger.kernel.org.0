Return-Path: <linux-renesas-soc+bounces-34929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2IinDXNcT2q+fAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:31:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6E372E4F9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 10:31:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Dv1p2Fq9;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34929-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC6CA30340B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 08:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB643F39F6;
	Thu,  9 Jul 2026 08:31:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD13F1662
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 08:31:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585877; cv=none; b=kT/KLgIzfLgLAkR9xYvJY3ffKGJd/mMaU+gMqOu0BwlkMM615vagf4fTeVI3py6iIJxGqI55B6zXhjE8brYg2NmMHMTpA0J1rQDblPEGbHhiEZuQqOimTPVR3+LP1c7f0OWbresJ5OtVLvMCwQyx6epXDm0cJ2DGVgoy8LRGSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585877; c=relaxed/simple;
	bh=mx/pjDOyWiHKCHRnKJyBhOvkuSMIrm9IzYrVW/evgLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxvW4FiLDkL8q+2E5vj0Qi++ICCEvR1HN6uU/eLb2EZ4iVdEd6yc9IiR1xqQy9fg+LTgrePVT7qeta2ln69kZEhOJg2XPf2ET01jBK6ggjnEJd7osKnUvBVFFSS3PtD7wat1IsuNz/6oP5VFQsAleBu2zvzLlmm89biYaDn/p20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dv1p2Fq9; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4728c12ba97so831441f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783585874; x=1784190674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ybz7YWo+HpjsUGeoXMU4juHhH28uW8hBmyh7VPj4UQU=;
        b=Dv1p2Fq9VRRpBX2ILBvT7GvK2gjLVkLPwZy2MLX+ya6RV8hNTTeTMKq7W6h3nmD2Qe
         8uNHEFT9t13JPXuXixkzqKF1IwlnPpP3G+Dmlg+N+tJheFyQtohkEVBKR3E7eRjnKdvM
         5Oq16ov4eVqVk28L4Z+N7SaQisA8wRolytgpuhmQ87N3jaSGKTrmNTuP0146fGKnJ2+Z
         BHsYvLsMRRvQNTY5VHElCgxTjEb4NGRQbEFKZTqQQ4LwF2lZsbFsm4XVqQswhDMswMDU
         +Fvmf3IfajozEQRp21ENHb0TdaWyl7wJGJY0OmVMM6jhcrnT2pmsgvhzn7PvWhDe5h1z
         mnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585874; x=1784190674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ybz7YWo+HpjsUGeoXMU4juHhH28uW8hBmyh7VPj4UQU=;
        b=MdOLo9HMUk/59QNrPRl89/XbhUSBzwp9znnULvvHYaD6CQuzhMj6XsJ5bRlkWQgXMW
         Ki66zrKdunuuY4NUW3DRVExu/RfOTt801DNnawUkSA4sNbeIH9r9lUJEDBLbuupokNmk
         73EgOr9vcMAmGmoNvsfQa5KNKjCbuizguYz4QOj7arcNmjW4o/I3ekm81pVyPYkQYB1f
         yLQWPMxCbDZ/1/o777LnRB2KJHs4v+2dKW4BkEYsOnEOwNugwZZ31ZnSWYJU/32oKR6t
         8CoR3zKYcNfFuqukZ0W8DGN2Gs7lFnYkGgcT9Gc3Rdc5JSzaA7bIf3CqBfiGM53Us7FU
         tm8A==
X-Forwarded-Encrypted: i=1; AHgh+RpaMBjJpTR9cuvLNtai6xkuiMRxc7eJuNyFGnc2yEPCmt2bvduxp7apZAc2cokp0N02vF0upjKTkvSAOmgKoOyPOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+s8SInVevDA6iSlvESo+1h0rafuKW0H7WujW1PyjBP06gQFOJ
	csgj0QKDiV7c6oB0KFBiLYgTJV15xIVYP/OAsuoDUIK0dOPWzoKWEdgn
X-Gm-Gg: AfdE7cn1SmlruPLTyao2uxBcrUF2QFguWC/OwAdByPEOvLQ1UoK3LiIItFLJuekCEzc
	v+atnuIjDRuzbbDHxr4Gr49pDMPEOEIz4GKrhpawUyS1Zx323a33aSGWbBGLGaJdj99hRY1u1Gh
	Pg1g7lxPznx/5X0z91sJNSvjFTy3xdKPsBYbbxHeSlnMC1ROlrz1pgEz9HOQOB/5LbOFgIp3YCh
	LAL29fIG7uZbkNF5qcL8ekM34yHEOCtT1g0GWFbhkOh4EWqRvUIVAyPpF8JRgvkNjtgMoCfY+bF
	J8B5gLZdlj1EmfVG5cszMeGIwwuy9VbiUc5L/M8OTRSF+vmvrmGEwfp2iXjlrIp0At8+KMSMSuQ
	XDIN38DUT4YuWALgtJhRUyL2X7ty3phy4JPPFYascc3Li//TevkSeFh+mijl0BQbU8AbcsyslSJ
	pMqP33Rt2SgeyB8EV2wu8C
X-Received: by 2002:a05:6000:25c7:b0:473:6e8d:7f8 with SMTP id ffacd0b85a97d-47df0738671mr6475656f8f.14.1783585873516;
        Thu, 09 Jul 2026 01:31:13 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8fb6:1d85:3dc1:42ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d780csm50316543f8f.11.2026.07.09.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:31:13 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 4/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L VBUS regulator support
Date: Thu,  9 Jul 2026 09:30:57 +0100
Message-ID: <20260709083108.108370-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
References: <20260709083108.108370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34929-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:p.zabel@pengutronix.de,m:broonie@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,config.dev:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED6E372E4F9

From: Biju Das <biju.das.jz@bp.renesas.com>

Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC, which
has two OTG controllers (one per port), unlike RZ/G3S which has only one.

Introduce a RZG3L_USB_VBUS_REG macro and a rzg3l_usb_vbus_regulators
array with two descriptors: vbus0 (BIT(0)) and vbus1 (BIT(1)), both
sourced from a regulators sub-node as defined in the binding. Add a
dedicated rzg3l_usb_vbus_regulator_probe() that iterates over the array
and registers both regulators using devm_regulator_register().

Convert the existing platform driver to use an id_table, allowing it to
dispatch to either the RZ/G2L or RZ/G3L probe function based on the
matched platform device name.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped rzg3l specific platform driver.
 * Dropped the tag as there are new changes
 * Added id_table handling by introducing a common probe().
v2->v3:
 * No change.
v1->v2:
 * Passing pointer to an array of regulators to make it scalable.
 * Updated commit description.
---
 .../regulator/renesas-usb-vbus-regulator.c    | 74 ++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..493397143617 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -55,8 +55,80 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
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
+static int rzg2l_usb_vbus_regulator_common_probe(struct platform_device *pdev)
+{
+	int (*probe_func)(struct platform_device *pdev);
+	const struct platform_device_id *id;
+
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(&pdev->dev, -ENODEV, "No ID match found\n");
+
+	probe_func = (int (*)(struct platform_device *))id->driver_data;
+
+	return probe_func(pdev);
+}
+
+static const struct platform_device_id rzg2l_usb_vbus_regulator_ids[] = {
+	{
+		.name = "rzg2l-vbus-regulator",
+		.driver_data = (kernel_ulong_t)rzg2l_usb_vbus_regulator_probe
+	},
+	{
+		.name = "rzg3l-vbus-regulator",
+		.driver_data = (kernel_ulong_t)rzg3l_usb_vbus_regulator_probe
+	},
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, rzg2l_usb_vbus_regulator_ids);
+
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
-	.probe = rzg2l_usb_vbus_regulator_probe,
+	.probe = rzg2l_usb_vbus_regulator_common_probe,
+	.id_table = rzg2l_usb_vbus_regulator_ids,
 	.driver	= {
 		.name = "rzg2l-usb-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-- 
2.43.0


