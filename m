Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A846E399A26
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 07:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhFCFn3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 01:43:29 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:34433 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbhFCFn3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 01:43:29 -0400
Received: by mail-lf1-f47.google.com with SMTP id f30so7037990lfj.1;
        Wed, 02 Jun 2021 22:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ReBuGJ3kMdLQZgbEUNMGa7FWj6h/UbcuCO+5v2l6TcE=;
        b=PkSD7zmDmkkVStojSE0uWr9WuiIQyx2fTfr0LynfTiO9/KYOor/pc8iEa1V1nBuwbm
         HFnVLHQZVb7CWz8338Dt4HVEVe+R4CwfWgnNgXPFY0ntiupMuqV8rYoazMoWj1pDHkOR
         VTq+S3Mqyto94y7s2Cc51umwkUIz1fpQk0C1TYEgHwfLGr8b7fdQ6Xd7Cu0zMYHxprwA
         b9e9C9Ixbz8EIpZv3oubipAN732EdEm1uF/7NfxRhG/kELod+fk7MEydBUF/3/ZAKq96
         qK0C4jzhceyL2rFMKWKqJ6tNzAQo+YFjaz2GPka738TA7cgV5oE6jYpFun2xeeY15Ngd
         D5Iw==
X-Gm-Message-State: AOAM530jLKf8dUcQCHAUWgwJMrm6J92Pevwqqij7f0CthEndg8u6Q2uu
        I70n24yIjvrElHD7/m5PQtE=
X-Google-Smtp-Source: ABdhPJwMexuC5PD/CJhr8/f6mLa2yXg1W5+fg7XDNRzOmKxohEEKE1dWkBQ+RRl65LVt64wfmB+FBw==
X-Received: by 2002:ac2:4294:: with SMTP id m20mr25247694lfh.6.1622698887744;
        Wed, 02 Jun 2021 22:41:27 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id f19sm234439ljc.55.2021.06.02.22.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 22:41:27 -0700 (PDT)
Date:   Thu, 3 Jun 2021 08:41:21 +0300
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
Subject: [PATCH RESEND v10 04/11] regulator: add warning flags
Message-ID: <9b54aa5589ae4b5945d53d114bac3fae55fa4818.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--BXVAT5kNtrzKuDFl
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

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmC4a4EACgkQeFA3/03a
ocWYfQf9Hku6ytfuomxoEv1E19jBT8YO3PIAJK9HFgbfsL+hQwvaqaPyNuvd9pKI
zqbingWGVbIexzsP9kz5JI57SHVEn1nB4qI1mUw1128OaH2OEjLyzu4hUpvxkKVq
94LYdT7nBFV+N9+86PATo1mAmrYA0rDUBJKuzNBdIvZTMsZDBQrd+ueXRNhp/HM9
AroZcTyui3z+B3YDMIz78tVpTgcEEmvy14S2/FeYUOCW8hm1xxU09zjaFs55slLn
jBQXcvFdfRe0ctA2I4S0Tokqf4dKHqOsg1E5J4eduNnoCEgCpRcpQ3EwoMuV/oXe
J0ND7ojtPHRkccQJt3E6iimk35sMZA==
=7dIA
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
