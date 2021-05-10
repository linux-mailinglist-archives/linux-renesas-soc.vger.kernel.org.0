Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E24A378A79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 14:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235928AbhEJLoq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 07:44:46 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:35759 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236411AbhEJLcQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 07:32:16 -0400
Received: by mail-lj1-f178.google.com with SMTP id f12so7783125ljp.2;
        Mon, 10 May 2021 04:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HO0OZAR8RDePAfoi+bjAtVFFyQna6RuzpHMHunE+bLg=;
        b=ZW2D4XibwjVwu9IXYmoQMfnVY3MT+y7ZfePSAB4gvtQVoECGovUeA5Xavw/5GpSALg
         XGYFvVNmaVdF/DUPkMtZ6YA28E9j5uuW4u3h26ojVRBPm5VpbZN/Vhj2juYW0UwX+Xoj
         +Y7sgfcsevLL9hI1jV6InoinhBONGihSn1rHjKr65QUpIFCgodx963SXeA2CEWJfVzPc
         ArOBj2jdpdHU//iI7GVLeyLiuJEX3NtXIvOatawiZDfo3o+y6gr4kL/lMF+8yIhKKHvK
         C9SS4A19QGXjh67VfKzDrGCFY590mwZ3xZQwkrAcM++Uw7IlzGfAj9ZTFVBc7SQvQ7cn
         Dy0w==
X-Gm-Message-State: AOAM532T8nH7h27Fk/yj+X5MQXDJsubQhrlMSmCm+JENQMQTjZIgDRzb
        Y38+jxs7tMMzWmg/owwRiP8=
X-Google-Smtp-Source: ABdhPJzWPDuzHPL2aeqOptQcSZLppX3hckXvnkL4pzQVAfc7K+EPfvPRhwOPfLvzQm8Ja1HxqrxEBg==
X-Received: by 2002:a05:651c:1068:: with SMTP id y8mr19797926ljm.59.1620646270008;
        Mon, 10 May 2021 04:31:10 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id s23sm3214369ljh.16.2021.05.10.04.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 04:31:09 -0700 (PDT)
Date:   Mon, 10 May 2021 14:31:03 +0300
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
Subject: [PATCH v9 09/10] regulator: bd9576: Fix the driver name in id table
Message-ID: <2f287fb014fd67bf1dc59e9d3f66f7f4f0a82daa.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <cover.1620645507.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Driver name was changed in MFD cell:
https://lore.kernel.org/lkml/560b9748094392493ebf7af11b6cc558776c4fd5.16130=
31055.git.matti.vaittinen@fi.rohmeurope.com/
Fix the ID table to match this.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
No changes since RFC-v2
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

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCZGXcACgkQeFA3/03a
ocVKBQf/Xi2lIzJHSz65RusNPNChegG1NM7TQp7j3bzxjd3e46GZQeMDhfTfGRzx
+Ih+xhHtWHq/G99osjjJ4CBsFjrIwtnDuJr5gGDRMF52OdHrL5B0NKO4JqFHpst+
2CuqBCfjX0upXURfzJ3NUWdyvVj4ay4/i8yeK364I0N37nQ/YGcyhcSzroAo8DZ5
qnXvgsZI+GUVAX1yCGJK0UskKj0VGkax7ySea2YtlUqruzCc7CNyozHrA0Dyg2k4
gjkpJrBfz24X7ixdYmhw5/AFt5eDctlmmbK4+q0XNnx8qY75J8t1PGTnCYS0BzgR
x9c6MhIGpm/BR5+pzn2ssxZCY5DzWA==
=NhL8
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
