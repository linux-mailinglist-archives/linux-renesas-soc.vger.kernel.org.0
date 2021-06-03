Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E2A399A3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 07:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhFCFpK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 01:45:10 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:43573 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbhFCFpJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 01:45:09 -0400
Received: by mail-lf1-f52.google.com with SMTP id x38so6989433lfa.10;
        Wed, 02 Jun 2021 22:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4kPdImkaMdoAiOwNxl8h4f3vHiKZqKYdf8UOeRQWNF4=;
        b=AqcfWQ0oQRK/W+QPSxw008TikhqyvMu29DRq1RifaavS84geobzIGJ3fzsgccO80Cz
         2cKeA+LyxMQ6k2cp5pU/Y5dCGAFlKBQ2ZdCuX0oZK7QyqsdcPlGuXsdfy2F3JmZFxSkY
         USX1xaMI2y9pL0uAOBk0ZjOO+avFxka9+1pdY5t5QymCzJjv4DQeEPIpCLYLBcbPzQD8
         97PQQvYQpKYAiVi0mf8ZFOnC1URot9dut7YqBkbwyg8cooqskQmZyND8yvWA6epb2t4e
         B6NJ6oBAPOerssYYxYdUVzgS0PJduy/bFro6GE6lXIn9vf3f/PjEfImUngCzRJL0RqFv
         2XaQ==
X-Gm-Message-State: AOAM531sDr26RS15wwBnxGIaZtbMmvHBKP3Ft9VJsZAnNqdHGuRuxiZd
        AHNrsdXNKEl8icMJULt+AIKF0bhj/js=
X-Google-Smtp-Source: ABdhPJxyQrEl3qk1VFLM6CKjiRJjxf1hhkCzf9DI1xajbfudtYb6IkvMxH1W22e9qCL5KwTyD2uvSQ==
X-Received: by 2002:a05:6512:3e26:: with SMTP id i38mr25170987lfv.283.1622698992072;
        Wed, 02 Jun 2021 22:43:12 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id k19sm201702lfv.299.2021.06.02.22.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 22:43:11 -0700 (PDT)
Date:   Thu, 3 Jun 2021 08:43:04 +0300
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
Subject: [PATCH RESEND v10 10/11] regulator: bd9576: Fix the driver name in
 id table
Message-ID: <e0483149333626b3bea298f305cf2809429d1822.1622628334.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Driver name was changed in MFD cell:
https://lore.kernel.org/lkml/560b9748094392493ebf7af11b6cc558776c4fd5.16130=
31055.git.matti.vaittinen@fi.rohmeurope.com/
Fix the ID table to match this.

Fixes: b1b3ced38979 ("mfd: Support ROHM BD9576MUF and BD9573MUF")
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Added fixes tag for the v10 resend
No other changes since RFC-v2
---
 drivers/regulator/bd9576-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd9576-regulator.c b/drivers/regulator/bd957=
6-regulator.c
index 6ba12af4c632..d78d6127c573 100644
--- a/drivers/regulator/bd9576-regulator.c
+++ b/drivers/regulator/bd9576-regulator.c
@@ -1114,8 +1114,8 @@ static int bd957x_probe(struct platform_device *pdev)
 }
=20
 static const struct platform_device_id bd957x_pmic_id[] =3D {
-	{ "bd9573-pmic", ROHM_CHIP_TYPE_BD9573 },
-	{ "bd9576-pmic", ROHM_CHIP_TYPE_BD9576 },
+	{ "bd9573-regulator", ROHM_CHIP_TYPE_BD9573 },
+	{ "bd9576-regulator", ROHM_CHIP_TYPE_BD9576 },
 	{ },
 };
 MODULE_DEVICE_TABLE(platform, bd957x_pmic_id);
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

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmC4a+gACgkQeFA3/03a
ocWG2wf9Em2lhvvtDcv1Pb8XGKskzIVxi3sjzz9LSmsyBQgRar4g4W8oyEcf0rR3
Wo4BkazjMnMEL222JFuWGX4eE+lWlP9GbwYG3Dcz0pzfjkMtORt+4e9Ut8mQjA7G
bZn1ij4qq93C6mIEGv1odrcE9xA3kKDlnxgt7w3m6KFLtcAQKDmcS0kygv9QoioK
eRzshqHUFCYrjRMdUNH+y2lOzUMMLNyjdpLjZ1kOAfx9AT5qDxFBB3RjoblGhFn7
a2bA1KufTtYPagCm4OYE6pc3ijcYidkS9jAuWb7o4cvljkTw37xp/2ZOs6dDUe7R
YtjDqIrOFhrCMK89qNEXlsbAjpGpIw==
=EN9b
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
