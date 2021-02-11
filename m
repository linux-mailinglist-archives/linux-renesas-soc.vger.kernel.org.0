Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47816318B02
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 13:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhBKMlC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 07:41:02 -0500
Received: from mail-lf1-f46.google.com ([209.85.167.46]:35245 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbhBKMg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 07:36:57 -0500
Received: by mail-lf1-f46.google.com with SMTP id u25so7874511lfc.2;
        Thu, 11 Feb 2021 04:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IftGh2kqPwKu1K1hBvknQpAd+9pF1hC3IiEOB1P1ZKY=;
        b=jk8sYsVsJpQM2WcBAa9LIUpKJTH7twrIk88k4ZKxeeRdBtHzoQWbflx6guAvS2zJ/r
         ijSaHJVt2rGRvf2oZzkwbaPIhYrrSRpHt8WxNyvSP83ZtEIyVAnprfhY7Rvr7S6WXYN4
         IjNSMfUprCRxaX+2MwbMmqzaLfTtOvZaw2rZzsWvZrSyftC1m/x56T8P7x0d6IV0zwIi
         j+H0jqozeH1kQ3kC76MDpBEBKAahaQhGY+mc5XqJn5RQlf7x8MWPjH7C/tMEujY+rbxd
         j4aW5C1cRiQ3BtYR8oWyy9RGdwdYryZ3Trkuiq8JAaDtMRWgGLwnEjI/ZkbYszJpRmKW
         fR7A==
X-Gm-Message-State: AOAM533ohybZCTNvfXLSHFKwClWcroLN0vgKsLCuq2Mqr5rtdq/zyR1H
        Jv/k0hXPCv6O2H6W4BF7xoo=
X-Google-Smtp-Source: ABdhPJzvb+9y6mnxQnrhYFCy8rEFteFnK3yjqQ6rSeQsiElZbSyFYZNhNl0NZwvmoku4vnHZblxoNA==
X-Received: by 2002:a19:f016:: with SMTP id p22mr4047698lfc.402.1613046970427;
        Thu, 11 Feb 2021 04:36:10 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id r3sm887567lji.130.2021.02.11.04.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 04:36:09 -0800 (PST)
Date:   Thu, 11 Feb 2021 14:36:02 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     mazziesaccount@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH 6/7] regulator: bd9576: Support error reporting
Message-ID: <17fb19aa9879764f4d2e7e5be91c3322a9b42498.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

BD9573 and BD9576 support set of "protection" interrupts for "fatal"
issues. Those lead to SOC reset as PMIC shuts the power outputs. Thus
there is no relevant IRQ handling for them.

Few "detection" interrupts were added to the BD9576 with the idea that
SOC could take some recovery-action before error gets unrecoverable.

Add support for over and under voltage detection for Vout1 ... Vout4
and VoutL1. Add over-current detection for VoutS1 and finally a
thermal warning (common for all regulators) which alerts 30 C
before temperature reaches the thermal shutdown point. This way
consumer drivers can build error-recovery mechanisms.

Unfortunately the BD9576 interrupt logic was not re-evaluated. IRQs
are not designed to be properly acknowleged - and IRQ line is kept
active for whole duration of error condition (in comparison to
informing only about state change).

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd9576-regulator.c | 1026 ++++++++++++++++++++++----
 1 file changed, 899 insertions(+), 127 deletions(-)

diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd9576-regulator.c
index a8b5832a5a1b..8768f6145ec4 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -2,10 +2,10 @@
 // Copyright (C) 2020 ROHM Semiconductors
 // ROHM BD9576MUF/BD9573MUF regulator driver
 
-#include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/mfd/rohm-bd957x.h>
 #include <linux/mfd/rohm-generic.h>
@@ -16,11 +16,18 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/workqueue.h>
 
 #define BD957X_VOUTS1_VOLT	3300000
 #define BD957X_VOUTS4_BASE_VOLT	1030000
 #define BD957X_VOUTS34_NUM_VOLT	32
 
