Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF65399A3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 07:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbhFCFoj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 01:44:39 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:39793 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbhFCFoj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 01:44:39 -0400
Received: by mail-lf1-f54.google.com with SMTP id p17so6243418lfc.6;
        Wed, 02 Jun 2021 22:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PS3VdIq/hyGlkliN+w8t7gB92niZL75Xs0fEvWoYJtM=;
        b=ljEzmOtQdgv3QbVlqqum75Zklmm5dG8S2cgo5naeAdKuXtOrT/p66r/SZBZ8Qt4vGn
         QuFyjdIHWBICW0ujx8891ysJIunSZtP2T75PUP21MId9a38vxqZZwT6cdIj2STbZUTGG
         D5l0ust93FEDtLCQCkQGnPGuzklHlRH+QOiY2zomPBpWTO5jBVIOFrCK6nyTbZ3JiiC/
         rv005LFktEzuKD/Z/kxCZBFim3+SDHdO05Zhsap5Xn6UoDX1ORHpC5KaeFnRm79e5oXJ
         xyOAXlkHvRidhgk1k67wFDqDV7Jus/KI4Z07Skda+ifnYM6Qtg4UxsR7GypjNJUM9/Hf
         g73g==
X-Gm-Message-State: AOAM530agOsWpLdcP7fwsC2YxCABMgokbZuQwsfOMbncsg5IN4JzOMSK
        Gk8IXQbQg9NLmeNqmLyJDeE=
X-Google-Smtp-Source: ABdhPJwoLYdTzUG2JEmZ0ci07McuYgi7y5bciyRu/Vh0B3YZiwh02SaCcjX+a9hGXrIlw5lgUdctng==
X-Received: by 2002:ac2:50c8:: with SMTP id h8mr13865976lfm.438.1622698973346;
        Wed, 02 Jun 2021 22:42:53 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id u16sm204050lfu.195.2021.06.02.22.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 22:42:52 -0700 (PDT)
Date:   Thu, 3 Jun 2021 08:42:46 +0300
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
Subject: [PATCH RESEND v10 09/11] regulator: bd9576: Support error reporting
Message-ID: <05c4f7a8e30ef1d4d5f3ceab07da4ebe68f5b4ed.1622628334.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline
In-Reply-To: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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
v9:
  - Rebased on v5.13-rc1 (probe return value fixes)
No changes since RFC-v3
---
 drivers/regulator/bd9576-regulator.c | 1050 +++++++++++++++++++++++---
 1 file changed, 926 insertions(+), 124 deletions(-)

diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd957=
6-regulator.c
index 204a2da054f5..6ba12af4c632 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -2,10 +2,10 @@
 // Copyright (C) 2020 ROHM Semiconductors
 // ROHM BD9576MUF/BD9573MUF regulator driver
=20
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
=20
 #define BD957X_VOUTS1_VOLT	3300000
 #define BD957X_VOUTS4_BASE_VOLT	1030000
 #define BD957X_VOUTS34_NUM_VOLT	32
