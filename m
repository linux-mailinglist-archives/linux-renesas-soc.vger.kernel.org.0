Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4448C378A74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 14:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235622AbhEJLoY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 07:44:24 -0400
Received: from mail-lf1-f50.google.com ([209.85.167.50]:40844 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236185AbhEJLbS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 07:31:18 -0400
Received: by mail-lf1-f50.google.com with SMTP id c3so22806670lfs.7;
        Mon, 10 May 2021 04:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nljcLRxfvKQmNeJA+p04B9LJ74kQgO1ZTVN6RhAGwQc=;
        b=lkwPKv2x3Y1lHUqXnGM1gxSgzXn3ykjxeSXCwqbyXoJZx6riYfe9Gc45UOw8Wv0UFG
         yozd2lIUobd4jhsRADhVNcMm2Mhu+TzPnljy96bj9A/kVUIItim1DRGy5N+N7B/vylxr
         fJ7V5nffFfYrTZv/Rg5njH1t9frGO91iIiy8BVyzec82kJ/4nHu4Knn2fbOot/qZxDmq
         ljEIh3Hmhn0JSGglRqBTEn+PG7Qe4WYLmBw7HRK9sXf8KlhNiyjYpb7qDGIw6iKe5a1t
         2pdDqIUCOOg307Xlrl7Buyp0AHWrDE+bs94xUgEzUCyaBF4OTtoVoSNlZX07Xxxf2+cO
         BXFQ==
X-Gm-Message-State: AOAM5307madLoMujoy829vYzKyurDQO9KMOqUnl7DvUVRYfBMeiM2Jfj
        QwYbuw+ivVlBh4Az1tpksHs=
X-Google-Smtp-Source: ABdhPJxVZB4tZoVgib8wd2dDz2AVVk/H0QBAE1cWHy5/y8RPUl/+5hua3Eg6wd7KFOAfQ+OFJtyrSQ==
X-Received: by 2002:a05:6512:c04:: with SMTP id z4mr16296251lfu.167.1620646210466;
        Mon, 10 May 2021 04:30:10 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id c26sm310145lfv.63.2021.05.10.04.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 04:30:09 -0700 (PDT)
Date:   Mon, 10 May 2021 14:30:03 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Kees Cook <keescook@chromium.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "agross@kernel.org" <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: [PATCH v9 06/10] regulator: add property parsing and callbacks to
 set protection limits
Message-ID: <5def4cd885a7477c457fb265ace97be271cc1478.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add DT property parsing code and setting callback for regulator over/under
voltage, over-current and temperature error limits.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
No changes since RFC-v3
---
 drivers/regulator/core.c                  | 122 +++++++++++++++++++++-
 drivers/regulator/of_regulator.c          |  58 ++++++++++
 drivers/regulator/qcom-labibb-regulator.c |  10 +-
 drivers/regulator/qcom_spmi-regulator.c   |   6 +-
 drivers/regulator/stpmic1_regulator.c     |  20 +++-
 include/linux/regulator/driver.h          |  41 +++++++-
 include/linux/regulator/machine.h         |  26 +++++
 7 files changed, 274 insertions(+), 9 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 87f53f5fbbd0..e40cb8c338dc 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1315,6 +1315,52 @@ static int machine_constraints_current(struct regula=
tor_dev *rdev,
=20
 static int _regulator_do_enable(struct regulator_dev *rdev);
=20
+static int notif_set_limit(struct regulator_dev *rdev,
+			   int (*set)(struct regulator_dev *, int, int, bool),
+			   int limit, int severity)
+{
+	bool enable;
+
+	if (limit =3D=3D REGULATOR_NOTIF_LIMIT_DISABLE) {
+		enable =3D false;
+		limit =3D 0;
+	} else {
+		enable =3D true;
+	}
+
+	if (limit =3D=3D REGULATOR_NOTIF_LIMIT_ENABLE)
+		limit =3D 0;
+
+	return set(rdev, limit, severity, enable);
+}
+
+static int handle_notify_limits(struct regulator_dev *rdev,
+			int (*set)(struct regulator_dev *, int, int, bool),
+			struct notification_limit *limits)
+{
+	int ret =3D 0;
+
+	if (!set)
+		return -EOPNOTSUPP;
+
+	if (limits->prot)
+		ret =3D notif_set_limit(rdev, set, limits->prot,
+				      REGULATOR_SEVERITY_PROT);
+	if (ret)
+		return ret;
+
+	if (limits->err)
+		ret =3D notif_set_limit(rdev, set, limits->err,
+				      REGULATOR_SEVERITY_ERR);
+	if (ret)
+		return ret;
+
+	if (limits->warn)
+		ret =3D notif_set_limit(rdev, set, limits->warn,
+				      REGULATOR_SEVERITY_WARN);
+
+	return ret;
+}
 /**
  * set_machine_constraints - sets regulator constraints
  * @rdev: regulator source
@@ -1400,9 +1446,27 @@ static int set_machine_constraints(struct regulator_=
dev *rdev)
 		}
 	}
=20
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
-		ret =3D ops->set_over_current_protection(rdev);
+		int lim =3D rdev->constraints->over_curr_limits.prot;
+
+		ret =3D ops->set_over_current_protection(rdev, lim,
+						       REGULATOR_SEVERITY_PROT,
+						       true);
 		if (ret < 0) {
 			rdev_err(rdev, "failed to set over current protection: %pe\n",
 				 ERR_PTR(ret));
@@ -1410,6 +1474,62 @@ static int set_machine_constraints(struct regulator_=
dev *rdev)
 		}
 	}
=20
+	if (rdev->constraints->over_current_detection)
+		ret =3D handle_notify_limits(rdev,
+					   ops->set_over_current_protection,
+					   &rdev->constraints->over_curr_limits);
+	if (ret) {
+		if (ret !=3D -EOPNOTSUPP) {
+			rdev_err(rdev, "failed to set over current limits: %pe\n",
+				 ERR_PTR(ret));
+			return ret;
+		}
+		rdev_warn(rdev,
+			  "IC does not support requested over-current limits\n");
+	}
+
+	if (rdev->constraints->over_voltage_detection)
+		ret =3D handle_notify_limits(rdev,
+					   ops->set_over_voltage_protection,
+					   &rdev->constraints->over_voltage_limits);
+	if (ret) {
+		if (ret !=3D -EOPNOTSUPP) {
+			rdev_err(rdev, "failed to set over voltage limits %pe\n",
+				 ERR_PTR(ret));
+			return ret;
+		}
+		rdev_warn(rdev,
+			  "IC does not support requested over voltage limits\n");
+	}
+
+	if (rdev->constraints->under_voltage_detection)
+		ret =3D handle_notify_limits(rdev,
+					   ops->set_under_voltage_protection,
+					   &rdev->constraints->under_voltage_limits);
+	if (ret) {
+		if (ret !=3D -EOPNOTSUPP) {
+			rdev_err(rdev, "failed to set under voltage limits %pe\n",
+				 ERR_PTR(ret));
+			return ret;
+		}
+		rdev_warn(rdev,
+			  "IC does not support requested under voltage limits\n");
+	}
+
+	if (rdev->constraints->over_temp_detection)
+		ret =3D handle_notify_limits(rdev,
+					   ops->set_thermal_protection,
+					   &rdev->constraints->temp_limits);
+	if (ret) {
+		if (ret !=3D -EOPNOTSUPP) {
+			rdev_err(rdev, "failed to set temperature limits %pe\n",
+				 ERR_PTR(ret));
+			return ret;
+		}
+		rdev_warn(rdev,
+			  "IC does not support requested temperature limits\n");
+	}
+
 	if (rdev->constraints->active_discharge && ops->set_active_discharge) {
 		bool ad_state =3D (rdev->constraints->active_discharge =3D=3D
 			      REGULATOR_ACTIVE_DISCHARGE_ENABLE) ? true : false;
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regula=
tor.c
index 49f6c05fee34..f54d4f176882 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -21,6 +21,62 @@ static const char *const regulator_states[PM_SUSPEND_MAX=
 + 1] =3D {
 	[PM_SUSPEND_MAX]	=3D "regulator-state-disk",
 };
=20
+static void fill_limit(int *limit, int val)
+{
+	if (val)
+		if (val =3D=3D 1)
+			*limit =3D REGULATOR_NOTIF_LIMIT_ENABLE;
+		else
+			*limit =3D val;
+	else
+		*limit =3D REGULATOR_NOTIF_LIMIT_DISABLE;
+}
+
+static void of_get_regulator_prot_limits(struct device_node *np,
+				struct regulation_constraints *constraints)
+{
+	u32 pval;
+	int i;
+	static const char *const props[] =3D {
+		"regulator-oc-%s-microamp",
+		"regulator-ov-%s-microvolt",
+		"regulator-temp-%s-kelvin",
+		"regulator-uv-%s-microvolt",
+	};
+	struct notification_limit *limits[] =3D {
+		&constraints->over_curr_limits,
+		&constraints->over_voltage_limits,
+		&constraints->temp_limits,
+		&constraints->under_voltage_limits,
+	};
+	bool set[4] =3D {0};
+
+	/* Protection limits: */
+	for (i =3D 0; i < ARRAY_SIZE(props); i++) {
+		char prop[255];
+		bool found;
+		int j;
+		static const char *const lvl[] =3D {
+			"protection", "error", "warn"
+		};
+		int *l[] =3D {
+			&limits[i]->prot, &limits[i]->err, &limits[i]->warn,
+		};
+
+		for (j =3D 0; j < ARRAY_SIZE(lvl); j++) {
+			snprintf(prop, 255, props[i], lvl[j]);
+			found =3D !of_property_read_u32(np, prop, &pval);
+			if (found)
+				fill_limit(l[j], pval);
+			set[i] |=3D found;
+		}
+	}
+	constraints->over_current_detection =3D set[0];
+	constraints->over_voltage_detection =3D set[1];
+	constraints->over_temp_detection =3D set[2];
+	constraints->under_voltage_detection =3D set[3];
+}
+
 static int of_get_regulation_constraints(struct device *dev,
 					struct device_node *np,
 					struct regulator_init_data **init_data,
@@ -188,6 +244,8 @@ static int of_get_regulation_constraints(struct device =
*dev,
 	constraints->over_current_protection =3D of_property_read_bool(np,
 					"regulator-over-current-protection");
=20
+	of_get_regulator_prot_limits(np, constraints);
+
 	for (i =3D 0; i < ARRAY_SIZE(regulator_states); i++) {
 		switch (i) {
 		case PM_SUSPEND_MEM:
diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/=
qcom-labibb-regulator.c
index de25e3279b4b..b3da0dc58782 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -307,13 +307,21 @@ static irqreturn_t qcom_labibb_ocp_isr(int irq, void =
*chip)
 	return IRQ_HANDLED;
 }
=20
-static int qcom_labibb_set_ocp(struct regulator_dev *rdev)
+static int qcom_labibb_set_ocp(struct regulator_dev *rdev, int lim,
+			       int severity, bool enable)
 {
 	struct labibb_regulator *vreg =3D rdev_get_drvdata(rdev);
 	char *ocp_irq_name;
 	u32 irq_flags =3D IRQF_ONESHOT;
 	int irq_trig_low, ret;
=20
+	/*
+	 * labibb supports only protection - and does not support setting
+	 * limit. Furthermore, we don't support disabling protection.
+	 */
+	if (lim || severity !=3D REGULATOR_SEVERITY_PROT || !enable)
+		return -EINVAL;
+
 	/* If there is no OCP interrupt, there's nothing to set */
 	if (vreg->ocp_irq <=3D 0)
 		return -EINVAL;
diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qc=
om_spmi-regulator.c
index 95677c51c1fa..41424a3366d0 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -595,11 +595,15 @@ static int spmi_regulator_vs_enable(struct regulator_=
dev *rdev)
 	return regulator_enable_regmap(rdev);
 }
=20
-static int spmi_regulator_vs_ocp(struct regulator_dev *rdev)
+static int spmi_regulator_vs_ocp(struct regulator_dev *rdev, int lim_uA,
+				 int severity, bool enable)
 {
 	struct spmi_regulator *vreg =3D rdev_get_drvdata(rdev);
 	u8 reg =3D SPMI_VS_OCP_OVERRIDE;
=20
+	if (lim_uA || !enable || severity !=3D REGULATOR_SEVERITY_PROT)
+		return -EINVAL;
+
 	return spmi_vreg_write(vreg, SPMI_VS_REG_OCP, &reg, 1);
 }
=20
diff --git a/drivers/regulator/stpmic1_regulator.c b/drivers/regulator/stpm=
ic1_regulator.c
index cf10fdb72e32..2d7597c76e4a 100644
--- a/drivers/regulator/stpmic1_regulator.c
+++ b/drivers/regulator/stpmic1_regulator.c
@@ -32,7 +32,8 @@ struct stpmic1_regulator_cfg {
=20
 static int stpmic1_set_mode(struct regulator_dev *rdev, unsigned int mode);
 static unsigned int stpmic1_get_mode(struct regulator_dev *rdev);
-static int stpmic1_set_icc(struct regulator_dev *rdev);
+static int stpmic1_set_icc(struct regulator_dev *rdev, int lim, int severi=
ty,
+			   bool enable);
 static unsigned int stpmic1_map_mode(unsigned int mode);
=20
 enum {
@@ -491,11 +492,26 @@ static int stpmic1_set_mode(struct regulator_dev *rde=
v, unsigned int mode)
 				  STPMIC1_BUCK_MODE_LP, value);
 }
=20
-static int stpmic1_set_icc(struct regulator_dev *rdev)
+static int stpmic1_set_icc(struct regulator_dev *rdev, int lim, int severi=
ty,
+			   bool enable)
 {
 	struct stpmic1_regulator_cfg *cfg =3D rdev_get_drvdata(rdev);
 	struct regmap *regmap =3D rdev_get_regmap(rdev);
=20
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
+	if (lim || severity !=3D REGULATOR_SEVERITY_PROT || !enable)
+		return -EINVAL;
+
 	/* enable switch off in case of over current */
 	return regmap_update_bits(regmap, cfg->icc_reg, cfg->icc_mask,
 				  cfg->icc_mask);
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/dri=
ver.h
index be301b28838a..eb979b810639 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -40,6 +40,15 @@ enum regulator_status {
 	REGULATOR_STATUS_UNDEFINED,
 };
=20
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
  * @get_current_limit: Get the configured limit for a current-limited regu=
lator.
  * @set_input_current_limit: Configure an input limit.
  *
- * @set_over_current_protection: Support capability of automatically shutt=
ing
- *                               down when detecting an over current event.
+ * @set_over_current_protection: Support enabling of and setting limits fo=
r over
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
+ * @set_over_voltage_protection: Support enabling of and setting limits fo=
r over
+ *	voltage situation detection. Detection can be configured for same
+ *	severities as over current protection.
+ * @set_under_voltage_protection: Support enabling of and setting limits f=
or
+ *	under situation detection.
+ * @set_thermal_protection: Support enabling of and setting limits for over
+ *	temperature situation detection.
  *
  * @set_active_discharge: Set active discharge enable/disable of regulator=
s.
  *
@@ -143,8 +169,15 @@ struct regulator_ops {
 	int (*get_current_limit) (struct regulator_dev *);
=20
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
=20
 	/* enable/disable regulator */
 	int (*enable) (struct regulator_dev *);
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/ma=
chine.h
index 8a56f033b6cd..68b4a514a410 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -83,6 +83,14 @@ struct regulator_state {
 	bool changeable;
 };
=20
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
  * @input_uV: Input voltage for regulator when supplied by another regulat=
or.
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
=20
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
=20
 /**
--=20
2.25.4


--=20
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =3D]=20

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCZGTsACgkQeFA3/03a
ocVZ7ggAxVwsGE2cOkGlBvpkN/l5m4sqTJEr4kPQDixgIfTBxW0UcL9Lcbj5RzXW
unU5MQ52t2Jgp2GyW8CsoPCJ4VxFzktgZxqaQPK59ZbbdTRftfJKoaEcB8ydfVNY
wE6UjqYSPzwBkyPBHgqLSCue0NQJBU/Z7VLyyPwcw34AOA0xoSK+FNdYiAvTFyKO
58J8TQN09u1EqOfeO2c9Ptv/LWSfH/tCBpRvWuPWfMgc1343a1JCZG7XSajKEtd5
cKKrYuy+4M5tcIX8eKT33ckKTQWp0Qv+HuGtbMiyYVsPuZBFeQJM0XkippxGDMNb
fwMzvAWCRkOHeuvomEL8N6J7sFdtqg==
=xcIp
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
