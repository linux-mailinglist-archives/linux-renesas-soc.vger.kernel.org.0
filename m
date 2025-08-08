Return-Path: <linux-renesas-soc+bounces-20122-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A81B1E216
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 08:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45807722969
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 06:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75FF221FB1;
	Fri,  8 Aug 2025 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c8UO55pY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B551F30CC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Aug 2025 06:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754633907; cv=none; b=Rss+hJFMJH+zph2+xTFjJLukoBEIuAvJze5VW4LSDimsb7hEsz2+DGn+ynS7KgqDNN4ycxYNoiHm5L+qbO2XLWQvsf9EYY5lrBmmpuZtZTLV7omwrS7nFnKBf//N0WGmCb5a/gxwJLEks038XpeJKaT7mbLjiH06xKFDOMcEiAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754633907; c=relaxed/simple;
	bh=fHWUKbA3sV+VXL5fHk8nBE3Rl9WF13IAAZ5agKA3uEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2gk9pXwh0VkgSaEU0tptZoKWm5TOP5oqQhlPl6hCWHGhWEEMB6HqD+t7NRv3ufDLJkkuAWvSsNAUkF6Pkqm8FQz4u5JRsj5y9HjoVkDzOm8Z1rJMkTUFiDDLwvZzALy8lujb46UpwMJOOLZigOnSXleMeh/g/ZPObCQLdscwCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c8UO55pY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af949bdf36cso309453366b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Aug 2025 23:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754633904; x=1755238704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGxErwgbikUB0r4Ah9WecOpEjMWqaBQxYhGBpW0b5K8=;
        b=c8UO55pYC7xVkUy9K3C0xaVClJowA69ulJiITbUNwr897Hyx+/E/lpMKoSEVUpSa8R
         mu4PNubuCn5sKWqeLZaGKtqjQ7bKUiMdYiZJQ1QXHwwPv0LbGI5T5XirjoH0QqWmBzke
         9GUP3IofjsaFNifaRharsRLVV/Ogsfr/yQdMevaMOWm0/79d7YHyOwTtBPiiW5aqzI8u
         xbDUVsL+M1t6c3qmEDF/MIr7F4+V1SRD6o+MhBhbMMOY4H1NDj9IKDh5AOyDANRNWq+A
         /VbL6ZTCypmkuq8072DJm5POboxFywkKG972MnkqnTQHFKK1nvfxbfbwd9XfgIfAko5f
         FbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754633904; x=1755238704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGxErwgbikUB0r4Ah9WecOpEjMWqaBQxYhGBpW0b5K8=;
        b=VZCdqXpLOCRnTV8DwV7IgIcC1moG3by3xJnHRjwkcNsFGjPTCuyL+kfNMRiIsVZTJu
         RHmqqQDAh8WpwojkPDg1TphIS0B9nz/DvXdT39YLcbxifBLkmAa3MjLaQp0BtKh7LTC8
         68SWfjRIx4A5E3EavEjUhtcpkFwAu0/90fKXamkc/dPPO/bHdR+GGqJhnBsaQvcuGpmB
         ef02YAxYoE2ImBMFTT5kklX31VM8LbA6s6ZD1S68krjR5cL+pEsGg37tX624hhY1PSJ/
         4cTZCzWE2YIqoX/+Svzc4mBd0+HXSo99VDzLv7hzBIYprpVjxpIjgG7nLKW7XMDR0YGG
         T/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUnRHpmHqNZ7h3+bjPjiOsp6pcvqP3zurwaOw8tiPewW2F/WaUzw54kxmW2HGnf21eABX6rTjgIhzxNmWFcjkOOJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbev4K7r8P/y4pnDzwOHfx4r5l7IJhLoX3SgTM/txG4g87erW
	2rr9m0XcQ4fA49UryPLSvrBrSpDkEanv4D3JGL+mnM1L2v95DHbpsniFaFm4JKP/VXs=
X-Gm-Gg: ASbGncsTIRbzVYx4xHtzLxw7jLQansEmk0QZPOX2uvqp3nDew+B78w37kCsx0SdG5Vm
	wCLXIdhvePsvPj+LGHuPYTcfB3sdsgoxsKLxsSvUpENAnOdLyGkvRiWzpq/85lxwLbEhd9yp/QG
	g8p6vKbkHZjabqhJCZEFFs8L9nxaAow5fQCPiHw4rlx/dRCwYANkhIa0pQKfmiBYzqjgiKGPcdx
	4wjB72pU95lXlcsogvmeIMXYQQPcEUSb9RVgoGEQvQE3waZmY65J2pFL+XLW4JPAsr3/di8D7yG
	N4eJqBJy8g/85jhreVxqmxHM0abbH+vuTj5dPSW3xygCsz+75ZNrxQKJMU1Dvib8Z4nUk1XUT1p
	qHlG7vBCKVwOl5+OGZT78Whv06BU7j13lXrn9IgZbrCkYY7aPkV3k
X-Google-Smtp-Source: AGHT+IHCkrMk678geaeYEI3zleLM4Vok8qAECVrbc6sPCl6ox+9eIuTcVivQhuzuhlup6596Rw/mBg==
X-Received: by 2002:a17:907:7b9d:b0:aec:f8bb:abeb with SMTP id a640c23a62f3a-af9c65175abmr133250366b.42.1754633903897;
        Thu, 07 Aug 2025 23:18:23 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a218ab4sm1440488566b.92.2025.08.07.23.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 23:18:23 -0700 (PDT)
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
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 1/8] soc: renesas: rz-sysc: Add syscon/regmap support
Date: Fri,  8 Aug 2025 09:17:59 +0300
Message-ID: <20250808061806.2729274-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Madieu <john.madieu.xa@bp.renesas.com>

