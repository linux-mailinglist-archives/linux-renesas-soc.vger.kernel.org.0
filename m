Return-Path: <linux-renesas-soc+bounces-15979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC62A89732
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 10:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCAB617E35A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 08:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9AA827510F;
	Tue, 15 Apr 2025 08:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3kvwCzC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452C218EB7;
	Tue, 15 Apr 2025 08:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707299; cv=none; b=IfoF7a92FS1MU6e6KKQkkCZnnm1gN8TscZrCe9aVq+KxXy5n0uTVSRXbaF3F+w4p1P0KpWU7p43rx4o6W2EpzSknmlGSJRz01dMVNK1Qv8R6qMpQhr3ClXsNQjXeuY+EZWezTFKXOionDM4/wVbbtpPxmFZGKHSoiHdN/F1X+n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707299; c=relaxed/simple;
	bh=wzQBQF8ORyj2oXWzu8VNoj3nCal7Tdwr8tyZz8abvSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JXqUER9ox6nGkT3lxeEWqp6j8FTR67/VaqXFiJnWOjh1cl0eR37lECbhkWZZecmDQqWDDLtoF31wJmcv0kO88nhzrb23okSRsNF3LMo0ifGNXUyHg4nud4L5CWrTbbRi5DEEDdWpX7e1b2J/yzTbx5FG8ZdbkfpyMNJyEhmyDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h3kvwCzC; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2915934f8f.2;
        Tue, 15 Apr 2025 01:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744707296; x=1745312096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mpPFETAdK6pHR99uQ7hWDbkrbXB15kaJorbk1ppPEHs=;
        b=h3kvwCzCzFB9szTcWqONGwm+UPNuFSld5fIAiWoLEUD6C6ZuPQO998nGjrgfrMKeWA
         3TYcRLQdCdGyGJcOVYYpnV+ULyVmgSBM4Avip5n1//s+Bk1nW6BGDUJf0IG020aSj2Q/
         Gg0UQtFNyF0UxtEsBSMqaM+6lfR3eZn3J23YGahXiR4vh2Zyf/UqRJURuKHPZ7MH2pOl
         zEzO1OkmyXx/BkzJBbJPnKX1P93b3x3pCxE9CF8jsA4V97DF5VepOBwjVkM0gDilwhGC
         dubOmJQe0dhcOUKsoDdq3o83gvkRPSnmtLb+K/974LaT9+5jSyrrezDC69XQbsDEd9p4
         mlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707296; x=1745312096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpPFETAdK6pHR99uQ7hWDbkrbXB15kaJorbk1ppPEHs=;
        b=d6mJ1+QcLXvBoaR556JoUwKONO/AVTlFf2BFKZteKEhCvBgRrNs1ptiTyqo9D7E9gu
         EOX8JHes55KAVvYbdPOv2qzMn6CaWzgfIURcynRy5eMLwjVijtie1394+IEXsy1VvgtK
         d5gB4enz5gWATBU0cmiyRaFikA6lftbUR7uTy2XdYdcLUwL4QtKaIcoUXCxXd+T5Y8bW
         X1Zsz7/Rg06yprNGkf8IsMtR1l3iBiGUiWD9/Awv9mivHAJO4FYaNtHdUfr05ZONwKyu
         cpkWly5omn3LUJFj5kjq67dXNxVFBMA25d3gytSZydKUPq1hrgT/CBESdNc79N7F+7zj
         nSyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX16yCglgiPlHKZA18i4zqFbuly3UqPS94dSwZcccdCMoE5iuDn7Dqps1Wy4qFu/e3ZpWw/sxEuZlmwRu9a+3qS/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFB64M6IsN0eABdyMm9VVbXSQt3vTReOgeGzYftEOR3gW4rOR4
	f1hgQY8H7IDfAUA8/oDXAR9gWK/ycEhaFyShzQ/AsIbWdUrjVzgP
