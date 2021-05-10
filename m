Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152DE378A78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 14:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235818AbhEJLoa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 07:44:30 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:34538 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236251AbhEJLbf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 07:31:35 -0400
Received: by mail-lf1-f51.google.com with SMTP id z13so22854087lft.1;
        Mon, 10 May 2021 04:30:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rPqAfqjhbovDywyUEoxgVrHpNkqVf0/mG9wUC0T9QPI=;
        b=gd0bFIDGaJe7Dwtou/Hk8Q94469+n3WGZsmyNIWjkEDVoror0PTxpB9ekwZE426NRr
         fIjZxMfjTo3UkNoKqgrgljoSym32mC0+0lU16p/KqjMTwNdo6ShNJiEfGR6DkMq/89IN
         ozOH6mjvHmOJD0e5Pel+DpEPOyfYKo8E5V3qi1EMivzIErDfDsCLvLP6J+LGZ8dVt4fV
         S77UMEJr+9SbinDbre0CsxA+eJ/jWn38SZNNLaqctLg/d79nYbKXcyN+E1ickNMXisIZ
         oF0cPjUeVNKZIam4Pr+tVaEKApQGrzQEFA3TxkJZW4FIzYtqCuxivfMiLj0VNiSNuOfp
         9Cfw==
X-Gm-Message-State: AOAM533/WCTlilN59q9fAiItUhZ4hw4s/jNRO/D0X0iuHlk1xFonVWmM
        Esh2NyjzCafh4nzcfktAUT7WYKGCnd9wNA==
X-Google-Smtp-Source: ABdhPJxUMvqcJGutORFQCWC7QignwID20u6MYAfU9ak77iX67hNQsAfEcSEygY1wcXPYoykVCIRyDg==
X-Received: by 2002:a19:ac0d:: with SMTP id g13mr16813491lfc.1.1620646228709;
        Mon, 10 May 2021 04:30:28 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id t10sm946619ljj.44.2021.05.10.04.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 04:30:28 -0700 (PDT)
Date:   Mon, 10 May 2021 14:30:22 +0300
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
Subject: [PATCH v9 07/10] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Message-ID: <f6c8faae0ca4d5eb1cd8959ecd93d7ffa21f06a6.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--45Z9DzgjV8m4Oswq
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

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCZGU4ACgkQeFA3/03a
ocWciwf9Fugf3uYIzVB35sWtnNyFLRneRZi5xqmUxaWmhHPkcx6DPkKzPKpigFwO
9pG5GL6w5uc2oaI0l5RvMckAVWBpLHlAGS4c+RPrI1isqereQXDJFRuAxxW2D0BP
1IUiNsouE9IvpkER2A4V1IdEDE4MhQMi8ar6MNc4BCqtcmVC92PClMFfXKKyB+Go
BnB80pzUgSzWyirgAtsMT7CoSEVyIhOvblbka+ks14YvpRc4uWDAzohozVpC0vbt
U4kjQMKzkCC7wLlEL2UlaukZUaKc7xQbXSEm9v9XIZTeQ7agBhqHRjJFBz4CWj6r
jiuu559ub4lWu2z12GN30KWbvHFmyQ==
=5qf9
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
