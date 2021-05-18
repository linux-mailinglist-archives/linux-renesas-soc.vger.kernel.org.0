Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62865387784
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 13:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbhERL2X (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 May 2021 07:28:23 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:46961 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233672AbhERL2X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 May 2021 07:28:23 -0400
Received: by mail-lj1-f178.google.com with SMTP id e11so11083050ljn.13;
        Tue, 18 May 2021 04:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5VM+aNdXZX/Tyi4SEhOD42oxW5wy9GjU50/LRNKpMwY=;
        b=Jr1awd99ZIpPXlqeFBbHiuDptehvc+kcj+iYOxY6Uz0Vr0PcIgRGMgrtEwDUkRmWHD
         UGR52shnGGXXF6qEj4ZTXcV0RmsecBY+8VSXbwRfllVYBZxrwkyUk0oZZr2fwz4+54ZB
         rZmmS46qz+/HesbpWyFPbJwveJY6X+ysZu6+m4nuvVjwAP/JLgzM5XCpioc6xy1ty/p6
         0GqVGB0AsE+UgP8STPBC1AK6hdjlQdyVdL9IsHF6t08CAHjB8KaJ7Ht0vU5H934PDeQB
         cUCPz4idAuNnkFLPQtTpfnDVE8uNDPxjsSN5lCP+S1YD6nHT9anruzYlZdF78pr1tJMi
         xNgg==
X-Gm-Message-State: AOAM530Au2ZYZAr9DATcuslbbpVbt0FMVyeQFzxYFImlcw7+ivUIxr8P
        BgysD11UZ1HG43D6qtaMxCY=
X-Google-Smtp-Source: ABdhPJyMQv5cur2ACgBRZur0OwO8R3K9eeD/9WrAkQC/iapgD4D/x/enA5tn0bAi7CJ4PjaemxvTGw==
X-Received: by 2002:a2e:8e99:: with SMTP id z25mr3822412ljk.146.1621337222883;
        Tue, 18 May 2021 04:27:02 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::1])
        by smtp.gmail.com with ESMTPSA id b24sm2254340lff.93.2021.05.18.04.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 04:27:02 -0700 (PDT)
Date:   Tue, 18 May 2021 14:26:55 +0300
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
Subject: [PATCH v10 05/11] regulator: move rdev_print helpers to internal.h
Message-ID: <fab42499f07b376021f801a5b07bba685e7a5253.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--DocE+STaALJfprDB
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

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCjpH8ACgkQeFA3/03a
ocWinwf/SSRizsz+8h8iXz6QlevjH/hUsCHgQBCQ3Z59jVO/VYzJKGUamKwU5TIM
TRLeVq7tvemZVFZfE/H9tkgWtx5/s0TaPjA7TbrVb6/kyslyCpgfhMq4bbNkCHjo
1lirILdxvTRfG1M6xDYFW5+wUoJg926KqQRq5P8fVjqKOzlDO9FazeJ6Gfks6lzI
6gRpkODIAMAjvYprFFkv2GVscTIELeUaZGhuE/TT0cAe9ZZ2RJhP0pRnXCFzmz6G
LLtd7YjGbIc1Sxxghq97q76a8/wl5UCRoQLjlidL5TQhlWSQ9IeTEvGqNk8b3MYB
4WJ46ksDajkxOluPuVPH+2fizhpnzw==
=SCTq
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
