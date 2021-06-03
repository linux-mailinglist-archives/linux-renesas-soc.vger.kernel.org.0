Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCD02399A42
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jun 2021 07:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhFCFpf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 01:45:35 -0400
Received: from mail-lj1-f171.google.com ([209.85.208.171]:36403 "EHLO
        mail-lj1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbhFCFpf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 01:45:35 -0400
Received: by mail-lj1-f171.google.com with SMTP id 131so5613637ljj.3;
        Wed, 02 Jun 2021 22:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HAlpbiQGajQ1pBzErKi0+GTfm08zr0T0VwPotEf0SXQ=;
        b=RqCrXAsbCinO92lBAMhJAsqI4Yk6JDvATKR/CBNCsDVvM/QcONhPRpIFDsPA2PfjiZ
         04s46WB/AhRhL4iMJ8OhfniTed+NnQdoqkBjVpxvW+9tmkJa35Xzf6yLyn9MbF2n+sr2
         L999QzCjLZzptSG8YeE55MI48fTDXBmGia6jDnKJ0eDOwtPJONfYgxMMxHwW7Kouai5m
         EQX1+pLoJ7ykw6Jb/Hmo0TsqslU+Z5KDEA3Ec3BgDUWtHoTU8uZT1LaDpqGGvcN0jfXo
         4goravydptMaqdxAdoxuMtDuJ+K0F9Vyz9UPJX61Q/PbNpqCmHlmioAF4YjepCqhA7Yx
         w7VA==
X-Gm-Message-State: AOAM530F1HIIL8sexLnF4SEFGEfLqu+7hyAtHiuRijPkKz+zZUl060ZL
        EaZiFmJTtOO/PI1NYIqV404=
X-Google-Smtp-Source: ABdhPJyCqLPjLK2RJfyEsmwL7ERAbdlogupv1JcG9WEyvzkVCjehZSkkHNogoDNhmFKhACLVc47c3g==
X-Received: by 2002:a2e:bf14:: with SMTP id c20mr27582982ljr.57.1622699013884;
        Wed, 02 Jun 2021 22:43:33 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id s1sm227973ljj.69.2021.06.02.22.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 22:43:33 -0700 (PDT)
Date:   Thu, 3 Jun 2021 08:43:26 +0300
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
Subject: [PATCH RESEND v10 11/11] MAINTAINERS: Add reviewer for regulator
 irq_helpers
Message-ID: <2a4286ed98fd69b2539919e6a3e84d2e9804b4da.1622628334.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <cover.1622628333.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--DocE+STaALJfprDB
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
index 503fd21901f1..68fa235a2d65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19566,6 +19566,10 @@ F:	include/dt-bindings/regulator/
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

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmC4a/4ACgkQeFA3/03a
ocU/bwgAgSey0rCRsNQbfGQkv6clRcpAKEZL3m9ssZZOO94FFcP4vGg3ag4sBc9l
9VW7+fOyxeYcVRHo0+DVWRfDLDb0uhVJN4uOy1f9xRvGUAilAsXycG3cmgUj80FU
efKXPbmhPze77NmYZtINZ7FiGjm0kS6dWdJMQRw39FRWz7xVe8bA7WwhVX0vEJfX
6ka+uS8n35RD+74lXQsdXsCCaVCNT7+xRBoSiPxVGp/u1KD2q3OsMJQ9cPxHuEQ9
XaMRNA/Mwm/aGljA51xe0SmcfVx889qJrJJwCisptUmIPO0MxdQhrCtpIJ6Dp3gP
Nlly8xJimDnV7TUeMvs8ZllqaYloXw==
=QtH4
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
