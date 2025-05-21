Return-Path: <linux-renesas-soc+bounces-17310-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA4CABF74F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 16:10:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C3F14E7A7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 14:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E447178CF8;
	Wed, 21 May 2025 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mUWCriUu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C599818D63A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 14:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836600; cv=none; b=BsjC1/THdUW/LQZb1KDlSeaKVOoBO/N43wUqhp9XRiTFAzF0OWFI1FO65ZW50Fcu128XQW1RF6oOrlE6gQnZzCW80e2VRkl3kkpL3awAdMJUjz17xd9BDxtw4YFtSuQCTj815dv1CXlwcBlX3n3ji/z+eCsZ3TzW3rGIfwkZcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836600; c=relaxed/simple;
	bh=ypS6wHW1s7xj7CWnC9K7y9jKyRCmDVvl04EXlJRQ+U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5mWK53INEwqH/4nlzg5D202JC6v53s7mdIcdMFmZdLCVOBJK5VSOggB+jm9ABwpQJ2SNbmMwnTF7Ei82PwpO/0NRubU0SC2uHJrCqo4PS79E2nXwLvmT1yIYxSpM5ofEnv4oFc+efqSj46HEeTCEHwFZ2hti+CawzQ0mb82rt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mUWCriUu; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso5955878a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 May 2025 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836596; x=1748441396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmrP+sot8rKutRjUGVZ8MSsGqAFIco0iPKh+ZSc/XZE=;
        b=mUWCriUuWgGDEiDqJ8Pvzqs3oUf40+HBCFOZtV4s8oxyf6aVdqWExWs8CZUwBTXFsJ
         2qiHkYYQ0UizIe6q3eLtnciBfhKAd3efD6F8vnjxMxG63Q6ZdAAI2RGVPo6Zyo/Umwwg
         P4S8MeyF8GXCszR0BmD0zoRuGVAvSlg7iJhscRk0WXtjfJ524EPccQ9Tm2QmG1uTyakW
         fKEu0BhqZKadGTZcrwUl8TWqOyBS/IpalHFaFXpykvsMWYAa/ALVNPAinui/PL5BQjeo
         VrLtW2W9uy+v6Z+V3i8UOsZqrAd9nmMO+CuR1hLqvsgL3AG88yjoqC6wKvfTR3mZeFbO
         ajug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836596; x=1748441396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmrP+sot8rKutRjUGVZ8MSsGqAFIco0iPKh+ZSc/XZE=;
        b=K+CQdlfdTv+8M5hHt2VkzU+B+ZxGhl7I/Q3SS2HbK0dkFxKLpQjWuHcZfSOaGsji9D
         V9LUlr7mTiXDL1z2as2Vaoeuq65LvkzttvZBycCNpZ6YqQuOLd8zsD7eXCLhXFzuRJ5p
         fbvG6znH+gakB7F6frmTqqly3+cAE4+QK41eGiBdvQfZMKXcpWdZ3H37vHmW0VmZdoGS
         N2TohIRuL5B3NUtj4GDzXbsk/qjr+RbKyFafMnZioqs2G2bu7PZUi/qcT8lFGYfQNgaI
         SgdKQ+UjwnwH75J9sk2FTZKLYemUjmuOUJB5Zh4/n4sgLOz6aidvqztgONUmzHHJk/f8
         85ig==
X-Forwarded-Encrypted: i=1; AJvYcCUCHFCvEmR6QTH4jtylNVcNSDJok8XVi2RrXBG1S6oyzrYECpHlbRd+zdRCinBtMEhePZmQVIBn42bnKOwbyyKZag==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZAoMMiCF5xGAi+eikcmPBXnHO8pRLrLmIWIrmZVBnCqdQ/RkN
	xyxZPTWvKlE5nK2Ylov4t3pCwvIX40lwQQEARH1K+IKjPqhenqQ2FtyLCtPw8Egzubk=
X-Gm-Gg: ASbGncs3fGJvuLPIuo9pyKWNXYVH5nrMjIoVEp5NLYcf+sBrpTF0itr0ZGvcWKNf+g6
	iJ9jw2/eG1N/7XsbANJSpdyy6YTAZAt4ZAds0Lrid4eW+hbcArxApUQnXWxevsMKsZ+voTCCt+C
	x1UvfPQtyUtQCU0ezv6wHMNA4oobrlTUXPR8e3OZPD4fjsXrQYn/cQwDviY6nSBJW67BFjDHvif
	49804uHJ/OenCwCENrspgKJVSUEFHbR2ccpeXoy4N5EoCaDfe+5M+O+GrFUGyDaaaAm7sIo83zs
	WXhWxc9vd6Tb7MM4kXxTdocqaIsQ1LfAPCacmIEXsFdfIV23R0MI/Pi3UgYBhT2x9fqgZAxGyJW
	H6bH9
