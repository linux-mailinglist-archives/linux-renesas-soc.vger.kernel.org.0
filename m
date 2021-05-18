Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83D873877A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 13:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240279AbhERLaa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 May 2021 07:30:30 -0400
Received: from mail-lf1-f54.google.com ([209.85.167.54]:33452 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238801AbhERLaa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 May 2021 07:30:30 -0400
Received: by mail-lf1-f54.google.com with SMTP id h4so13661093lfv.0;
        Tue, 18 May 2021 04:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dcJhZHI2dMBnsGGuAZxTwh/jDPWWPYy1O0c7zJIFI2Q=;
        b=DikOqRPFItvq/zDpraDr0Oevx3V9Pn4UsG7FPWl71h70ekQ+lyVUmMHCjt7W6ikHC0
         ffjO/eLWxQeEKgu6TKxW/BlTuT3UOApKn4d1S+AVm5Q+mIXJet8aXCO3JTTmUUypgKes
         VHdJ2cv/O5FH5oKKluD4Xx9eCOYRf4Lh5m8v4gTWaOu/BGXuOmB6X3akfC5ZVsEzVctH
         7e805evd3O3OSSFVUzbCDJP7THhzWSmQpEkI5czE0qB15knRuqFeBQGGB0Bi+XoyhiJj
         lyS8PZoymJXmOAoVSKjjxsZxRFcsnbBRTQamC9NJMysGYxV+nZbt5NkAhCHutrpl7YzV
         l83A==
X-Gm-Message-State: AOAM5324meWRcnBQnmoNTrYA8Gc0ZzmqHCOMC7Ru0d4UySOC5XeA7PIl
        zAOKCIP3l4hdZ+6bTl+ojVk=
X-Google-Smtp-Source: ABdhPJwe5wZdkDxZsmNXpGcgrdpRaYMah8nwFziwesxZzIh4oRkc/xlzCVi0bxg5aMoJRBIZe8fnJA==
X-Received: by 2002:a05:6512:510:: with SMTP id o16mr1673142lfb.488.1621337350977;
        Tue, 18 May 2021 04:29:10 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::1])
        by smtp.gmail.com with ESMTPSA id t22sm2258555lfe.309.2021.05.18.04.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 04:29:10 -0700 (PDT)
Date:   Tue, 18 May 2021 14:29:04 +0300
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
Subject: [PATCH v10 11/11] MAINTAINERS: Add reviewer for regulator irq_helpers
Message-ID: <15105258ec870240c7e05ea01236986b379bf7f8.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--UugvWAfsgieZRqgk
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
index 008fcad7ac00..48fd36e93b66 100644
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

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCjpQAACgkQeFA3/03a
ocV2mwgArv5FNsn4yKrQE5FJBeqzxxCob1kdon3S3j1oL2yP8GfvDcSgOnAX7vFp
xK8XjQy/XF8bOuST+igrlI1oL6oPMLuv2MDotPYFzdybWAvIzGsnLp1jULOL967I
f9+4cvk65RmFeAji4Bukzaotgl6KWpoPW2mNCZ2YIM8QxQWqOA9iZ8RTkUXd76GB
u4l5OReAqrh9ip9hFvboDpro0YRU0IwznJfJ0SyMsYOMsfLhAne4ku7Aopz1ugyj
oF5EpC0rGg/b5czPBtieW9uGhR4WX4bDp18DPQLE0ph1duNw8NGxF4pn1cd5IAwJ
tPS9mf7/0ZJgYWAiSNntSQN2wy4hjw==
=oKGl
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
