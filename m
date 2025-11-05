Return-Path: <linux-renesas-soc+bounces-24115-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F24FC3422F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 08:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AFCF18C188C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 07:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF69A2D0C60;
	Wed,  5 Nov 2025 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Q9hNz3FJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9AC2D060C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Nov 2025 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762326336; cv=none; b=WfLZ8r9auQD1ABesKaOI+VqEw5YplmFHGnOEL4mKbOMq3HbtgYgykQOucgsy8CkQMCX+jF9j8V0fbj2OosoYbimuYglDawYUAFad5GdkK8gef6dAUZudj+sWL6hT/xv4FHAGYymrrY97X3cjc88VPX7b55smTAxpi3RBYfmVIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762326336; c=relaxed/simple;
	bh=lhDkAQ4kr78D99O0a7na/KEqoaXqKwoajkeCwTiMOrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HI4LTeuq2Ysr4fQ88n26KPJEsVaBoVdd/GHxb8VBHMz+1rc1X5I/k3ULLPFNHYXyCcICFdgfFprAyag3rib6SPf87NOeumrLBFfvSF1R1+yaQrS7L1MLtT2ISf/ofs+ZAVjWgwAHXPOEpoT0ZjReGlcrg27nVbqNuIGmUs4stA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Q9hNz3FJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47112a73785so40992265e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 23:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762326332; x=1762931132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ks9fyBm/fH9vLCyV5g4+RxI0CfJjx/IAJ59IrtxkkEM=;
        b=Q9hNz3FJFOt9uVfiZdqhFDRt9Z3QMG95LM47Vv+UXgsDM1T/IEsgnPEa4ZflEmGcjC
         t5xKtKiXe6/bzwnJYBZemCarhSNQVnbHQiDv0jcPvEOiFV22LHP3NJx/A/dTCbye4FWn
         Kw0pG8lpPyoPYQQA+BWfrziWlhz/LXRLpYSbPnxj4SVpOdCKSca7e4DSUlm7PiC3divB
         TSxsruF1abKFSI+Mdcux4D2NyvjBvey2pPLE/eY7QeHDO9PoqMxBB/vOgeAeZU9fOKAd
         HSQKB6AY9ZbgcB2dZHEyrhR5XRAFWANOHjCgUNCawukZ5JgJUoUVmkRqqKvkR8pmVDu6
         ifUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762326332; x=1762931132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ks9fyBm/fH9vLCyV5g4+RxI0CfJjx/IAJ59IrtxkkEM=;
        b=deeXiPlIu1RilEcKI0gsQIWlygII9cy/KH5TkO3oRGo8gTvt9X6HWt5yIqShNiJF4e
         zGzmv1wHnNd8XvQBrMKGFBjikZ3PuvqRqJKnut3pcavac+9PPrEqx0EP7BpHg+Ix6/hV
         Lz0NbV3vHmiG4bs9ub9D7RvO00LS+f1ThVmvJjOY7jw4xeyWfJzgk0I1bGuPC0/EePDx
         plNYQrI2CyPmduYCDi5D0Xkv8EAi0CH26MF5PKgyMPhkms3RvMpWdpzMF4iLpuvj0ZBu
         4lm+J7KbdAWSHFvjU4Lszj90RL8aF3TQyc3pM3P+5urFPm89lzjA8sDkOfbyKqgNiaxq
         6haw==
X-Forwarded-Encrypted: i=1; AJvYcCWhoUzwWjRe0xxVkNp/jFqd8ThWhXgt4a1+7RCo5dyNnYkz8OJoak9FOSe+MpPrCPOdeUuIeQWkT3EEsrFO5yFjPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw7dB1slzdtqFSVxtvcTJmoTMpGRYoxu7WrFxFHpAJElSWlo5+
	aR5djhZ2IXdHZkWbNx2QBvxcomOCZQUZfePm6rYuiNFp8Hm1ChKxTGbZDP0A0/vBdz8OaGw59de
	YST2yIHY=
