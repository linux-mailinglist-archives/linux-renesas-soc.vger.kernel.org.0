Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B2538777E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 May 2021 13:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233497AbhERL17 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 May 2021 07:27:59 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:46652 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233393AbhERL16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 May 2021 07:27:58 -0400
Received: by mail-lf1-f47.google.com with SMTP id i9so13558159lfe.13;
        Tue, 18 May 2021 04:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9UP0Ve8zPlcDC6ko6Yn1C9bDcYQbHNon0ynodga2ftY=;
        b=p0QHulf8CQuAP2M+ySriE9B2JAuTsX92KeNSpekkEhrtPYwKzfdieeB6GmnJAXyI4p
         L0SayRe/drFQHZEjJam1a9BIGWhXCXo8WrSqaSuUnocmFW2NEJhCt2uyw4vEM7QaCYAP
         jCgzkhFVVB28CVV1vwNqCQw8zppFLigFwV5eGgfQqQUiFbxCuuIPJ/zN8EVtmTxhgZ7y
         P0uBdcjbSbnhFZHwNBsqWsHeoJ4gwy8xbjBtewodt90qdMAwOYMpQ80g5qT3mo+CgDJX
         Q9yUKw6JAPpajKeru/2FWeR8EeaTGeR4VhWh+9gNIDRemiAztqVZDuVrKT50INSTv4GX
         BpjQ==
X-Gm-Message-State: AOAM533pjAiRD+sp4bR9rmfEbXiEYn+41F8NEmpEkFJ2L9MzKh4btkrY
        EAohR8WRTACUwRA28huDkuw=
X-Google-Smtp-Source: ABdhPJzDYHNNxgJ27Y/fsTnyCSkA52sefFwuudJ2N0R7TR2XgC/vabSADcgYwIo+FjEhSkSU/ME6LA==
X-Received: by 2002:ac2:5dfc:: with SMTP id z28mr3803962lfq.297.1621337199080;
        Tue, 18 May 2021 04:26:39 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::1])
        by smtp.gmail.com with ESMTPSA id m12sm2279010lfb.72.2021.05.18.04.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 04:26:38 -0700 (PDT)
Date:   Tue, 18 May 2021 14:26:31 +0300
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
Subject: [PATCH v10 04/11] regulator: add warning flags
Message-ID: <b4824751515cd791504e6823b7c82b5e6c0787a7.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <cover.1621333893.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Add 'warning' level events and error flags to regulator core.
Current regulator core notifications are used to inform consumers
about errors where HW is misbehaving in such way it is assumed to
be broken/unrecoverable.

There are PMICs which are designed for system(s) that may have use
for regulator indications sent before HW is damaged so that some
board/consumer specific recovery-event can be performed while
continuing most of the normal operations.

Add new WARNING level events and notifications to be used for
that purpose.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
No changes since RFC-v2
---
 include/linux/regulator/consumer.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator/c=
onsumer.h
index 20e84a84fb77..f72ca73631be 100644
--- a/include/linux/regulator/consumer.h
+++ b/include/linux/regulator/consumer.h
@@ -119,6 +119,16 @@ struct regulator_dev;
 #define REGULATOR_EVENT_PRE_DISABLE		0x400
 #define REGULATOR_EVENT_ABORT_DISABLE		0x800
 #define REGULATOR_EVENT_ENABLE			0x1000
+/*
+ * Following notifications should be emitted only if detected condition
+ * is such that the HW is likely to still be working but consumers should
+ * take a recovery action to prevent problems esacalating into errors.
+ */
+#define REGULATOR_EVENT_UNDER_VOLTAGE_WARN	0x2000
+#define REGULATOR_EVENT_OVER_CURRENT_WARN	0x4000
+#define REGULATOR_EVENT_OVER_VOLTAGE_WARN	0x8000
+#define REGULATOR_EVENT_OVER_TEMP_WARN		0x10000
+#define REGULATOR_EVENT_WARN_MASK		0x1E000
=20
 /*
  * Regulator errors that can be queried using regulator_get_error_flags
@@ -138,6 +148,10 @@ struct regulator_dev;
 #define REGULATOR_ERROR_FAIL			BIT(4)
 #define REGULATOR_ERROR_OVER_TEMP		BIT(5)
=20
+#define REGULATOR_ERROR_UNDER_VOLTAGE_WARN	BIT(6)
+#define REGULATOR_ERROR_OVER_CURRENT_WARN	BIT(7)
+#define REGULATOR_ERROR_OVER_VOLTAGE_WARN	BIT(8)
+#define REGULATOR_ERROR_OVER_TEMP_WARN		BIT(9)
=20
 /**
  * struct pre_voltage_change_data - Data sent with PRE_VOLTAGE_CHANGE event
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

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmCjpGcACgkQeFA3/03a
ocWMWAf+PtcaNWKVJnmgiLk7BSuQayo54SV2Cq8enx85N6EB3SSR4X3afpcydSdP
rbXsqc9rb3/XhHYk94nSGfPjhXlJCjdHQzt50CiJY8d1ti1uVaJkB2kSS6qj0bqT
a2RPukcfS52PWIM68bK5FHyS6Q2c0UPEXB9GwfVKCD9L9iWwDb3POkA+vKjXzEx8
v7iDJjP4y1R37bUrboeB1a7Y4G6CUy1ZE0SSh4aMxtlTggK/aIdiV8uuKyAzmdYm
67jBRyq4t0ZO9lnLTvBbr7/U+AbSQta6BNa0mG/s5chQNdPhQKGUz959n3TEKjUh
2hvMCRxS4M+Dy2qr3Oi33gymRbhSvQ==
=Jc1+
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
