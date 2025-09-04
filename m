Return-Path: <linux-renesas-soc+bounces-21333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB89B43A8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE3B25E288E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A684B30506D;
	Thu,  4 Sep 2025 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MS+60N/U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5334303CB4;
	Thu,  4 Sep 2025 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986147; cv=none; b=sDInKg8n/e3A27YqZkEQpMprb3OJIbtguozpJGlA3sWxcIcY0CzO9ohvRk128nPbKSf2VC5lBTR8Fo/PgC9m1p34gd6wSDCCBSY2eTmGFzVKfO5s3NuyYfYAHfdVWkhiAVI3JHcRzKjAkAGnh5pKtByKf5SniO8k5ez3fTIUYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986147; c=relaxed/simple;
	bh=ZhCxxRYlLpjU3mfnFvdogAg17FTMIg+ObYHYliDT8Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E1bCTqvRF+XwPHe/rCcKXGRNLRqVQshQbQGGCVWnp/+HWWxD9YZ/uIEbHywl4uk2hxZEmHL8lF+l6ZJ9t2TY+5zsl2vk/bb+BJ2cPVYECYuLZMIg1rqd6EEP7eQOpjIqz+k3mavVXzIWSohRLqGAlAYmA68SH8NHqwQhypnBjXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MS+60N/U; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3df726ecff3so390025f8f.3;
        Thu, 04 Sep 2025 04:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986144; x=1757590944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkSLStQfOHLAL4atpN/+86grIcI5ZXdinr9UKNViLgk=;
        b=MS+60N/UvN5VtdSbtbp48SZy1xtrpAH6/ScJC++fLaSJeDWylbS+4QgpIANbvygTqy
         +qHbp5yKd3d5y0xsIY3fE3Xhj3NNJl7rnyTUFtfDV82VhOoWZ3hqMXTeGyjX2968A0TF
         zsaWVtbqJgtqGpjUmJQz/EBA7NflmhmatxoUjBjyvOC26R8kRwGt6rrahqWC5EeRwOyE
         NgYplD0PUoe2s2jq04+G6mjOEYW9YVkNk5NFt0Um3uGU14NaTG6qlqwYcoaKu5oXISiY
         AyUGqZp0wGgUKdapQq2K2qLk8qv4UI8o0I1VHFR/tWMPepnabqn+9SXH/l1nzqIPkN3O
         eYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986144; x=1757590944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkSLStQfOHLAL4atpN/+86grIcI5ZXdinr9UKNViLgk=;
        b=P8uRD4P+uQXhcG71n/w5IlmXgpHWrSae15tcHbLijHvUcy4cEzGMTVG3AbDxniqJTB
         z0VCaesaqIBX1flZlWH95x/99lGWZMRp9fbpENqFX4WY73H2mjbTaXRmYgHBwgLccsdN
         IRnaTuwZXFAYYiYlKGUoqIt/WjyEhQS9sTPOMy2ZyhproARHGgTyA+pVnzBr4WUFM3eB
         xCkHVKbDaKDzxGZHuFIniO7lZpUhGYJXdTWP6h2x7arcUPq/ZvpCwHMba5XWGm1nx6aY
         +IxDHrPuPeWyD+jN/ys5WE8F6LgJRGMefnqgZiNlyDu9gybRwRpJGp75p5olRWtQT6cp
         z4dw==
X-Forwarded-Encrypted: i=1; AJvYcCUYSlKxSpgNrBDg32M8tRjsQI82xP9NS9T7vuSIeJ5yMDj6JH2yFZYHXC92MsqTFAr1y8FGZN0dy5z5lwgx@vger.kernel.org, AJvYcCVv/cpYbbAXwK2ZYaWwtCQHQbAf/uAZqFN+Rw0Odc+cQ0G6mxKhqKZIQlIRKfQPN7ioxWZlkjbh@vger.kernel.org, AJvYcCXERpVLqSdMi9vfeLKVz2e8Don29Lv+vTuWGWLrs62l5cQjs8g/bLazz3dulmfN2RHPDiuyKoHOjtrb@vger.kernel.org
X-Gm-Message-State: AOJu0YxZr6Q8Y4rDzDLzuIJW3QcCCrS7j10Lbg2oIsmaGYsTbPJ0qHRW
	PQmXGsYnXaDVeTVuXgmA18HzCVUBod2VUbULZqFlOlImHdPYBX9U0bNH
