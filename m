Return-Path: <linux-renesas-soc+bounces-15094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C829A75D25
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 00:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A98A169017
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Mar 2025 22:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20E71DF273;
	Sun, 30 Mar 2025 22:12:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E6C1DF25C;
	Sun, 30 Mar 2025 22:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743372751; cv=none; b=KJsrPTUN1A/1SuCMEZkLODMEfG0iHSAm+oXWGphkDPQBzEoWg9UZOgYCCHa8KoJlb9zsL5C9dR2XOkCoCS5sKTsoUQjXBqWHg8kTGF3mHlqADyJkOMos1j7UM8oySjX400d0zkzinNPsjipcxfYZtCNXXfzyx7t4YtWI/iJFqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743372751; c=relaxed/simple;
	bh=fL5LgR1SHXe1Dq+KGdgBQ2pipEkbCWQF5f9T/aCwAhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cldpJZMzEn75nwuynJpuzgZlSkou7DixitH2lW8uHZXzID8fX0CAO+1MZFZE09NL2YlX9sU5pCY3HOKk9bPn55mJ3YrLHhWJqVit/SQjm8Vy3KK/9KXoSSCmy8tcsLq8Olnn+GLBdv1w484skKJRUYxB0MnyM5cte5uyJuJPDNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: lvoOxg2pSles4Fhtokt3CA==
X-CSE-MsgGUID: n7YyQl1TT8qoYXgr8sEOrQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2025 07:12:27 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.1])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CC8B340078C5;
	Mon, 31 Mar 2025 07:12:22 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org
Cc: magnus.damm@gmail.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	rui.zhang@intel.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com,
	linux-pm@vger.kernel.org,
	lukasz.luba@arm.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v5 3/5] thermal: renesas: rzg3e: Add thermal driver for the Renesas RZ/G3E SoC
Date: Sun, 30 Mar 2025 23:49:39 +0200
Message-ID: <20250330214945.185725-4-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250330214945.185725-1-john.madieu.xa@bp.renesas.com>
References: <20250330214945.185725-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The RZ/G3E SoC integrates a Temperature Sensor Unit (TSU) block designed
to monitor the chip's junction temperature. This sensor is connected to
channel 1 of the APB port clock/reset and provides temperature measurements.

It also requires calibration values stored in the system controller registers
for accurate temperature measurement. Add a driver for the Renesas RZ/G3E TSU.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
v1 -> v2: fixes IRQ names
v2 -> v3: no changes
v3 -> v4: no changes
v5: removes curly braces arround single-line protected scoped guards

 MAINTAINERS                             |   7 +
 drivers/thermal/renesas/Kconfig         |   7 +
 drivers/thermal/renesas/Makefile        |   1 +
 drivers/thermal/renesas/rzg3e_thermal.c | 443 ++++++++++++++++++++++++
 4 files changed, 458 insertions(+)
 create mode 100644 drivers/thermal/renesas/rzg3e_thermal.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b9f7d2115b57..ba7c95146f01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20289,6 +20289,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/potentiometer/renesas,x9250.yaml
 F:	drivers/iio/potentiometer/x9250.c
 
+RENESAS RZ/G3E THERMAL SENSOR UNIT DRIVER
+M:	John Madieu <john.madieu.xa@bp.renesas.com>
+L:	linux-pm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
+F:	drivers/thermal/renesas/rzg3e_thermal.c
+
 RESET CONTROLLER FRAMEWORK
 M:	Philipp Zabel <p.zabel@pengutronix.de>
 S:	Maintained
diff --git a/drivers/thermal/renesas/Kconfig b/drivers/thermal/renesas/Kconfig
index dcf5fc5ae08e..10cf90fc4bfa 100644
--- a/drivers/thermal/renesas/Kconfig
+++ b/drivers/thermal/renesas/Kconfig
@@ -26,3 +26,10 @@ config RZG2L_THERMAL
 	help
 	  Enable this to plug the RZ/G2L thermal sensor driver into the Linux
 	  thermal framework.