=20
+#define BD9576_THERM_IRQ_MASK_TW	BIT(5)
+#define BD9576_xVD_IRQ_MASK_VOUTL1	BIT(5)
+#define BD9576_UVD_IRQ_MASK_VOUTS1_OCW	BIT(6)
+#define BD9576_xVD_IRQ_MASK_VOUT1TO4	0x0F
+
 static int vout1_volt_table[] =3D {5000000, 4900000, 4800000, 4700000, 460=
0000,
 				 4500000, 4500000, 4500000, 5000000, 5100000,
 				 5200000, 5300000, 5400000, 5500000, 5500000,
@@ -36,9 +43,85 @@ static int voutl1_volt_table[] =3D {2500000, 2540000, 25=
80000, 2620000, 2660000,
 				  2420000, 2380000, 2340000, 2300000, 2260000,
 				  2220000};
=20
+static const struct linear_range vout1_xvd_ranges[] =3D {
+	REGULATOR_LINEAR_RANGE(225000, 0x01, 0x2b, 0),
+	REGULATOR_LINEAR_RANGE(225000, 0x2c, 0x54, 5000),
+	REGULATOR_LINEAR_RANGE(425000, 0x55, 0x7f, 0),
+};
+
+static const struct linear_range vout234_xvd_ranges[] =3D {
+	REGULATOR_LINEAR_RANGE(17000, 0x01, 0x0f, 0),
+	REGULATOR_LINEAR_RANGE(17000, 0x10, 0x6d, 1000),
+	REGULATOR_LINEAR_RANGE(110000, 0x6e, 0x7f, 0),
+};
+
+static const struct linear_range voutL1_xvd_ranges[] =3D {
+	REGULATOR_LINEAR_RANGE(34000, 0x01, 0x0f, 0),
+	REGULATOR_LINEAR_RANGE(34000, 0x10, 0x6d, 2000),
+	REGULATOR_LINEAR_RANGE(220000, 0x6e, 0x7f, 0),
+};
+
+static struct linear_range voutS1_ocw_ranges_internal[] =3D {
+	REGULATOR_LINEAR_RANGE(200000, 0x01, 0x04, 0),
+	REGULATOR_LINEAR_RANGE(250000, 0x05, 0x18, 50000),
+	REGULATOR_LINEAR_RANGE(1200000, 0x19, 0x3f, 0),
+};
+
+static struct linear_range voutS1_ocw_ranges[] =3D {
+	REGULATOR_LINEAR_RANGE(50000, 0x01, 0x04, 0),
+	REGULATOR_LINEAR_RANGE(60000, 0x05, 0x18, 10000),
+	REGULATOR_LINEAR_RANGE(250000, 0x19, 0x3f, 0),
+};
+
+static struct linear_range voutS1_ocp_ranges_internal[] =3D {
+	REGULATOR_LINEAR_RANGE(300000, 0x01, 0x06, 0),
+	REGULATOR_LINEAR_RANGE(350000, 0x7, 0x1b, 50000),
+	REGULATOR_LINEAR_RANGE(1350000, 0x1c, 0x3f, 0),
+};
+
+static struct linear_range voutS1_ocp_ranges[] =3D {
+	REGULATOR_LINEAR_RANGE(70000, 0x01, 0x06, 0),
+	REGULATOR_LINEAR_RANGE(80000, 0x7, 0x1b, 10000),
+	REGULATOR_LINEAR_RANGE(280000, 0x1c, 0x3f, 0),
+};
+
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
+	bool oc_supported;
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
=20
 static int bd957x_vout34_list_voltage(struct regulator_dev *rdev,
@@ -72,151 +155,784 @@ static int bd957x_list_voltage(struct regulator_dev =
*rdev,
 	return desc->volt_table[index];
 }
=20
-static const struct regulator_ops bd957x_vout34_ops =3D {
+static void bd9576_fill_ovd_flags(struct bd957x_regulator_data *data,
+				  bool warn)
+{
+	if (warn) {
+		data->ovd_notif =3D REGULATOR_EVENT_OVER_VOLTAGE_WARN;
+		data->ovd_err =3D REGULATOR_ERROR_OVER_VOLTAGE_WARN;
+	} else {
+		data->ovd_notif =3D REGULATOR_EVENT_REGULATION_OUT;
+		data->ovd_err =3D REGULATOR_ERROR_REGULATION_OUT;
+	}
+}
+
+static void bd9576_fill_ocp_flags(struct bd957x_regulator_data *data,
+				  bool warn)
+{
+	if (warn) {
+		data->uvd_notif =3D REGULATOR_EVENT_OVER_CURRENT_WARN;
+		data->uvd_err =3D REGULATOR_ERROR_OVER_CURRENT_WARN;
+	} else {
+		data->uvd_notif =3D REGULATOR_EVENT_OVER_CURRENT;
+		data->uvd_err =3D REGULATOR_ERROR_OVER_CURRENT;
+	}
+}
+
+static void bd9576_fill_uvd_flags(struct bd957x_regulator_data *data,
+				  bool warn)
+{
+	if (warn) {
+		data->uvd_notif =3D REGULATOR_EVENT_UNDER_VOLTAGE_WARN;
+		data->uvd_err =3D REGULATOR_ERROR_UNDER_VOLTAGE_WARN;
+	} else {
+		data->uvd_notif =3D REGULATOR_EVENT_UNDER_VOLTAGE;
+		data->uvd_err =3D REGULATOR_ERROR_UNDER_VOLTAGE;
+	}
+}
+
+static void bd9576_fill_temp_flags(struct bd957x_regulator_data *data,
+				   bool enable, bool warn)
+{
+	if (!enable) {
+		data->temp_notif =3D 0;
+		data->temp_err =3D 0;
+	} else if (warn) {
+		data->temp_notif =3D REGULATOR_EVENT_OVER_TEMP_WARN;
+		data->temp_err =3D REGULATOR_ERROR_OVER_TEMP_WARN;
+	} else {
+		data->temp_notif =3D REGULATOR_EVENT_OVER_TEMP;
+		data->temp_err =3D REGULATOR_ERROR_OVER_TEMP;
+	}
+}
+
+static int bd9576_set_limit(const struct linear_range *r, int num_ranges,
+			    struct regmap *regmap, int reg, int mask, int lim)
+{
+	int ret;
+	bool found;
+	int sel =3D 0;
+
+	if (lim) {
+
+		ret =3D linear_range_get_selector_low_array(r, num_ranges,
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
+static bool check_ocp_flag_mismatch(struct regulator_dev *rdev, int severi=
ty,
+				    struct bd957x_regulator_data *r)
+{
+	if ((severity =3D=3D REGULATOR_SEVERITY_ERR &&
+	    r->uvd_notif !=3D REGULATOR_EVENT_OVER_CURRENT) ||
+	    (severity =3D=3D REGULATOR_SEVERITY_WARN &&
+	    r->uvd_notif !=3D REGULATOR_EVENT_OVER_CURRENT_WARN)) {
+		dev_warn(rdev_get_dev(rdev),
+			 "Can't support both OCP WARN and ERR\n");
+		/* Do not overwrite ERR config with WARN */
+		if (severity =3D=3D REGULATOR_SEVERITY_WARN)
+			return true;
+
+		bd9576_fill_ocp_flags(r, 0);
+	}
+
+	return false;
+}
+
+static bool check_uvd_flag_mismatch(struct regulator_dev *rdev, int severi=
ty,
+				    struct bd957x_regulator_data *r)
+{
+	if ((severity =3D=3D REGULATOR_SEVERITY_ERR &&
+	     r->uvd_notif !=3D REGULATOR_EVENT_UNDER_VOLTAGE) ||
+	     (severity =3D=3D REGULATOR_SEVERITY_WARN &&
+	     r->uvd_notif !=3D REGULATOR_EVENT_UNDER_VOLTAGE_WARN)) {
+		dev_warn(rdev_get_dev(rdev),
+			 "Can't support both UVD WARN and ERR\n");
+		if (severity =3D=3D REGULATOR_SEVERITY_WARN)
+			return true;
+
+		bd9576_fill_uvd_flags(r, 0);
+	}
+
+	return false;
+}
+
+static bool check_ovd_flag_mismatch(struct regulator_dev *rdev, int severi=
ty,
+				    struct bd957x_regulator_data *r)
+{
+	if ((severity =3D=3D REGULATOR_SEVERITY_ERR &&
+	     r->ovd_notif !=3D REGULATOR_EVENT_REGULATION_OUT) ||
+	     (severity =3D=3D REGULATOR_SEVERITY_WARN &&
+	     r->ovd_notif !=3D REGULATOR_EVENT_OVER_VOLTAGE_WARN)) {
+		dev_warn(rdev_get_dev(rdev),
+			 "Can't support both OVD WARN and ERR\n");
+		if (severity =3D=3D REGULATOR_SEVERITY_WARN)
+			return true;
+
+		bd9576_fill_ovd_flags(r, 0);
+	}
+
+	return false;
+}
+
+static bool check_temp_flag_mismatch(struct regulator_dev *rdev, int sever=
ity,
+				    struct bd957x_regulator_data *r)
+{
+	if ((severity =3D=3D REGULATOR_SEVERITY_ERR &&
+	     r->ovd_notif !=3D REGULATOR_EVENT_OVER_TEMP) ||
+	     (severity =3D=3D REGULATOR_SEVERITY_WARN &&
+	     r->ovd_notif !=3D REGULATOR_EVENT_OVER_TEMP_WARN)) {
+		dev_warn(rdev_get_dev(rdev),
+			 "Can't support both thermal WARN and ERR\n");
+		if (severity =3D=3D REGULATOR_SEVERITY_WARN)
+			return true;
+	}
+
+	return false;
+}
+
+static int bd9576_set_ocp(struct regulator_dev *rdev, int lim_uA, int seve=
rity,
+			  bool enable)
+{
+	struct bd957x_data *d;
+	struct bd957x_regulator_data *r;
+	int reg, mask;
+	int Vfet, rfet;
+	const struct linear_range *range;
+	int num_ranges;
+
+	if ((lim_uA && !enable) || (!lim_uA && enable))
+		return -EINVAL;
+
+	r =3D container_of(rdev->desc, struct bd957x_regulator_data, desc);
+	if (!r->oc_supported)
+		return -EINVAL;
+
+	d =3D rdev_get_drvdata(rdev);
+
+	if (severity =3D=3D REGULATOR_SEVERITY_PROT) {
+		reg =3D r->ocp_reg;
+		mask =3D r->ocp_mask;
+		if (r->ocw_rfet) {
+			range =3D voutS1_ocp_ranges;
+			num_ranges =3D ARRAY_SIZE(voutS1_ocp_ranges);
+			rfet =3D r->ocw_rfet / 1000;
+		} else {
+			range =3D voutS1_ocp_ranges_internal;
+			num_ranges =3D ARRAY_SIZE(voutS1_ocp_ranges_internal);
+			/* Internal values are already micro-amperes */
+			rfet =3D 1000;
+		}
+	} else {
+		reg =3D r->ocw_reg;
+		mask =3D r->ocw_mask;
+
+		if (r->ocw_rfet) {
+			range =3D voutS1_ocw_ranges;
+			num_ranges =3D ARRAY_SIZE(voutS1_ocw_ranges);
+			rfet =3D r->ocw_rfet / 1000;
+		} else {
+			range =3D voutS1_ocw_ranges_internal;
+			num_ranges =3D ARRAY_SIZE(voutS1_ocw_ranges_internal);
+			/* Internal values are already micro-amperes */
+			rfet =3D 1000;
+		}
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
+			bool warn =3D severity =3D=3D REGULATOR_SEVERITY_WARN;
+
+			bd9576_fill_ocp_flags(r, warn);
+		}
+	}
+
+	/*
+	 * limits are given in uA, rfet is mOhm
+	 * Divide lim_uA by 1000 to get Vfet in uV.
+	 * (We expect both Rfet and limit uA to be magnitude of hundreds of
+	 * milli Amperes & milli Ohms =3D> we should still have decent accuracy)
+	 */
+	Vfet =3D lim_uA/1000 * rfet;
+
+	return bd9576_set_limit(range, num_ranges, d->regmap,
+				reg, mask, Vfet);
+}
+
+static int bd9576_set_uvp(struct regulator_dev *rdev, int lim_uV, int seve=
rity,
+			  bool enable)
+{
+	struct bd957x_data *d;
+	struct bd957x_regulator_data *r;
+	int mask, reg;
+
+	if (severity =3D=3D REGULATOR_SEVERITY_PROT) {
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
+	r =3D container_of(rdev->desc, struct bd957x_regulator_data, desc);
+	d =3D rdev_get_drvdata(rdev);
+
+	mask =3D r->xvd_mask;
+	reg =3D r->uvd_reg;
+	/*
+	 * Check that there is no mismatch for what the detection IRQs are to
+	 * be used.
+	 */
+	if (r->uvd_notif) {
+		if (check_uvd_flag_mismatch(rdev, severity, r))
+			return 0;
+	} else {
+		bd9576_fill_uvd_flags(r, severity =3D=3D REGULATOR_SEVERITY_WARN);
+	}
+
+	return bd9576_set_limit(r->xvd_ranges, r->num_xvd_ranges, d->regmap,
+				reg, mask, lim_uV);
+}
+
+static int bd9576_set_ovp(struct regulator_dev *rdev, int lim_uV, int seve=
rity,
+			  bool enable)
+{
+	struct bd957x_data *d;
+	struct bd957x_regulator_data *r;
+	int mask, reg;
+
+	if (severity =3D=3D REGULATOR_SEVERITY_PROT) {
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
+	r =3D container_of(rdev->desc, struct bd957x_regulator_data, desc);
+	d =3D rdev_get_drvdata(rdev);
+
+	mask =3D r->xvd_mask;
+	reg =3D r->ovd_reg;
+	/*
+	 * Check that there is no mismatch for what the detection IRQs are to
+	 * be used.
+	 */
+	if (r->ovd_notif) {
+		if (check_ovd_flag_mismatch(rdev, severity, r))
+			return 0;
+	} else {
+		bd9576_fill_ovd_flags(r, severity =3D=3D REGULATOR_SEVERITY_WARN);
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
+	if (severity =3D=3D REGULATOR_SEVERITY_PROT) {
+		if (!enable)
+			return -EINVAL;
+		else
+			return 0;
+	}
+
+	r =3D container_of(rdev->desc, struct bd957x_regulator_data, desc);
+	d =3D rdev_get_drvdata(rdev);
+
+	/*
+	 * Check that there is no mismatch for what the detection IRQs are to
+	 * be used.
+	 */
+	if (r->temp_notif)
+		if (check_temp_flag_mismatch(rdev, severity, r))
+			return 0;
+
+	bd9576_fill_temp_flags(r, enable, severity =3D=3D REGULATOR_SEVERITY_WARN=
);
+
+	if (enable)
+		return regmap_update_bits(d->regmap, BD957X_REG_INT_THERM_MASK,
+					 BD9576_THERM_IRQ_MASK_TW, 0);
+
+	/*
+	 * If any of the regulators is interested in thermal warning we keep IRQ
+	 * enabled.
+	 */
+	for (i =3D 0; i < BD9576_NUM_REGULATORS; i++)
+		if (d->regulator_data[i].temp_notif)
+			return 0;
+
+	return regmap_update_bits(d->regmap, BD957X_REG_INT_THERM_MASK,
+				  BD9576_THERM_IRQ_MASK_TW,
+				  BD9576_THERM_IRQ_MASK_TW);
+}
+
+static const struct regulator_ops bd9573_vout34_ops =3D {
 	.is_enabled =3D regulator_is_enabled_regmap,
 	.list_voltage =3D bd957x_vout34_list_voltage,
 	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
 };
=20
-static const struct regulator_ops bd957X_vouts1_regulator_ops =3D {
+static const struct regulator_ops bd9576_vout34_ops =3D {
+	.is_enabled =3D regulator_is_enabled_regmap,
+	.list_voltage =3D bd957x_vout34_list_voltage,
+	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
+	.set_over_voltage_protection =3D bd9576_set_ovp,
+	.set_under_voltage_protection =3D bd9576_set_uvp,
+	.set_thermal_protection =3D bd9576_set_tw,
+};
+
+static const struct regulator_ops bd9573_vouts1_regulator_ops =3D {
+	.is_enabled =3D regulator_is_enabled_regmap,
+};
+
+static const struct regulator_ops bd9576_vouts1_regulator_ops =3D {
+	.is_enabled =3D regulator_is_enabled_regmap,
+	.set_over_current_protection =3D bd9576_set_ocp,
+};
+
+static const struct regulator_ops bd9573_ops =3D {
 	.is_enabled =3D regulator_is_enabled_regmap,
+	.list_voltage =3D bd957x_list_voltage,
+	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
 };
=20
-static const struct regulator_ops bd957x_ops =3D {
+static const struct regulator_ops bd9576_ops =3D {
 	.is_enabled =3D regulator_is_enabled_regmap,
 	.list_voltage =3D bd957x_list_voltage,
 	.get_voltage_sel =3D regulator_get_voltage_sel_regmap,
+	.set_over_voltage_protection =3D bd9576_set_ovp,
+	.set_under_voltage_protection =3D bd9576_set_uvp,
+	.set_thermal_protection =3D bd9576_set_tw,
+};
+
+static const struct regulator_ops  *bd9573_ops_arr[] =3D {
+	[BD957X_VD50]	=3D &bd9573_ops,
+	[BD957X_VD18]	=3D &bd9573_ops,
+	[BD957X_VDDDR]	=3D &bd9573_vout34_ops,
+	[BD957X_VD10]	=3D &bd9573_vout34_ops,
+	[BD957X_VOUTL1]	=3D &bd9573_ops,
+	[BD957X_VOUTS1]	=3D &bd9573_vouts1_regulator_ops,
 };
=20
-static struct bd957x_regulator_data bd9576_regulators[] =3D {
-	{
-		.desc =3D {
-			.name =3D "VD50",
-			.of_match =3D of_match_ptr("regulator-vd50"),
-			.regulators_node =3D of_match_ptr("regulators"),
-			.id =3D BD957X_VD50,
-			.type =3D REGULATOR_VOLTAGE,
-			.ops =3D &bd957x_ops,
-			.volt_table =3D &vout1_volt_table[0],
-			.n_voltages =3D ARRAY_SIZE(vout1_volt_table),
-			.vsel_reg =3D BD957X_REG_VOUT1_TUNE,
-			.vsel_mask =3D BD957X_MASK_VOUT1_TUNE,
-			.enable_reg =3D BD957X_REG_POW_TRIGGER1,
-			.enable_mask =3D BD957X_REGULATOR_EN_MASK,
-			.enable_val =3D BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted =3D true,
-			.owner =3D THIS_MODULE,
+static const struct regulator_ops  *bd9576_ops_arr[] =3D {
+	[BD957X_VD50]	=3D &bd9576_ops,
+	[BD957X_VD18]	=3D &bd9576_ops,
+	[BD957X_VDDDR]	=3D &bd9576_vout34_ops,
+	[BD957X_VD10]	=3D &bd9576_vout34_ops,
+	[BD957X_VOUTL1]	=3D &bd9576_ops,
+	[BD957X_VOUTS1]	=3D &bd9576_vouts1_regulator_ops,
+};
+
+static int vouts1_get_fet_res(struct device_node *np,
+				const struct regulator_desc *desc,
+				struct regulator_config *cfg)
+{
+	struct bd957x_regulator_data *data;
+	int ret;
+	u32 uohms;
+
+	data =3D container_of(desc, struct bd957x_regulator_data, desc);
+
+	ret =3D of_property_read_u32(np, "rohm,ocw-fet-ron-micro-ohms", &uohms);
+	if (ret) {
+		if (ret !=3D -EINVAL)
+			return ret;
+
+		return 0;
+	}
+	data->ocw_rfet =3D uohms;
+	return 0;
+}
+
+static struct bd957x_data bd957x_regulators =3D {
+	.regulator_data =3D {
+		{
+			.desc =3D {
+				.name =3D "VD50",
+				.of_match =3D of_match_ptr("regulator-vd50"),
+				.regulators_node =3D of_match_ptr("regulators"),
+				.id =3D BD957X_VD50,
+				.type =3D REGULATOR_VOLTAGE,
+				.volt_table =3D &vout1_volt_table[0],
+				.n_voltages =3D ARRAY_SIZE(vout1_volt_table),
+				.vsel_reg =3D BD957X_REG_VOUT1_TUNE,
+				.vsel_mask =3D BD957X_MASK_VOUT1_TUNE,
+				.enable_reg =3D BD957X_REG_POW_TRIGGER1,
+				.enable_mask =3D BD957X_REGULATOR_EN_MASK,
+				.enable_val =3D BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted =3D true,
+				.owner =3D THIS_MODULE,
+			},
+			.xvd_ranges =3D vout1_xvd_ranges,
+			.num_xvd_ranges =3D ARRAY_SIZE(vout1_xvd_ranges),
+			.ovd_reg =3D BD9576_REG_VOUT1_OVD,
+			.uvd_reg =3D BD9576_REG_VOUT1_UVD,
+			.xvd_mask =3D BD9576_MASK_XVD,
 		},
-	},
-	{
-		.desc =3D {
-			.name =3D "VD18",
-			.of_match =3D of_match_ptr("regulator-vd18"),
-			.regulators_node =3D of_match_ptr("regulators"),
-			.id =3D BD957X_VD18,
-			.type =3D REGULATOR_VOLTAGE,
-			.ops =3D &bd957x_ops,
-			.volt_table =3D &vout2_volt_table[0],
-			.n_voltages =3D ARRAY_SIZE(vout2_volt_table),
-			.vsel_reg =3D BD957X_REG_VOUT2_TUNE,
-			.vsel_mask =3D BD957X_MASK_VOUT2_TUNE,
-			.enable_reg =3D BD957X_REG_POW_TRIGGER2,
-			.enable_mask =3D BD957X_REGULATOR_EN_MASK,
-			.enable_val =3D BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted =3D true,
-			.owner =3D THIS_MODULE,
+		{
+			.desc =3D {
+				.name =3D "VD18",
+				.of_match =3D of_match_ptr("regulator-vd18"),
+				.regulators_node =3D of_match_ptr("regulators"),
+				.id =3D BD957X_VD18,
+				.type =3D REGULATOR_VOLTAGE,
+				.volt_table =3D &vout2_volt_table[0],
+				.n_voltages =3D ARRAY_SIZE(vout2_volt_table),
+				.vsel_reg =3D BD957X_REG_VOUT2_TUNE,
+				.vsel_mask =3D BD957X_MASK_VOUT2_TUNE,
+				.enable_reg =3D BD957X_REG_POW_TRIGGER2,
+				.enable_mask =3D BD957X_REGULATOR_EN_MASK,
+				.enable_val =3D BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted =3D true,
+				.owner =3D THIS_MODULE,
+			},
+			.xvd_ranges =3D vout234_xvd_ranges,
+			.num_xvd_ranges =3D ARRAY_SIZE(vout234_xvd_ranges),
+			.ovd_reg =3D BD9576_REG_VOUT2_OVD,
+			.uvd_reg =3D BD9576_REG_VOUT2_UVD,
+			.xvd_mask =3D BD9576_MASK_XVD,
 		},
-	},
-	{
-		.desc =3D {
-			.name =3D "VDDDR",
-			.of_match =3D of_match_ptr("regulator-vdddr"),
-			.regulators_node =3D of_match_ptr("regulators"),
-			.id =3D BD957X_VDDDR,
-			.ops =3D &bd957x_vout34_ops,
-			.type =3D REGULATOR_VOLTAGE,
-			.n_voltages =3D BD957X_VOUTS34_NUM_VOLT,
-			.vsel_reg =3D BD957X_REG_VOUT3_TUNE,
-			.vsel_mask =3D BD957X_MASK_VOUT3_TUNE,
-			.enable_reg =3D BD957X_REG_POW_TRIGGER3,
-			.enable_mask =3D BD957X_REGULATOR_EN_MASK,
-			.enable_val =3D BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted =3D true,
-			.owner =3D THIS_MODULE,
+		{
+			.desc =3D {
+				.name =3D "VDDDR",
+				.of_match =3D of_match_ptr("regulator-vdddr"),
+				.regulators_node =3D of_match_ptr("regulators"),
+				.id =3D BD957X_VDDDR,
+				.type =3D REGULATOR_VOLTAGE,
+				.n_voltages =3D BD957X_VOUTS34_NUM_VOLT,
+				.vsel_reg =3D BD957X_REG_VOUT3_TUNE,
+				.vsel_mask =3D BD957X_MASK_VOUT3_TUNE,
+				.enable_reg =3D BD957X_REG_POW_TRIGGER3,
+				.enable_mask =3D BD957X_REGULATOR_EN_MASK,
+				.enable_val =3D BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted =3D true,
+				.owner =3D THIS_MODULE,
+			},
+			.ovd_reg =3D BD9576_REG_VOUT3_OVD,
+			.uvd_reg =3D BD9576_REG_VOUT3_UVD,
+			.xvd_mask =3D BD9576_MASK_XVD,
+			.xvd_ranges =3D vout234_xvd_ranges,
+			.num_xvd_ranges =3D ARRAY_SIZE(vout234_xvd_ranges),
 		},
-	},
-	{
-		.desc =3D {
-			.name =3D "VD10",
-			.of_match =3D of_match_ptr("regulator-vd10"),
-			.regulators_node =3D of_match_ptr("regulators"),
-			.id =3D BD957X_VD10,
-			.ops =3D &bd957x_vout34_ops,
-			.type =3D REGULATOR_VOLTAGE,
-			.fixed_uV =3D BD957X_VOUTS4_BASE_VOLT,
-			.n_voltages =3D BD957X_VOUTS34_NUM_VOLT,
-			.vsel_reg =3D BD957X_REG_VOUT4_TUNE,
-			.vsel_mask =3D BD957X_MASK_VOUT4_TUNE,
-			.enable_reg =3D BD957X_REG_POW_TRIGGER4,
-			.enable_mask =3D BD957X_REGULATOR_EN_MASK,
-			.enable_val =3D BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted =3D true,
-			.owner =3D THIS_MODULE,
+		{
+			.desc =3D {
+				.name =3D "VD10",
+				.of_match =3D of_match_ptr("regulator-vd10"),
+				.regulators_node =3D of_match_ptr("regulators"),
+				.id =3D BD957X_VD10,
+				.type =3D REGULATOR_VOLTAGE,
+				.fixed_uV =3D BD957X_VOUTS4_BASE_VOLT,
+				.n_voltages =3D BD957X_VOUTS34_NUM_VOLT,
+				.vsel_reg =3D BD957X_REG_VOUT4_TUNE,
+				.vsel_mask =3D BD957X_MASK_VOUT4_TUNE,
+				.enable_reg =3D BD957X_REG_POW_TRIGGER4,
+				.enable_mask =3D BD957X_REGULATOR_EN_MASK,
+				.enable_val =3D BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted =3D true,
+				.owner =3D THIS_MODULE,
+			},
+			.xvd_ranges =3D vout234_xvd_ranges,
+			.num_xvd_ranges =3D ARRAY_SIZE(vout234_xvd_ranges),
+			.ovd_reg =3D BD9576_REG_VOUT4_OVD,
+			.uvd_reg =3D BD9576_REG_VOUT4_UVD,
+			.xvd_mask =3D BD9576_MASK_XVD,
 		},
-	},
-	{
-		.desc =3D {
-			.name =3D "VOUTL1",
-			.of_match =3D of_match_ptr("regulator-voutl1"),
-			.regulators_node =3D of_match_ptr("regulators"),
-			.id =3D BD957X_VOUTL1,
-			.ops =3D &bd957x_ops,
-			.type =3D REGULATOR_VOLTAGE,
-			.volt_table =3D &voutl1_volt_table[0],
-			.n_voltages =3D ARRAY_SIZE(voutl1_volt_table),
-			.vsel_reg =3D BD957X_REG_VOUTL1_TUNE,
-			.vsel_mask =3D BD957X_MASK_VOUTL1_TUNE,
-			.enable_reg =3D BD957X_REG_POW_TRIGGERL1,
-			.enable_mask =3D BD957X_REGULATOR_EN_MASK,
-			.enable_val =3D BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted =3D true,
-			.owner =3D THIS_MODULE,
+		{
+			.desc =3D {
+				.name =3D "VOUTL1",
+				.of_match =3D of_match_ptr("regulator-voutl1"),
+				.regulators_node =3D of_match_ptr("regulators"),
+				.id =3D BD957X_VOUTL1,
+				.type =3D REGULATOR_VOLTAGE,
+				.volt_table =3D &voutl1_volt_table[0],
+				.n_voltages =3D ARRAY_SIZE(voutl1_volt_table),
+				.vsel_reg =3D BD957X_REG_VOUTL1_TUNE,
+				.vsel_mask =3D BD957X_MASK_VOUTL1_TUNE,
+				.enable_reg =3D BD957X_REG_POW_TRIGGERL1,
+				.enable_mask =3D BD957X_REGULATOR_EN_MASK,
+				.enable_val =3D BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted =3D true,
+				.owner =3D THIS_MODULE,
+			},
+			.xvd_ranges =3D voutL1_xvd_ranges,
+			.num_xvd_ranges =3D ARRAY_SIZE(voutL1_xvd_ranges),
+			.ovd_reg =3D BD9576_REG_VOUTL1_OVD,
+			.uvd_reg =3D BD9576_REG_VOUTL1_UVD,
+			.xvd_mask =3D BD9576_MASK_XVD,
 		},
-	},
-	{
-		.desc =3D {
-			.name =3D "VOUTS1",
-			.of_match =3D of_match_ptr("regulator-vouts1"),
-			.regulators_node =3D of_match_ptr("regulators"),
-			.id =3D BD957X_VOUTS1,
-			.ops =3D &bd957X_vouts1_regulator_ops,
-			.type =3D REGULATOR_VOLTAGE,
-			.n_voltages =3D 1,
-			.fixed_uV =3D BD957X_VOUTS1_VOLT,
-			.enable_reg =3D BD957X_REG_POW_TRIGGERS1,
-			.enable_mask =3D BD957X_REGULATOR_EN_MASK,
-			.enable_val =3D BD957X_REGULATOR_DIS_VAL,
-			.enable_is_inverted =3D true,
-			.owner =3D THIS_MODULE,
+		{
+			.desc =3D {
+				.name =3D "VOUTS1",
+				.of_match =3D of_match_ptr("regulator-vouts1"),
+				.regulators_node =3D of_match_ptr("regulators"),
+				.id =3D BD957X_VOUTS1,
+				.type =3D REGULATOR_VOLTAGE,
+				.n_voltages =3D 1,
+				.fixed_uV =3D BD957X_VOUTS1_VOLT,
+				.enable_reg =3D BD957X_REG_POW_TRIGGERS1,
+				.enable_mask =3D BD957X_REGULATOR_EN_MASK,
+				.enable_val =3D BD957X_REGULATOR_DIS_VAL,
+				.enable_is_inverted =3D true,
+				.owner =3D THIS_MODULE,
+				.of_parse_cb =3D vouts1_get_fet_res,
+			},
+			.oc_supported =3D true,
+			.ocw_reg =3D BD9576_REG_VOUT1S_OCW,
+			.ocw_mask =3D BD9576_MASK_VOUT1S_OCW,
+			.ocp_reg =3D BD9576_REG_VOUT1S_OCP,
+			.ocp_mask =3D BD9576_MASK_VOUT1S_OCP,
 		},
 	},
 };
=20
+static int bd9576_renable(struct regulator_irq_data *rid, int reg, int mas=
k)
+{
+	int val, ret;
+	struct bd957x_data *d =3D (struct bd957x_data *)rid->data;
+
+	ret =3D regmap_read(d->regmap, reg, &val);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	if (rid->opaque && rid->opaque =3D=3D (val & mask)) {
+		/*
+		 * It seems we stil have same status. Ack and return
+		 * information that we are still out of limits and core
+		 * should not enable IRQ
+		 */
+		regmap_write(d->regmap, reg, mask & val);
+		return REGULATOR_ERROR_ON;
+	}
+	rid->opaque =3D 0;
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
+	struct bd957x_data *d =3D (struct bd957x_data *)rid->data;
+
+	ret =3D regmap_read(d->regmap, BD957X_REG_INT_UVD_STAT, &val);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	*dev_mask =3D 0;
+
+	rid->opaque =3D val & UVD_IRQ_VALID_MASK;
+
+	/*
+	 * Go through the set status bits and report either error or warning
+	 * to the notifier depending on what was flagged in DT
+	 */
+	*dev_mask =3D val & BD9576_xVD_IRQ_MASK_VOUT1TO4;
+	/* There is 1 bit gap in register after Vout1 .. Vout4 statuses */
+	*dev_mask |=3D ((val & BD9576_xVD_IRQ_MASK_VOUTL1) >> 1);
+	/*
+	 * We (ab)use the uvd for OCW notification. DT parsing should
+	 * have added correct OCW flag to uvd_notif and uvd_err for S1
+	 */
+	*dev_mask |=3D ((val & BD9576_UVD_IRQ_MASK_VOUTS1_OCW) >> 1);
+
+	for_each_set_bit(i, dev_mask, 6) {
+		struct bd957x_regulator_data *rdata;
+		struct regulator_err_state *stat;
+
+		rdata =3D &d->regulator_data[i];
+		stat  =3D &rid->states[i];
+
+		stat->notifs	=3D rdata->uvd_notif;
+		stat->errors	=3D rdata->uvd_err;
+	}
+
+	ret =3D regmap_write(d->regmap, BD957X_REG_INT_UVD_STAT,
+			   UVD_IRQ_VALID_MASK & val);
+
+	return 0;
+}
+
+static int bd9576_ovd_handler(int irq, struct regulator_irq_data *rid,
+			      unsigned long *dev_mask)
+{
+	int val, ret, i;
+	struct bd957x_data *d =3D (struct bd957x_data *)rid->data;
+
+	ret =3D regmap_read(d->regmap, BD957X_REG_INT_OVD_STAT, &val);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	rid->opaque =3D val & OVD_IRQ_VALID_MASK;
+	*dev_mask =3D 0;
+
+	if (!(val & OVD_IRQ_VALID_MASK))
+		return 0;
+
+	*dev_mask =3D val & BD9576_xVD_IRQ_MASK_VOUT1TO4;
+	/* There is 1 bit gap in register after Vout1 .. Vout4 statuses */
+	*dev_mask |=3D ((val & BD9576_xVD_IRQ_MASK_VOUTL1) >> 1);
+
+	for_each_set_bit(i, dev_mask, 5) {
+		struct bd957x_regulator_data *rdata;
+		struct regulator_err_state *stat;
+
+		rdata =3D &d->regulator_data[i];
+		stat  =3D &rid->states[i];
+
+		stat->notifs	=3D rdata->ovd_notif;
+		stat->errors	=3D rdata->ovd_err;
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
+	struct bd957x_data *d =3D (struct bd957x_data *)rid->data;
+
+	ret =3D regmap_read(d->regmap, BD957X_REG_INT_THERM_STAT, &val);
+	if (ret)
+		return REGULATOR_FAILED_RETRY;
+
+	if (!(val & BD9576_THERM_IRQ_MASK_TW)) {
+		*dev_mask =3D 0;
+		return 0;
+	}
+
+	*dev_mask =3D BD9576_DEV_MASK_ALL_REGULATORS;
+
+	for (i =3D 0; i < BD9576_NUM_REGULATORS; i++) {
+		struct bd957x_regulator_data *rdata;
+		struct regulator_err_state *stat;
+
+		rdata =3D &d->regulator_data[i];
+		stat  =3D &rid->states[i];
+
+		stat->notifs	=3D rdata->temp_notif;
+		stat->errors	=3D rdata->temp_err;
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
+	int i;
+	unsigned int num_reg_data;
+	bool vout_mode, ddr_sel, may_have_irqs;
 	struct regmap *regmap;
+	struct bd957x_data *ic_data;
 	struct regulator_config config =3D { 0 };
-	int i;
-	bool vout_mode, ddr_sel;
-	const struct bd957x_regulator_data *reg_data =3D &bd9576_regulators[0];
-	unsigned int num_reg_data =3D ARRAY_SIZE(bd9576_regulators);
+	/* All regulators are related to UVD and thermal IRQs... */
+	struct regulator_dev *rdevs[BD9576_NUM_REGULATORS];
+	/* ...But VoutS1 is not flagged by OVD IRQ */
+	struct regulator_dev *ovd_devs[BD9576_NUM_OVD_REGULATORS];
+	static const struct regulator_irq_desc bd9576_notif_uvd =3D {
+		.name =3D "bd9576-uvd",
+		.irq_off_ms =3D 1000,
+		.map_event =3D bd9576_uvd_handler,
+		.renable =3D bd9576_uvd_renable,
+		.data =3D &bd957x_regulators,
+	};
+	static const struct regulator_irq_desc bd9576_notif_ovd =3D {
+		.name =3D "bd9576-ovd",
+		.irq_off_ms =3D 1000,
+		.map_event =3D bd9576_ovd_handler,
+		.renable =3D bd9576_ovd_renable,
+		.data =3D &bd957x_regulators,
+	};
+	static const struct regulator_irq_desc bd9576_notif_temp =3D {
+		.name =3D "bd9576-temp",
+		.irq_off_ms =3D 1000,
+		.map_event =3D bd9576_thermal_handler,
+		.renable =3D bd9576_temp_renable,
+		.data =3D &bd957x_regulators,
+	};
 	enum rohm_chip_type chip =3D platform_get_device_id(pdev)->driver_data;
=20
+	num_reg_data =3D ARRAY_SIZE(bd957x_regulators.regulator_data);
+
+	ic_data =3D &bd957x_regulators;
+
 	regmap =3D dev_get_regmap(pdev->dev.parent, NULL);
 	if (!regmap) {
 		dev_err(&pdev->dev, "No regmap\n");
 		return -EINVAL;
 	}
+
+	ic_data->regmap =3D regmap;
 	vout_mode =3D of_property_read_bool(pdev->dev.parent->of_node,
 					 "rohm,vout1-en-low");
 	if (vout_mode) {
@@ -263,15 +979,17 @@ static int bd957x_probe(struct platform_device *pdev)
 	 * bytes and use bd9576_regulators directly for non-constant configs
 	 * like DDR voltage selection.
 	 */
+	platform_set_drvdata(pdev, ic_data);
 	ddr_sel =3D  of_property_read_bool(pdev->dev.parent->of_node,
 					 "rohm,ddr-sel-low");
 	if (ddr_sel)
-		bd9576_regulators[2].desc.fixed_uV =3D 1350000;
+		ic_data->regulator_data[2].desc.fixed_uV =3D 1350000;
 	else
-		bd9576_regulators[2].desc.fixed_uV =3D 1500000;
+		ic_data->regulator_data[2].desc.fixed_uV =3D 1500000;
=20
 	switch (chip) {
 	case ROHM_CHIP_TYPE_BD9576:
+		may_have_irqs =3D true;
 		dev_dbg(&pdev->dev, "Found BD9576MUF\n");
 		break;
 	case ROHM_CHIP_TYPE_BD9573:
@@ -282,32 +1000,116 @@ static int bd957x_probe(struct platform_device *pde=
v)
 		return -EINVAL;
 	}
=20
+	for (i =3D 0; i < num_reg_data; i++) {
+		struct regulator_desc *d;
+
+		d =3D &ic_data->regulator_data[i].desc;
+
+
+		if (may_have_irqs) {
+			if (d->id >=3D ARRAY_SIZE(bd9576_ops_arr))
+				return -EINVAL;
+
+			d->ops =3D bd9576_ops_arr[d->id];
+		} else {
+			if (d->id >=3D ARRAY_SIZE(bd9573_ops_arr))
+				return -EINVAL;
+
+			d->ops =3D bd9573_ops_arr[d->id];
+		}
+	}
+
 	config.dev =3D pdev->dev.parent;
 	config.regmap =3D regmap;
+	config.driver_data =3D ic_data;
=20
 	for (i =3D 0; i < num_reg_data; i++) {
=20
-		const struct regulator_desc *desc;
-		struct regulator_dev *rdev;
-		const struct bd957x_regulator_data *r;
+		struct bd957x_regulator_data *r =3D &ic_data->regulator_data[i];
+		const struct regulator_desc *desc =3D &r->desc;
=20
-		r =3D &reg_data[i];
-		desc =3D &r->desc;
-
-		rdev =3D devm_regulator_register(&pdev->dev, desc, &config);
-		if (IS_ERR(rdev)) {
+		r->rdev =3D devm_regulator_register(&pdev->dev, desc,
+							   &config);
+		if (IS_ERR(r->rdev)) {
 			dev_err(&pdev->dev,
 				"failed to register %s regulator\n",
 				desc->name);
-			return PTR_ERR(rdev);
+			return PTR_ERR(r->rdev);
 		}
 		/*
 		 * Clear the VOUT1 GPIO setting - rest of the regulators do not
 		 * support GPIO control
 		 */
 		config.ena_gpiod =3D NULL;
+
+		if (!may_have_irqs)
+			continue;
+
+		rdevs[i] =3D r->rdev;
+		if (i < BD957X_VOUTS1)
+			ovd_devs[i] =3D r->rdev;
 	}
+	if (may_have_irqs) {
+		void *ret;
+		/*
+		 * We can add both the possible error and warning flags here
+		 * because the core uses these only for status clearing and
+		 * if we use warnings - errors are always clear and the other
+		 * way around. We can also add CURRENT flag for all regulators
+		 * because it is never set if it is not supported. Same applies
+		 * to setting UVD for VoutS1 - it is not accidentally cleared
+		 * as it is never set.
+		 */
+		int uvd_errs =3D REGULATOR_ERROR_UNDER_VOLTAGE |
+			       REGULATOR_ERROR_UNDER_VOLTAGE_WARN |
+			       REGULATOR_ERROR_OVER_CURRENT |
+			       REGULATOR_ERROR_OVER_CURRENT_WARN;
+		int ovd_errs =3D REGULATOR_ERROR_OVER_VOLTAGE_WARN |
+			       REGULATOR_ERROR_REGULATION_OUT;
+		int temp_errs =3D REGULATOR_ERROR_OVER_TEMP |
+				REGULATOR_ERROR_OVER_TEMP_WARN;
+		int irq;
+
+		irq =3D platform_get_irq_byname(pdev, "bd9576-uvd");
+
+		/* Register notifiers - can fail if IRQ is not given */
+		ret =3D devm_regulator_irq_helper(&pdev->dev, &bd9576_notif_uvd,
+						irq, 0, uvd_errs, NULL,
+						&rdevs[0],
+						BD9576_NUM_REGULATORS);
+		if (IS_ERR(ret)) {
+			if (PTR_ERR(ret) =3D=3D -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+
+			dev_warn(&pdev->dev, "UVD disabled %pe\n", ret);
+		}
+
+		irq =3D platform_get_irq_byname(pdev, "bd9576-ovd");
+
+		ret =3D devm_regulator_irq_helper(&pdev->dev, &bd9576_notif_ovd,
+						irq, 0, ovd_errs, NULL,
+						&ovd_devs[0],
+						BD9576_NUM_OVD_REGULATORS);
+		if (IS_ERR(ret)) {
+			if (PTR_ERR(ret) =3D=3D -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+
+			dev_warn(&pdev->dev, "OVD disabled %pe\n", ret);
+		}
+		irq =3D platform_get_irq_byname(pdev, "bd9576-temp");
+
+		ret =3D devm_regulator_irq_helper(&pdev->dev, &bd9576_notif_temp,
+						irq, 0, temp_errs, NULL,
+						&rdevs[0],
+						BD9576_NUM_REGULATORS);
+		if (IS_ERR(ret)) {
+			if (PTR_ERR(ret) =3D=3D -EPROBE_DEFER)
+				return -EPROBE_DEFER;
=20
+			dev_warn(&pdev->dev, "Thermal warning disabled %pe\n",
+				 ret);
+		}
+	}
 	return 0;
 }
=20
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

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmC4a9YACgkQeFA3/03a
ocUcEgf9F/s9x9llpsW0z0L3w/BP7R2iriQ6UigND2Ov0EagUpn8bNN+u/I7e1Bb
1IxllHD88pzr1fui6pFWZyzhQKkOPfDPIxt8x3dNKbYJGcAz1IvNvqsQOKlqTozE
/5QjQ/2XhdUkNuPgC0JM5yEl5QkeWblGrTg5t32gbndmW4S1WF1IFtADG4ysVYEt
zQza47KCIXiKVWYD9Xlg9/6dziAqlg43gapw7k8QFx3GcERIAFh74HVH2X1wg/aY
LcyJxthz8ikkaF0O4YBcxTXyDafbgNbClsDb38J9otd4c/yDhppY2EScVDWkco80
UTvYRUF+SYHO46SHopUU4/+h2+za2A==
=ItSr
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