X-Gm-Gg: ASbGncvMrg1Lkhw00o51fMbIqa9kgZaBNef/v78xLsakWnGYZy6SZ60Xia0p+4G/cS/
	P83JmJC6aTJwbl6C+OI+r0uwgPcGSz9sDTMstr4KpweRDfYJ1haT0xPX0GVRSp/8MnFUksqqMYX
	gQh3XrdItZiq60+e+QltJU7XSlhiSl5k8YCZ9Rn2NgJftpp8BvbrhMB2PTW97IRZagTC+2tqByw
	pwPWQpX+P3//E9+OhTv0YL+x660MqczBOsXqcnYlxCtAbMd0bn2+zmOtbwNBqhHgg+W4ogHb+Uu
	Wj5NCID006i7QdeLiC4qAADTDJXqmm3jHt4UWRZQ17+6ClT+TmvhAXWKQCbkbEti+AhfLaKugdQ
	il8+f2Ab4xYvWmmZ1zS7iqakVTx/Va6QD9rkldzJYDbHe50olgIZFRiV3eXsTDGC8Pmka9GR8rK
	my3Kl01SDjhVofn11t5uOlTzMb8vHT34T7Um3Dv7pa
X-Google-Smtp-Source: AGHT+IFSpPVrk0ZVV5rw7VKNVJsWgnPoyMMmE7Fk75vIi2jqyWdy565dG6nXK4RZwZjxWn7VQoK9Jw==
X-Received: by 2002:a05:600d:8315:b0:477:55c9:c0c2 with SMTP id 5b1f17b1804b1-4775cdbfb96mr8429375e9.12.1762326332083;
        Tue, 04 Nov 2025 23:05:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc96edsm30520685e9.6.2025.11.04.23.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:05:31 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/2] soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap config
Date: Wed,  5 Nov 2025 09:05:26 +0200
Message-ID: <20251105070526.264445-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Not all system controller registers are accessible from Linux. Accessing
such registers generates synchronous external abort. Populate the
readable_reg and writeable_reg members of the regmap config to inform the
regmap core which registers can be accessed. The list will need to be
updated whenever new system controller functionality is exported through
regmap.

Fixes: 2da2740fb9c8 ("soc: renesas: rz-sysc: Add syscon/regmap support")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- added all SYSC registers IP specific, except the SPI
  registers on RZ/V2H and RZ/V2N as these are accessible only from EL3

 drivers/soc/renesas/r9a08g045-sysc.c |  69 ++++++++++++++++++
 drivers/soc/renesas/r9a09g047-sys.c  |  79 +++++++++++++++++++++
 drivers/soc/renesas/r9a09g056-sys.c  |  68 ++++++++++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  | 101 +++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        |   2 +
 drivers/soc/renesas/rz-sysc.h        |   4 ++
 6 files changed, 323 insertions(+)

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index 0504d4e68761..03d653d5cde5 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -6,10 +6,29 @@
  */
 
 #include <linux/bits.h>
+#include <linux/device.h>
 #include <linux/init.h>
 
 #include "rz-sysc.h"
 
+#define SYS_XSPI_MAP_STAADD_CS0		0x348
+#define SYS_XSPI_MAP_ENDADD_CS0		0x34c
+#define SYS_XSPI_MAP_STAADD_CS1		0x350
+#define SYS_XSPI_MAP_ENDADD_CS1		0x354
+#define SYS_GETH0_CFG			0x380
+#define SYS_GETH1_CFG			0x390
+#define SYS_PCIE_CFG			0x3a0
+#define SYS_PCIE_MON			0x3a4
+#define SYS_PCIE_ERR_MON		0x3ac
+#define SYS_PCIE_PHY			0x3b4
+#define SYS_I2C0_CFG			0x400
+#define SYS_I2C1_CFG			0x410
+#define SYS_I2C2_CFG			0x420
+#define SYS_I2C3_CFG			0x430
+#define SYS_I3C_CFG			0x440
+#define SYS_USB_PWRRDY			0xd70
+#define SYS_PCIE_RST_RSM_B		0xd74
+
 static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initconst = {
 	.family = "RZ/G3S",
 	.id = 0x85e0447,
@@ -18,7 +37,57 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 	.specific_id_mask = GENMASK(27, 0),
 };
 
