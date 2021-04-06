Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A113551DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Apr 2021 13:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245438AbhDFLUY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Apr 2021 07:20:24 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:42614 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbhDFLUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Apr 2021 07:20:22 -0400
Received: by mail-lj1-f176.google.com with SMTP id 184so16031037ljf.9;
        Tue, 06 Apr 2021 04:20:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/i072olxFWhcBpuVvtjanr7IdW2cHdKAkNdskPcEMIY=;
        b=XVUhkqpK6dOcToRK6EPTrAw9uSu22POJyoNpCeL4B7bo3ATjQ8lJamhukqHIqf3ioU
         0HY+Efw6O/ek8ap5Wm/hPKgynq5XWv7ICijWaASjWjHswAVEnXiYDT38MdFbDnLD9Ow7
         WRag3R8OriLsfftW3eJAlF43YeeRQKW4PfxsqLr5tlHf72XzZ1K2VZcFFtG/36mRTpVA
         YscGQ/fCQ6asfFWbtq8G8hKLBdOCxO599Ca9jzxCQqXBflV+56FdJdt4vWqGj3xa2CdW
         tLtUvxvqFAnVX8/jRBTxkqSicSQFIhA2KUEcPqTpFa75sq3pG2zo7VO2bMwOOn+1/7hj
         V+sA==
X-Gm-Message-State: AOAM532CHlw5Iyqdv/bWvt8XLX0NUYOgbX+vS1xYz8dozk6cfD6Sn2SY
        x/4UXt5zeVOOYLMLEeSbq8o=
X-Google-Smtp-Source: ABdhPJyk1v+PqYXxPmE8bD+J2ZEMxxryuGAkyGUAKmTZEryAguJ9yJxL+5Pdkvz5rj30Z81iAt+7Bw==
X-Received: by 2002:a2e:b817:: with SMTP id u23mr18168884ljo.44.1617708012913;
        Tue, 06 Apr 2021 04:20:12 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id l10sm2122894lfk.48.2021.04.06.04.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 04:20:12 -0700 (PDT)
Date:   Tue, 6 Apr 2021 14:20:06 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 4/7] regulator: add property parsing and callbacks to set
 protection limits