X-Gm-Gg: ASbGncszC725Y4KHODgHSlvc3+1DABnPYub7Mouc5itITGw+ef1YmTKAnCBtGmwp8dz
	AZrZ8p1y3lJCSJWShlX49sAkxvQYT/0S1fKPoo2CdHFmZgI4qsjvKt7GtTDgI/gcN7vnuNxXeA6
	+PoBgon1BFKFi+UuT0+sR7tfcSj45N1mttwEHIGTG0NMYqqlHC2JBUlCC8NNZhv2wZguHqEo+EZ
	00wWg1xBoh2SRIcSIMLFJdBT1noP6AT37zqAB4BtUsvG694szvxx1phhvhEjakRidzQ031X5ylp
	I3MS5ivk0KlJRj7IPG0mQqe41MrL0UHgtC7v3lSSQvcHc+TAhWXJN+voN6Dj9oDqFlWkeeMWZYa
	RV2eCZsnV2l+hxlxsaQbi9xK7dZxQ4pPKEXcJr8NDC1byLGL11QGszKDo3w==
X-Google-Smtp-Source: AGHT+IEFMz4IXO1OgHZd1PaB01r0haZ1V/WHAlrm7HnQMPU3/qt75Sgmr83WL/Dg1xKkARcBxT8d+A==
X-Received: by 2002:a05:6000:26c5:b0:3c8:29eb:732e with SMTP id ffacd0b85a97d-3d1df539ea3mr14494080f8f.59.1756986143767;
        Thu, 04 Sep 2025 04:42:23 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 9/9] net: pcs: rzn1-miic: Add RZ/T2H MIIC support
Date: Thu,  4 Sep 2025 12:42:03 +0100
Message-ID: <20250904114204.4148520-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the Renesas RZ/T2H MIIC by defining SoC-specific
modctrl match tables, register map, and string representations
for converters and ports.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped regx in config description.
- Used "renesas,r9a09g077-miic" as compatible for RZ/T2H.
---
 drivers/net/pcs/Kconfig         | 11 +++--
 drivers/net/pcs/pcs-rzn1-miic.c | 82 +++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 5 deletions(-)

diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
index f6aa437473de..76dbc11d9575 100644
--- a/drivers/net/pcs/Kconfig
+++ b/drivers/net/pcs/Kconfig
@@ -26,11 +26,12 @@ config PCS_MTK_LYNXI
 	  which is part of MediaTek's SoC and Ethernet switch ICs.
 
 config PCS_RZN1_MIIC
-	tristate "Renesas RZ/N1 MII converter"
-	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	tristate "Renesas RZ/N1, RZ/N2H, RZ/T2H MII converter"
+	depends on OF
+	depends on ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G087 || COMPILE_TEST
 	help
-	  This module provides a driver for the MII converter that is available
-	  on RZ/N1 SoCs. This PCS converts MII to RMII/RGMII or can be set in
-	  pass-through mode for MII.
+	  This module provides a driver for the MII converter available on
+	  Renesas RZ/N1, RZ/N2H, and RZ/T2H SoCs. This PCS converts MII to
+	  RMII/RGMII, or can be set in pass-through mode for MII.
 
 endmenu
diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 86d4dccd694e..5ec36bf042cd 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -21,6 +21,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <dt-bindings/net/pcs-rzn1-miic.h>
+#include <dt-bindings/net/renesas,r9a09g077-pcs-miic.h>
 
 #define MIIC_PRCMD			0x0
 #define MIIC_ESID_CODE			0x4
@@ -125,6 +126,57 @@ static const char * const index_to_string[] = {
 	"CONV5",
 };
 