+static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_XSPI_MAP_STAADD_CS0:
+	case SYS_XSPI_MAP_ENDADD_CS0:
+	case SYS_XSPI_MAP_STAADD_CS1:
+	case SYS_XSPI_MAP_ENDADD_CS1:
+	case SYS_GETH0_CFG:
+	case SYS_GETH1_CFG:
+	case SYS_PCIE_CFG:
+	case SYS_PCIE_MON:
+	case SYS_PCIE_ERR_MON:
+	case SYS_PCIE_PHY:
+	case SYS_I2C0_CFG:
+	case SYS_I2C1_CFG:
+	case SYS_I2C2_CFG:
+	case SYS_I2C3_CFG:
+	case SYS_I3C_CFG:
+	case SYS_USB_PWRRDY:
+	case SYS_PCIE_RST_RSM_B:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rzg3s_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_XSPI_MAP_STAADD_CS0:
+	case SYS_XSPI_MAP_ENDADD_CS0:
+	case SYS_XSPI_MAP_STAADD_CS1:
+	case SYS_XSPI_MAP_ENDADD_CS1:
+	case SYS_PCIE_CFG:
+	case SYS_PCIE_PHY:
+	case SYS_I2C0_CFG:
+	case SYS_I2C1_CFG:
+	case SYS_I2C2_CFG:
+	case SYS_I2C3_CFG:
+	case SYS_I3C_CFG:
+	case SYS_USB_PWRRDY:
+	case SYS_PCIE_RST_RSM_B:
+		return true;
+	default:
+		return false;
+	}
+}
+
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+	.readable_reg = rzg3s_regmap_readable_reg,
+	.writeable_reg = rzg3s_regmap_writeable_reg,
 	.max_register = 0xe20,
 };
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index 2e8426c03050..e413b0eff9bf 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -29,6 +29,27 @@
 #define SYS_LSI_PRR_CA55_DIS		BIT(8)
 #define SYS_LSI_PRR_NPU_DIS		BIT(1)
 
+#define SYS_LSI_OTPTSU1TRMVAL0		0x330
+#define SYS_LSI_OTPTSU1TRMVAL1		0x334
+#define SYS_SPI_STAADDCS0		0x900
+#define SYS_SPI_ENDADDCS0		0x904
+#define SYS_SPI_STAADDCS1		0x908
+#define SYS_SPI_ENDADDCS1		0x90c
+#define SYS_VSP_CLK			0xe00
+#define SYS_GBETH0_CFG			0xf00
+#define SYS_GBETH1_CFG			0xf04
+#define SYS_PCIE_INTX_CH0		0x1000
+#define SYS_PCIE_MSI1_CH0		0x1004
+#define SYS_PCIE_MSI2_CH0		0x1008
+#define SYS_PCIE_MSI3_CH0		0x100c
+#define SYS_PCIE_MSI4_CH0		0x1010
+#define SYS_PCIE_MSI5_CH0		0x1014
+#define SYS_PCIE_PME_CH0		0x1018
+#define SYS_PCIE_ACK_CH0		0x101c
+#define SYS_PCIE_MISC_CH0		0x1020
+#define SYS_PCIE_MODE_CH0		0x1024
+#define SYS_ADC_CFG			0x1600
+
 static void rzg3e_sys_print_id(struct device *dev,
 				void __iomem *sysc_base,
 				struct soc_device_attribute *soc_dev_attr)
@@ -62,7 +83,65 @@ static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initco
 	.print_id = rzg3e_sys_print_id,
 };
 
