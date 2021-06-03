Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B58F399A36
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 07:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbhFCFoh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 01:44:37 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:44575 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhFCFoh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 01:44:37 -0400
Received: by mail-lj1-f182.google.com with SMTP id d2so1438313ljj.11;
        Wed, 02 Jun 2021 22:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GmQChLFQPkkLEuM3wwQNXLDAlDpU960H+8gaxRMHHiA=;
        b=FE6hN27CHqEbepn1N4uI0SB6xcL1wtCxKq4WC0QSN23eQATfYQuuM3ztmPLoIZwMNm
         2/XXCB9od4lB8zzyyNS0rwcTwkwBWWfOCJDS/fWjzRLJHOPMpu+RjzePsXcxZi3PY3RH
         6mfmdz1Aac2qT3q+IcOCcgNfNavieuBqdZ07tWBoogXhgs4t7+JAigDURnkBjUBOtFeh
         psl8DVgYSQNgpxyG/VKJarR9oVjIWwln7aGTjcRuuf6UfmoYgT586BsmdCXMZmYDKU/X
         LyFXw0ZZcdsXpVIIa204PBWfMmswcRAp0Zp7gD2vCdlrLt281vL88eKxc0KgfSBMbVib
         KnZw==
X-Gm-Message-State: AOAM533hgle2GsXKu4Nvg6YnxBQrdb4cuRQqxTer+gW6PVrwliXFMudb
        HygzVEtQ2mkwLVKqrPwowuYdwzcwOpM=
X-Google-Smtp-Source: ABdhPJye5e4taiwb7yC1UDWzASCM389rnsa+2zifOInTT9R47QJE8wLkuY4cvCqQFCu2ZTTpN1STKw==
X-Received: by 2002:a2e:9098:: with SMTP id l24mr9531841ljg.383.1622698956480;
        Wed, 02 Jun 2021 22:42:36 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id j4sm204417lfg.124.2021.06.02.22.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 22:42:35 -0700 (PDT)
Date:   Thu, 3 Jun 2021 08:42:30 +0300
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
Subject: [PATCH RESEND v10 08/11] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Message-ID: <e5feb160d7e09f33fff5b88f1928c66a15c6680f.1622628334.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Content-Disposition: inline
In-Reply-To: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

BD9576MUF provides over-current protection and detection. Current is
measured as voltage loss over external FET. Allow specifying FET's on
resistance so current monitoring limits can be converted to voltages.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>

---
v5 onwards:
  - No changes
v4:
  - Fixed the description indentiation
---
 .../bindings/regulator/rohm,bd9576-regulator.yaml           | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regula=
tor.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulato=
r.yaml
index b6515a0cee62..7cb74cc8c5d9 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
@@ -27,6 +27,12 @@ patternProperties:
       Properties for single regulator.
     $ref: "regulator.yaml#"
=20
+    properties:
+      rohm,ocw-fet-ron-micro-ohms:
+        description: |
+          External FET's ON-resistance. Required if VoutS1 OCP/OCW is
+          to be set.
+
     required:
       - regulator-name
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

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmC4a8UACgkQeFA3/03a
ocXMUAf7BxtsqI+CKL4wnQqBE+hAz56T4lPZgbqT/en6XPysiPzIky3ddOXopfxq
UvWEXxfMQ5ku0za2qZnVJiJzrsmYhTaZ2X466wdSUKF2IWj8mjIhSEF38KVFx0iq
dUyFHd3NAR/rjpuhkBwJXbmektSzwWM3mY2x9PX7p9Oo2GqdgE1I6e/FwQnmbryl
DXfmHxjinGuaAwILjqIJ2q9P6als2JiNx0xAg7fWI/uQV42xL6OSPaTYvOMfZgGg
nYWR4SEuS8g5tQ10pPhOEbZf9jJPHShzL85yS2z4wMwV0RecAfKsUXNmobwgsOHD
gbO5T+NnHihI9br16GlyYZG8M7hH+w==
=Sg+5
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
