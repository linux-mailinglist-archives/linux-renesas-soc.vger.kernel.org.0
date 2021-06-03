Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40DC8399A17
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 07:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhFCFmh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 01:42:37 -0400
Received: from mail-lj1-f170.google.com ([209.85.208.170]:41621 "EHLO
        mail-lj1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhFCFmh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 01:42:37 -0400
Received: by mail-lj1-f170.google.com with SMTP id p20so5570501ljj.8;
        Wed, 02 Jun 2021 22:40:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xN6aRvmLaxYX9MgFx3rl1k896x6TvWvZBw9T/Adkpys=;
        b=dZJp8Lph4MkUtwVsM2IFPUvKnF9H4RICkvkQ0cEcSyZZkqhghdxhhm6v4j5lB5GZIS
         XpvfaOFpXyUJSUISjYIKcmCJb5cYWN/z8bg095d4lxCzvokYKd0iJf1rCkeQJa2oYUnn
         ifnAvtbYVvXnkJCgd3y3C+CUYm7nhFKh+O917Te0ra44BGl2xi6+rOrceA3m3Af8EXnm
         WJx61g9A++Y2JaHcLtRg/YWzKJq0Fq3kDqu+u54HOMlqg7KsqWx1Yum/4GrsVLbR6Qoh
         9TFscC/Mz2T4x6Bjgu+G4zf4KD0w3tHG8ZdvZubDA62UUJ6pzHJs+DlU1YJLd2yZTY8+
         /jjQ==
X-Gm-Message-State: AOAM533r/AJYPkIucRsnUTze63ZXDrYFNw9E8iOlnexL+njY2VQVFkNH
        kD9mEc1QUQDwe3Sznfwb2dU=
X-Google-Smtp-Source: ABdhPJztgpHdkeWIAkRr8Arcj0pDsNjuimLDkg7ufI+zadKkf0DVK4fcxreOBgk+2YNOdhphj62HBg==
X-Received: by 2002:a2e:a443:: with SMTP id v3mr27425834ljn.251.1622698835107;
        Wed, 02 Jun 2021 22:40:35 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id w16sm203550lfn.183.2021.06.02.22.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 22:40:34 -0700 (PDT)
Date:   Thu, 3 Jun 2021 08:40:28 +0300
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
Subject: [PATCH RESEND v10 01/11] dt_bindings: Add protection limit properties
Message-ID: <ae2c6056d5ed1334912d27e736d23c9151065433.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Support specifying protection/error/warning limits for regulator
over current, over temperature and over/under voltage.

Most of the PMICs support only "protection" feature but few
setups do also support error/warning level indications.

On many ICs most of the protection limits can't actually be set.
But for example the ampere limit for over-current protection on ROHM
BD9576 can be configured - or feature can be completely disabled.

Provide limit setting for all protections/errors for the sake of
the completeness and do that using own properties for all so that
not all users would need to set all levels when only one or few are
supported.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
No changes since RFC-v2
---
 .../bindings/regulator/regulator.yaml         | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/D=
ocumentation/devicetree/bindings/regulator/regulator.yaml
index 6d0bc9cd4040..a6ae9ecae5cc 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -117,6 +117,88 @@ properties:
     description: Enable over current protection.
     type: boolean
=20
+  regulator-oc-protection-microamp:
+    description: Set over current protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled=
 but
+      limit setting can be omitted.
+
+  regulator-oc-error-microamp:
+    description: Set over current error limit. This is a limit where part =
of
+      the hardware propably is malfunctional and damage prevention is requ=
ested.
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted.
+
+  regulator-oc-warn-microamp:
+    description: Set over current warning limit. This is a limit where har=
dware
+      is assumed still to be functional but approaching limit where it gets
+      damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted.
+
+  regulator-ov-protection-microvolt:
+    description: Set over voltage protection limit. This is a limit where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled=
 but
+      limit setting can be omitted. Limit is given as microvolt offset from
+      voltage set to regulator.
+
+  regulator-ov-error-microvolt:
+    description: Set over voltage error limit. This is a limit where part =
of
+      the hardware propably is malfunctional and damage prevention is requ=
ested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted. L=
imit
+      is given as microvolt offset from voltage set to regulator.
+
+  regulator-ov-warn-microvolt:
+    description: Set over voltage warning limit. This is a limit where har=
dware
+      is assumed still to be functional but approaching limit where it gets
+      damaged. Recovery actions should be initiated. Zero can be passed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted. Limit is given as micro=
volt
+      offset from voltage set to regulator.
+
+  regulator-uv-protection-microvolt:
+    description: Set over under voltage protection limit. This is a limit =
where
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled=
 but
+      limit setting can be omitted. Limit is given as microvolt offset from
+      voltage set to regulator.
+
+  regulator-uv-error-microvolt:
+    description: Set under voltage error limit. This is a limit where part=
 of
+      the hardware propably is malfunctional and damage prevention is requ=
ested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted. L=
imit
+      is given as microvolt offset from voltage set to regulator.
+
+  regulator-uv-warn-microvolt:
+    description: Set over under voltage warning limit. This is a limit whe=
re
+      hardware is assumed still to be functional but approaching limit whe=
re
+      it gets damaged. Recovery actions should be initiated. Zero can be p=
assed
+      to disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted. Limit is given as micro=
volt
+      offset from voltage set to regulator.
+
+  regulator-temp-protection-kelvin:
+    description: Set over temperature protection limit. This is a limit wh=
ere
+      hardware performs emergency shutdown. Zero can be passed to disable
+      protection and value '1' indicates that protection should be enabled=
 but
+      limit setting can be omitted.
+
+  regulator-temp-error-kelvin:
+    description: Set over temperature error limit. This is a limit where p=
art of
+      the hardware propably is malfunctional and damage prevention is requ=
ested
+      Zero can be passed to disable error detection and value '1' indicates
+      that detection should be enabled but limit setting can be omitted.
+
+  regulator-temp-warn-kelvin:
+    description: Set over temperature warning limit. This is a limit where
+      hardware is assumed still to be functional but approaching limit whe=
re it
+      gets damaged. Recovery actions should be initiated. Zero can be pass=
ed to
+      disable detection and value '1' indicates that detection should
+      be enabled but limit setting can be omitted.
+
   regulator-active-discharge:
     description: |
       tristate, enable/disable active discharge of regulators. The values =
are:
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

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmC4a0wACgkQeFA3/03a
ocWVAggAlyRu8D4cdebvOBCcDmG8VGrvD8kp29EseKgiErN1qJxgQhAgv6CdHAAL
LDXAwJNirK1cn0s+z/HDRHakEf/4s6vEcXjOWWHpgb9cSPGhwXt+0N8amzu6i34J
OAonS3aessE+MNmKvb3fW36w885AqeJyBMnhe9eGshqUQ5jug+DfQBSNIF9XQf7G
znrNSqPWTX3Hz96/AXEE7cSK0RKUg0QvSiPuz1j157cRKejs52FqLhWtfcaAZUHc
z/Xa5T675kytvUxcP33LvwywhLv87oEg7sxghI9DgEFFwgg0XW69ctQkSk/CopHw
A9FS72Ms4Ut7XZ+glxuZQkfnP91oKQ==
=1oUw
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