+#define BD9576_THERM_IRQ_MASK_TW	BIT(5)
+#define BD9576_xVD_IRQ_MASK_VOUTL1	BIT(5)
+#define BD9576_UVD_IRQ_MASK_VOUTS1_OCW	BIT(6)
+#define BD9576_xVD_IRQ_MASK_VOUT1TO4	0x0F
+
 static int vout1_volt_table[] = {5000000, 4900000, 4800000, 4700000, 4600000,
 				 4500000, 4500000, 4500000, 5000000, 5100000,
 				 5200000, 5300000, 5400000, 5500000, 5500000,
@@ -39,6 +46,43 @@ static int voutl1_volt_table[] = {2500000, 2540000, 2580000, 2620000, 2660000,
 struct bd957x_regulator_data {
 	struct regulator_desc desc;
 	int base_voltage;
+	struct regulator_dev *rdev;
+	int ovd_notif;
+	int uvd_notif;
+	int temp_notif;
+	int ovd_err;
+	int uvd_err;
+	int temp_err;
+	const struct linear_range *xvd_ranges;
+	int num_xvd_ranges;
+	const struct linear_range *ocp_ranges;
+	int num_ocp_ranges;
+	const struct linear_range *ocw_ranges;
+	int num_ocw_ranges;
+	unsigned int ovd_reg;
+	unsigned int uvd_reg;
+	unsigned int xvd_mask;
+	unsigned int ocp_reg;
+	unsigned int ocp_mask;
+	unsigned int ocw_reg;
+	unsigned int ocw_mask;
+	unsigned int ocw_rfet;
+};
+
+#define BD9576_NUM_REGULATORS 6
+#define BD9576_NUM_OVD_REGULATORS 5
+
+struct bd957x_data {
+	struct bd957x_regulator_data regulator_data[BD9576_NUM_REGULATORS];
+	struct regmap *regmap;
+	struct delayed_work therm_irq_suppress;
+	struct delayed_work ovd_irq_suppress;
+	struct delayed_work uvd_irq_suppress;
+	unsigned int therm_irq;
+	unsigned int ovd_irq;
+	unsigned int uvd_irq;
+	spinlock_t err_lock;
+	int regulator_global_err;
 };
 
 static int bd957x_vout34_list_voltage(struct regulator_dev *rdev,
@@ -72,151 +116,797 @@ static int bd957x_list_voltage(struct regulator_dev *rdev,
 	return desc->volt_table[index];
 }
 
-static const struct regulator_ops bd957x_vout34_ops = {
+static void bd9576_fill_ovd_flags(struct bd957x_regulator_data *data,
+				  bool warn)
+{
+	if (warn) {
+		data->ovd_notif = REGULATOR_EVENT_OVER_VOLTAGE_WARN;
+		data->ovd_err = REGULATOR_ERROR_OVER_VOLTAGE_WARN;
+	} else {
+		data->ovd_notif = REGULATOR_EVENT_REGULATION_OUT;
+		data->ovd_err = REGULATOR_ERROR_REGULATION_OUT;
+	}
+}
+
+static void bd9576_fill_ocp_flags(struct bd957x_regulator_data *data,
+				  bool warn)
+{
+	if (warn) {
+		data->uvd_notif = REGULATOR_EVENT_OVER_CURRENT_WARN;
+		data->uvd_err = REGULATOR_ERROR_OVER_CURRENT_WARN;
+	} else {
+		data->uvd_notif = REGULATOR_EVENT_OVER_CURRENT;
+		data->uvd_err = REGULATOR_ERROR_OVER_CURRENT;
+	}
+}
+
+static void bd9576_fill_uvd_flags(struct bd957x_regulator_data *data,
+				  bool warn)
+{
+	if (warn) {
+		data->uvd_notif = REGULATOR_EVENT_UNDER_VOLTAGE_WARN;
+		data->uvd_err = REGULATOR_ERROR_UNDER_VOLTAGE_WARN;
+	} else {
+		data->uvd_notif = REGULATOR_EVENT_UNDER_VOLTAGE;
+		data->uvd_err = REGULATOR_ERROR_UNDER_VOLTAGE;
+	}
+}
+
+static void bd9576_fill_temp_flags(struct bd957x_regulator_data *data,
+				   bool enable, bool warn)
+{
+	if (!enable) {
+		data->temp_notif = 0;
+		data->temp_err = 0;
+	} else if (warn) {
+		data->temp_notif = REGULATOR_EVENT_OVER_TEMP_WARN;
+		data->temp_err = REGULATOR_ERROR_OVER_TEMP_WARN;
+	} else {
+		data->temp_notif = REGULATOR_EVENT_OVER_TEMP;
+		data->temp_err = REGULATOR_ERROR_OVER_TEMP;
+	}
+}
+
+static int bd9576_set_limit(const struct linear_range *r, int num_ranges,
+			    struct regmap *regmap, int reg, int mask, int lim)
+{
+	int ret;
+	bool found;
+	int sel = 0;
+
+	if (lim) {
+
+		ret = linear_range_get_selector_low_array(r, num_ranges,
+							  lim, &sel, &found);
+		if (ret)
+			return ret;
+
+		if (!found)
+			dev_warn(regmap_get_device(regmap),
+				 "limit %d out of range. Setting lower\n",
+				 lim);
+	}
+
+	return regmap_update_bits(regmap, reg, mask, sel);
+}
+
+static bool check_ocp_flag_mismatch(struct regulator_dev *rdev, int severity,
+				    struct bd957x_regulator_data *r)
+{
+	if ((severity == REGULATOR_SEVERITY_ERR &&
+	    r->uvd_notif != REGULATOR_EVENT_OVER_CURRENT) ||
+	    (severity == REGULATOR_SEVERITY_WARN &&
+	    r->uvd_notif != REGULATOR_EVENT_OVER_CURRENT_WARN)) {
+		dev_warn(rdev_get_dev(rdev),
+			 "Can't support both OCP WARN and ERR\n");
+		/* Do not overwrite ERR config with WARN */
+		if (severity == REGULATOR_SEVERITY_WARN)
+			return true;
+
+		bd9576_fill_ocp_flags(r, 0);
+	}
+
+	return false;
+}
+
+static bool check_uvd_flag_mismatch(struct regulator_dev *rdev, int severity,
+				    struct bd957x_regulator_data *r)
+{
+	if ((severity == REGULATOR_SEVERITY_ERR &&
+	     r->uvd_notif != REGULATOR_EVENT_UNDER_VOLTAGE) ||
+	     (severity == REGULATOR_SEVERITY_WARN &&
+	     r->uvd_notif != REGULATOR_EVENT_UNDER_VOLTAGE_WARN)) {
+		dev_warn(rdev_get_dev(rdev),
+			 "Can't support both UVD WARN and ERR\n");
+		if (severity == REGULATOR_SEVERITY_WARN)
+			return true;
+
+		bd9576_fill_uvd_flags(r, 0);
+	}
+
+	return false;
+}
+
+static bool check_ovd_flag_mismatch(struct regulator_dev *rdev, int severity,
+				    struct bd957x_regulator_data *r)
+{
+	if ((severity == REGULATOR_SEVERITY_ERR &&
+	     r->ovd_notif != REGULATOR_EVENT_REGULATION_OUT) ||
+	     (severity == REGULATOR_SEVERITY_WARN &&
+	     r->ovd_notif != REGULATOR_EVENT_OVER_VOLTAGE_WARN)) {
+		dev_warn(rdev_get_dev(rdev),
+			 "Can't support both OVD WARN and ERR\n");
+		if (severity == REGULATOR_SEVERITY_WARN)
+			return true;
+
+		bd9576_fill_ovd_flags(r, 0);
+	}
+
+	return false;
+}
+
+static bool check_temp_flag_mismatch(struct regulator_dev *rdev, int severity,
+				    struct bd957x_regulator_data *r)
+{
+	if ((severity == REGULATOR_SEVERITY_ERR &&
+	     r->ovd_notif != REGULATOR_EVENT_OVER_TEMP) ||
+	     (severity == REGULATOR_SEVERITY_WARN &&
+	     r->ovd_notif != REGULATOR_EVENT_OVER_TEMP_WARN)) {
+		dev_warn(rdev_get_dev(rdev),
+			 "Can't support both thermal WARN and ERR\n");
+		if (severity == REGULATOR_SEVERITY_WARN)
+			return true;
+	}
+
+	return false;
+}
+
+static int bd9576_set_ocp(struct regulator_dev *rdev, int lim_uA, int severity,
+			  bool enable)
+{
+	struct bd957x_data *d;
+	struct bd957x_regulator_data *r;
+	int reg, mask;
+	int Vfet;
+	const struct linear_range *range;
+	int num_ranges;
+
+	if ((lim_uA && !enable) || (!lim_uA && enable))
+		return -EINVAL;
+
+	r = container_of(rdev->desc, struct bd957x_regulator_data, desc);
+	d = rdev_get_drvdata(rdev);
+
+	if (enable && !r->ocw_rfet) {
+		dev_err(rdev_get_dev(rdev),
+			"Need FET's ON-resistance value to monior current\n");
+		return -EINVAL;
+	}
+
+	Vfet = lim_uA * r->ocw_rfet;
+
+	if (severity == REGULATOR_SEVERITY_PROT) {
+		reg = r->ocp_reg;
+		mask = r->ocp_mask;
+		range = r->ocp_ranges;
+		num_ranges = r->num_ocp_ranges;
+	} else {
+		reg = r->ocw_reg;
+		mask = r->ocw_mask;
+		range = r->ocw_ranges;
+		num_ranges = r->num_ocw_ranges;
+
+		/* We abuse uvd fields for OCW on VoutS1 */
+		if (r->uvd_notif) {
+			/*
+			 * If both warning and error are requested, prioritize
+			 * ERROR configuration
+			 */
+			if (check_ocp_flag_mismatch(rdev, severity, r))
+				return 0;
+		} else {
+			bool warn = severity == REGULATOR_SEVERITY_WARN;
+
+			bd9576_fill_ocp_flags(r, warn);
+		}
+	}
+
+	return bd9576_set_limit(range, num_ranges, d->regmap,
+				reg, mask, Vfet);
+}
+
+static int bd9576_set_uvp(struct regulator_dev *rdev, int lim_uV, int severity,
+			  bool enable)
+{
+	struct bd957x_data *d;
+	struct bd957x_regulator_data *r;
+	int mask, reg;
+
+	if (severity == REGULATOR_SEVERITY_PROT) {
+		if (!enable || lim_uV)
+			return -EINVAL;
+		return 0;
+	}
+
+	/*
+	 * BD9576 has enable control as a special value in limit reg. Can't
+	 * set limit but keep feature disabled or enable W/O given limit.
+	 */
+	if ((lim_uV && !enable) || (!lim_uV && enable))
+		return -EINVAL;
+
+	r = container_of(rdev->desc, struct bd957x_regulator_data, desc);
+	d = rdev_get_drvdata(rdev);
+
+	mask = r->xvd_mask;
+	reg = r->uvd_reg;
+	/*
+	 * Check that there is no mismatch for what the detection IRQs are to
+	 * be used.
+	 */
+	if (r->uvd_notif) {
+		if (check_uvd_flag_mismatch(rdev, severity, r))
+			return 0;
+	} else {
+		bd9576_fill_uvd_flags(r, severity == REGULATOR_SEVERITY_WARN);
+	}
+
+	return bd9576_set_limit(r->xvd_ranges, r->num_xvd_ranges, d->regmap,
+				reg, mask, lim_uV);
+}
+
+static int bd9576_set_ovp(struct regulator_dev *rdev, int lim_uV, int severity,
+			  bool enable)
+{
+	struct bd957x_data *d;
+	struct bd957x_regulator_data *r;
+	int mask, reg;
+
+	if (severity == REGULATOR_SEVERITY_PROT) {
+		if (!enable || lim_uV)
+			return -EINVAL;
+		return 0;
+	}
+
+	/*
+	 * BD9576 has enable control as a special value in limit reg. Can't
+	 * set limit but keep feature disabled or enable W/O given limit.
+	 */
+	if ((lim_uV && !enable) || (!lim_uV && enable))
+		return -EINVAL;
+
+	r = container_of(rdev->desc, struct bd957x_regulator_data, desc);
+	d = rdev_get_drvdata(rdev);
+
+	mask = r->xvd_mask;
+	reg = r->ovd_reg;
+	/*
+	 * Check that there is no mismatch for what the detection IRQs are to
+	 * be used.
+	 */
+	if (r->ovd_notif) {
+		if (check_ovd_flag_mismatch(rdev, severity, r))
+			return 0;
+	} else {
+		bd9576_fill_ovd_flags(r, severity == REGULATOR_SEVERITY_WARN);
+	}
+
+	return bd9576_set_limit(r->xvd_ranges, r->num_xvd_ranges, d->regmap,
+				reg, mask, lim_uV);
+}
+
+
+static int bd9576_set_tw(struct regulator_dev *rdev, int lim, int severity,
+			  bool enable)
+{
+	struct bd957x_data *d;
+	struct bd957x_regulator_data *r;
+	int i;
+
+	/*
+	 * BD9576MUF has fixed temperature limits
+	 * The detection can only be enabled/disabled
+	 */
+	if (lim)
+		return -EINVAL;
+
+	/* Protection can't be disabled */
+	if (severity == REGULATOR_SEVERITY_PROT) {
+		if (!enable)
+			return -EINVAL;
+		else
+			return 0;
+	}
+
+	r = container_of(rdev->desc, struct bd957x_regulator_data, desc);
+	d = rdev_get_drvdata(rdev);
+
+	/*
+	 * Check that there is no mismatch for what the detection IRQs are to
+	 * be used.
+	 */
+	if (r->temp_notif)
+		if (check_temp_flag_mismatch(rdev, severity, r))
+			return 0;
+
+	bd9576_fill_temp_flags(r, enable, severity == REGULATOR_SEVERITY_WARN);
+
+	if (enable)
+		return regmap_update_bits(d->regmap, BD957X_REG_INT_THERM_MASK,
+					 BD9576_THERM_IRQ_MASK_TW, 0);
+
+	/*
+	 * If any of the regulators is interested in thermal warning we keep IRQ
+	 * enabled.
+	 */
+	for (i = 0; i < BD9576_NUM_REGULATORS; i++)
+		if (d->regulator_data[i].temp_notif)
+			return 0;
+
+	return regmap_update_bits(d->regmap, BD957X_REG_INT_THERM_MASK,
+				  BD9576_THERM_IRQ_MASK_TW,
+				  BD9576_THERM_IRQ_MASK_TW);
+}
+
+static const struct regulator_ops bd9573_vout34_ops = {
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = bd957x_vout34_list_voltage,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+};
+
+static const struct regulator_ops bd9576_vout34_ops = {
 	.is_enabled = regulator_is_enabled_regmap,
 	.list_voltage = bd957x_vout34_list_voltage,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_over_voltage_protection = bd9576_set_ovp,
+	.set_under_voltage_protection = bd9576_set_uvp,
+	.set_thermal_protection = bd9576_set_tw,
 };
 
-static const struct regulator_ops bd957X_vouts1_regulator_ops = {
+static const struct regulator_ops bd9573_vouts1_regulator_ops = {
 	.is_enabled = regulator_is_enabled_regmap,
 };
 
-static const struct regulator_ops bd957x_ops = {
+static const struct regulator_ops bd9576_vouts1_regulator_ops = {
+	.is_enabled = regulator_is_enabled_regmap,
+	.set_over_current_protection = bd9576_set_ocp,
+};
+
+static const struct regulator_ops bd9573_ops = {
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = bd957x_list_voltage,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+};
+
+static const struct regulator_ops bd9576_ops = {
 	.is_enabled = regulator_is_enabled_regmap,
 	.list_voltage = bd957x_list_voltage,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_over_voltage_protection = bd9576_set_ovp,
+	.set_under_voltage_protection = bd9576_set_uvp,
+	.set_thermal_protection = bd9576_set_tw,
+};
+
+static const struct regulator_ops  *bd9573_ops_arr[] = {
+	[BD957X_VD50]	= &bd9573_ops,
+	[BD957X_VD18]	= &bd9573_ops,
+	[BD957X_VDDDR]	= &bd9573_vout34_ops,
+	[BD957X_VD10]	= &bd9573_vout34_ops,
+	[BD957X_VOUTL1]	= &bd9573_ops,
+	[BD957X_VOUTS1]	= &bd9573_vouts1_regulator_ops,
+};
+
+static const struct regulator_ops  *bd9576_ops_arr[] = {
+	[BD957X_VD50]	= &bd9576_ops,
+	[BD957X_VD18]	= &bd9576_ops,
+	[BD957X_VDDDR]	= &bd9576_vout34_ops,
+	[BD957X_VD10]	= &bd9576_vout34_ops,
+	[BD957X_VOUTL1]	= &bd9576_ops,
+	[BD957X_VOUTS1]	= &bd9576_vouts1_regulator_ops,
+};
+
+static const struct linear_range vout1_xvd_ranges[] = {
+	REGULATOR_LINEAR_RANGE(225000, 0x01, 0x2b, 0),
+	REGULATOR_LINEAR_RANGE(225000, 0x2c, 0x54, 5000),
+	REGULATOR_LINEAR_RANGE(425000, 0x55, 0x7f, 0),
+};
+
+static const struct linear_range vout234_xvd_ranges[] = {
+	REGULATOR_LINEAR_RANGE(17000, 0x01, 0x0f, 0),
+	REGULATOR_LINEAR_RANGE(17000, 0x10, 0x6d, 1000),
+	REGULATOR_LINEAR_RANGE(110000, 0x6e, 0x7f, 0),
 };
 
-static struct bd957x_regulator_data bd9576_regulators[] = {
-	{
-		.desc = {
-			.name = "VD50",
-			.of_match = of_match_ptr("regulator-vd50"),
-			.regulators_node = of_match_ptr("regulators"),
-			.id = BD957X_VD50,
-			.type = REGULATOR_VOLTAGE,
-			.ops = &bd957x_ops,
-			.volt_table = &vout1_volt_table[0],
-			.n_voltages = ARRAY_SIZE(vout1_volt_table),
-			.vsel_reg = BD957X_REG_VOUT1_TUNE,
-			.vsel_mask = BD957X_MASK_VOUT1_TUNE,
-			.enable_reg = BD957X_REG_POW_TRIGGER1,
-			.enable_mask = BD957X_REGULATOR_EN_MASK,
-			.enable_val = BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted = true,
-			.owner = THIS_MODULE,
+static const struct linear_range voutL1_xvd_ranges[] = {
+	REGULATOR_LINEAR_RANGE(34000, 0x01, 0x0f, 0),
+	REGULATOR_LINEAR_RANGE(34000, 0x10, 0x6d, 2000),
+	REGULATOR_LINEAR_RANGE(220000, 0x6e, 0x7f, 0),
+};
+
+static struct linear_range voutS1_ocw_ranges[] = {
+	REGULATOR_LINEAR_RANGE(70000, 0x01, 0x05, 0),
+	REGULATOR_LINEAR_RANGE(70000, 0x06, 0x1a, 10000),
+	REGULATOR_LINEAR_RANGE(270000, 0x1b, 0x3f, 0),
+};
+
+static struct linear_range voutS1_ocp_ranges[] = {
+	REGULATOR_LINEAR_RANGE(170, 0x01, 0x0f, 0),
+	REGULATOR_LINEAR_RANGE(170, 0x10, 0x24, 10000),
+	REGULATOR_LINEAR_RANGE(370000, 0x25, 0x3f, 0),
+};
+
+static int vouts1_get_fet_res(struct device_node *np,
+				const struct regulator_desc *desc,
+				struct regulator_config *cfg)
+{
+	struct bd957x_regulator_data *data;
+	int ret;
+	u32 mohms;
+
+	data = container_of(desc, struct bd957x_regulator_data, desc);
+
+	ret = of_property_read_u32(np, "rohm,ocw-fet-ron-milliohms", &mohms);
+	if (ret) {
+		if (ret != -EINVAL)
+			return ret;
+
+		return 0;
+	}
+	data->ocw_rfet = mohms;
+	return 0;
+}
+
+static struct bd957x_data bd957x_regulators = {
+	.regulator_data = {
+		{
+			.desc = {
+				.name = "VD50",
+				.of_match = of_match_ptr("regulator-vd50"),
+				.regulators_node = of_match_ptr("regulators"),
+				.id = BD957X_VD50,
+				.type = REGULATOR_VOLTAGE,
+				.volt_table = &vout1_volt_table[0],
+				.n_voltages = ARRAY_SIZE(vout1_volt_table),
+				.vsel_reg = BD957X_REG_VOUT1_TUNE,
+				.vsel_mask = BD957X_MASK_VOUT1_TUNE,
+				.enable_reg = BD957X_REG_POW_TRIGGER1,
+				.enable_mask = BD957X_REGULATOR_EN_MASK,
+				.enable_val = BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted = true,
+				.owner = THIS_MODULE,
+			},
+			.xvd_ranges = vout1_xvd_ranges,
+			.num_xvd_ranges = ARRAY_SIZE(vout1_xvd_ranges),
+			.ovd_reg = BD9576_REG_VOUT1_OVD,
+			.uvd_reg = BD9576_REG_VOUT1_UVD,
+			.xvd_mask = BD9576_MASK_XVD,
 		},
-	},
-	{
-		.desc = {
-			.name = "VD18",
-			.of_match = of_match_ptr("regulator-vd18"),
-			.regulators_node = of_match_ptr("regulators"),
-			.id = BD957X_VD18,
-			.type = REGULATOR_VOLTAGE,
-			.ops = &bd957x_ops,
-			.volt_table = &vout2_volt_table[0],
-			.n_voltages = ARRAY_SIZE(vout2_volt_table),
-			.vsel_reg = BD957X_REG_VOUT2_TUNE,
-			.vsel_mask = BD957X_MASK_VOUT2_TUNE,
-			.enable_reg = BD957X_REG_POW_TRIGGER2,
-			.enable_mask = BD957X_REGULATOR_EN_MASK,
-			.enable_val = BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted = true,
-			.owner = THIS_MODULE,
+		{
+			.desc = {
+				.name = "VD18",
+				.of_match = of_match_ptr("regulator-vd18"),
+				.regulators_node = of_match_ptr("regulators"),
+				.id = BD957X_VD18,
+				.type = REGULATOR_VOLTAGE,
+				.volt_table = &vout2_volt_table[0],
+				.n_voltages = ARRAY_SIZE(vout2_volt_table),
+				.vsel_reg = BD957X_REG_VOUT2_TUNE,
+				.vsel_mask = BD957X_MASK_VOUT2_TUNE,
+				.enable_reg = BD957X_REG_POW_TRIGGER2,
+				.enable_mask = BD957X_REGULATOR_EN_MASK,
+				.enable_val = BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted = true,
+				.owner = THIS_MODULE,
+			},
+			.xvd_ranges = vout234_xvd_ranges,
+			.num_xvd_ranges = ARRAY_SIZE(vout234_xvd_ranges),
+			.ovd_reg = BD9576_REG_VOUT2_OVD,
+			.uvd_reg = BD9576_REG_VOUT2_UVD,
+			.xvd_mask = BD9576_MASK_XVD,
 		},
-	},
-	{
-		.desc = {
-			.name = "VDDDR",
-			.of_match = of_match_ptr("regulator-vdddr"),
-			.regulators_node = of_match_ptr("regulators"),
-			.id = BD957X_VDDDR,
-			.ops = &bd957x_vout34_ops,
-			.type = REGULATOR_VOLTAGE,
-			.n_voltages = BD957X_VOUTS34_NUM_VOLT,
-			.vsel_reg = BD957X_REG_VOUT3_TUNE,
-			.vsel_mask = BD957X_MASK_VOUT3_TUNE,
-			.enable_reg = BD957X_REG_POW_TRIGGER3,
-			.enable_mask = BD957X_REGULATOR_EN_MASK,
-			.enable_val = BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted = true,
-			.owner = THIS_MODULE,
+		{
+			.desc = {
+				.name = "VDDDR",
+				.of_match = of_match_ptr("regulator-vdddr"),
+				.regulators_node = of_match_ptr("regulators"),
+				.id = BD957X_VDDDR,
+				.type = REGULATOR_VOLTAGE,
+				.n_voltages = BD957X_VOUTS34_NUM_VOLT,
+				.vsel_reg = BD957X_REG_VOUT3_TUNE,
+				.vsel_mask = BD957X_MASK_VOUT3_TUNE,
+				.enable_reg = BD957X_REG_POW_TRIGGER3,
+				.enable_mask = BD957X_REGULATOR_EN_MASK,
+				.enable_val = BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted = true,
+				.owner = THIS_MODULE,
+			},
+			.ovd_reg = BD9576_REG_VOUT3_OVD,
+			.uvd_reg = BD9576_REG_VOUT3_UVD,
+			.xvd_mask = BD9576_MASK_XVD,
+			.xvd_ranges = vout234_xvd_ranges,
+			.num_xvd_ranges = ARRAY_SIZE(vout234_xvd_ranges),
 		},
-	},
-	{
-		.desc = {
-			.name = "VD10",
-			.of_match = of_match_ptr("regulator-vd10"),
-			.regulators_node = of_match_ptr("regulators"),
-			.id = BD957X_VD10,
-			.ops = &bd957x_vout34_ops,
-			.type = REGULATOR_VOLTAGE,
-			.fixed_uV = BD957X_VOUTS4_BASE_VOLT,
-			.n_voltages = BD957X_VOUTS34_NUM_VOLT,
-			.vsel_reg = BD957X_REG_VOUT4_TUNE,
-			.vsel_mask = BD957X_MASK_VOUT4_TUNE,
-			.enable_reg = BD957X_REG_POW_TRIGGER4,
-			.enable_mask = BD957X_REGULATOR_EN_MASK,
-			.enable_val = BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted = true,
-			.owner = THIS_MODULE,
+		{
+			.desc = {
+				.name = "VD10",
+				.of_match = of_match_ptr("regulator-vd10"),
+				.regulators_node = of_match_ptr("regulators"),
+				.id = BD957X_VD10,
+				.type = REGULATOR_VOLTAGE,
+				.fixed_uV = BD957X_VOUTS4_BASE_VOLT,
+				.n_voltages = BD957X_VOUTS34_NUM_VOLT,
+				.vsel_reg = BD957X_REG_VOUT4_TUNE,
+				.vsel_mask = BD957X_MASK_VOUT4_TUNE,
+				.enable_reg = BD957X_REG_POW_TRIGGER4,
+				.enable_mask = BD957X_REGULATOR_EN_MASK,
+				.enable_val = BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted = true,
+				.owner = THIS_MODULE,
+			},
+			.xvd_ranges = vout234_xvd_ranges,
+			.num_xvd_ranges = ARRAY_SIZE(vout234_xvd_ranges),
+			.ovd_reg = BD9576_REG_VOUT4_OVD,
+			.uvd_reg = BD9576_REG_VOUT4_UVD,
+			.xvd_mask = BD9576_MASK_XVD,
 		},
-	},
-	{
-		.desc = {
-			.name = "VOUTL1",
-			.of_match = of_match_ptr("regulator-voutl1"),
-			.regulators_node = of_match_ptr("regulators"),
-			.id = BD957X_VOUTL1,
-			.ops = &bd957x_ops,
-			.type = REGULATOR_VOLTAGE,
-			.volt_table = &voutl1_volt_table[0],
-			.n_voltages = ARRAY_SIZE(voutl1_volt_table),
-			.vsel_reg = BD957X_REG_VOUTL1_TUNE,
-			.vsel_mask = BD957X_MASK_VOUTL1_TUNE,
-			.enable_reg = BD957X_REG_POW_TRIGGERL1,
-			.enable_mask = BD957X_REGULATOR_EN_MASK,
-			.enable_val = BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted = true,
-			.owner = THIS_MODULE,
+		{
+			.desc = {
+				.name = "VOUTL1",
+				.of_match = of_match_ptr("regulator-voutl1"),
+				.regulators_node = of_match_ptr("regulators"),
+				.id = BD957X_VOUTL1,
+				.type = REGULATOR_VOLTAGE,
+				.volt_table = &voutl1_volt_table[0],
+				.n_voltages = ARRAY_SIZE(voutl1_volt_table),
+				.vsel_reg = BD957X_REG_VOUTL1_TUNE,
+				.vsel_mask = BD957X_MASK_VOUTL1_TUNE,
+				.enable_reg = BD957X_REG_POW_TRIGGERL1,
+				.enable_mask = BD957X_REGULATOR_EN_MASK,
+				.enable_val = BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted = true,
+				.owner = THIS_MODULE,
+			},
+			.xvd_ranges = voutL1_xvd_ranges,
+			.num_xvd_ranges = ARRAY_SIZE(voutL1_xvd_ranges),
+			.ovd_reg = BD9576_REG_VOUTL1_OVD,
+			.uvd_reg = BD9576_REG_VOUTL1_UVD,
+			.xvd_mask = BD9576_MASK_XVD,
 		},
-	},
-	{
-		.desc = {
-			.name = "VOUTS1",
-			.of_match = of_match_ptr("regulator-vouts1"),
-			.regulators_node = of_match_ptr("regulators"),
-			.id = BD957X_VOUTS1,
-			.ops = &bd957X_vouts1_regulator_ops,
-			.type = REGULATOR_VOLTAGE,
-			.n_voltages = 1,
-			.fixed_uV = BD957X_VOUTS1_VOLT,
-			.enable_reg = BD957X_REG_POW_TRIGGERS1,
-			.enable_mask = BD957X_REGULATOR_EN_MASK,
-			.enable_val = BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted = true,
-			.owner = THIS_MODULE,
+		{
+			.desc = {
+				.name = "VOUTS1",
+				.of_match = of_match_ptr("regulator-vouts1"),
+				.regulators_node = of_match_ptr("regulators"),
+				.id = BD957X_VOUTS1,
+				.type = REGULATOR_VOLTAGE,
+				.n_voltages = 1,
+				.fixed_uV = BD957X_VOUTS1_VOLT,
+				.enable_reg = BD957X_REG_POW_TRIGGERS1,
+				.enable_mask = BD957X_REGULATOR_EN_MASK,
+				.enable_val = BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted = true,
+				.owner = THIS_MODULE,
+				.of_parse_cb = vouts1_get_fet_res,
+			},
+			.ocp_ranges = voutS1_ocp_ranges,
+			.num_ocp_ranges = ARRAY_SIZE(voutS1_ocp_ranges),
+			.ocw_ranges = voutS1_ocw_ranges,
+			.num_ocw_ranges = ARRAY_SIZE(voutS1_ocw_ranges),
+			.ocw_reg = BD9576_REG_VOUT1S_OCW,
+			.ocw_mask = BD9576_MASK_VOUT1S_OCW,
+			.ocp_reg = BD9576_REG_VOUT1S_OCP,
+			.ocp_mask = BD9576_MASK_VOUT1S_OCP,
 		},
 	},
 };
 
+static int bd9576_renable(struct regulator_irq_data *rid, int reg, int mask)
+{
+	int val, ret;
+	struct bd957x_data *d = (struct bd957x_data *)rid->data;
+
+	ret = regmap_read(d->regmap, reg, &val);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	if (rid->opaque && rid->opaque == (val & mask)) {
+		/*
+		 * It seems we stil have same status. Ack and return
+		 * information that we are still out of limits and core
+		 * should not enable IRQ
+		 */
+		regmap_write(d->regmap, reg, mask & val);
+		return REGULATOR_ERROR_ON;
+	}
+	rid->opaque = 0;
+	/*
+	 * Status was changed. Either prolem was solved or we have new issues.
+	 * Let's re-enable IRQs and be prepared to report problems again
+	 */
+	return REGULATOR_ERROR_CLEARED;
+}
+
+static int bd9576_uvd_renable(struct regulator_irq_data *rid)
+{
+	return bd9576_renable(rid, BD957X_REG_INT_UVD_STAT, UVD_IRQ_VALID_MASK);
+}
+
+static int bd9576_ovd_renable(struct regulator_irq_data *rid)
+{
+	return bd9576_renable(rid, BD957X_REG_INT_OVD_STAT, OVD_IRQ_VALID_MASK);
+}
+
+static int bd9576_temp_renable(struct regulator_irq_data *rid)
+{
+	return bd9576_renable(rid, BD957X_REG_INT_THERM_STAT,
+			      BD9576_THERM_IRQ_MASK_TW);
+}
+
+static int bd9576_uvd_handler(int irq, struct regulator_irq_data *rid,
+			      unsigned long *dev_mask)
+{
+	int val, ret, i;
+	struct bd957x_data *d = (struct bd957x_data *)rid->data;
+
+	ret = regmap_read(d->regmap, BD957X_REG_INT_UVD_STAT, &val);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	*dev_mask = 0;
+
+	rid->opaque = val & UVD_IRQ_VALID_MASK;
+
+	/*
+	 * Go through the set status bits and report either error or warning
+	 * to the notifier depending on what was flagged in DT
+	 */
+	*dev_mask = val & BD9576_xVD_IRQ_MASK_VOUT1TO4;
+	/* There is 1 bit gap in register after Vout1 .. Vout4 statuses */
+	*dev_mask |= ((val & BD9576_xVD_IRQ_MASK_VOUTL1) >> 1);
+	/*
+	 * We (ab)use the uvd for OCW notification. DT parsing should
+	 * have added correct OCW flag to uvd_notif and uvd_err for S1
+	 */
+	*dev_mask |= ((val & BD9576_UVD_IRQ_MASK_VOUTS1_OCW) >> 1);
+
+	for_each_set_bit(i, dev_mask, 6) {
+		struct bd957x_regulator_data *rdata;
+		struct regulator_err_state *stat;
+
+		rdata = &d->regulator_data[i];
+		stat  = &rid->states[i];
+
+		stat->notifs	= rdata->uvd_notif;
+		stat->errors	= rdata->uvd_err;
+	}
+
+	ret = regmap_write(d->regmap, BD957X_REG_INT_UVD_STAT,
+			   UVD_IRQ_VALID_MASK & val);
+
+	return 0;
+}
+
+static int bd9576_ovd_handler(int irq, struct regulator_irq_data *rid,
+			      unsigned long *dev_mask)
+{
+	int val, ret, i;
+	struct bd957x_data *d = (struct bd957x_data *)rid->data;
+
+	ret = regmap_read(d->regmap, BD957X_REG_INT_OVD_STAT, &val);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	rid->opaque = val & OVD_IRQ_VALID_MASK;
+	*dev_mask = 0;
+
+	if (!(val & OVD_IRQ_VALID_MASK))
+		return 0;
+
+	*dev_mask = val & BD9576_xVD_IRQ_MASK_VOUT1TO4;
+	/* There is 1 bit gap in register after Vout1 .. Vout4 statuses */
+	*dev_mask |= ((val & BD9576_xVD_IRQ_MASK_VOUTL1) >> 1);
+
+	for_each_set_bit(i, dev_mask, 5) {
+		struct bd957x_regulator_data *rdata;
+		struct regulator_err_state *stat;
+
+		rdata = &d->regulator_data[i];
+		stat  = &rid->states[i];
+
+		stat->notifs	= rdata->ovd_notif;
+		stat->errors	= rdata->ovd_err;
+	}
+
+	/* Clear the sub-IRQ status */
+	regmap_write(d->regmap, BD957X_REG_INT_OVD_STAT,
+		     OVD_IRQ_VALID_MASK & val);
+
+	return 0;
+}
+
+#define BD9576_DEV_MASK_ALL_REGULATORS 0x3F
+
+static int bd9576_thermal_handler(int irq, struct regulator_irq_data *rid,
+				  unsigned long *dev_mask)
+{
+	int val, ret, i;
+	struct bd957x_data *d = (struct bd957x_data *)rid->data;
+
+	ret = regmap_read(d->regmap, BD957X_REG_INT_THERM_STAT, &val);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	if (!(val & BD9576_THERM_IRQ_MASK_TW)) {
+		*dev_mask = 0;
+		return 0;
+	}
+
+	*dev_mask = BD9576_DEV_MASK_ALL_REGULATORS;
+
+	for (i = 0; i < BD9576_NUM_REGULATORS; i++) {
+		struct bd957x_regulator_data *rdata;
+		struct regulator_err_state *stat;
+
+		rdata = &d->regulator_data[i];
+		stat  = &rid->states[i];
+
+		stat->notifs	= rdata->temp_notif;
+		stat->errors	= rdata->temp_err;
+	}
+
+	/* Clear the sub-IRQ status */
+	regmap_write(d->regmap, BD957X_REG_INT_THERM_STAT,
+		     BD9576_THERM_IRQ_MASK_TW);
+
+	return 0;
+}
+
 static int bd957x_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
 	struct regulator_config config = { 0 };
-	int i, err;
-	bool vout_mode, ddr_sel;
-	const struct bd957x_regulator_data *reg_data = &bd9576_regulators[0];
-	unsigned int num_reg_data = ARRAY_SIZE(bd9576_regulators);
+	int i, err = 0;
+	bool vout_mode, ddr_sel, may_have_irqs;
+	struct bd957x_data *ic_data;
+	unsigned int num_reg_data;
+	/* All regulators are related to UVD and thermal IRQs... */
+	struct regulator_dev *rdevs[BD9576_NUM_REGULATORS];
+	/* ...But VoutS1 is not flagged by OVD IRQ */
+	struct regulator_dev *ovd_devs[BD9576_NUM_OVD_REGULATORS];
+	static const struct regulator_irq_desc bd9576_notif_uvd = {
+		.name = "bd9576-uvd",
+		.irq_off_ms = 1000,
+		.map_event = bd9576_uvd_handler,
+		.renable = bd9576_uvd_renable,
+		.data = &bd957x_regulators,
+	};
+	static const struct regulator_irq_desc bd9576_notif_ovd = {
+		.name = "bd9576-ovd",
+		.irq_off_ms = 1000,
+		.map_event = bd9576_ovd_handler,
+		.renable = bd9576_ovd_renable,
+		.data = &bd957x_regulators,
+	};
+	static const struct regulator_irq_desc bd9576_notif_temp = {
+		.name = "bd9576-temp",
+		.irq_off_ms = 1000,
+		.map_event = bd9576_thermal_handler,
+		.renable = bd9576_temp_renable,
+		.data = &bd957x_regulators,
+	};
 	enum rohm_chip_type chip = platform_get_device_id(pdev)->driver_data;
 
+	num_reg_data = ARRAY_SIZE(bd957x_regulators.regulator_data);
+
+	ic_data = &bd957x_regulators;
+
 	regmap = dev_get_regmap(pdev->dev.parent, NULL);
 	if (!regmap) {
 		dev_err(&pdev->dev, "No regmap\n");
 		return -EINVAL;
 	}
+
+	ic_data->regmap = regmap;
 	vout_mode = of_property_read_bool(pdev->dev.parent->of_node,
 					 "rohm,vout1-en-low");
 	if (vout_mode) {
@@ -263,15 +953,17 @@ static int bd957x_probe(struct platform_device *pdev)
 	 * bytes and use bd9576_regulators directly for non-constant configs
 	 * like DDR voltage selection.
 	 */
+	platform_set_drvdata(pdev, ic_data);
 	ddr_sel =  of_property_read_bool(pdev->dev.parent->of_node,
 					 "rohm,ddr-sel-low");
 	if (ddr_sel)
-		bd9576_regulators[2].desc.fixed_uV = 1350000;
+		ic_data->regulator_data[2].desc.fixed_uV = 1350000;
 	else
-		bd9576_regulators[2].desc.fixed_uV = 1500000;
+		ic_data->regulator_data[2].desc.fixed_uV = 1500000;
 
 	switch (chip) {
 	case ROHM_CHIP_TYPE_BD9576:
+		may_have_irqs = true;
 		dev_dbg(&pdev->dev, "Found BD9576MUF\n");
 		break;
 	case ROHM_CHIP_TYPE_BD9573:
@@ -280,37 +972,117 @@ static int bd957x_probe(struct platform_device *pdev)
 	default:
 		dev_err(&pdev->dev, "Unsupported chip type\n");
 		err = -EINVAL;
-		goto err;
+		goto err_out;
+	}
+
+	for (i = 0; i < num_reg_data; i++) {
+		struct regulator_desc *d;
+
+		d = &ic_data->regulator_data[i].desc;
+
+
+		if (may_have_irqs) {
+			if (d->id >= ARRAY_SIZE(bd9576_ops_arr))
+				return -EINVAL;
+
+			d->ops = bd9576_ops_arr[d->id];
+		} else {
+			if (d->id >= ARRAY_SIZE(bd9573_ops_arr))
+				return -EINVAL;
+
+			d->ops = bd9573_ops_arr[d->id];
+		}
 	}
 
 	config.dev = pdev->dev.parent;
 	config.regmap = regmap;
+	config.driver_data = ic_data;
 
 	for (i = 0; i < num_reg_data; i++) {
 
-		const struct regulator_desc *desc;
-		struct regulator_dev *rdev;
-		const struct bd957x_regulator_data *r;
-
-		r = &reg_data[i];
-		desc = &r->desc;
+		struct bd957x_regulator_data *r = &ic_data->regulator_data[i];
+		const struct regulator_desc *desc = &r->desc;
 
-		rdev = devm_regulator_register(&pdev->dev, desc, &config);
-		if (IS_ERR(rdev)) {
+		r->rdev = devm_regulator_register(&pdev->dev, desc,
+							   &config);
+		if (IS_ERR(r->rdev)) {
 			dev_err(&pdev->dev,
 				"failed to register %s regulator\n",
 				desc->name);
-			err = PTR_ERR(rdev);
-			goto err;
+			err = PTR_ERR(r->rdev);
+			goto err_out;
 		}
 		/*
 		 * Clear the VOUT1 GPIO setting - rest of the regulators do not
 		 * support GPIO control
 		 */
 		config.ena_gpiod = NULL;
+
+		if (!may_have_irqs)
+			continue;
+
+		rdevs[i] = r->rdev;
+		if (i < BD957X_VOUTS1)
+			ovd_devs[i] = r->rdev;
 	}
+	if (may_have_irqs) {
+		int ret;
+		/*
+		 * We can add both the possible error and warning flags here
+		 * because the core uses these only for status clearing and
+		 * if we use warnings - errors are always clear and the other
+		 * way around. We can also add CURRENT flag for all regulators
+		 * because it is never set if it is not supported. Same applies
+		 * to setting UVD for VoutS1 - it is not accidentally cleared
+		 * as it is never set.
+		 */
+		int uvd_errs = REGULATOR_ERROR_UNDER_VOLTAGE |
+			       REGULATOR_ERROR_UNDER_VOLTAGE_WARN |
+			       REGULATOR_ERROR_OVER_CURRENT |
+			       REGULATOR_ERROR_OVER_CURRENT_WARN;
+		int ovd_errs = REGULATOR_ERROR_OVER_VOLTAGE_WARN |
+			       REGULATOR_ERROR_REGULATION_OUT;
+		int temp_errs = REGULATOR_ERROR_OVER_TEMP |
+				REGULATOR_ERROR_OVER_TEMP_WARN;
+		int irq;
+
+		irq = platform_get_irq_byname(pdev, "bd9576-uvd");
+
+		/* Register notifiers - can fail if IRQ is not given */
+		ret = regulator_irq_helper(&pdev->dev, &bd9576_notif_uvd, irq,
+					   0, uvd_errs, NULL, &rdevs[0],
+					   BD9576_NUM_REGULATORS);
+		if (ret) {
+			if (ret == -EPROBE_DEFER)
+				return ret;
+
+			dev_warn(&pdev->dev, "UVD disabled %d\n", ret);
+		}
 
-err:
+		irq = platform_get_irq_byname(pdev, "bd9576-ovd");
+
+		ret = regulator_irq_helper(&pdev->dev, &bd9576_notif_ovd, irq,
+					   0, ovd_errs, NULL, &ovd_devs[0],
+					   BD9576_NUM_OVD_REGULATORS);
+		if (ret) {
+			if (ret == -EPROBE_DEFER)
+				return ret;
+
+			dev_warn(&pdev->dev, "OVD disabled %d\n", ret);
+		}
+		irq = platform_get_irq_byname(pdev, "bd9576-temp");
+
+		ret = regulator_irq_helper(&pdev->dev, &bd9576_notif_temp, irq,
+					   0, temp_errs, NULL, &rdevs[0],
+					   BD9576_NUM_REGULATORS);
+		if (ret) {
+			if (ret == -EPROBE_DEFER)
+				return ret;
+
+			dev_warn(&pdev->dev, "Thermal warning disabled %d\n", ret);
+		}
+	}
+err_out:
 	return err;
 }
 
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
