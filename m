Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AD93877A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 13:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243060AbhERLaM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 May 2021 07:30:12 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:37454 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241164AbhERLaL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 May 2021 07:30:11 -0400
Received: by mail-lf1-f41.google.com with SMTP id v9so12245412lfa.4;
        Tue, 18 May 2021 04:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p8oGWI2VUTJgGXTQB+7ihhjBGrLVzwUpEAq7z7P8Edo=;
        b=n5RcaJNvpNGTsRRBfhvJvkH8y3ZrtaMaGnmV31BCtFiNOie87awxnf5DeYQO7KaYMp
         uDEe93mX665kteT3mXBx+dlLQAetoFcUy1vBjc6x1rFRbO7Maedlmv8kv+O2+dKETsln
         RLVRC1eSJxqkmOX6dvKxRGur7OKzrkNfYXy/cWeDu6cfaNW9TtbL/xRr9fRVhw4vJhLh
         RbVgYPSfmpdIBsVAX58Te912+5x5/PJGIughSSE93K+mPF8LSTP1Muycg50UutemINiJ
         O2glgzWILNx3T14UHzn0JrztzcnODHuH1PwTynVw6QkFf2ZbS+FY452uVwXh2j14wL5J
         RbHw==
X-Gm-Message-State: AOAM532TXMOm6QVdL+UcS7Q1qmcV4+KoPPL0ux8MY6bce+AcYxCjp0jk
        na3W9tPpejaVVbp6N5RS0Oot9jeSzq6ZDQ==
X-Google-Smtp-Source: ABdhPJy9J++R2t9q5F5o7MNLjaH+0AQwV64QiC9hjm6tvi66rf8cEXmsYLNvEVW133Ok0e9vuFH50A==
X-Received: by 2002:ac2:4a7c:: with SMTP id q28mr3881544lfp.94.1621337331670;
        Tue, 18 May 2021 04:28:51 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::1])
        by smtp.gmail.com with ESMTPSA id b11sm2252729lfi.292.2021.05.18.04.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 04:28:50 -0700 (PDT)
Date:   Tue, 18 May 2021 14:28:45 +0300
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
Subject: [PATCH v10 10/11] regulator: bd9576: Fix the driver name in id table
Message-ID: <fedc49458c819da23fa60f19db7bd8ac39257d73.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline
In-Reply-To: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--IJpNTDwzlM2Ie8A6
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

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCjpOwACgkQeFA3/03a
ocVHvAgAk5TYVroNGjB3VeUtXkxOXaJtptkxVhol7fhNBjIdky+a8aTKSN+K/jGK
hXfAbF9OwsKluT+uC/RcYGgK91UQnbcMjulpPneUdAyJbc2W65FdB2UyZMunUn6Q
r+4pSHwEauU7rBghQkYPj0PQbpSMlUYB13LiaAxmNzxdyQsDeXMWB2Lc9BtZ1KqL
LaKdocnmNtW0V2j+PV7Ij2NBvwaUMk4yls3zCf8VWWYvQrksR5CpiwemUnFWUo5k
ODsINwQ15zThOag7laZPi2viRt9+QbpuDP/EvjdpEgiX1jclLEFAeB8mtBq2J2Dx
Y1rdSGrcchEdpTAoSFptGAjnrAX5pA==
=VR7K
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
