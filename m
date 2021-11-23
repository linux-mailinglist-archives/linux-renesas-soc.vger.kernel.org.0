Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97AB145A0C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 11:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235586AbhKWLAU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 06:00:20 -0500
Received: from mail-lj1-f172.google.com ([209.85.208.172]:45900 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235398AbhKWLAT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 06:00:19 -0500
Received: by mail-lj1-f172.google.com with SMTP id b16so5037270ljf.12;
        Tue, 23 Nov 2021 02:57:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wDBfIxPCunChiakkAlZ8A5wU6FVeySkRCkCo/ttzO8w=;
        b=xIXSOlUbIUm/pzorcPH46y0WuQzRdNJDpAfvx1ex0EUC/54EW4zSI3/z9NuOhQ4hYn
         nIx94OXPUHKoSTXBso69BiFMUJfKBrRVf8nrWYVE0Ck0zrsrCpFuXsU+BpwzNlP55Gy0
         aPandCmKSbSazh1P7jvheXNMS4XWPtzpgWyTrY+dc85ovc6qHgNbrpwC3hSq5PC+wwKi
         bhb60wpUUG7Yr9DNuUiCg220K6MgDM1aEf5+kh9KqPhHBSUZCnzYJ22YdPchApylJgxh
         IsvS5mCZxa3sJ1Se4XylEAJB0AJMyMqLMSnQaJd561mqN5WCemetmLFsUEnGFo3Q8HBG
         rVpA==
X-Gm-Message-State: AOAM531/UZS9KFQR46M1EjoBelNivkUKjLvykQhtXUW9jlmdg4YPh4ai
        MKQ6ekmrRv6sPUVZ615GeYQ=
X-Google-Smtp-Source: ABdhPJxmojs50ANN3mnFQ+HdGDYf1ne60Toba3fOenQWvDNIrsSVuH9Stw+lYDkqqJAAhgDjbFMIbg==
X-Received: by 2002:a2e:96c2:: with SMTP id d2mr4094593ljj.46.1637665030487;
        Tue, 23 Nov 2021 02:57:10 -0800 (PST)
Received: from fedora (dc73szyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16ee:fa00::4])
        by smtp.gmail.com with ESMTPSA id n7sm492543lfu.116.2021.11.23.02.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 02:57:09 -0800 (PST)
Date:   Tue, 23 Nov 2021 12:57:02 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: bd957x: Fix Kconfig dependency
Message-ID: <YZzI/gNDRdvdK0nv@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="50bHO1pf7QlL+9ro"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--50bHO1pf7QlL+9ro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The bd957x driver uses regmap-IRQ but does not SELECT ot depend on it.
This can cause build failure.

SELECT the regmap-IRQ for BD957X from Kconfig.

Fixes: 0e9692607f94 ("mfd: bd9576: Add IRQ support")
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/mfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3fb480818599..47bacded4a51 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1983,6 +1983,7 @@ config MFD_ROHM_BD957XMUF
 	depends on I2C=3Dy
 	depends on OF
 	select REGMAP_I2C
+	select REGMAP_IRQ
 	select MFD_CORE
 	help
 	  Select this option to get support for the ROHM BD9576MUF and
--=20
2.31.1


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

--50bHO1pf7QlL+9ro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmGcyPEACgkQeFA3/03a
ocX1lAf/TL1fhu37dph2+ahSDBES6DkRbUIVSrIWf8MXZSindAGPeOWijTY/QXVi
eKxbunpKrh3tuTmuBFybnaK9GzNMuNXg0zgB3TxJhNvA4sP3ymkXSi1SK6W27nxD
H4IwYtwmfxGNY7FBEqeUE1oKueGpdLzBL8ZoRk8pZHS4mGdhbtGW/qb3Z2aXDcLB
4OKx9ShaBKP2eCJx3QewlgKqkgH6qg2HvPNSSEtCkx0FDzRLhap8DzCmhtTkMbmm
sdrSQHZW02srCgP6yVnf55cB+t5Fa58dKOz2Uq1lCT2y6J5ceNW4tlxbBIkLLHBV
eqKB8BKfeWpsS3I5X9C+nr0EeygFCQ==
=Qj6a
-----END PGP SIGNATURE-----

--50bHO1pf7QlL+9ro--