X-Google-Smtp-Source: AGHT+IH2Q+dXGJ1p+fzjH3SJID8Si948P9OQNtR6M7pu6BCu4wpblWU0sr2HucFryDErcvkRzd82tA==
X-Received: by 2002:a17:907:94ce:b0:ad1:8e6a:5945 with SMTP id a640c23a62f3a-ad52d583cbbmr2059152666b.36.1747836595765;
        Wed, 21 May 2025 07:09:55 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:09:55 -0700 (PDT)
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
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 01/12] soc: renesas: rz-sysc: Add syscon/regmap support
Date: Wed, 21 May 2025 17:09:32 +0300
Message-ID: <20250521140943.3830195-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
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
add register a custom regmap configuration.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
[claudiu.beznea:
 - s/rzg3e_sysc_regmap/rzv2h_sysc_regmap in RZ/V2H sysc
   file
 - do not check the match->data validity in rz_sysc_probe() as it is
   always valid
 - register the regmap if data->regmap_cfg is valid]
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none, this patch is new, it was picked from John after he addressed
  the review comments received at [1];
- I adjusted as specified in the SoB area, and included it here as it
  is the base for the signal support presented in the next commits

[1] https://lore.kernel.org/all/20250330214945.185725-2-john.madieu.xa@bp.renesas.com/

 drivers/soc/renesas/Kconfig          |  1 +
 drivers/soc/renesas/r9a08g045-sysc.c | 10 ++++++++++
 drivers/soc/renesas/r9a09g047-sys.c  | 10 ++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  | 10 ++++++++++
 drivers/soc/renesas/rz-sysc.c        | 17 ++++++++++++++++-
 drivers/soc/renesas/rz-sysc.h        |  3 +++
 6 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fbc3b69d21a7..f3b7546092d6 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -437,6 +437,7 @@ config RST_RCAR
 
 config SYSC_RZ
 	bool "System controller for RZ SoCs" if COMPILE_TEST
+	select MFD_SYSCON
 
 config SYSC_R9A08G045
 	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index f4db1431e036..0ef6df77e25f 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -18,6 +18,16 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 	.specific_id_mask = GENMASK(27, 0),
 };
 
+static const struct regmap_config rzg3s_sysc_regmap __initconst = {
+	.name = "rzg3s_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0xe20,
+};
+
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+	.regmap_cfg = &rzg3s_sysc_regmap,
 };
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index cd2eb7782cfe..a3acf6dd2867 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -62,6 +62,16 @@ static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initco
 	.print_id = rzg3e_sys_print_id,
 };
 
+static const struct regmap_config rzg3e_sysc_regmap __initconst = {
+	.name = "rzg3e_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x170c,
+};
+
 const struct rz_sysc_init_data rzg3e_sys_init_data = {
 	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
+	.regmap_cfg = &rzg3e_sysc_regmap,
 };
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index 4c21cc29edbc..c26821636dce 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -62,6 +62,16 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.print_id = rzv2h_sys_print_id,
 };
 
+static const struct regmap_config rzv2h_sysc_regmap __initconst = {
+	.name = "rzv2h_sysc_regs",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x170c,
+};
+
 const struct rz_sysc_init_data rzv2h_sys_init_data = {
 	.soc_id_init_data = &rzv2h_sys_soc_id_init_data,
+	.regmap_cfg = &rzv2h_sysc_regmap,
 };
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index ffa65fb4dade..70556a2f55e6 100644
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
@@ -100,14 +102,19 @@ MODULE_DEVICE_TABLE(of, rz_sysc_match);
 
 static int rz_sysc_probe(struct platform_device *pdev)
 {
+	const struct rz_sysc_init_data *data;
 	const struct of_device_id *match;
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
@@ -117,7 +124,15 @@ static int rz_sysc_probe(struct platform_device *pdev)
 		return PTR_ERR(sysc->base);
 
 	sysc->dev = dev;
-	return rz_sysc_soc_init(sysc, match);
+	ret = rz_sysc_soc_init(sysc, match);
+	if (ret || !data->regmap_cfg)
+		return ret;
+
+	regmap = devm_regmap_init_mmio(dev, sysc->base, data->regmap_cfg);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return of_syscon_register_regmap(dev->of_node, regmap);
 }
 
 static struct platform_driver rz_sysc_driver = {
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 56bc047a1bff..447008140634 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -9,6 +9,7 @@
 #define __SOC_RENESAS_RZ_SYSC_H__
 
 #include <linux/device.h>
+#include <linux/regmap.h>
 #include <linux/sys_soc.h>
 #include <linux/types.h>
 
@@ -34,9 +35,11 @@ struct rz_sysc_soc_id_init_data {
 /**
  * struct rz_sysc_init_data - RZ SYSC initialization data
  * @soc_id_init_data: RZ SYSC SoC ID initialization data
+ * @regmap_cfg: SoC-specific regmap config
  */
 struct rz_sysc_init_data {
 	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
+	const struct regmap_config *regmap_cfg;
 };
 
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
-- 
2.43.0


