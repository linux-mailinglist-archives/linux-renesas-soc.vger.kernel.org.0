Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCA6399A2A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 07:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229913AbhFCFnp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 01:43:45 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:34409 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFCFno (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 01:43:44 -0400
Received: by mail-lj1-f180.google.com with SMTP id bn21so5621409ljb.1;
        Wed, 02 Jun 2021 22:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5+RrvvygOmnNqvd3bvt2KZV36nkm3zkGqgE4tlD+qIU=;
        b=dbMIIaD60Q1BcWKSjkKV56L2jYjJwUj/teHizhoBDxe9QIy0CqKj72zrna6YhIHwD2
         dP31fcypWMjPspwotw+jYm9zj+aPDieWWU/Lx80UqNHnwVCS2OoNluPHGtcAFKqgSIdX
         sE9utcLle9ZCyClF3I4ghKCalfm6EeEoSZgqo7vYG/HEQsRQUnRbktz5y3xDCbGwUyuS
         p/Vf7OzfEkkNnAeMkUa+bDedi5gTTpGOI85cDNrAk5W0SBaqce/GUNpBf1GUijB42CUw
         Mv+YBw6yk5BA8CTGf47VSynsGwCX8+WGiS/r/5J/nTQCswQc59v/Va7UT7KqM9nx8wcz
         zD8w==
X-Gm-Message-State: AOAM531gNi7jpVgGmlhdNz5Pd9WsfvpM1S0fuJNSn1vk2udL0ZPoi48f
        ge0tYzjYERotQ50dQ5fdStw=
X-Google-Smtp-Source: ABdhPJwo1QwTtrEsRakPtd3uBGGpVB6f5oGBatiBAYGZUy0dhnvUP5uCZj80OBNXZ1dLJCF0i/zSLQ==
X-Received: by 2002:a2e:8086:: with SMTP id i6mr27416026ljg.135.1622698904076;
        Wed, 02 Jun 2021 22:41:44 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id j1sm203383lfg.166.2021.06.02.22.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 22:41:43 -0700 (PDT)
Date:   Thu, 3 Jun 2021 08:41:37 +0300
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
Subject: [PATCH RESEND v10 05/11] regulator: move rdev_print helpers to
 internal.h
Message-ID: <dc7fd70dc31de4d0e820b7646bb78eeb04f80735.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The rdev print helpers are a nice way to print messages related to a
specific regulator device. Move them from core.c to internal.h

As the rdev print helpers use rdev_get_name() export it from core.c. Also
move the declaration from coupler.h to driver.h because the rdev name is
not just a coupled regulator property. I guess the main audience for
rdev_get_name() will be the regulator core and drivers.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

---
Changelog:
 - v10 New Patch.
---
 drivers/regulator/core.c          | 12 +-----------
 drivers/regulator/internal.h      | 11 +++++++++++
 include/linux/regulator/coupler.h |  5 -----
 include/linux/regulator/driver.h  | 10 ++++++++++
 4 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index f192bf19492e..a8188f7e5072 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -33,17 +33,6 @@
 #include "dummy.h"
 #include "internal.h"
=20
-#define rdev_crit(rdev, fmt, ...)					\
-	pr_crit("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
-#define rdev_err(rdev, fmt, ...)					\
-	pr_err("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
-#define rdev_warn(rdev, fmt, ...)					\
-	pr_warn("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
-#define rdev_info(rdev, fmt, ...)					\
-	pr_info("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
-#define rdev_dbg(rdev, fmt, ...)					\
-	pr_debug("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
-
 static DEFINE_WW_CLASS(regulator_ww_class);
 static DEFINE_MUTEX(regulator_nesting_mutex);
 static DEFINE_MUTEX(regulator_list_mutex);
@@ -117,6 +106,7 @@ const char *rdev_get_name(struct regulator_dev *rdev)
 	else
 		return "";
 }
+EXPORT_SYMBOL_GPL(rdev_get_name);
=20
 static bool have_full_constraints(void)
 {
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 2391b565ef11..1e9c71642143 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -15,6 +15,17 @@
=20
 #define REGULATOR_STATES_NUM	(PM_SUSPEND_MAX + 1)
=20
+#define rdev_crit(rdev, fmt, ...)					\
+	pr_crit("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
+#define rdev_err(rdev, fmt, ...)					\
+	pr_err("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
+#define rdev_warn(rdev, fmt, ...)					\
+	pr_warn("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
+#define rdev_info(rdev, fmt, ...)					\
+	pr_info("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
+#define rdev_dbg(rdev, fmt, ...)					\
+	pr_debug("%s: " fmt, rdev_get_name(rdev), ##__VA_ARGS__)
+
 struct regulator_voltage {
 	int min_uV;
 	int max_uV;
diff --git a/include/linux/regulator/coupler.h b/include/linux/regulator/co=
upler.h
index 5f86824bd117..73291f280a23 100644
--- a/include/linux/regulator/coupler.h
+++ b/include/linux/regulator/coupler.h
@@ -52,7 +52,6 @@ struct regulator_coupler {
=20
 #ifdef CONFIG_REGULATOR
 int regulator_coupler_register(struct regulator_coupler *coupler);
-const char *rdev_get_name(struct regulator_dev *rdev);
 int regulator_check_consumers(struct regulator_dev *rdev,
 			      int *min_uV, int *max_uV,
 			      suspend_state_t state);
@@ -69,10 +68,6 @@ static inline int regulator_coupler_register(struct regu=
lator_coupler *coupler)
 {
 	return 0;
 }
-static inline const char *rdev_get_name(struct regulator_dev *rdev)
-{
-	return NULL;
-}
 static inline int regulator_check_consumers(struct regulator_dev *rdev,
 					    int *min_uV, int *max_uV,
 					    suspend_state_t state)
diff --git a/include/linux/regulator/driver.h b/include/linux/regulator/dri=
ver.h
index 4ea520c248e9..7ec0fa79d1a8 100644
--- a/include/linux/regulator/driver.h
+++ b/include/linux/regulator/driver.h
@@ -550,4 +550,14 @@ int regulator_desc_list_voltage_linear_range(const str=
uct regulator_desc *desc,
=20
 int regulator_desc_list_voltage_linear(const struct regulator_desc *desc,
 				       unsigned int selector);
+
+#ifdef CONFIG_REGULATOR
+const char *rdev_get_name(struct regulator_dev *rdev);
+#else
+static inline const char *rdev_get_name(struct regulator_dev *rdev)
+{
+	return NULL;
+}
+#endif
+
 #endif
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

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmC4a5EACgkQeFA3/03a
ocWafQgAvlmJRWhwDkQS5+JtXuvupAOpIC/0VSGZiAAcKaXBIOiRBw2PvMjjq61U
N8RFxewyUN/C7KvpxWDnJqjeXYxUJKEC95nIpNauj/pWTYlU04cUhbyzyeb+9Bjw
7hNGKHFgsT4hvwrPIC2FmwgjU9x3uw/VVx7Ok8LO3uDuTmIvD9c4LUdFy+6O10c6
n62a/21ZeR8zJU/c7iBmcFrAaboZ/xnWK44vQ9zAmyzrT2wUXkmnGpPOhIvT1NF8
oNMbngqzF9tOx2Zn5iHrHVfQbVgqdM2oZf6JAm2xvEiQaE3aVOSP2iZeV420GtfI
LXdTeJAYV8BxBf87ZLu8+xwiakIHXA==
=Er7y
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