+static bool rzg3e_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_LSI_OTPTSU1TRMVAL0:
+	case SYS_LSI_OTPTSU1TRMVAL1:
+	case SYS_SPI_STAADDCS0:
+	case SYS_SPI_ENDADDCS0:
+	case SYS_SPI_STAADDCS1:
+	case SYS_SPI_ENDADDCS1:
+	case SYS_VSP_CLK:
+	case SYS_GBETH0_CFG:
+	case SYS_GBETH1_CFG:
+	case SYS_PCIE_INTX_CH0:
+	case SYS_PCIE_MSI1_CH0:
+	case SYS_PCIE_MSI2_CH0:
+	case SYS_PCIE_MSI3_CH0:
+	case SYS_PCIE_MSI4_CH0:
+	case SYS_PCIE_MSI5_CH0:
+	case SYS_PCIE_PME_CH0:
+	case SYS_PCIE_ACK_CH0:
+	case SYS_PCIE_MISC_CH0:
+	case SYS_PCIE_MODE_CH0:
+	case SYS_ADC_CFG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rzg3e_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_SPI_STAADDCS0:
+	case SYS_SPI_ENDADDCS0:
+	case SYS_SPI_STAADDCS1:
+	case SYS_SPI_ENDADDCS1:
+	case SYS_VSP_CLK:
+	case SYS_GBETH0_CFG:
+	case SYS_GBETH1_CFG:
+	case SYS_PCIE_INTX_CH0:
+	case SYS_PCIE_MSI1_CH0:
+	case SYS_PCIE_MSI2_CH0:
+	case SYS_PCIE_MSI3_CH0:
+	case SYS_PCIE_MSI4_CH0:
+	case SYS_PCIE_MSI5_CH0:
+	case SYS_PCIE_PME_CH0:
+	case SYS_PCIE_ACK_CH0:
+	case SYS_PCIE_MISC_CH0:
+	case SYS_PCIE_MODE_CH0:
+	case SYS_ADC_CFG:
+		return true;
+	default:
+		return false;
+	}
+}
+
 const struct rz_sysc_init_data rzg3e_sys_init_data = {
 	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
+	.readable_reg = rzg3e_regmap_readable_reg,
+	.writeable_reg = rzg3e_regmap_writeable_reg,
 	.max_register = 0x170c,
 };
diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
index 16b4e433c337..42f5eff291fd 100644
--- a/drivers/soc/renesas/r9a09g056-sys.c
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -34,6 +34,24 @@
 #define SYS_RZV2N_FEATURE_C55		BIT(1)
 #define SYS_RZV2N_FEATURE_SEC		BIT(2)
 
+#define SYS_LSI_OTPTSU0TRMVAL0		0x320
+#define SYS_LSI_OTPTSU0TRMVAL1		0x324
+#define SYS_LSI_OTPTSU1TRMVAL0		0x330
+#define SYS_LSI_OTPTSU1TRMVAL1		0x334
+#define SYS_GBETH0_CFG			0xf00
+#define SYS_GBETH1_CFG			0xf04
+#define SYS_PCIE_INTX_CH0		0x1000
+#define SYS_PCIE_MSI1_CH0		0x1004
+#define SYS_PCIE_MSI2_CH0		0x1008
+#define SYS_PCIE_MSI3_CH0		0x100c
+#define SYS_PCIE_MSI4_CH0		0x1010
+#define SYS_PCIE_MSI5_CH0		0x1014
+#define SYS_PCIE_PME_CH0		0x1018
+#define SYS_PCIE_ACK_CH0		0x101c
+#define SYS_PCIE_MISC_CH0		0x1020
+#define SYS_PCIE_MODE_CH0		0x1024
+#define SYS_ADC_CFG			0x1600
+
 static void rzv2n_sys_print_id(struct device *dev,
 			       void __iomem *sysc_base,
 			       struct soc_device_attribute *soc_dev_attr)
@@ -70,7 +88,57 @@ static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initco
 	.print_id = rzv2n_sys_print_id,
 };
 
