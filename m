Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B3C41B2B1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 17:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241495AbhI1PPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Sep 2021 11:15:17 -0400
Received: from www.zeus03.de ([194.117.254.33]:35364 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241442AbhI1PPQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 11:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=+21Wry4timplKVudZJMqCEQXr3dn
        xi/GZbTN32kQy3g=; b=LW2Ne+6LvDPugwaCBKkK8FMOiNTxdk7oDFWPUeBvfjNb
        Fm3+RNGCJd0humYGz6v7UOsB6tNCcqkGbzsnoAog0ogmArXTfOvU/ggpjfaBuuZJ
        DFdKvmEEOcljibibl3lXRfr3JkD1VvKmhyKpp0OKq7p6P8HZeOnju5gika2nkE4=
Received: (qmail 1295169 invoked from network); 28 Sep 2021 17:13:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Sep 2021 17:13:34 +0200
X-UD-Smtp-Session: l3s3148p1@TDI6qA/NzuYgARa4Rac9ATot9flkfyHw
Date:   Tue, 28 Sep 2021 17:13:33 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 2/3] mmc: core: also abort tuning with CMD12 for SD
Message-ID: <YVMxHaTJordlRrFV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210914182023.8103-1-wsa+renesas@sang-engineering.com>
 <20210914182023.8103-3-wsa+renesas@sang-engineering.com>
 <CAPDyKFp0AgAqbJnvpUb4gxP_7wGszEZxVXU1=0UCMB3c+ruLzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mDZRYI2RgJSDBSv6"
Content-Disposition: inline
In-Reply-To: <CAPDyKFp0AgAqbJnvpUb4gxP_7wGszEZxVXU1=0UCMB3c+ruLzA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--mDZRYI2RgJSDBSv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ulf,

> Besides the minor nitpicks, this looks good to me!

Thanks for the review! However, I acquired new data which could mean
that this series is maybe really a workaround. Let's put it on hold for
now until I have found out more.

Happy hacking,

   Wolfram


--mDZRYI2RgJSDBSv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFTMRkACgkQFA3kzBSg
KbZeXA//bZqLOo1ZugqbgDQddaG1NbGNt+YXGKlTEKalhnuQex61bhJg+8G+L2ku
jHDm3/pk8JkNp9J9DWSBkc/oiU4e+nQfKls9u5/oMGzYENfTQsgkFxpnpC6fAXx5
iFWME/SNvzeXnPMBrtb1tK2fQbbnGDeISTdNEIY+BYMUsVqXx6+cO/P6ZCShcoM6
TvrD3QiyR3jT5aYasQEAorEZQJ2DHM6YbXlJaKnwFX0/BQbu6l2iM0WmGFBwO4Zk
x48RUg6i/H0RisZEz4WqTh/mF7w+l0QHLdOYY4E4GQGjF1n/vTLvzdjo106HVfKN
/ndT7/VItFunz988xmDtFNvknUcGN7eXr7ZE/bYvs5f3Jcj5Q7Mx06Eo8D9sIxvD
ocLxozYEkU5wUk4GnWt0B2oAiYi7TwVQDoN+KdxmUD9RTAKfWTi5uaZt8IIx8K7A
pEjYtnq+iQ10D+HhPOdDmw4r6v8a5LJlTZgbwc7pv1RbwJ2N1LfGpzhS8ZdjJNGr
J9aszYvmlikM7NVjOHuS4QJFMHZ/vFD3ThMGN2+aYv4ozE8bnB7RJXSpJqEo+mGC
Mxvl04IywZh7OiVTE498qDVaWu3ftPPaa6YRnEekjsuscEWStbzqJCkDukrLB+eb
8XwSfzWTutz8x4j4BDNIWd/KpHLE8uUTy6gBvzMUv6Jbwa1OZBc=
=g279
-----END PGP SIGNATURE-----

--mDZRYI2RgJSDBSv6--
