Return-Path: <linux-renesas-soc+bounces-21748-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E69E1B5228E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 22:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07E90583D8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 20:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F793043B6;
	Wed, 10 Sep 2025 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQjjS77/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2856D3064A6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 20:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757536911; cv=none; b=kRIm29YjR1qtjRgFyy/BVGg4YeBV8hw7mO6Jnk+7+dEluMWOA9wecM5oNs15L5jjurx3AivbxHpGfN/Q/k+NJvAMrFryZNKPmBW4m4hj/07OUQLfP/evuKEqTY6woV3/Ochr5WjV60cyqsULxBo2qXm0uLNYRfmwotcO/s3zDc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757536911; c=relaxed/simple;
	bh=llYEKR9ZsQCFnMi48dM1Js47Rbaf1JKFBze2trZI1y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cbn+yHlI0QUv4375NQ8gfpkoaIry1i1cDaIo0Zru8xpH4w5BZukgL2O5599azKcd7OjPtHHmlxvezaJTAGYyE1SDbfAyrth5/tDkT9FyHhEIzLQ/Sa31dMiZNcdpbt+9ErZgP7/gRj//IOwZ5YOCYvvu4jF9qmrLHQAUkYk8Y5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQjjS77/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso143735e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 13:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757536907; x=1758141707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FHTZRydesHvIXXhzlLwXfJdC1zrWRzHVjiGEebmFrg=;
        b=iQjjS77/YpOurYBP4UYx2wDmKedhsCTQvyJbum1WQi33+Se23EoTud3ubl2VJ3fJmE
         ofl6xtvl/desp17hIWbuFuLlGuahuPr44cuCX/VQWG3ImCXPmkAJB5mG9ISJlkbbEx/k
         1DEBnFFIc4aUDOFiCtvEQ9JjkqA62AL9hUB9pTQYrZTuDmZuDq1vQTeVPpwDngagJPwf
         vVJMbRNsbXKj6of0B5Q1dcFuY8twVXHTvHlphqBje2OVAo5iKIJP86x4QvtEzUVGTWEB
         sKRmfKsz97Xo8iCDjyrIOt4rmu1k9S/3zs7QSTZSof2fesRrocn+kxIgyFtCz0hONykC
         NYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757536907; x=1758141707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FHTZRydesHvIXXhzlLwXfJdC1zrWRzHVjiGEebmFrg=;
        b=aaO3fj/VYvQPVm06hgr2acQAfoHFpGHEzLqkNmv49SFsO+eiGWSGQG7jo8Se25UHK1
         bUsLZHaiV1pHKNCiYGJYtN/I/ENyIKwtwoFx+RZLAxwtOGOJAHcUWA8KN3VOzlhTvo2d
         09SD5pAcILYbpnfyUUGBGm5uwVZfofUyt6oHiHBcJcFBy94KlUPDIluq7KJ5qDoJGRrm
         8hiNCqyPfopiPUW44k7fx8FdFRmgzJIwJZDJN+PlD0xR/ZwRKl483EOFC24i2Rq8msdG
         Kg6odrijqTgJAM3H4K+x1GEolgln3gjHPA3nJdVWlPgHDVibep5BswUeWlKnK1ZALdX5
         4cdA==
X-Gm-Message-State: AOJu0YwH2Dh3294KUP1OYuTPdhdKcVU1g0gwq8NqnOGoftZfU9sB68ue
	XVOjs+yPEddpT5/L4xgaVSWEe95qnoxAFjK3ZtzyONUnF3euXdv2WBlF
X-Gm-Gg: ASbGncuZ4HRkjFSOP7W1XBVQP8sjFhQvfI90SYMrMY/b6heepPXy6pIz3cmLQi2aWcj
	BeycgcSM8lF4Qj9W5fYfpEYzw5GBZn0BZv0XhbbmbnJhnePxrIKORuXhYjN+uc/NnOWSwrZKZzE
	UvZT8n5d4Cm4VFtrt4yp/ZZE6biJ6QIQ5UI75gXlaQK+ooF9dXDbQjPhgF4oHOV/i6YsTraWobN
	M6+uCQ3dr2uAR/KcmFkR8IrXlusTkFSSSFhmJ2Zo6uOqpfoY6lt/pHV6RA1Bq19UCWEPnROsvFe
	Dq6+gOxQqyYfZ+3zY+EBtsnRMpOPW9LvGFIupDb0L7J9+pBX3F2RHI5KK87TC3F4YHuVTOV7E7j
	ohOPio21wtsyBkyr22zi8dLD42fRmYQCqDJPjHk/Y9WyqGGo=
X-Google-Smtp-Source: AGHT+IGbpCneuFgKariSapKev3xYB10Cgl8j+/UcwQVOYSv/8nDk4BOfl8jeZtgRapP8sGugb4Kc/Q==
X-Received: by 2002:a05:6000:40ca:b0:3e2:a7d0:add3 with SMTP id ffacd0b85a97d-3e636d900cdmr14105621f8f.11.1757536907147;
        Wed, 10 Sep 2025 13:41:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ee64:b92b:f8fd:6cd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157d68esm320085e9.6.2025.09.10.13.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:41:46 -0700 (PDT)
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 9/9] net: pcs: rzn1-miic: Add RZ/T2H MIIC support
Date: Wed, 10 Sep 2025 21:41:30 +0100
Message-ID: <20250910204132.319975-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250910204132.319975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2->v3:
- Dropped inlining of miic_lock_regs().
- Added Tested-by tag.

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
index ef10994d8c11..885f17c32643 100644
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
@@ -204,11 +256,24 @@ static void miic_unlock_regs(struct miic *miic)
 	writel(0x0001, miic->base + MIIC_PRCMD);
 }
 
+static void miic_lock_regs(struct miic *miic)
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
@@ -666,7 +731,24 @@ static struct miic_of_data rzn1_miic_of_data = {
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


