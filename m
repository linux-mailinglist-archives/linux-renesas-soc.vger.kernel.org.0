Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6889A318AF4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Feb 2021 13:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhBKMje (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Feb 2021 07:39:34 -0500
Received: from mail-lj1-f178.google.com ([209.85.208.178]:39367 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhBKMgN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Feb 2021 07:36:13 -0500
Received: by mail-lj1-f178.google.com with SMTP id u4so7146132ljh.6;
        Thu, 11 Feb 2021 04:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PV5F1WgtOQ84QjU5bTwvTgDjAehKSeN90DWi0kzdE6s=;
        b=SWi743SD4XI1drGE8nFh9jzpo0UCcefam+oyT0ptaNd9G+Vs3axlaZAMxMUl/ZjZLo
         GXYTmevkQZ1/x/jlE91POoJdS9V+m79Hxs/ubnygb8K+SpHM4YAB+4KFy88mFrm236wC
         Yl8/K0/xe90vo7+6mjaJ4W5S05DTRd96M8T2IoGkdLW1B8bmmvrEFpKcn0AGyMq157KU
         S1B1YUwNRkKzT38VBWK1cKWNWLEU3IDbCjEkPK3DovM5o5wP5+k+ob4mRU5FNNA88MQm
         dJ0ttISA+yQ6PQ1bT4muOyxaS2D/I8Prwm+9xcJ7TwAkju3mI0rESfoJaGvzlBJIPGMv
         tytA==
X-Gm-Message-State: AOAM532lmVvDX6vlgxMNSTs40TrLEdrneRl3Zsw6vYPXOGnrTCsdPpKj
        3QqAhGwrDpsNqrl2B1/qoVc=
X-Google-Smtp-Source: ABdhPJwsC8E/spkmvU3rYpBsPIMOghFEQMZXUEGsq/8gx+1cawn9K//pHA4XCgDMIrMx56cOAXMQxg==
X-Received: by 2002:a2e:b179:: with SMTP id a25mr3795410ljm.351.1613046928824;
        Thu, 11 Feb 2021 04:35:28 -0800 (PST)
Received: from localhost.localdomain (62-78-225-252.bb.dnainternet.fi. [62.78.225.252])
        by smtp.gmail.com with ESMTPSA id j1sm238296lfb.208.2021.02.11.04.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 04:35:28 -0800 (PST)
Date:   Thu, 11 Feb 2021 14:35:22 +0200
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
Subject: [RFC PATCH 4/7] regulator: add property parsing and callbacks to set
 protection limits
Message-ID: <19d533dbc99d610c40b9023dba7da7a9eaadbe3d.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1613042245.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT property parsing code and setting callback for regulator over/under
voltage, over-current and temperature error limits.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/core.c                  | 122 +++++++++++++++++++++-
 drivers/regulator/of_regulator.c          |  58 ++++++++++
 drivers/regulator/qcom-labibb-regulator.c |  10 +-
 drivers/regulator/stpmic1_regulator.c     |  17 ++-
 include/linux/regulator/driver.h          |  41 +++++++-
 include/linux/regulator/machine.h         |  26 +++++
 6 files changed, 267 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 9f06b33ff1e2..519329d34b08 100644
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
index 564f928eb1db..d1d6d7444b29 100644
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
+		"regulator-over-current-%s-microamp",
+		"regulator-over-voltage-%s-microvolt",
+		"regulator-over-temperature-%s-kelvin",
+		"regulator-under-voltage-%s-microvolt",
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
diff --git a/drivers/regulator/stpmic1_regulator.c b/drivers/regulator/stpmic1_regulator.c
index cf10fdb72e32..3f38ac583e3d 100644
--- a/drivers/regulator/stpmic1_regulator.c
+++ b/drivers/regulator/stpmic1_regulator.c
@@ -491,11 +491,26 @@ static int stpmic1_set_mode(struct regulator_dev *rdev, unsigned int mode)
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
index 9a9bc0f5dcea..2bbad7a32942 100644
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
