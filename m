Return-Path: <linux-renesas-soc+bounces-8041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B4195BA30
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78286286721
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB541CC164;
	Thu, 22 Aug 2024 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="biw6fs4F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE6C1CDA32
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 15:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340511; cv=none; b=rKfoAN8KL22XZh8+DjBfWpYS9+lOpNtPZsPwfnsoXNepW+EKjJ+kjWkYbNrVPyLpcpBYm78saM3TKwM2XPAqeV61CgDK5P2T0ThRCPMvVyg9kUpo5IpPMkHkjYtKjMjycWqEj3b38M9ZLZR8SgAtUxDubUkict/JZgT684mR5/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340511; c=relaxed/simple;
	bh=XrqcPTylVERKklChscjba3VfZJzY0R9/Nuua9/voHH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bd2v9nxlM5745UYKEeTn1TziVeCFaGKOJ13YfBZfrajrOwwQkiHs9a0bWSbFEI2Tzu523nylRS2y+T7FLJHkHBoOHGoNBSlpxXVbINtSCrjR8v7IOhcuqDBL1lPr36bi9cKFEqDojwd7lZRYZB0uduOMYF+9udfn5VzDD9vQRY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=biw6fs4F; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so93832766b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724340506; x=1724945306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgJzIoJ7odKtUR1tmJxpafPTYpDoiiIktLX51hzayU4=;
        b=biw6fs4FEJ9VTT0QKBWewO4YKyGNdebDHOlYUrgMTg8iOBHUSMU5Gmb7ecqjTIdyaK
         I7Ro0JkfBrfV5nKFDiGU/J0j9kmD3SFKkWJ73ydYo612bUdMTmEWqCV7I1627gYW9aim
         +BUa1jzThreIMURepC90llPIoN7eqrXtsuJYcWuDl1K3jSJEHbUZ2kUURun1i/MayD74
         WjWNbwka553pU9i/deR9XDEcnOr34ZiOgWYuEW/PmLtrmVrAWEdwDOFgzyNxa0RNyMae
         FD0rvjoJ1YKbx9PmMlF7EylOCXtBOC2eEUsHyvi4f9zoAAogZ1rpbwwKy79yy8y8DoEx
         Um7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340506; x=1724945306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZgJzIoJ7odKtUR1tmJxpafPTYpDoiiIktLX51hzayU4=;
        b=RAC6Wq47G2iPAURdvvBN71mlQ0Q1YXLcH5DLn7vYkR2OcYHLqg5ezn5Zzf1guQfYmt
         SN5ZP6kH+OrYV5CKVJ8W3vNkVCpRu9MHenXtrybMBjVVEJ+ml/gNKmRzXSIb4HkrRSpC
         +lXxqNi1i8epwP6hDNRffeQ39p6z3SurNiSbTlN8z9wQR/YU7APXA2iAOhob8BpjLuSP
         xEPbuLAiTXjdBbiaB2o6prq4KvxIksxGJjYZMnPVNK2rUen61S09E8Hwv0snTTPbNRD0
         BRmErdDZKQnJtHXQ3Rcce+z9PaTma4coaVWgBF1eynnJDX2++SHufDt/arcJQYCJ1ljY
         u+oA==
X-Forwarded-Encrypted: i=1; AJvYcCXVkZsmnNl7JLlH3ibHorP9GqjEElYSLyOLiOCDp/7RVa0O7EhsaJ1WYgKdpaK2SIuNWQ7IYzdh+fY2gU+CPOg+bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNRaS1ljQdTRM5RrColSBB4CqOukAbyAs1gCQle7Oi+EnVEjHE
	hcQu1VjkRlqCpe5ufax9nl0mhdRcfIQCWkhM8l0YpHIrqAfWiZYbXG/0NJdzIVM=
X-Google-Smtp-Source: AGHT+IFeGPZpt21jhTv4W0bfHajPG9OGuBMYaiwjLe2EM/CfoluWSL4gm6uew0mp9CeRcXzWktBU8w==
X-Received: by 2002:a17:907:9688:b0:a86:7a23:1292 with SMTP id a640c23a62f3a-a867a23275amr475672566b.66.1724340506359;
        Thu, 22 Aug 2024 08:28:26 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f484dc5sm134189166b.171.2024.08.22.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 08:28:25 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com,
	ulf.hansson@linaro.org
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 05/16] soc: renesas: sysc: Move RZ/G3S SoC detection on SYSC driver
Date: Thu, 22 Aug 2024 18:27:50 +0300
Message-Id: <20240822152801.602318-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240822152801.602318-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Now that we have a driver for SYSC driver for RZ/G3S move the SoC detection
for RZ/G3S in SYSC driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/soc/renesas/renesas-soc.c | 12 ---------
 drivers/soc/renesas/rzg3s-sysc.c  | 45 +++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 172d59e6fbcf..425d9037dcd0 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -71,10 +71,6 @@ static const struct renesas_family fam_rzg2ul __initconst __maybe_unused = {
 	.name	= "RZ/G2UL",
 };
 