The RZ/G3E system controller has various registers that control or report
some properties specific to individual IPs. The regmap is registered as a
syscon device to allow these IP drivers to access the registers through the
regmap API.

As other RZ SoCs might have custom read/write callbacks or max-offsets,
register a custom regmap configuration.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
[claudiu.beznea:
 - do not check the match->data validity in rz_sysc_probe() as it is
   always valid
 - dinamically allocate regmap_cfg]
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- adjusted the patch description by dropping "add" from
  "add register a custom regmap configuration"
- updated the list of changes from Claudiu Beznea
- dynamically allocate the regmap_config as proposed at [2]
- this patch is needed for proper function of USB (as proposed in this
  series) that being the reason it is introduced here, as well

[2] https://lore.kernel.org/all/CAMuHMdVyf3Xtpw=LWHrnD2CVQX4xYm=FBHvY_dx9OesHDz5zNg@mail.gmail.com/

Changes in v3:
- none, this patch is new, it was picked from John after he addressed
  the review comments received at [1];
- I adjusted as specified in the SoB area, and included it here as it
  is the base for the signal support presented in the next commits

[1] https://lore.kernel.org/all/20250330214945.185725-2-john.madieu.xa@bp.renesas.com/

 drivers/soc/renesas/Kconfig          |  1 +
 drivers/soc/renesas/r9a08g045-sysc.c |  1 +
 drivers/soc/renesas/r9a09g047-sys.c  |  1 +
 drivers/soc/renesas/r9a09g057-sys.c  |  1 +
 drivers/soc/renesas/rz-sysc.c        | 29 +++++++++++++++++++++++++++-
 drivers/soc/renesas/rz-sysc.h        |  2 ++
 6 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 719b7f4f376f..c97e2a183388 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -449,6 +449,7 @@ config RST_RCAR
 
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
+	select MFD_SYSCON
 
 config SYSC_R9A08G045
 	bool "Renesas System controller support for R9A08G045 (RZ/G3S)" if COMPILE_TEST
diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index f4db1431e036..0504d4e68761 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -20,4 +20,5 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+	.max_register = 0xe20,
 };
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index cd2eb7782cfe..2e8426c03050 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -64,4 +64,5 @@ static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initco
 
 const struct rz_sysc_init_data rzg3e_sys_init_data = {
 	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
+	.max_register = 0x170c,
 };
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 4c21cc29edbc..e3390e7c7fe5 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -64,4 +64,5 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 
 const struct rz_sysc_init_data rzv2h_sys_init_data = {
 	.soc_id_init_data = &rzv2h_sys_soc_id_init_data,
+	.max_register = 0x170c,
 };
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index ffa65fb4dade..66cc8d01f096 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -6,8 +6,10 @@
  */
 
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/sys_soc.h>
 
 #include "rz-sysc.h"
@@ -100,14 +102,20 @@ MODULE_DEVICE_TABLE(of, rz_sysc_match);
 
 static int rz_sysc_probe(struct platform_device *pdev)
 {
+	const struct rz_sysc_init_data *data;
 	const struct of_device_id *match;
+	struct regmap_config *regmap_cfg;
 	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
 	struct rz_sysc *sysc;
+	int ret;
 
 	match = of_match_node(rz_sysc_match, dev->of_node);
 	if (!match)
 		return -ENODEV;
 
+	data = match->data;
+
 	sysc = devm_kzalloc(dev, sizeof(*sysc), GFP_KERNEL);
 	if (!sysc)
 		return -ENOMEM;
@@ -117,7 +125,26 @@ static int rz_sysc_probe(struct platform_device *pdev)
 		return PTR_ERR(sysc->base);
 
 	sysc->dev = dev;
-	return rz_sysc_soc_init(sysc, match);
+	ret = rz_sysc_soc_init(sysc, match);
+	if (ret)
+		return ret;
+
+	regmap_cfg = devm_kzalloc(dev, sizeof(*regmap_cfg), GFP_KERNEL);
+	if (!regmap_cfg)
+		return -ENOMEM;
+
+	regmap_cfg->name = "rz_sysc_regs";
+	regmap_cfg->reg_bits = 32;
+	regmap_cfg->reg_stride = 4;
+	regmap_cfg->val_bits = 32;
+	regmap_cfg->fast_io = true;
+	regmap_cfg->max_register = data->max_register;
+
+	regmap = devm_regmap_init_mmio(dev, sysc->base, regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return of_syscon_register_regmap(dev->of_node, regmap);
 }
 
 static struct platform_driver rz_sysc_driver = {
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 56bc047a1bff..8eec355d5d56 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -34,9 +34,11 @@ struct rz_sysc_soc_id_init_data {
 /**
  * struct rz_sysc_init_data - RZ SYSC initialization data
  * @soc_id_init_data: RZ SYSC SoC ID initialization data
+ * @max_register: Maximum SYSC register offset to be used by the regmap config
  */
 struct rz_sysc_init_data {
 	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
+	u32 max_register;
 };
 
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
-- 
2.43.0


