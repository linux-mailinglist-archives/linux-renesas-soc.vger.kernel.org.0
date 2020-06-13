Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49BA1F8322
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2020 13:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgFMLj1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 13 Jun 2020 07:39:27 -0400
Received: from www.zeus03.de ([194.117.254.33]:38228 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726017AbgFMLj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 07:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=SB1R1byaLkHjHBlaDluUd/qNJ7vn
        aI6Jb22ivt621Bw=; b=Wd856/AHPLmefJUz9bD8pn56T+KYVuSGswTyu4G7aq5F
        NTBATJ0IMPbG5BJ83Mc/Q9XXM6L9C1PH8ANaIKWnm3F2sPkRPeWfFnbfqjijmZo8
        WUUXPr1UT3tmHs/XHp/Ah+tzdeoDZjhgaLgwf7tEJYCUKSlnJrlavPrJ7qyhkfs=
Received: (qmail 505575 invoked from network); 13 Jun 2020 13:39:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2020 13:39:25 +0200
X-UD-Smtp-Session: l3s3148p1@JmNDpfWnWsQgAwDPXyHFAGqOHKP9IeEo
Date:   Sat, 13 Jun 2020 13:39:24 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] lib: update DEBUG_SHIRQ docs to match reality
Message-ID: <20200613113924.GA5578@kunai>
References: <20200612124844.19422-1-wsa+renesas@sang-engineering.com>
 <CAHp75VdMPt60CKnP1HtkN8=3iY7+Kgrv6b9DTjcj-KMKaRknvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <CAHp75VdMPt60CKnP1HtkN8=3iY7+Kgrv6b9DTjcj-KMKaRknvw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > There is no extra interrupt when registering a shared interrupt handler
> > since 2011. Update the Kconfig text to make it clear and to avoid wrong
> > assumptions when debugging issues found by it.
> >
>=20
> I'm not sure.
> I have recently fixed a bug in the IIO sensor during ->probe() due to
> an issued test interrupt exactly as soon as the handler is registered.

$ git grep DEBUG_SHIRQ_FIXME
kernel/irq/manage.c:#ifdef CONFIG_DEBUG_SHIRQ_FIXME

There is no place to enable this code.

Maybe your case was like Krzysztof's case where the issue turned out to
be the extra interrupt on deregistering after a deferred probe? He
thought it was the initial interrupt but it wasn't.


--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7kuuwACgkQFA3kzBSg
KbaEPA//fF34K0egPXJkSO4SEjHd4YSHXJsQZYi0pwPOyaHwM3fN7VuWt/oAX3Im
qY1vOSERFovY2L44L+OOiauyyZJd5zuTO5Frt5jUJkSnO9VJw80Nn2zY28zw4qR9
WSu4a24WAj3Ioc2PkZyzsRZJsqsDSbP/iOEpcz5I0C+W11reME9EnTSq/ZhHYttD
pOSrX9x6aHNIyZzdmRy0kYh1PDBlEktDHEKtEmWVvrjPEMvCY4+h20Z2WOAs23UJ
T+mGnZul5sJdy53zHQcOC3kMRUaXAKIJyKXHmoWVnlcRt0Zd1OB11lclHUwWU7yM
1Z60TGAhMJSKi2gzSnuucfMDcyTjS4WAxEnxDZMFGEzBOGALZXTzM8h9GSUAAo+R
WObL1HOw29TFkmxFeE230gdQJSBKoAcMUMWuPn+FrhfkX6xD2vObtvTgJVtntObd
7K+qwZPVhgXHZ+ZZT8l+v+rszgcfRG9BVTgWq1dvSp+kf1GkjXFM+4aYvlaVWT54
uftDJcSqUEYL3t6G2W96Vb9rMs679SdEw24JqQn/M+vU8fEYOG64mWQs1oE1Z+xy
R6VNhxpGaj/lbs9ATiSY+hnxVPwsqCOi+wYUUz5RhIFl8SawNEzIUZiIaWy40/fR
OVUZbZYn9JuDIZeqpoSfHj/e+9a+bCZA5a0hSoQSW95MMJXJfYQ=
=tU/2
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