Message-ID: <42acc677e41869623cf9f2a8b3592835826f49d4.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617707724.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT property parsing code and setting callback for regulator over/under
voltage, over-current and temperature error limits.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
No changes since RFC-v3

 drivers/regulator/core.c                  | 122 +++++++++++++++++++++-
 drivers/regulator/of_regulator.c          |  58 ++++++++++
 drivers/regulator/qcom-labibb-regulator.c |  10 +-
 drivers/regulator/qcom_spmi-regulator.c   |   6 +-
 drivers/regulator/stpmic1_regulator.c     |  20 +++-
 include/linux/regulator/driver.h          |  41 +++++++-
 include/linux/regulator/machine.h         |  26 +++++
 7 files changed, 274 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index fabc83288e1b..5a3b932dc8a5 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1312,6 +1312,52 @@ static int machine_constraints_current(struct regulator_dev *rdev,
 
 static int _regulator_do_enable(struct regulator_dev *rdev);
 
+static int notif_set_limit(struct regulator_dev *rdev,
+			   int (*set)(struct regulator_dev *, int, int, bool),
+			   int limit, int severity)
+{
+	bool enable;
+
+	if (limit == REGULATOR_NOTIF_LIMIT_DISABLE) {
+		enable = false;
+		limit = 0;
+	} else {
+		enable = true;
+	}
+
+	if (limit == REGULATOR_NOTIF_LIMIT_ENABLE)
+		limit = 0;
+
+	return set(rdev, limit, severity, enable);
+}
+
+static int handle_notify_limits(struct regulator_dev *rdev,
+			int (*set)(struct regulator_dev *, int, int, bool),
+			struct notification_limit *limits)
+{
+	int ret = 0;
+
+	if (!set)
+		return -EOPNOTSUPP;
+
+	if (limits->prot)
+		ret = notif_set_limit(rdev, set, limits->prot,
+				      REGULATOR_SEVERITY_PROT);
+	if (ret)
+		return ret;
+
+	if (limits->err)
+		ret = notif_set_limit(rdev, set, limits->err,
+				      REGULATOR_SEVERITY_ERR);
+	if (ret)
+		return ret;
+
+	if (limits->warn)
+		ret = notif_set_limit(rdev, set, limits->warn,
+				      REGULATOR_SEVERITY_WARN);
+
+	return ret;
+}
 /**
  * set_machine_constraints - sets regulator constraints
  * @rdev: regulator source
@@ -1397,9 +1443,27 @@ static int set_machine_constraints(struct regulator_dev *rdev)
 		}
 	}
 
+	/*
+	 * Existing logic does not warn if over_current_protection is given as
+	 * a constraint but driver does not support that. I think we should
+	 * warn about this type of issues as it is possible someone changes
+	 * PMIC on board to another type - and the another PMIC's driver does
+	 * not support setting protection. Board composer may happily believe
+	 * the DT limits are respected - especially if the new PMIC HW also
+	 * supports protection but the driver does not. I won't change the logic
+	 * without hearing more experienced opinion on this though.
+	 *
+	 * If warning is seen as a good idea then we can merge handling the
+	 * over-curret protection and detection and get rid of this special
+	 * handling.
+	 */
 	if (rdev->constraints->over_current_protection
 		&& ops->set_over_current_protection) {
-		ret = ops->set_over_current_protection(rdev);
+		int lim = rdev->constraints->over_curr_limits.prot;
+
+		ret = ops->set_over_current_protection(rdev, lim,
+						       REGULATOR_SEVERITY_PROT,
+						       true);
 		if (ret < 0) {
 			rdev_err(rdev, "failed to set over current protection: %pe\n",
 				 ERR_PTR(ret));
@@ -1407,6 +1471,62 @@ static int set_machine_constraints(struct regulator_dev *rdev)
 		}
 	}
 
+	if (rdev->constraints->over_current_detection)
+		ret = handle_notify_limits(rdev,
+					   ops->set_over_current_protection,
+					   &rdev->constraints->over_curr_limits);
+	if (ret) {
+		if (ret != -EOPNOTSUPP) {
+			rdev_err(rdev, "failed to set over current limits: %pe\n",
+				 ERR_PTR(ret));
+			return ret;
+		}
+		rdev_warn(rdev,
+			  "IC does not support requested over-current limits\n");
+	}
+
+	if (rdev->constraints->over_voltage_detection)
+		ret = handle_notify_limits(rdev,
+					   ops->set_over_voltage_protection,
+					   &rdev->constraints->over_voltage_limits);
+	if (ret) {
+		if (ret != -EOPNOTSUPP) {
+			rdev_err(rdev, "failed to set over voltage limits %pe\n",
+				 ERR_PTR(ret));
+			return ret;
+		}
+		rdev_warn(rdev,
+			  "IC does not support requested over voltage limits\n");
+	}
+
+	if (rdev->constraints->under_voltage_detection)
+		ret = handle_notify_limits(rdev,
+					   ops->set_under_voltage_protection,
+					   &rdev->constraints->under_voltage_limits);
+	if (ret) {
+		if (ret != -EOPNOTSUPP) {
+			rdev_err(rdev, "failed to set under voltage limits %pe\n",
+				 ERR_PTR(ret));
+			return ret;
+		}
+		rdev_warn(rdev,
+			  "IC does not support requested under voltage limits\n");
+	}
+
+	if (rdev->constraints->over_temp_detection)
+		ret = handle_notify_limits(rdev,
+					   ops->set_thermal_protection,
+					   &rdev->constraints->temp_limits);
+	if (ret) {
+		if (ret != -EOPNOTSUPP) {
+			rdev_err(rdev, "failed to set temperature limits %pe\n",
+				 ERR_PTR(ret));
+			return ret;
+		}
+		rdev_warn(rdev,
+			  "IC does not support requested temperature limits\n");
+	}
+
 	if (rdev->constraints->active_discharge && ops->set_active_discharge) {
 		bool ad_state = (rdev->constraints->active_discharge ==
 			      REGULATOR_ACTIVE_DISCHARGE_ENABLE) ? true : false;
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index 564f928eb1db..b70fdc5c7000 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -21,6 +21,62 @@ static const char *const regulator_states[PM_SUSPEND_MAX + 1] = {
 	[PM_SUSPEND_MAX]	= "regulator-state-disk",
 };
 
+static void fill_limit(int *limit, int val)
+{
+	if (val)
+		if (val == 1)
+			*limit = REGULATOR_NOTIF_LIMIT_ENABLE;
+		else
+			*limit = val;
+	else
+		*limit = REGULATOR_NOTIF_LIMIT_DISABLE;
+}
+
+static void of_get_regulator_prot_limits(struct device_node *np,
+				struct regulation_constraints *constraints)
+{
+	u32 pval;
+	int i;
+	static const char *const props[] = {
+		"regulator-oc-%s-microamp",
+		"regulator-ov-%s-microvolt",
+		"regulator-temp-%s-kelvin",
+		"regulator-uv-%s-microvolt",
+	};
+	struct notification_limit *limits[] = {
+		&constraints->over_curr_limits,
+		&constraints->over_voltage_limits,
+		&constraints->temp_limits,
+		&constraints->under_voltage_limits,
+	};
+	bool set[4] = {0};
+
+	/* Protection limits: */
+	for (i = 0; i < ARRAY_SIZE(props); i++) {
+		char prop[255];
+		bool found;
+		int j;
+		static const char *const lvl[] = {
+			"protection", "error", "warn"
+		};
+		int *l[] = {
+			&limits[i]->prot, &limits[i]->err, &limits[i]->warn,
+		};
+
+		for (j = 0; j < ARRAY_SIZE(lvl); j++) {
+			snprintf(prop, 255, props[i], lvl[j]);
+			found = !of_property_read_u32(np, prop, &pval);
+			if (found)
+				fill_limit(l[j], pval);
+			set[i] |= found;
+		}
+	}
+	constraints->over_current_detection = set[0];
+	constraints->over_voltage_detection = set[1];
+	constraints->over_temp_detection = set[2];
+	constraints->under_voltage_detection = set[3];
+}
+
 static int of_get_regulation_constraints(struct device *dev,
 					struct device_node *np,
 					struct regulator_init_data **init_data,
@@ -188,6 +244,8 @@ static int of_get_regulation_constraints(struct device *dev,
 	constraints->over_current_protection = of_property_read_bool(np,
 					"regulator-over-current-protection");
 
+	of_get_regulator_prot_limits(np, constraints);
+
 	for (i = 0; i < ARRAY_SIZE(regulator_states); i++) {
 		switch (i) {
 		case PM_SUSPEND_MEM:
diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index de25e3279b4b..b3da0dc58782 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -307,13 +307,21 @@ static irqreturn_t qcom_labibb_ocp_isr(int irq, void *chip)
 	return IRQ_HANDLED;
 }
 
-static int qcom_labibb_set_ocp(struct regulator_dev *rdev)
+static int qcom_labibb_set_ocp(struct regulator_dev *rdev, int lim,
+			       int severity, bool enable)
 {
 	struct labibb_regulator *vreg = rdev_get_drvdata(rdev);
 	char *ocp_irq_name;
 	u32 irq_flags = IRQF_ONESHOT;
 	int irq_trig_low, ret;
 
+	/*
+	 * labibb supports only protection - and does not support setting
+	 * limit. Furthermore, we don't support disabling protection.
+	 */
+	if (lim || severity != REGULATOR_SEVERITY_PROT || !enable)
+		return -EINVAL;
+
 	/* If there is no OCP interrupt, there's nothing to set */
 	if (vreg->ocp_irq <= 0)
 		return -EINVAL;
diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index e62e1d72d943..45b29c8856bd 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -594,11 +594,15 @@ static int spmi_regulator_vs_enable(struct regulator_dev *rdev)
 	return regulator_enable_regmap(rdev);
 }
 
-static int spmi_regulator_vs_ocp(struct regulator_dev *rdev)
+static int spmi_regulator_vs_ocp(struct regulator_dev *rdev, int lim_uA,
+				 int severity, bool enable)
 {
 	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
 	u8 reg = SPMI_VS_OCP_OVERRIDE;
 
+	if (lim_uA || !enable || severity != REGULATOR_SEVERITY_PROT)
+		return -EINVAL;
+
 	return spmi_vreg_write(vreg, SPMI_VS_REG_OCP, &reg, 1);
 }
 
diff --git a/drivers/regulator/stpmic1_regulator.c b/drivers/regulator/stpmic1_regulator.c
index cf10fdb72e32..2d7597c76e4a 100644
--- a/drivers/regulator/stpmic1_regulator.c
+++ b/drivers/regulator/stpmic1_regulator.c
@@ -32,7 +32,8 @@ struct stpmic1_regulator_cfg {
 
 static int stpmic1_set_mode(struct regulator_dev *rdev, unsigned int mode);
 static unsigned int stpmic1_get_mode(struct regulator_dev *rdev);
-static int stpmic1_set_icc(struct regulator_dev *rdev);
+static int stpmic1_set_icc(struct regulator_dev *rdev, int lim, int severity,
+			   bool enable);
 static unsigned int stpmic1_map_mode(unsigned int mode);
 
 enum {
@@ -491,11 +492,26 @@ static int stpmic1_set_mode(struct regulator_dev *rdev, unsigned int mode)
 				  STPMIC1_BUCK_MODE_LP, value);
 }
 
-static int stpmic1_set_icc(struct regulator_dev *rdev)
+static int stpmic1_set_icc(struct regulator_dev *rdev, int lim, int severity,
+			   bool enable)
 {
 	struct stpmic1_regulator_cfg *cfg = rdev_get_drvdata(rdev);
 	struct regmap *regmap = rdev_get_regmap(rdev);
 
+	/*
+	 * The code seems like one bit in a register controls whether OCP is
+	 * enabled. So we might be able to turn it off here is if that
+	 * was requested. I won't support this because I don't have the HW.
+	 * Feel free to try and implement if you have the HW and need kernel
+	 * to disable this.
+	 *
+	 * Also, I don't know if limit can be configured or if we support
+	 * error/warning instead of protect. So I just keep existing logic
+	 * and assume no.
+	 */
+	if (lim || severity != REGULATOR_SEVERITY_PROT || !enable)
+		return -EINVAL;
+
 	/* enable switch off in case of over current */
 	return regmap_update_bits(regmap, cfg->icc_reg, cfg->icc_mask,
 				  cfg->icc_mask);
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/driver.h
index 03a8eee9fca9..ded1933ae17a 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -40,6 +40,15 @@ enum regulator_status {
 	REGULATOR_STATUS_UNDEFINED,
 };
 
+enum regulator_detection_severity {
+	/* Hardware shut down voltage outputs if condition is detected */
+	REGULATOR_SEVERITY_PROT,
+	/* Hardware is probably damaged/inoperable */
+	REGULATOR_SEVERITY_ERR,
+	/* Hardware is still recoverable but recovery action must be taken */
+	REGULATOR_SEVERITY_WARN,
+};
+
 /* Initialize struct linear_range for regulators */
 #define REGULATOR_LINEAR_RANGE(_min_uV, _min_sel, _max_sel, _step_uV)	\
 {									\
@@ -78,8 +87,25 @@ enum regulator_status {
  * @get_current_limit: Get the configured limit for a current-limited regulator.
  * @set_input_current_limit: Configure an input limit.
  *
- * @set_over_current_protection: Support capability of automatically shutting
- *                               down when detecting an over current event.
+ * @set_over_current_protection: Support enabling of and setting limits for over
+ *	current situation detection. Detection can be configured for three
+ *	levels of severity.
+ *	REGULATOR_SEVERITY_PROT should automatically shut down the regulator(s).
+ *	REGULATOR_SEVERITY_ERR should indicate that over-current situation is
+ *		caused by an unrecoverable error but HW does not perform
+ *		automatic shut down.
+ *	REGULATOR_SEVERITY_WARN should indicate situation where hardware is
+ *		still believed to not be damaged but that a board sepcific
+ *		recovery action is needed. If lim_uA is 0 the limit should not
+ *		be changed but the detection should just be enabled/disabled as
+ *		is requested.
+ * @set_over_voltage_protection: Support enabling of and setting limits for over
+ *	voltage situation detection. Detection can be configured for same
+ *	severities as over current protection.
+ * @set_under_voltage_protection: Support enabling of and setting limits for
+ *	under situation detection.
+ * @set_thermal_protection: Support enabling of and setting limits for over
+ *	temperature situation detection.
  *
  * @set_active_discharge: Set active discharge enable/disable of regulators.
  *
@@ -143,8 +169,15 @@ struct regulator_ops {
 	int (*get_current_limit) (struct regulator_dev *);
 
 	int (*set_input_current_limit) (struct regulator_dev *, int lim_uA);
-	int (*set_over_current_protection) (struct regulator_dev *);
-	int (*set_active_discharge) (struct regulator_dev *, bool enable);
+	int (*set_over_current_protection)(struct regulator_dev *, int lim_uA,
+					   int severity, bool enable);
+	int (*set_over_voltage_protection)(struct regulator_dev *, int lim_uV,
+					   int severity, bool enable);
+	int (*set_under_voltage_protection)(struct regulator_dev *, int lim_uV,
+					    int severity, bool enable);
+	int (*set_thermal_protection)(struct regulator_dev *, int lim,
+				      int severity, bool enable);
+	int (*set_active_discharge)(struct regulator_dev *, bool enable);
 
 	/* enable/disable regulator */
 	int (*enable) (struct regulator_dev *);
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 8a56f033b6cd..68b4a514a410 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -83,6 +83,14 @@ struct regulator_state {
 	bool changeable;
 };
 
+#define REGULATOR_NOTIF_LIMIT_DISABLE -1
+#define REGULATOR_NOTIF_LIMIT_ENABLE -2
+struct notification_limit {
+	int prot;
+	int err;
+	int warn;
+};
+
 /**
  * struct regulation_constraints - regulator operating constraints.
  *
@@ -100,6 +108,11 @@ struct regulator_state {
  * @ilim_uA: Maximum input current.
  * @system_load: Load that isn't captured by any consumer requests.
  *
+ * @over_curr_limits:		Limits for acting on over current.
+ * @over_voltage_limits:	Limits for acting on over voltage.
+ * @under_voltage_limits:	Limits for acting on under voltage.
+ * @temp_limits:		Limits for acting on over temperature.
+
  * @max_spread: Max possible spread between coupled regulators
  * @max_uV_step: Max possible step change in voltage
  * @valid_modes_mask: Mask of modes which may be configured by consumers.
@@ -116,6 +129,11 @@ struct regulator_state {
  * @pull_down: Enable pull down when regulator is disabled.
  * @over_current_protection: Auto disable on over current event.
  *
+ * @over_current_detection: Configure over current limits.
+ * @over_voltage_detection: Configure over voltage limits.
+ * @under_voltage_detection: Configure under voltage limits.
+ * @over_temp_detection: Configure over temperature limits.
+ *
  * @input_uV: Input voltage for regulator when supplied by another regulator.
  *
  * @state_disk: State for regulator when system is suspended in disk mode.
@@ -172,6 +190,10 @@ struct regulation_constraints {
 	struct regulator_state state_disk;
 	struct regulator_state state_mem;
 	struct regulator_state state_standby;
+	struct notification_limit over_curr_limits;
+	struct notification_limit over_voltage_limits;
+	struct notification_limit under_voltage_limits;
+	struct notification_limit temp_limits;
 	suspend_state_t initial_state; /* suspend state to set at init */
 
 	/* mode to set on startup */
@@ -193,6 +215,10 @@ struct regulation_constraints {
 	unsigned soft_start:1;	/* ramp voltage slowly */
 	unsigned pull_down:1;	/* pull down resistor when regulator off */
 	unsigned over_current_protection:1; /* auto disable on over current */
+	unsigned over_current_detection:1; /* notify on over current */
+	unsigned over_voltage_detection:1; /* notify on over voltage */
+	unsigned under_voltage_detection:1; /* notify on under voltage */
+	unsigned over_temp_detection:1; /* notify on over temperature */
 };
 
 /**
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
