Return-Path: <linux-renesas-soc+bounces-22126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB82B8F510
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 09:41:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE448189DB8D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 07:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A22245006;
	Mon, 22 Sep 2025 07:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e31n2Qm+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE22F5A2E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 07:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758526870; cv=none; b=chxUUdlm4CaRuLLOfoG69ugMOmbwDCq3jyTzBCdAMTQilko0UlIIIUuzgDhCONnn0IHIimWiQnFi+3+cqVr/siMHSVTLpqVnktu058UqQc0XRUQaBgLkYrhzqkWpg0MOteT51GzR+sDge3eCZvPbqJD23JMSX48al1LtzZsnl1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758526870; c=relaxed/simple;
	bh=350kseYCPzlSUnQJtXKRlacC6FHv4j4/QxcsHxOHemo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nt9cN86ylkfiuO2YQqFlWsSYd6LsNHIfHipF5cs2n/wCe+H9Tnbx5figw+AvHlTmce88qBzNUk62mr3j24v83GpkFOFxN0msligJwNhSkNF4XrsHFE1MAwI1NdGfocaYb+tDM9aPI3hUeuK96a7i+5nI/YCYq2/I5W9mGJBqmtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e31n2Qm+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso36314375e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 00:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758526865; x=1759131665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sVdS5ZxaRZwCVsFgnk0PyX9gMRVloyzuq0Gi0VkzBYQ=;
        b=e31n2Qm+weHBJX3MS98zR3+KfKNveteX1Kzc/IJcZwiogQlL+FEqyB5bpqdW0QW67K
         pCbq/dOTogf932B6Ib6Em9bY305gU2kT2GzXbVY/6eV5vvm7LNKscl/ZOgpAk/jdQuP9
         4L17wJrkeTbqaoFfjAo0WFIdsaEKED7sSuc7d30X1Vi3mk8MllDkWvVQO1iyiV2BCqWp
         JIor4Z+9VJrKIoKsq3B8b86Xi+f+f7WiyFpHTaIHRNudP9XP+2EeDs2t1052jrMMstlj
         G3T/i5h65Nz3Esv1qf+4rLr677hbYjaS+l9c+KLYE7PsXOKW4CPZFxKJ5Tfu7SHodzDx
         IaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758526865; x=1759131665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVdS5ZxaRZwCVsFgnk0PyX9gMRVloyzuq0Gi0VkzBYQ=;
        b=WiuZxnNhgEofFkSMI4WcTkKVYg7aY1917/yeUSjJ1oFymf99+6PKjMBFmieuJyuU2X
         vG24GxNmkzHZuGHamrcCyfFD7BMPs7Gsh3MDQucF1gay/dkilc5CQt3pNzekXTbAl8eu
         DtWieWunSArENIDX0IOHGNprGX0HbdLX/64K4Z92COs7QUdoQFbrqPiKIQ9QjVN+vfqN
         7WjcBBsS9P3KigbKoNsLRC8UhODvjz0RYIIg1+T/UqyYXsUn2FYVldskww7r0UQM5ewA
         QscWoJ4jT7A4WRfqUB8jUvaHkqhpaTTsG+m1KCb/9LyOiFagu3muZkeuHLEI32Y+3C4p
         BfXw==
X-Forwarded-Encrypted: i=1; AJvYcCUqGqnVsQcXXzws/SUwlsPHqiNRIc/U3FDDBO8HBUrGcyi5bFI1zdeLt6iYEBLTG+eHgdWBozDd+T6mxy1aVgJFJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJH7TJtVjuuJPDpUB4ck8xmyBN9pfHG+UyJ/70bcPbWQvYsdP5
	IAf9kRMnahLLxJwjshFlDFUqlVfQYHr2CSDqX0tlSPKsk7HI+Ohh+WraZ0MPbq1nbxc=
X-Gm-Gg: ASbGncvU3wsNhduMjQBNXJ61ctA77VObZuJzEa/Qu2H2usJHkoi0Bvg8NlLOx75swzN
	gb8lDA3nFfQWpKnodEoEyJkLatzfJcVLSlUX8fwJLLt2lyzW4UXk/ODLI+i4j9tmI1MnkLstl95
	bQY7Ur9Hg1b6gaqiAsPUyUfMyR5+odZBJ33eX9KqZS9ut2lvng4yAtRtJqay4i2RtD8m9CptEzh
	iE4nSzpixHHyFuyNc9WnJvsGuUan/fo7Y3I8NMXeEz1A8kkZwuShG39UUkWzs38ZvI7jc0X0CWD
	3AbBJJfutoyt/CreAVcefROEN77MWUUw4beNDmNZ62hO1EynTwSeyuqTPCgRwIdzSWk1BJmtRUk
	dJbvHRBwFFG+k++rFBWcl/EftfEkYKhzTxCnMH+aIbVhOiQOLo2bZ