+static bool rzv2n_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_LSI_OTPTSU0TRMVAL0:
+	case SYS_LSI_OTPTSU0TRMVAL1:
+	case SYS_LSI_OTPTSU1TRMVAL0:
+	case SYS_LSI_OTPTSU1TRMVAL1:
+	case SYS_GBETH0_CFG:
+	case SYS_GBETH1_CFG:
+	case SYS_PCIE_INTX_CH0:
+	case SYS_PCIE_MSI1_CH0:
+	case SYS_PCIE_MSI2_CH0:
+	case SYS_PCIE_MSI3_CH0:
+	case SYS_PCIE_MSI4_CH0:
+	case SYS_PCIE_MSI5_CH0:
+	case SYS_PCIE_PME_CH0:
+	case SYS_PCIE_ACK_CH0:
+	case SYS_PCIE_MISC_CH0:
+	case SYS_PCIE_MODE_CH0:
+	case SYS_ADC_CFG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rzv2n_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_GBETH0_CFG:
+	case SYS_GBETH1_CFG:
+	case SYS_PCIE_INTX_CH0:
+	case SYS_PCIE_MSI1_CH0:
+	case SYS_PCIE_MSI2_CH0:
+	case SYS_PCIE_MSI3_CH0:
+	case SYS_PCIE_MSI4_CH0:
+	case SYS_PCIE_MSI5_CH0:
+	case SYS_PCIE_PME_CH0:
+	case SYS_PCIE_ACK_CH0:
+	case SYS_PCIE_MISC_CH0:
+	case SYS_PCIE_MODE_CH0:
+	case SYS_ADC_CFG:
+		return true;
+	default:
+		return false;
+	}
+}
+
 const struct rz_sysc_init_data rzv2n_sys_init_data = {
 	.soc_id_init_data = &rzv2n_sys_soc_id_init_data,
+	.readable_reg = rzv2n_regmap_readable_reg,
+	.writeable_reg = rzv2n_regmap_writeable_reg,
 	.max_register = 0x170c,
 };
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index e3390e7c7fe5..827c718ac7c5 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -29,6 +29,35 @@
 #define SYS_LSI_PRR_GPU_DIS		BIT(0)
 #define SYS_LSI_PRR_ISP_DIS		BIT(4)
 
+#define SYS_LSI_OTPTSU0TRMVAL0		0x320
+#define SYS_LSI_OTPTSU0TRMVAL1		0x324
+#define SYS_LSI_OTPTSU1TRMVAL0		0x330
+#define SYS_LSI_OTPTSU1TRMVAL1		0x334
+#define SYS_GBETH0_CFG			0xf00
+#define SYS_GBETH1_CFG			0xf04
+#define SYS_PCIE_INTX_CH0		0x1000
+#define SYS_PCIE_MSI1_CH0		0x1004
+#define SYS_PCIE_MSI2_CH0		0x1008
+#define SYS_PCIE_MSI3_CH0		0x100c
+#define SYS_PCIE_MSI4_CH0		0x1010
+#define SYS_PCIE_MSI5_CH0		0x1014
+#define SYS_PCIE_PME_CH0		0x1018
+#define SYS_PCIE_ACK_CH0		0x101c
+#define SYS_PCIE_MISC_CH0		0x1020
+#define SYS_PCIE_MODE_CH0		0x1024
+#define SYS_PCIE_INTX_CH1		0x1030
+#define SYS_PCIE_MSI1_CH1		0x1034
+#define SYS_PCIE_MSI2_CH1		0x1038
+#define SYS_PCIE_MSI3_CH1		0x103c
+#define SYS_PCIE_MSI4_CH1		0x1040
+#define SYS_PCIE_MSI5_CH1		0x1044
+#define SYS_PCIE_PME_CH1		0x1048
+#define SYS_PCIE_ACK_CH1		0x104c
+#define SYS_PCIE_MISC_CH1		0x1050
+#define SYS_PCIE_MODE_CH1		0x1054
+#define SYS_PCIE_MODE			0x1060
+#define SYS_ADC_CFG			0x1600
+
 static void rzv2h_sys_print_id(struct device *dev,
 				void __iomem *sysc_base,
 				struct soc_device_attribute *soc_dev_attr)
@@ -62,7 +91,79 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.print_id = rzv2h_sys_print_id,
 };
 
