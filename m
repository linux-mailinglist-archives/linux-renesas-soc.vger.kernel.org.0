Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1AB378A70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 14:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235254AbhEJLoN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 07:44:13 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:46603 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238980AbhEJLah (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 07:30:37 -0400
Received: by mail-lj1-f176.google.com with SMTP id e11so6806960ljn.13;
        Mon, 10 May 2021 04:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FUdRlSiiUa5Y1q43J/1tupaWVg9evxJCbTVAbgek4vI=;
        b=dgjsUgegtyTHJkdbswxRfr4v+Ta+Vh2k79+vT4njV2BZ/v/0me8KTY0psfJISF956u
         wksRoUMIQaMaqR3YUbMQPhedx4zPJdrjpF9aLFTaGm/DQFKMg44gJ5Kf51K1uGyrZ9UX
         3Zf7YC5uocSfEZclI9Zd8tY2KJtvLM1weEWZisLWq0Z5clmm63Bwud4bTcogGA8eZO4w
         b7/IQE/0gnuosespA8Qx4IsXXeMdDcrBO+BeKtkF2CLUh8vD5xn0I+sJUToXBmuryfy7
         1ytfEGFkj+bjwUGrsFtnDvey5/Eiy1uhNInwfRc/RNkI/csOLfHzEfCBFxmFKM2Eo2GI
         jw+g==
X-Gm-Message-State: AOAM532MGqSYI0pIva8BFwxKXga2K9w/J20F193pAUO7DCcywc0jaBIH
        B2YUiCg4EeQe1WEHOyCsXkw=
X-Google-Smtp-Source: ABdhPJyrDGC6ojef+NIbI6El8Djir55wPG+n4bhm21wFOMz2QKY/CFkPagzpWPUaINEuhwpyvx9RFQ==
X-Received: by 2002:a2e:b0c2:: with SMTP id g2mr19621429ljl.492.1620646171486;
        Mon, 10 May 2021 04:29:31 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id h19sm3222897ljg.119.2021.05.10.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 04:29:30 -0700 (PDT)
Date:   Mon, 10 May 2021 14:29:25 +0300
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
Subject: [PATCH v9 04/10] regulator: add warning flags
Message-ID: <5976be0ed8418f4b5e74a809c8353835279d61cd.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline
In-Reply-To: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add 'warning' level events and error flags to regulator core.
Current regulator core notifications are used to inform consumers
about errors where HW is misbehaving in such way it is assumed to
be broken/unrecoverable.

There are PMICs which are designed for system(s) that may have use
for regulator indications sent before HW is damaged so that some
board/consumer specific recovery-event can be performed while
continuing most of the normal operations.

Add new WARNING level events and notifications to be used for
that purpose.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
No changes since RFC-v2
---
 include/linux/regulator/consumer.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/c=
onsumer.h
index 20e84a84fb77..f72ca73631be 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -119,6 +119,16 @@ struct regulator_dev;
 #define REGULATOR_EVENT_PRE_DISABLE		0x400
 #define REGULATOR_EVENT_ABORT_DISABLE		0x800
 #define REGULATOR_EVENT_ENABLE			0x1000
+/*
+ * Following notifications should be emitted only if detected condition
+ * is such that the HW is likely to still be working but consumers should
+ * take a recovery action to prevent problems esacalating into errors.
+ */
+#define REGULATOR_EVENT_UNDER_VOLTAGE_WARN	0x2000
+#define REGULATOR_EVENT_OVER_CURRENT_WARN	0x4000
+#define REGULATOR_EVENT_OVER_VOLTAGE_WARN	0x8000
+#define REGULATOR_EVENT_OVER_TEMP_WARN		0x10000
+#define REGULATOR_EVENT_WARN_MASK		0x1E000
=20
 /*
  * Regulator errors that can be queried using regulator_get_error_flags
@@ -138,6 +148,10 @@ struct regulator_dev;
 #define REGULATOR_ERROR_FAIL			BIT(4)
 #define REGULATOR_ERROR_OVER_TEMP		BIT(5)
=20
+#define REGULATOR_ERROR_UNDER_VOLTAGE_WARN	BIT(6)
+#define REGULATOR_ERROR_OVER_CURRENT_WARN	BIT(7)
+#define REGULATOR_ERROR_OVER_VOLTAGE_WARN	BIT(8)
+#define REGULATOR_ERROR_OVER_TEMP_WARN		BIT(9)
=20
 /**
  * struct pre_voltage_change_data - Data sent with PRE_VOLTAGE_CHANGE event
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

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCZGRUACgkQeFA3/03a
ocVtWAf9HpTkWb8S/YPZm7Bb3Fd+koeatvSWJZhjpiGOvCWS2rNNbQYj1spxsQoG
VyAN2YQGqvucbQik6kWshsEqMIsnIMwW6SX2azn40bA3C4VV0yKK0s95Z9r3Glvj
oZ40mjupnveuf2Bzsl5d7s6+aW6AGtm5LdHr2i7s7TrP01DsoKln+S7mOWUmsfwM
F01JEAMarVNR8AFcNBmBmn81KomgeGoZxK1LBzciZgrIHkWEdVoI+u04MKToSyXk
rUDFgFP2zcaOjO0CWb69wHANU9XCND8JURSyiWP+mwUvBZwV1dOi/E1QoM84YD2h
ftLHZ8j0eWqzsvzHaS2B+JtoQZFPNg==
=Htol
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
