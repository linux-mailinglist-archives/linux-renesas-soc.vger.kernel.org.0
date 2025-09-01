Return-Path: <linux-renesas-soc+bounces-21146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D64AAB3F137
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 00:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2C434E06E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 22:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D1429B216;
	Mon,  1 Sep 2025 22:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLQ5+tiH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE286296BC0;
	Mon,  1 Sep 2025 22:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756766636; cv=none; b=MhFmuF5uYAAySdjVVIv8ebVvNkA98/0Lo3rmZjFPOdbpM9lINn97z6B1cqtZ5IgA4mJNWwwJQHOsI6p/COboBLZoPq1Q70FqrECKfnfex7DcF9wauP2oLkpzjjz2S4qPdo3KSRsP6DQn/K6DAfsaDPorJFqyXXKyaMp/Dx8jkcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756766636; c=relaxed/simple;
	bh=SCLkrsEWnzB9eKvqG0q6Ea4G1QTnBOSaX79K7x+a/dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LPiHyn6JAXjxQu+6ItxOJ7Wz8ovGTC3a9u8i0v+NMw2x52Vr3rVCZRgcfCrggBZaL4lDBH/kMp4j6DDYvvmt0invK/xcyGp8LMpmcGM/rQ40cNY5UrxDHNeIIOnRXQj91zNIzXLcTcUzrTuCcYzmi5TfkbCiQOHCHte0sbWLlPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLQ5+tiH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so18965855e9.0;
        Mon, 01 Sep 2025 15:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756766633; x=1757371433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4Gu7IGtrz35Fo4f6Ngu2+JRiwq4NSt4HvcJP5xmKD4=;
        b=TLQ5+tiHr4R8c5uqH1hWAgZ0R+ZRd559GszlfrUUnw0s57aWZcqNTpw0xhc+BhtALX
         3q98WsKtAJIzq3NcOXvnVjJrszjX3vs2RIx1vyj7nY8nOR/i9jwL4cFhp4iIy2MVcyf9
         PrOptt4GLodDGp+/sZy0ZbDBP+mBzw5256mspOWQoIZLB8CmwuiayUUsq943N/NaKxX/
         R1TaAwomM3h202AEg3IvJXdOVrMr7VXxsVVIUU/8aND/kl6RJ3h+fUQNs/tEoxTurizL
         IgY05PKLiyzlvzirRT1VfSDIFiBm1wmcB4+sW1CviHJOa/wE4/sHuLtxSjvLCFBj9dJY
         dbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756766633; x=1757371433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4Gu7IGtrz35Fo4f6Ngu2+JRiwq4NSt4HvcJP5xmKD4=;
        b=EtAgtnQbLKp8B1tKZ75IA84KRHf9OV9U2+tjHBleK2DCYntzYwyFchHmJuGA3ml2JT
         8ruDVfCxO3rC5YNyD6Tlwuh6H1jHgFSgcLFJU5ALtTgPFu+YgyEcqx92KI7LX5/UgL2Z
         VrY6V6RUbTw6fwmi+/Hv6SOOkOCUZq1dCOK29kWUTGNc8Wunx//q9TY5BnMq3QykTknb
         sH0ckxOzdWJmlD/0EBzaq0EhwIHErWPTaz9xAmeKv8MnX6LvZP+xhsn6/HfGzkGmw1wJ
         cK3q7XlAXETtRenOYemlugVcYxBLHdb+GNArWIWZHPKso5i9Bq0mgEbDlx9GISzura7S
         F0Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUHkuEM8g2GGSQv2AjCFNHn06W4nGhKUgNG6B3xkfIMJBR30x0FVM1HVjUZUX2w1ehFd18Ej+P+@vger.kernel.org, AJvYcCUW40gJV77FaeVM0c+W0IZ6/HHk6YZci9Tw9zMKO/ID30OkG0+3UsB/p0X4xPXOIpi/4QN2pI5IZ2QR@vger.kernel.org, AJvYcCWsH6axmX3hSeKp8QGwfAdxkgA/j9+DikQqIp6hr/kyC9k7z5YMsveLl0MwoPqfqwMHWM3uwC55cDHXnirR@vger.kernel.org
X-Gm-Message-State: AOJu0YzLBAPd5hIgQjmViC8ryICF02cj9D7oj24rYT3eFdCHKOL/KBEj
	en3+UGZFev8XyUfBOgaUitjNZkweUbfEyhvsteyQCraqqN0iPjAICUd1
X-Gm-Gg: ASbGncujlWaA756xZdlFdWY4WmtVUF0eLxrsWdUhOVvO2ci5KwlkDcpd57ecXxAHh7t
	383VnN/S1Wg13i4Pd+Qt7oj1Wl9E2jxc+OKpZWjTypXEA9h5xFXHenX0By8JDEdxG+C4ACQC5qI
	f8n8rjnBEHB48y2d7G7xugsDrAoUWh4lyDoPCNjjtYwSgVszB4y+dE5IVylKaITHbnK9r0HE5SY
	jB6JFKd8oxL7ujydmQ1lP26pRg6xzWzdVgeICvYqR+czdmaxsa9B/Aq4Kycpu+aQvocauDP4zre
	0ao7OlhVZumwlNQ6ov16qdIZPlUZWW7LEBmLiMyiNjQvmCA83LXuHy0irwGWJ7+9wFIkEpBM5hG
	8H0zH7mTmwOv63EysD4Q5NnF225SqOQ2Z0A1f2wK+kgROhqXglvCY35Om