X-Gm-Gg: ASbGncsC5rGDjL69Wm4oRYzCQmPsd9ZsZorWO5fqpd/6cCGte1enzXsWqS1BFR282MH
	l4RRsvEZEwmxf/K65Rvc2IOKR6zgXmJ653ps714rfGOhPa2fEwxhv/+4yPlwCq8jZi24cw+FmPI
	tk8a6p4FxavzmhRFyl7Eh1TLlVzkz4+3cZohAGcUTEaq6M5MjXFRTBXjYIFZLcQj6iK3y6gY4IQ
	lowhtPdVaRUKOWaGeCdLcP0JcIXq0FK7ZGeKQUMjAjg8c2p5aaVk0txwa7NWFUG/+eG90Soajrc
	20vPDCt3529Kvg8A5Gosk6Ci0PtkSazlazj2t9n+Bnw/AmD8nQyJXNO970tLZj5D
X-Google-Smtp-Source: AGHT+IEY2B0zKtG6n2kdgsEnmJbc+t3/tvuPnGH7qJxdHPJ8tey1b6eY11+by9OyjwHzdUc3c+fNVg==
X-Received: by 2002:a05:6000:1a88:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-39ea5212b03mr13391512f8f.25.1744707295918;
        Tue, 15 Apr 2025 01:54:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9797aasm13616001f8f.56.2025.04.15.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 01:54:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] soc: renesas: sysc: Add SoC identification for RZ/V2N SoC
Date: Tue, 15 Apr 2025 09:54:38 +0100
Message-ID: <20250415085438.83856-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add SoC identification for the RZ/V2N SoC using the System Controller
(SYS) block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi All,
This patch is from series [0]. Since most of the patches have already
been queued, I'm sending this one separately.

[0] https://lore.kernel.org/all/20250407191628.323613-5-prabhakar.mahadev-lad.rj@bp.renesas.com/
Cheers, Prabhakar

v2->v3:
- Updated dev_info message to include the SoC revision and feature flags.
- Dropped `<linux/string.h>` include.
v1->v2:
- No changes in the code.
---
 drivers/soc/renesas/Kconfig         |  5 ++
 drivers/soc/renesas/Makefile        |  1 +
 drivers/soc/renesas/r9a09g056-sys.c | 77 +++++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c       |  3 ++
 drivers/soc/renesas/rz-sysc.h       |  1 +
 5 files changed, 87 insertions(+)
 create mode 100644 drivers/soc/renesas/r9a09g056-sys.c

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index f02b8fe60e6b..fbc3b69d21a7 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -396,6 +396,7 @@ config ARCH_R9A09G047
 config ARCH_R9A09G056
 	bool "ARM64 Platform support for RZ/V2N"
 	default y if ARCH_RENESAS
+	select SYS_R9A09G056
 	help
 	  This enables support for the Renesas RZ/V2N SoC variants.
 
@@ -445,6 +446,10 @@ config SYS_R9A09G047
 	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
 	select SYSC_RZ
 
+config SYS_R9A09G056
+	bool "Renesas RZ/V2N System controller support" if COMPILE_TEST
+	select SYSC_RZ
+
 config SYS_R9A09G057
 	bool "Renesas RZ/V2H System controller support" if COMPILE_TEST
 	select SYSC_RZ
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 81d4c5726e4c..3bdcc6a395d5 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_ARCH_R9A06G032)	+= r9a06g032-smp.o
 endif
 obj-$(CONFIG_SYSC_R9A08G045)	+= r9a08g045-sysc.o
 obj-$(CONFIG_SYS_R9A09G047)	+= r9a09g047-sys.o
+obj-$(CONFIG_SYS_R9A09G056)	+= r9a09g056-sys.o
 obj-$(CONFIG_SYS_R9A09G057)	+= r9a09g057-sys.o
 
 # Family
diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
new file mode 100644
index 000000000000..1b7185db929d
--- /dev/null
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * RZ/V2N System controller (SYS) driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/io.h>
+
+#include "rz-sysc.h"
+
+/* Register Offsets */
+#define SYS_LSI_MODE		0x300
+#define SYS_LSI_MODE_SEC_EN	BIT(16)
+/*
+ * BOOTPLLCA[1:0]
+ *	    [0,0] => 1.1GHZ
+ *	    [0,1] => 1.5GHZ
+ *	    [1,0] => 1.6GHZ
+ *	    [1,1] => 1.7GHZ
+ */
+#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
+#define SYS_LSI_MODE_CA55_1_7GHZ	0x3
+
+#define SYS_LSI_PRR			0x308
+#define SYS_LSI_PRR_GPU_DIS		BIT(0)
+#define SYS_LSI_PRR_ISP_DIS		BIT(4)
+
+#define SYS_RZV2N_FEATURE_G31		BIT(0)
+#define SYS_RZV2N_FEATURE_C55		BIT(1)
+#define SYS_RZV2N_FEATURE_SEC		BIT(2)
+
+static void rzv2n_sys_print_id(struct device *dev,
+			       void __iomem *sysc_base,
+			       struct soc_device_attribute *soc_dev_attr)
+{
+	unsigned int part_number;
+	u32 prr_val, mode_val;
+	u8 feature_flags;
+
+	prr_val = readl(sysc_base + SYS_LSI_PRR);
+	mode_val = readl(sysc_base + SYS_LSI_MODE);
+
+	/* Check GPU, ISP and Cryptographic configuration */
+	feature_flags = !(prr_val & SYS_LSI_PRR_GPU_DIS) ? SYS_RZV2N_FEATURE_G31 : 0;
+	feature_flags |= !(prr_val & SYS_LSI_PRR_ISP_DIS) ? SYS_RZV2N_FEATURE_C55 : 0;
+	feature_flags |= (mode_val & SYS_LSI_MODE_SEC_EN) ? SYS_RZV2N_FEATURE_SEC : 0;
+
+	part_number = 41 + feature_flags;
+
+	dev_info(dev, "Detected Renesas %s %sn%d Rev %s%s%s%s%s\n", soc_dev_attr->family,
+		 soc_dev_attr->soc_id, part_number, soc_dev_attr->revision, feature_flags ?
+		 " with" : "", feature_flags & SYS_RZV2N_FEATURE_G31 ? " GE3D (Mali-G31)" : "",
+		 feature_flags & SYS_RZV2N_FEATURE_SEC ? " Cryptographic engine" : "",
+		 feature_flags & SYS_RZV2N_FEATURE_C55 ? " ISP (Mali-C55)" : "");
+
+	/* Check CA55 PLL configuration */
+	if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) != SYS_LSI_MODE_CA55_1_7GHZ)
+		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n");
+}
+
+static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initconst = {
+	.family = "RZ/V2N",
+	.id = 0x867d447,
+	.devid_offset = 0x304,
+	.revision_mask = GENMASK(31, 28),
+	.specific_id_mask = GENMASK(27, 0),
+	.print_id = rzv2n_sys_print_id,
+};
+
+const struct rz_sysc_init_data rzv2n_sys_init_data = {
+	.soc_id_init_data = &rzv2n_sys_soc_id_init_data,
+};
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 14db508f669f..ffa65fb4dade 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -88,6 +88,9 @@ static const struct of_device_id rz_sysc_match[] = {
 #ifdef CONFIG_SYS_R9A09G047
 	{ .compatible = "renesas,r9a09g047-sys", .data = &rzg3e_sys_init_data },
 #endif
+#ifdef CONFIG_SYS_R9A09G056
+	{ .compatible = "renesas,r9a09g056-sys", .data = &rzv2n_sys_init_data },
+#endif
 #ifdef CONFIG_SYS_R9A09G057
 	{ .compatible = "renesas,r9a09g057-sys", .data = &rzv2h_sys_init_data },
 #endif
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index aa83948c5117..56bc047a1bff 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -42,5 +42,6 @@ struct rz_sysc_init_data {
 extern const struct rz_sysc_init_data rzg3e_sys_init_data;
 extern const struct rz_sysc_init_data rzg3s_sysc_init_data;
 extern const struct rz_sysc_init_data rzv2h_sys_init_data;
+extern const struct rz_sysc_init_data rzv2n_sys_init_data;
 
 #endif /* __SOC_RENESAS_RZ_SYSC_H__ */
-- 
2.49.0