+static struct modctrl_match rzt2h_modctrl_match_table[] = {
+	{0x0, {ETHSS_GMAC0_PORT, ETHSS_ETHSW_PORT0, ETHSS_ETHSW_PORT1,
+	       ETHSS_ETHSW_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x1, {MIIC_MODCTRL_CONF_NONE, ETHSS_ESC_PORT0, ETHSS_ESC_PORT1,
+	       ETHSS_GMAC2_PORT, ETHSS_GMAC1_PORT}},
+
+	{0x2, {ETHSS_GMAC0_PORT, ETHSS_ESC_PORT0, ETHSS_ESC_PORT1,
+		ETHSS_ETHSW_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x3, {MIIC_MODCTRL_CONF_NONE, ETHSS_ESC_PORT0, ETHSS_ESC_PORT1,
+	       ETHSS_ESC_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x4, {ETHSS_GMAC0_PORT, ETHSS_ETHSW_PORT0, ETHSS_ESC_PORT1,
+	       ETHSS_ESC_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x5, {ETHSS_GMAC0_PORT, ETHSS_ETHSW_PORT0, ETHSS_ESC_PORT1,
+	       ETHSS_ETHSW_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x6, {ETHSS_GMAC0_PORT, ETHSS_ETHSW_PORT0, ETHSS_ETHSW_PORT1,
+	       ETHSS_GMAC2_PORT, ETHSS_GMAC1_PORT}},
+
+	{0x7, {MIIC_MODCTRL_CONF_NONE, ETHSS_GMAC0_PORT, ETHSS_GMAC1_PORT,
+		ETHSS_GMAC2_PORT, MIIC_MODCTRL_CONF_NONE}}
+};
+
+static const char * const rzt2h_conf_to_string[] = {
+	[ETHSS_GMAC0_PORT]	= "GMAC0_PORT",
+	[ETHSS_GMAC1_PORT]	= "GMAC1_PORT",
+	[ETHSS_GMAC2_PORT]	= "GMAC2_PORT",
+	[ETHSS_ESC_PORT0]	= "ETHERCAT_PORT0",
+	[ETHSS_ESC_PORT1]	= "ETHERCAT_PORT1",
+	[ETHSS_ESC_PORT2]	= "ETHERCAT_PORT2",
+	[ETHSS_ETHSW_PORT0]	= "SWITCH_PORT0",
+	[ETHSS_ETHSW_PORT1]	= "SWITCH_PORT1",
+	[ETHSS_ETHSW_PORT2]	= "SWITCH_PORT2",
+};
+
+static const char * const rzt2h_index_to_string[] = {
+	"SWITCH_PORTIN",
+	"CONV0",
+	"CONV1",
+	"CONV2",
+	"CONV3",
+};
+
+static const char * const rzt2h_reset_ids[] = {
+	"rst",
+	"crst",
+};
+
 /**
  * struct miic - MII converter structure
  * @base: base address of the MII converter
@@ -203,11 +255,24 @@ static inline void miic_unlock_regs(struct miic *miic)
 	writel(0x0001, miic->base + MIIC_PRCMD);
 }
 
+static inline void miic_lock_regs(struct miic *miic)
+{
+	/* Protect register writes */
+	writel(0x0000, miic->base + MIIC_PRCMD);
+}
+
 static void miic_reg_writel_unlocked(struct miic *miic, int offset, u32 value)
 {
 	writel(value, miic->base + offset);
 }
 
+static void miic_reg_writel_locked(struct miic *miic, int offset, u32 value)
+{
+	miic_unlock_regs(miic);
+	writel(value, miic->base + offset);
+	miic_lock_regs(miic);
+}
+
 static void miic_reg_writel(struct miic *miic, int offset, u32 value)
 {
 	miic->of_data->miic_write(miic, offset, value);
@@ -645,7 +710,24 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.miic_write = miic_reg_writel_unlocked,
 };
 
+static struct miic_of_data rzt2h_miic_of_data = {
+	.match_table = rzt2h_modctrl_match_table,
+	.match_table_count = ARRAY_SIZE(rzt2h_modctrl_match_table),
+	.conf_conv_count = 5,
+	.conf_to_string = rzt2h_conf_to_string,
+	.conf_to_string_count = ARRAY_SIZE(rzt2h_conf_to_string),
+	.index_to_string = rzt2h_index_to_string,
+	.index_to_string_count = ARRAY_SIZE(rzt2h_index_to_string),
+	.miic_port_start = 0,
+	.miic_port_max = 4,
+	.sw_mode_mask = GENMASK(2, 0),
+	.reset_ids = rzt2h_reset_ids,
+	.reset_count = ARRAY_SIZE(rzt2h_reset_ids),
+	.miic_write = miic_reg_writel_locked,
+};
+
 static const struct of_device_id miic_of_mtable[] = {
+	{ .compatible = "renesas,r9a09g077-miic", .data = &rzt2h_miic_of_data },
 	{ .compatible = "renesas,rzn1-miic", .data = &rzn1_miic_of_data },
 	{ /* sentinel */ }
 };
-- 
2.51.0