X-Google-Smtp-Source: AGHT+IHp0y726g+Zzu2IZQPOjiBXQwp8bRxiUnH9+BmM9YDF9R54b31Y68vJBceZtELyEzGsEv2jQA==
X-Received: by 2002:a5d:64c4:0:b0:3d6:3af4:7cdb with SMTP id ffacd0b85a97d-3d63af4814bmr4946588f8f.24.1756766632695;
        Mon, 01 Sep 2025 15:43:52 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d2250115fdsm11532607f8f.40.2025.09.01.15.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:43:51 -0700 (PDT)
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
Subject: [PATCH net-next 09/10] net: pcs: rzn1-miic: Add RZ/T2H MIIC support
Date: Mon,  1 Sep 2025 23:43:22 +0100
Message-ID: <20250901224327.3429099-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/net/pcs/Kconfig         | 11 +++--
 drivers/net/pcs/pcs-rzn1-miic.c | 82 +++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+), 5 deletions(-)

diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
index f6aa437473de..9e19692985d7 100644
--- a/drivers/net/pcs/Kconfig
+++ b/drivers/net/pcs/Kconfig
@@ -26,11 +26,12 @@ config PCS_MTK_LYNXI
 	  which is part of MediaTek's SoC and Ethernet switch ICs.
 
 config PCS_RZN1_MIIC
-	tristate "Renesas RZ/N1 MII converter"
-	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
+	tristate "Renesas RZ/{N1, T2H, N2H} MII converter"
+	depends on OF
+	depends on ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G087 || COMPILE_TEST
 	help
-	  This module provides a driver for the MII converter that is available
-	  on RZ/N1 SoCs. This PCS converts MII to RMII/RGMII or can be set in
-	  pass-through mode for MII.
+	  This module provides a driver for the MII converter available on
+	  Renesas RZ/N1, RZ/T2H, and RZ/N2H SoCs. This PCS converts MII to
+	  RMII/RGMII, or can be set in pass-through mode for MII.
 
 endmenu
diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 86d4dccd694e..024562204d7c 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -21,6 +21,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <dt-bindings/net/pcs-rzn1-miic.h>
+#include <dt-bindings/net/pcs-rzt2h-miic.h>
 
 #define MIIC_PRCMD			0x0
 #define MIIC_ESID_CODE			0x4
@@ -125,6 +126,57 @@ static const char * const index_to_string[] = {
 	"CONV5",
 };
 
+static struct modctrl_match rzt2h_modctrl_match_table[] = {
+	{0x0, {ETHSS_GMAC0_PORT, ETHSS_SWITCH_PORT0, ETHSS_SWITCH_PORT1,
+	       ETHSS_SWITCH_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x1, {MIIC_MODCTRL_CONF_NONE, ETHSS_ETHERCAT_PORT0, ETHSS_ETHERCAT_PORT1,
+	       ETHSS_GMAC2_PORT, ETHSS_GMAC1_PORT}},
+
+	{0x2, {ETHSS_GMAC0_PORT, ETHSS_ETHERCAT_PORT0, ETHSS_ETHERCAT_PORT1,
+		ETHSS_SWITCH_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x3, {MIIC_MODCTRL_CONF_NONE, ETHSS_ETHERCAT_PORT0, ETHSS_ETHERCAT_PORT1,
+	       ETHSS_ETHERCAT_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x4, {ETHSS_GMAC0_PORT, ETHSS_SWITCH_PORT0, ETHSS_ETHERCAT_PORT1,
+	       ETHSS_ETHERCAT_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x5, {ETHSS_GMAC0_PORT, ETHSS_SWITCH_PORT0, ETHSS_ETHERCAT_PORT1,
+	       ETHSS_SWITCH_PORT2, ETHSS_GMAC1_PORT}},
+
+	{0x6, {ETHSS_GMAC0_PORT, ETHSS_SWITCH_PORT0, ETHSS_SWITCH_PORT1,
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
+	[ETHSS_ETHERCAT_PORT0]	= "ETHERCAT_PORT0",
+	[ETHSS_ETHERCAT_PORT1]	= "ETHERCAT_PORT1",
+	[ETHSS_ETHERCAT_PORT2]	= "ETHERCAT_PORT2",
+	[ETHSS_SWITCH_PORT0]	= "SWITCH_PORT0",
+	[ETHSS_SWITCH_PORT1]	= "SWITCH_PORT1",
+	[ETHSS_SWITCH_PORT2]	= "SWITCH_PORT2",
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
@@ -645,8 +710,25 @@ static struct miic_of_data rzn1_miic_of_data = {
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
 	{ .compatible = "renesas,rzn1-miic", .data = &rzn1_miic_of_data },
+	{ .compatible = "renesas,rzt2h-miic", .data = &rzt2h_miic_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, miic_of_mtable);
-- 
2.51.0


