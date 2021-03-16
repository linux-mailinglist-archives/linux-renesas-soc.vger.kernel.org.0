Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A797333D475
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 13:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhCPM5f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 08:57:35 -0400
Received: from www.zeus03.de ([194.117.254.33]:42532 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234460AbhCPM5S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 08:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=fDuLIWyfsKQi6O7j3bx0fRKXhjJz
        ffnJfqve+YGpC2c=; b=vhRRZ3iHw/AnRHnbvhcDkK9sVoycFatXc8yLg4mUeV6G
        yD9/vyNHbSnMJ69x2YfWIT5npHFYdDX+o3gutN5RTKshAQrZOEgQQ/5f8YG0+fhS
        QtUlp3pU4Mi3PORDfbH61Q++tUSCytSPFiPSV2k2p1yN3Rf2P9egWfvpSg6v+cU=
Received: (qmail 1779835 invoked from network); 16 Mar 2021 13:57:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Mar 2021 13:57:10 +0100
X-UD-Smtp-Session: l3s3148p1@K1CF56a9xp0gARa4ReUdAWIPBxWmfbkD
Date:   Tue, 16 Mar 2021 13:57:09 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: do hard reset if possible
Message-ID: <20210316125709.GE1031@ninjato>
References: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
 <20210315145938.58565-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdUw8wWh3ybsFUopKGMw-Zbcqr9bJBEGHAerL-Y226A0=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AjmyJqqohANyBN/e"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUw8wWh3ybsFUopKGMw-Zbcqr9bJBEGHAerL-Y226A0=w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--AjmyJqqohANyBN/e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       select RESET_CONTROLLER
>=20
> ... if ARCH_RENESAS?
>=20
> While RESET_CONTROLLER can be enabled on SuperH (and compiles),
> there are no reset drivers for SuperH, so it won't be used anyway.

Yeah, I also thought about it and decided against it. Because a new arch
will then support resets out of the box while the overhead for old archs
is negligible, I'd think.

But no strong opinion here.


--AjmyJqqohANyBN/e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBQqyEACgkQFA3kzBSg
KbZcFA//aY/++eQqkxtdRtSkM7U0Dud7N+JZAlab1+AbS66TL4odJC7chBjs+3Do
ZpYI33/NTPLYCEcKHwEhzcSx/jZW0lEzGREfbbsolJqykSB/bx3SGJBgV6UYW0m9
/KH3EbuX2KfYFqYzNJgvQ/euwrJlO2OMplQ73hoiyhFRc5vqzZef0RNZ14MBPvWn
ut22DG9ZnUoYSgEFDiIcNUiabK5dI43Jy1d6xY9/hEH2Nsx93c0EI1XvQMKMmyRg
t/opgixvnFVvjsaYZCXEZpLUvKSwosrhaNWoLY59hDR/ZRwG5Kt7VbH3gip8/aFb
BvM4pzFs2KbSCEMP3UfsfuUEbPvMyaanE7yqhUOMZP6yHyUUrjkSUAFlzkZfsEH4
Eat23JlbaHvWiKThHHijWAfXXz1v/914OPFEVp0n1S37yuLtM9slPr4HumDxb2AU
1sf+zQZfd8kEcjVrR+mYhUgvH/njTLmca5KKotEvgUJdEIWqVHTYtDLOz8Eoz7/G
3GeeIL4zPs4bnL2Cd6YXgo0kU/R5ZIWm5HCKPFa9nIIBPpjykuD58oPhZb0KsNCB
fo76IRhKkuhlIxd9APD+TqCZiJGot7C36uBajkrQqLYmu5r0c7AtBwWOy0J2mrh9
zIWO59wL0Hm2e3Y3LDWhtqsVyRe8rokBrGRTJyYokJMXa5ENAAM=
=QQ5u
-----END PGP SIGNATURE-----

--AjmyJqqohANyBN/e--