X-Google-Smtp-Source: AGHT+IFStw5BkLBlppRCWhPlEKp4slrfPlWyGFOfXUQzpSUd1uiuH8H4wbcwGJ8qKTuXs4J7S40EPg==
X-Received: by 2002:a05:600c:3553:b0:45d:d2d2:f081 with SMTP id 5b1f17b1804b1-467ea00456emr100493965e9.20.1758526864644;
        Mon, 22 Sep 2025 00:41:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07412111sm18518616f8f.28.2025.09.22.00.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 00:41:04 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap config
Date: Mon, 22 Sep 2025 10:41:01 +0300
Message-ID: <20250922074101.2067014-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
 drivers/soc/renesas/r9a08g045-sysc.c | 17 +++++++++++++++++
 drivers/soc/renesas/r9a09g047-sys.c  | 21 +++++++++++++++++++++
 drivers/soc/renesas/r9a09g056-sys.c  |  7 +++++++
 drivers/soc/renesas/r9a09g057-sys.c  |  7 +++++++
 drivers/soc/renesas/rz-sysc.c        |  2 ++
 drivers/soc/renesas/rz-sysc.h        |  4 ++++
 6 files changed, 58 insertions(+)

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index 0504d4e68761..e4455ac37511 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -6,10 +6,14 @@
  */
 
 #include <linux/bits.h>
+#include <linux/device.h>
 #include <linux/init.h>
 
 #include "rz-sysc.h"
 
+#define SYS_USB_PWRRDY		0xd70
+#define SYS_PCIE_RST_RSM_B	0xd74
+
 static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initconst = {
 	.family = "RZ/G3S",
 	.id = 0x85e0447,
@@ -18,7 +22,20 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 	.specific_id_mask = GENMASK(27, 0),
 };
 
+static bool rzg3s_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
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
+	.writeable_reg = rzg3s_regmap_readable_reg,
 	.max_register = 0xe20,
 };
diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index 2e8426c03050..4200253638f8 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -29,6 +29,9 @@
 #define SYS_LSI_PRR_CA55_DIS		BIT(8)
 #define SYS_LSI_PRR_NPU_DIS		BIT(1)
 
+#define SYS_LSI_OTPTSU1TRMVAL0		0x330
+#define SYS_LSI_OTPTSU1TRMVAL1		0x334
+
 static void rzg3e_sys_print_id(struct device *dev,
 				void __iomem *sysc_base,
 				struct soc_device_attribute *soc_dev_attr)
@@ -62,7 +65,25 @@ static const struct rz_sysc_soc_id_init_data rzg3e_sys_soc_id_init_data __initco
 	.print_id = rzg3e_sys_print_id,
 };
 
+static bool rzg3e_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case SYS_LSI_OTPTSU1TRMVAL0:
+	case SYS_LSI_OTPTSU1TRMVAL1:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool rzg3e_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return false;
+}
+
 const struct rz_sysc_init_data rzg3e_sys_init_data = {
 	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
+	.readable_reg = rzg3e_regmap_readable_reg,
+	.writeable_reg = rzg3e_regmap_writeable_reg,
 	.max_register = 0x170c,
 };
diff --git a/drivers/soc/renesas/r9a09g056-sys.c b/drivers/soc/renesas/r9a09g056-sys.c
index 3ad1422eba36..5ebe53042524 100644
--- a/drivers/soc/renesas/r9a09g056-sys.c
+++ b/drivers/soc/renesas/r9a09g056-sys.c
@@ -70,6 +70,13 @@ static const struct rz_sysc_soc_id_init_data rzv2n_sys_soc_id_init_data __initco
 	.print_id = rzv2n_sys_print_id,
 };
 
+static bool rzv2n_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	return false;
+}
+
 const struct rz_sysc_init_data rzv2n_sys_init_data = {
 	.soc_id_init_data = &rzv2n_sys_soc_id_init_data,
+	.readable_reg = rzv2n_regmap_readable_reg,
+	.writeable_reg = rzv2n_regmap_readable_reg,
 };
diff --git a/drivers/soc/renesas/r9a09g057-sys.c b/drivers/soc/renesas/r9a09g057-sys.c
index e3390e7c7fe5..8336b8466bbf 100644
--- a/drivers/soc/renesas/r9a09g057-sys.c
+++ b/drivers/soc/renesas/r9a09g057-sys.c
@@ -62,7 +62,14 @@ static const struct rz_sysc_soc_id_init_data rzv2h_sys_soc_id_init_data __initco
 	.print_id = rzv2h_sys_print_id,
 };
 
+static bool rzv2h_regmap_readable_reg(struct device *dev, unsigned int reg)
+{
+	return false;
+}
+
 const struct rz_sysc_init_data rzv2h_sys_init_data = {
 	.soc_id_init_data = &rzv2h_sys_soc_id_init_data,
+	.readable_reg = rzv2h_regmap_readable_reg,
+	.writeable_reg = rzv2h_regmap_readable_reg,
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


