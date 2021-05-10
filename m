Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA30E378A7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 14:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236086AbhEJLox (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 07:44:53 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:33521 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236514AbhEJLcm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 07:32:42 -0400
Received: by mail-lj1-f177.google.com with SMTP id s25so20389901lji.0;
        Mon, 10 May 2021 04:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u5il3nxbTwmrW8YyZH+z/dhfcZ2mEO3uDs9ZKJdHlzE=;
        b=nensv2KmrnwCT6EiKrzlF3m8iWhl1PvpoHtvZf3aJjHqi+u1neKFDSbiIsbk+5NmXr
         /slN458dFZ+sQa5fcu4hjIoYY3/bgiTDAPzkRBKTrsu0080kjS19D4JvFGE+RFCLzJa0
         vaCqwIBBMSqEfj3G8SXgf5FqeFfSJuPujbmuRePu5afWcUNFpdUZjjMo6bkCQ/VSKTHG
         faSugIniY/OaUbobUOcu3JYX7rb5ELccpaLHy7nQTIIrxJZ7w5wS4pINO3xk/K9DrOx8
         4E/mZHCNPKo2J9gd9FGmz1weJVhKpu7XRkogTNABebyXqUHYLZZnqHS+L+1Xw2mpum5L
         qCoQ==
X-Gm-Message-State: AOAM531QfRdvIAPsxdFlSD6LTwp6ZlJigQe8uRScHNs3JD6+74qC3IPb
        NKpzAmYZSKYSpRdv6cyRjA0=
X-Google-Smtp-Source: ABdhPJwG3eHoR+NZjQ7XRyZv9rC0BGkMtp7VJUK5CkwhWuhV88pi48Utb6pvx6hT0bQqR0k3hm8syg==
X-Received: by 2002:a2e:7807:: with SMTP id t7mr19066732ljc.393.1620646293133;
        Mon, 10 May 2021 04:31:33 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id 20sm813954ljj.101.2021.05.10.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 04:31:32 -0700 (PDT)
Date:   Mon, 10 May 2021 14:31:27 +0300
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
Subject: [PATCH v9 10/10] MAINTAINERS: Add reviewer for regulator irq_helpers
Message-ID: <22dfc2a668a4a494013d0d0fd7b71cd9e2c59195.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add a reviewer entry for the regulator irq_helpers.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changelog:
 v7 - onwards
  - no changes
 v6:
  - New patch
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..93f51caf9fb5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19551,6 +19551,10 @@ F:	include/dt-bindings/regulator/
 F:	include/linux/regulator/
 K:	regulator_get_optional
=20
+VOLTAGE AND CURRENT REGULATOR IRQ HELPERS
+R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+F:	drivers/regulator/irq_helpers.c
+
 VRF
 M:	David Ahern <dsahern@kernel.org>
 L:	netdev@vger.kernel.org
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

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCZGY4ACgkQeFA3/03a
ocUM6Qf/bXktkY8GMEGpI3l0x4bPqVUmLqv2/Bnar7VEA+5eZEEKu6MKsdoWdfbS
jM4rqW4kRj54RFp64D+iYCxBJc40BRYp9sjLHVWoNe+wCuP7/qWzLqps5CU0xEmS
ekTcyz44vEU9MsHrPG17ex4OyzBWatdKTVd5b9Xr7ukMjwy7n+Jl40LPRdZhCrFh
5Ourmf9ZKAkykIA0egIpTpWLU+hb9WPs5SKSCofathpDBib4FheIHUWh8a6IDdvu
v9vs/xUH9TN9dencQOoUAO4lHCetBIwHBpt5V5P/iCkoHSBGYWWtfBZOern1eZhb
RtTk7xd/YRTQCOotFgKAhvfkww011A==
=Vn7b
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