+
+config RZG3E_THERMAL
+	tristate "Renesas RZ/G3E thermal driver"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	help
+	  Enable this to plug the RZ/G3E thermal sensor driver into the Linux
+	  thermal framework.
diff --git a/drivers/thermal/renesas/Makefile b/drivers/thermal/renesas/Makefile
index bf9cb3cb94d6..5a3eba0dedd0 100644
--- a/drivers/thermal/renesas/Makefile
+++ b/drivers/thermal/renesas/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_RCAR_GEN3_THERMAL)	+= rcar_gen3_thermal.o
 obj-$(CONFIG_RCAR_THERMAL)	+= rcar_thermal.o
 obj-$(CONFIG_RZG2L_THERMAL)	+= rzg2l_thermal.o
+obj-$(CONFIG_RZG3E_THERMAL)	+= rzg3e_thermal.o
diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
new file mode 100644
index 000000000000..fe50df057b74
--- /dev/null
+++ b/drivers/thermal/renesas/rzg3e_thermal.c
@@ -0,0 +1,443 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G3E TSU Temperature Sensor Unit
+ *
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/thermal.h>
+#include <linux/units.h>
+
+#include "../thermal_hwmon.h"
+
+/* SYS Trimming register offsets macro */
+#define SYS_TSU_TRMVAL(x) (0x330 + (x) * 4)
+
+/* TSU Register offsets and bits */
+#define TSU_SSUSR		0x00
+#define TSU_SSUSR_EN_TS		BIT(0)
+#define TSU_SSUSR_ADC_PD_TS	BIT(1)
+#define TSU_SSUSR_SOC_TS_EN	BIT(2)
+
+#define TSU_STRGR		0x04
+#define TSU_STRGR_ADST		BIT(0)
+
+#define TSU_SOSR1		0x08
+#define TSU_SOSR1_ADCT_8	0x03
+#define TSU_SOSR1_OUTSEL_AVERAGE	BIT(9)
+
+/* Sensor Code Read Register */
+#define TSU_SCRR		0x10
+#define TSU_SCRR_OUT12BIT_TS	GENMASK(11, 0)
+
+/* Sensor Status Register */
+#define TSU_SSR			0x14
+#define TSU_SSR_CONV_RUNNING	BIT(0)
+
+/* Compare Mode Setting Register */
+#define TSU_CMSR		0x18
+#define TSU_CMSR_CMPEN		BIT(0)
+#define TSU_CMSR_CMPCOND	BIT(1)
+
+/* Lower Limit Setting Register */
+#define TSU_LLSR		0x1C
+#define TSU_LLSR_LIM		GENMASK(11, 0)
+
+/* Upper Limit Setting Register */
+#define TSU_ULSR		0x20
+#define TSU_ULSR_ULIM		GENMASK(11, 0)
+
+/* Interrupt Status Register */
+#define TSU_SISR		0x30
+#define TSU_SISR_ADF		BIT(0)
+#define TSU_SISR_CMPF		BIT(1)
+
+/* Interrupt Enable Register */
+#define TSU_SIER		0x34
+#define TSU_SIER_ADIE		BIT(0)
+#define TSU_SIER_CMPIE		BIT(1)
+
+/* Interrupt Clear Register */
+#define TSU_SICR		0x38
+#define TSU_SICR_ADCLR		BIT(0)
+#define TSU_SICR_CMPCLR		BIT(1)
+
+/* Temperature calculation constants */
+#define TSU_D		41
+#define TSU_E		126
+#define TSU_TRMVAL_MASK	GENMASK(11, 0)
+
+#define TSU_POLL_DELAY_US	50
+#define TSU_TIMEOUT_US		10000
+#define TSU_MIN_CLOCK_RATE	24000000
+
+/**
+ * struct rzg3e_thermal_priv - RZ/G3E thermal private data structure
+ * @base: TSU base address
+ * @dev: device pointer
+ * @syscon: regmap for calibration values
+ * @zone: thermal zone pointer
+ * @mode: current tzd mode
+ * @conv_complete: ADC conversion completion
+ * @reg_lock: protect shared register access
+ * @cached_temp: last computed temperature (milliCelsius)
+ * @trmval: trim (calibration) values
+ */
+struct rzg3e_thermal_priv {
+	void __iomem *base;
+	struct device *dev;
+	struct regmap *syscon;
+	struct thermal_zone_device *zone;
+	enum thermal_device_mode mode;
+	struct completion conv_complete;
+	spinlock_t reg_lock;
+	int cached_temp;
+	u32 trmval[2];
+};
+
+static void rzg3e_thermal_hw_disable(struct rzg3e_thermal_priv *priv)
+{
+	/* Disable all interrupts first */
+	writel(0, priv->base + TSU_SIER);
+	/* Clear any pending interrupts */
+	writel(TSU_SICR_ADCLR | TSU_SICR_CMPCLR, priv->base + TSU_SICR);
+	/* Put device in power down */
+	writel(TSU_SSUSR_ADC_PD_TS, priv->base + TSU_SSUSR);
+}
+
+static void rzg3e_thermal_hw_enable(struct rzg3e_thermal_priv *priv)
+{
+	/* First clear any pending status */
+	writel(TSU_SICR_ADCLR | TSU_SICR_CMPCLR, priv->base + TSU_SICR);
+	/* Disable all interrupts */
+	writel(0, priv->base + TSU_SIER);
+
+	/* Enable thermal sensor */
+	writel(TSU_SSUSR_SOC_TS_EN | TSU_SSUSR_EN_TS, priv->base + TSU_SSUSR);
+	/* Setup for averaging mode with 8 samples */
+	writel(TSU_SOSR1_OUTSEL_AVERAGE | TSU_SOSR1_ADCT_8, priv->base + TSU_SOSR1);
+}
+
+static irqreturn_t rzg3e_thermal_cmp_irq(int irq, void *dev_id)
+{
+	struct rzg3e_thermal_priv *priv = dev_id;
+	u32 status;
+
+	status = readl(priv->base + TSU_SISR);
+	if (!(status & TSU_SISR_CMPF))
+		return IRQ_NONE;
+
+	/* Clear the comparison interrupt flag */
+	writel(TSU_SICR_CMPCLR, priv->base + TSU_SICR);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t rzg3e_thermal_cmp_threaded_irq(int irq, void *dev_id)
+{
+	struct rzg3e_thermal_priv *priv = dev_id;
+
+	thermal_zone_device_update(priv->zone, THERMAL_EVENT_UNSPECIFIED);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t rzg3e_thermal_adc_irq(int irq, void *dev_id)
+{
+	struct rzg3e_thermal_priv *priv = dev_id;
+	u32 status;
+	u32 result;
+
+	/* Check if this is our interrupt */
+	status = readl(priv->base + TSU_SISR);
+	if (!(status & TSU_SISR_ADF))
+		return IRQ_NONE;
+
+	/* Disable ADC interrupt */
+	writel(0, priv->base + TSU_SIER);
+	/* Clear conversion complete interrupt */
+	writel(TSU_SICR_ADCLR, priv->base + TSU_SICR);
+
+	/* Read ADC conversion result */
+	result = readl(priv->base + TSU_SCRR) & TSU_SCRR_OUT12BIT_TS;
+
+	/*
+	 * Calculate temperature using compensation formula
+	 * Section 7.11.7.8 (Temperature Compensation Calculation)
+	 *
+	 * T(°C) = ((e - d) / (c -b)) * (a - b) + d
+	 *
+	 * a = 12 bits temperature code read from the sensor
+	 * b = SYS trmval[0]
+	 * c = SYS trmval[1]
+	 * d = -41
+	 * e = 126
+	 */
+	s64 temp_val = div_s64(((TSU_E + TSU_D) * (s64)(result - priv->trmval[0])),
+				priv->trmval[1] - priv->trmval[0]) - TSU_D;
+	int new_temp = temp_val * MILLIDEGREE_PER_DEGREE;
+
+	scoped_guard(spinlock_irqsave, &priv->reg_lock)
+		priv->cached_temp = new_temp;
+
+	complete(&priv->conv_complete);
+
+	return IRQ_HANDLED;
+}
+
+static int rzg3e_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
+{
+	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(zone);
+	u32 val;
+	int ret;
+
+	if (priv->mode == THERMAL_DEVICE_DISABLED)
+		return -EBUSY;
+
+	reinit_completion(&priv->conv_complete);
+
+	/* Enable ADC interrupt */
+	writel(TSU_SIER_ADIE, priv->base + TSU_SIER);
+
+	/* Verify no ongoing conversion */
+	ret = readl_poll_timeout_atomic(priv->base + TSU_SSR, val,
+					!(val & TSU_SSR_CONV_RUNNING),
+					TSU_POLL_DELAY_US, TSU_TIMEOUT_US);
+	if (ret) {
+		dev_err(priv->dev, "ADC conversion timed out\n");
+		return ret;
+	}
+
+	/* Start conversion */
+	writel(TSU_STRGR_ADST, priv->base + TSU_STRGR);
+
+	if (!wait_for_completion_timeout(&priv->conv_complete,
+					 msecs_to_jiffies(100))) {
+		dev_err(priv->dev, "ADC conversion completion timeout\n");
+		return -ETIMEDOUT;
+	}
+
+	scoped_guard(spinlock_irqsave, &priv->reg_lock)
+		*temp = priv->cached_temp;
+
+	return 0;
+}
+
+/* Convert temperature in milliCelsius to raw sensor code */
+static int rzg3e_temp_to_raw(struct rzg3e_thermal_priv *priv, int temp_mc)
+{
+	s64 raw = div_s64(((temp_mc / 1000) - TSU_D) *
+			  (priv->trmval[1] - priv->trmval[0]),
+			  (TSU_E - TSU_D));
+	return clamp_val(raw, 0, 0xFFF);
+}
+
+static int rzg3e_thermal_set_trips(struct thermal_zone_device *tz, int low, int high)
+{
+	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(tz);
+	int ret;
+	int val;
+
+	if (low >= high)
+		return -EINVAL;
+
+	if (priv->mode == THERMAL_DEVICE_DISABLED)
+		return -EBUSY;
+
+	/* Set up comparison interrupt */
+	writel(0, priv->base + TSU_SIER);
+	writel(TSU_SICR_ADCLR | TSU_SICR_CMPCLR, priv->base + TSU_SICR);
+
+	/* Set thresholds */
+	writel(rzg3e_temp_to_raw(priv, low), priv->base + TSU_LLSR);
+	writel(rzg3e_temp_to_raw(priv, high), priv->base + TSU_ULSR);
+
+	/* Configure comparison:
+	 * - Enable comparison function (CMPEN = 1)
+	 * - Set comparison condition (CMPCOND = 0 for out of range)
+	 */
+	writel(TSU_CMSR_CMPEN, priv->base + TSU_CMSR);
+
+	/* Enable comparison irq */
+	writel(TSU_SIER_CMPIE, priv->base + TSU_SIER);
+
+	/* Verify no ongoing conversion */
+	ret = readl_poll_timeout_atomic(priv->base + TSU_SSR, val,
+					!(val & TSU_SSR_CONV_RUNNING),
+					TSU_POLL_DELAY_US, TSU_TIMEOUT_US);
+	if (ret) {
+		dev_err(priv->dev, "ADC conversion timed out\n");
+		return ret;
+	}
+
+	/* Start a conversion to trigger comparison */
+	writel(TSU_STRGR_ADST, priv->base + TSU_STRGR);
+
+	return 0;
+}
+
+static int rzg3e_thermal_get_trimming(struct rzg3e_thermal_priv *priv)
+{
+	int ret;
+
+	ret = regmap_read(priv->syscon, SYS_TSU_TRMVAL(0), &priv->trmval[0]);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(priv->syscon, SYS_TSU_TRMVAL(1), &priv->trmval[1]);
+	if (ret)
+		return ret;
+
+	priv->trmval[0] &= TSU_TRMVAL_MASK;
+	priv->trmval[1] &= TSU_TRMVAL_MASK;
+
+	if (!priv->trmval[0] || !priv->trmval[1])
+		return dev_err_probe(priv->dev, -EINVAL, "invalid trimming values");
+
+	return 0;
+}
+
+static int rzg3e_thermal_change_mode(struct thermal_zone_device *tz,
+				     enum thermal_device_mode mode)
+{
+	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(tz);
+
+	if (mode == THERMAL_DEVICE_DISABLED)
+		rzg3e_thermal_hw_disable(priv);
+	else
+		rzg3e_thermal_hw_enable(priv);
+
+	priv->mode = mode;
+	return 0;
+}
+
+static const struct thermal_zone_device_ops rzg3e_tz_ops = {
+	.get_temp = rzg3e_thermal_get_temp,
+	.set_trips = rzg3e_thermal_set_trips,
+	.change_mode = rzg3e_thermal_change_mode,
+};
+
+static int rzg3e_thermal_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rzg3e_thermal_priv *priv;
+	struct reset_control *rstc;
+	char *adc_name, *cmp_name;
+	int adc_irq, cmp_irq;
+	struct clk *clk;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return dev_err_probe(dev, PTR_ERR(priv->base),
+				"Failed to map I/O memory");
+
+	priv->syscon = syscon_regmap_lookup_by_phandle(dev->of_node,
+						       "renesas,tsu-calibration-sys");
+	if (IS_ERR(priv->syscon))
+		return dev_err_probe(dev, PTR_ERR(priv->syscon),
+				"Failed to get calibration syscon");
+
+	adc_irq = platform_get_irq_byname(pdev, "adi");
+	if (adc_irq < 0)
+		return adc_irq;
+
+	cmp_irq = platform_get_irq_byname(pdev, "adcmpi");
+	if (cmp_irq < 0)
+		return cmp_irq;
+
+	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc),
+				     "Failed to acquire deasserted reset");
+
+	platform_set_drvdata(pdev, priv);
+
+	spin_lock_init(&priv->reg_lock);
+	init_completion(&priv->conv_complete);
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "Failed to get and enable clock");
+
+	if (clk_get_rate(clk) < TSU_MIN_CLOCK_RATE)
+		return dev_err_probe(dev, -EINVAL,
+				     "Clock rate too low (minimum %d Hz required)",
+				     TSU_MIN_CLOCK_RATE);
+
+	ret = rzg3e_thermal_get_trimming(priv);
+	if (ret)
+		return ret;
+
+	adc_name = devm_kasprintf(dev, GFP_KERNEL, "%s-adc", dev_name(dev));
+	if (!adc_name)
+		return -ENOMEM;
+
+	cmp_name = devm_kasprintf(dev, GFP_KERNEL, "%s-cmp", dev_name(dev));
+	if (!cmp_name)
+		return -ENOMEM;
+
+	/* Unit in a known disabled mode */
+	rzg3e_thermal_hw_disable(priv);
+
+	ret = devm_request_irq(dev, adc_irq, rzg3e_thermal_adc_irq,
+			       IRQF_TRIGGER_RISING, adc_name, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request ADC IRQ");
+
+	ret = devm_request_threaded_irq(dev, cmp_irq, rzg3e_thermal_cmp_irq,
+					rzg3e_thermal_cmp_threaded_irq,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					cmp_name, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request comparison IRQ");
+
+	/* Register Thermal Zone */
+	priv->zone = devm_thermal_of_zone_register(dev, 0, priv, &rzg3e_tz_ops);
+	if (IS_ERR(priv->zone))
+		return dev_err_probe(dev, PTR_ERR(priv->zone),
+				"Failed to register thermal zone");
+
+	ret = devm_thermal_add_hwmon_sysfs(dev, priv->zone);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add hwmon sysfs");
+
+	return 0;
+}
+
+static const struct of_device_id rzg3e_thermal_dt_ids[] = {
+	{ .compatible = "renesas,r9a09g047-tsu" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, rzg3e_thermal_dt_ids);
+
+static struct platform_driver rzg3e_thermal_driver = {
+	.driver = {
+		.name	= "rzg3e_thermal",
+		.of_match_table = rzg3e_thermal_dt_ids,
+	},
+	.probe = rzg3e_thermal_probe,
+};
+module_platform_driver(rzg3e_thermal_driver);
+
+MODULE_DESCRIPTION("Renesas RZ/G3E TSU Thermal Sensor Driver");
+MODULE_AUTHOR("John Madieu <john.madieu.xa@bp.renesas.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