+static bool rzv2h_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_LSI_OTPTSU0TRMVAL0:
+	case SYS_LSI_OTPTSU0TRMVAL1:
+	case SYS_LSI_OTPTSU1TRMVAL0:
+	case SYS_LSI_OTPTSU1TRMVAL1:
+	case SYS_GBETH0_CFG:
+	case SYS_GBETH1_CFG:
+	case SYS_PCIE_INTX_CH0:
+	case SYS_PCIE_MSI1_CH0:
+	case SYS_PCIE_MSI2_CH0:
+	case SYS_PCIE_MSI3_CH0:
+	case SYS_PCIE_MSI4_CH0:
+	case SYS_PCIE_MSI5_CH0:
+	case SYS_PCIE_PME_CH0:
+	case SYS_PCIE_ACK_CH0:
+	case SYS_PCIE_MISC_CH0:
+	case SYS_PCIE_MODE_CH0:
+	case SYS_PCIE_INTX_CH1:
+	case SYS_PCIE_MSI1_CH1:
+	case SYS_PCIE_MSI2_CH1:
+	case SYS_PCIE_MSI3_CH1:
+	case SYS_PCIE_MSI4_CH1:
+	case SYS_PCIE_MSI5_CH1:
+	case SYS_PCIE_PME_CH1:
+	case SYS_PCIE_ACK_CH1:
+	case SYS_PCIE_MISC_CH1:
+	case SYS_PCIE_MODE_CH1:
+	case SYS_PCIE_MODE:
+	case SYS_ADC_CFG:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rzv2h_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_GBETH0_CFG:
+	case SYS_GBETH1_CFG:
+	case SYS_PCIE_INTX_CH0:
+	case SYS_PCIE_MSI1_CH0:
+	case SYS_PCIE_MSI2_CH0:
+	case SYS_PCIE_MSI3_CH0:
+	case SYS_PCIE_MSI4_CH0:
+	case SYS_PCIE_MSI5_CH0:
+	case SYS_PCIE_PME_CH0:
+	case SYS_PCIE_ACK_CH0:
+	case SYS_PCIE_MISC_CH0:
+	case SYS_PCIE_MODE_CH0:
+	case SYS_PCIE_INTX_CH1:
+	case SYS_PCIE_MSI1_CH1:
+	case SYS_PCIE_MSI2_CH1:
+	case SYS_PCIE_MSI3_CH1:
+	case SYS_PCIE_MSI4_CH1:
+	case SYS_PCIE_MSI5_CH1:
+	case SYS_PCIE_PME_CH1:
+	case SYS_PCIE_ACK_CH1:
+	case SYS_PCIE_MISC_CH1:
+	case SYS_PCIE_MODE_CH1:
+	case SYS_PCIE_MODE:
+	case SYS_ADC_CFG:
+		return true;
+	default:
+		return false;
+	}
+}
+
 const struct rz_sysc_init_data rzv2h_sys_init_data = {
 	.soc_id_init_data = &rzv2h_sys_soc_id_init_data,
+	.readable_reg = rzv2h_regmap_readable_reg,
+	.writeable_reg = rzv2h_regmap_writeable_reg,
 	.max_register = 0x170c,
 };
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 9f79e299e6f4..19c1e666279b 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -140,6 +140,8 @@ static int rz_sysc_probe(struct platform_device *pdev)
 	regmap_cfg->val_bits = 32;
 	regmap_cfg->fast_io = true;
 	regmap_cfg->max_register = data->max_register;
+	regmap_cfg->readable_reg = data->readable_reg;
+	regmap_cfg->writeable_reg = data->writeable_reg;
 
 	regmap = devm_regmap_init_mmio(dev, sysc->base, regmap_cfg);
 	if (IS_ERR(regmap))
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index 8eec355d5d56..88929bf21cb1 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -34,10 +34,14 @@ struct rz_sysc_soc_id_init_data {
 /**
  * struct rz_sysc_init_data - RZ SYSC initialization data
  * @soc_id_init_data: RZ SYSC SoC ID initialization data
+ * @writeable_reg: Regmap writeable register check function
+ * @readable_reg: Regmap readable register check function
  * @max_register: Maximum SYSC register offset to be used by the regmap config
  */
 struct rz_sysc_init_data {
 	const struct rz_sysc_soc_id_init_data *soc_id_init_data;
+	bool (*writeable_reg)(struct device *dev, unsigned int reg);
+	bool (*readable_reg)(struct device *dev, unsigned int reg);
 	u32 max_register;
 };
 
-- 
2.43.0