-static const struct renesas_family fam_rzg3s __initconst __maybe_unused = {
-	.name	= "RZ/G3S",
-};
-
 static const struct renesas_family fam_rzv2h __initconst __maybe_unused = {
 	.name	= "RZ/V2H",
 };
@@ -176,11 +172,6 @@ static const struct renesas_soc soc_rz_g2ul __initconst __maybe_unused = {
 	.id     = 0x8450447,
 };
 
-static const struct renesas_soc soc_rz_g3s __initconst __maybe_unused = {
-	.family = &fam_rzg3s,
-	.id	= 0x85e0447,
-};
-
 static const struct renesas_soc soc_rz_v2h __initconst __maybe_unused = {
 	.family = &fam_rzv2h,
 	.id     = 0x847a447,
@@ -410,9 +401,6 @@ static const struct of_device_id renesas_socs[] __initconst __maybe_unused = {
 #ifdef CONFIG_ARCH_R9A07G054
 	{ .compatible = "renesas,r9a07g054",	.data = &soc_rz_v2l },
 #endif
-#ifdef CONFIG_ARCH_R9A08G045
-	{ .compatible = "renesas,r9a08g045",	.data = &soc_rz_g3s },
-#endif
 #ifdef CONFIG_ARCH_R9A09G011
 	{ .compatible = "renesas,r9a09g011",	.data = &soc_rz_v2m },
 #endif
diff --git a/drivers/soc/renesas/rzg3s-sysc.c b/drivers/soc/renesas/rzg3s-sysc.c
index e664d29ce5c3..1dd48c7255d1 100644
--- a/drivers/soc/renesas/rzg3s-sysc.c
+++ b/drivers/soc/renesas/rzg3s-sysc.c
@@ -6,10 +6,16 @@
  */
 
 #include <linux/auxiliary_bus.h>
+#include <linux/io.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/sys_soc.h>
 
 #include <linux/soc/renesas/rzg3s-sysc-reset.h>
 
+#define RZG3S_SYS_LSI_DEVID		0xa04
+#define RZG3S_SYS_LSI_DEVID_REV		GENMASK(31, 28)
+
 /**
  * struct rzg3s_sysc - SYSC private data structure
  * @base: base address
@@ -71,8 +77,14 @@ static int rzg3s_sysc_reset_probe(struct rzg3s_sysc *sysc, const char *adev_name
 
 static int rzg3s_sysc_probe(struct platform_device *pdev)
 {
+	const char *soc_id_start, *soc_id_end, *compatible;
+	struct soc_device_attribute *soc_dev_attr;
 	struct device *dev = &pdev->dev;
+	struct soc_device *soc_dev;
 	struct rzg3s_sysc *sysc;
+	char soc_id[32] = {0};
+	u32 devid, revision;
+	u8 size;
 
 	sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
 	if (!sysc)
@@ -85,6 +97,39 @@ static int rzg3s_sysc_probe(struct platform_device *pdev)
 	sysc->dev = dev;
 	spin_lock_init(&sysc->lock);
 
+	compatible = of_get_property(dev->of_node, "compatible", NULL);
+	if (!compatible)
+		return -ENODEV;
+
+	soc_id_start = strchr(compatible, ',') + 1;
+	soc_id_end = strchr(compatible, '-');
+	size = soc_id_end - soc_id_start;
+	if (size > 32)
+		size = 32;
+	strscpy(soc_id, soc_id_start, size);
+
+	soc_dev_attr = devm_kzalloc(dev, sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	soc_dev_attr->family = "RZ/G3S";
+	soc_dev_attr->soc_id = devm_kstrdup(dev, soc_id, GFP_KERNEL);
+	if (!soc_dev_attr->soc_id)
+		return -ENOMEM;
+
+	devid = readl(sysc->base + RZG3S_SYS_LSI_DEVID);
+	revision = FIELD_GET(RZG3S_SYS_LSI_DEVID_REV, devid);
+	soc_dev_attr->revision = devm_kasprintf(dev, GFP_KERNEL, "%u", revision);
+	if (!soc_dev_attr->revision)
+		return -ENOMEM;
+
+	dev_info(dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr->family,
+		 soc_dev_attr->soc_id, soc_dev_attr->revision);
+
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
 	return rzg3s_sysc_reset_probe(sysc, "reset", 0);
 }
 
-- 
2.39.2


