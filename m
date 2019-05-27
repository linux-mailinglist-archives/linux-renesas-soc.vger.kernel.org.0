Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80CFC2B630
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2019 15:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfE0NVs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 May 2019 09:21:48 -0400
Received: from sauhun.de ([88.99.104.3]:33888 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726274AbfE0NVs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 09:21:48 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id 7972E2C04C2;
        Mon, 27 May 2019 15:21:45 +0200 (CEST)
Date:   Mon, 27 May 2019 15:21:45 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] mmc: tmio: move runtime PM enablement to the driver
 implementations
Message-ID: <20190527132145.GA5023@kunai>
References: <20190410222240.5800-1-niklas.soderlund+renesas@ragnatech.se>
 <CAPDyKFrhrmxKvH-LOO1u+aYGs5-HnqtO9kFibKsAKthOUdjStg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Content-Disposition: inline
In-Reply-To: <CAPDyKFrhrmxKvH-LOO1u+aYGs5-HnqtO9kFibKsAKthOUdjStg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 03:14:36PM +0200, Ulf Hansson wrote:
> On Thu, 11 Apr 2019 at 00:29, Niklas S=C3=B6derlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> >
> > Both the Renesas and Uniphier implementations perform actions which
> > affect runtime PM before calling into the core tmio_mmc_host_probe()
> > which enabled runtime PM. Move pm_runtime_enable() from the core and
> > tmio_mmc_host_probe() into each drivers probe() so it can be called
> > before any clocks or other resources are switched on.
> >
> > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
>=20
> Niklas, Wolfram,
>=20
> Can I apply this for next?

Yes, Geert and Niklas sorted out that the regression with APE6 was
something else.

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzr5GQACgkQFA3kzBSg
KbZeYhAAnxuKoLmjrPaMVPvyEUWW2NVPGeXER+8KWTVZZoRnFXYF+EhDbDxqKnAg
PY7CjzCTBt4yxtA5Vjl09hhKrYa8m44z6njDihPJpQKgAXFqEH62iFt7xc7Kp6Cc
5lXeGJf3N5yzGLoDXWNu2VUvd4S+af0LD9DLLwD90lixcZkE0rEYP4tQ4wGLfA+T
Zpjr8LcCkKP26NbDB+vG+VXH/LB7maOiGyVyqevEG7+eEZ10Ytxcp99yFFhsCkLr
jd8zE6ooSBo7RylYrEJjXqL3aj625BYy0DvGwlQHn3XCOASXMUBIhY/U23L/qByH
GOj7Zm0suSVyRgz0AmlPalQsyhoxnQHJ9AcAQXbszPws/buIJ8tm7TpThWeI5XnK
DrR/hqq3FWelzzqJp5mBe9k10UhYpL+dOIu3s7fnMKOXVLsEMdxj68hVCXPLPgI1
NbXno/ACMW0ZjAGojL+X677JwJIrxYgeeHWh97uBW62/I/lO8yjs9vBtdXNYOfDJ
RF3MnEvVZjqkCipH1TLQV/dWegLT8vlzSbWLI+St/ezja0WwSM8Q1U90o8PT81bq
bkh9j5iISx1/YcP/Uu34Xo97yJX4Trhhjv+3PAZOgJOwHQ9eUiIzEx6jTPkFTzdG
j1D4vxITm+r4GRdyz/COv65opA3oJQMbxd28MfY0wsieM6ggnug=
=8ri5
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
