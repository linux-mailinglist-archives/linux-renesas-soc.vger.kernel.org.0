Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B34387793
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 13:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234501AbhERL3c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 May 2021 07:29:32 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:35820 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234445AbhERL3b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 May 2021 07:29:31 -0400
Received: by mail-lj1-f178.google.com with SMTP id f12so11129031ljp.2;
        Tue, 18 May 2021 04:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DD57W8lOf9lLSMwdxcpJLV8r8bFNOb5J/N5EEn/FNhQ=;
        b=r+dg0jxdJcy28rEW1tmNILB5ipfQlxe8RnhaHjmuICEEDrmXbR+3AGQt8PiCc+L3J2
         lSPn7wOj07Sw337CXey8j2EK9BGNNvGIz8i/md8lUQ4bz1QOte0iYua+uvm3MngGwpkq
         0aeIqRJJvfGWAua5Nx2FXQfbIxlFamsmDmQ3e/3vQQz5SFne+HTAsDagOkkn3Xv2z5tq
         Ab6UljwsNtnJD1Hcty7DcSO+uf+8xqvzIhQAGddh74t8YGrFOsuqEaWeNLrdbZm8I+IV
         Py6F+OVheqnEobfzrspQa0Vz/pPiLwK98tTQbmJZ6N9UZvSCeq9bDWo5l7VdhYeMZDmw
         0GWg==
X-Gm-Message-State: AOAM530gwETJNc8FHUVgX1eUCYkoRlOpAk35Mg/O09IaSCLOba0vhSZ8
        7urZR48qztJaNnQ1BBx4gyA=
X-Google-Smtp-Source: ABdhPJyT0GstYTQBHjmA1S8oWU5Yvd8Lf50VDyELwUS4dMpaDSXx7blTFsUAb9wjeJNFIXAuTMSA0w==
X-Received: by 2002:a2e:b524:: with SMTP id z4mr3710482ljm.62.1621337292354;
        Tue, 18 May 2021 04:28:12 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::1])
        by smtp.gmail.com with ESMTPSA id s9sm577396lfr.231.2021.05.18.04.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 04:28:11 -0700 (PDT)
Date:   Tue, 18 May 2021 14:28:04 +0300
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
Subject: [PATCH v10 08/11] dt-bindings: regulator: bd9576 add FET
 ON-resistance for OCW
Message-ID: <5f12c473d6264ce66b598ac13c7ae2ce516e4483.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--h31gzZEtNLTqOjlF
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

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCjpMQACgkQeFA3/03a
ocWEpQf/SzF8imLbFjFkjcDJxmIPUkkOetFhGI4AU24qcdiLWJvqrV4kvPK8uMcV
7ijjHN27rKu7JJ2tsqDBJEwR/0HsQayiGm9I4Q/ruPVoFpOkqBP6iw9oqISLZKV4
lDVDN9jUHhCDHYla7Bpb6+Vsk16Jqjr2rIREbrdo/e7bec7yJcQ+Aki1FpW7DK4V
0E3U6rgBJypUBzkLj65xpL2sNrCOP9/elq4ROYDPkgDhszSx1P83rbfyVZpyu3un
iEbb2zYKRauPynMOv+19cuQLXoYEH+vcwGOgaU0faIcC32pOd+HBuEKNqDyrQCdU
BOPBMWuJbkNOSGc/ADAsttm9tqvSWQ==
=HGXQ
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
