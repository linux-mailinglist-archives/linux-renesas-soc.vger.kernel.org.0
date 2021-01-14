Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442062F6CC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 21:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730091AbhANU6k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 15:58:40 -0500
Received: from www.zeus03.de ([194.117.254.33]:60336 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727380AbhANU6j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 15:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=1YzZheeZxrC0IyrzF3OfuCwdSnag
        uWY94TKKkiaq2zw=; b=Q+2r6wsoslkXTB4MVkcVPC2XeKy5rouTiY2KYBoQg2t/
        L/8N4Cj1XdRtRiOLelxCsgSVVQw9JORI0CPiOFxzGLcLpQmH8CEdQxPtrKMV1GIb
        YrMLKxgk0O5a+/gHc6+Rnc5Z3vT4v2JsU4DmdPWSWR3LqvNBMczFbboUmvDW+2U=
Received: (qmail 3643857 invoked from network); 14 Jan 2021 21:57:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2021 21:57:57 +0100
X-UD-Smtp-Session: l3s3148p1@ytKaguK4MNggAwDPXwjsANskl+1DI0tg
Date:   Thu, 14 Jan 2021 21:57:56 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linh Phung <linh.phung.jy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r8a779a0: add & update SCIF
 nodes
Message-ID: <20210114205756.GB16693@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linh Phung <linh.phung.jy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
 <20201228112715.14947-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUDPaaaHsDP11qZJzWzd+tss97iZXXATCHdVQZE1vLHSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUDPaaaHsDP11qZJzWzd+tss97iZXXATCHdVQZE1vLHSg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +               scif3: serial@e6c50000 {
>=20
> Please move scif3 before scif4.

I thought we are sorting by reg value?


--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAAsFAACgkQFA3kzBSg
KbYKzA/+LpQqDBq9UvcVF9LSHlNcPlvWbnEc0qZXQDnQOIiniFx9e8qLkv6yudSy
gkQbzjOrNIPOJMfZsvr2utuXPGNM5PCLJx81QjPEfVoYlvvJAXFmJlaD8ZCPsiTe
xEvKwYaO9JFKDPClxe5GDFU1ULla3BXYQef/kHjF+omn9AczA07BvHpT3s4jb5Bi
3LnKyqwvEREdnULHunXp4YiIG0yJhO3Bqe9ROzaEg3zR84igcNw6QYdehpTDBTvX
HYN5L79RQzhaQrD3MGH7bFAAyFkBAlYhYKtbhnfOq3g/ovn/ymIJQDzdIKY4Nqzx
g4aFbQLRWmrdoCmNvdNvC212qQ12v5x45lHzHpyU9WGoIoxM+zKPH4/K2qVeKGSS
OwRySufiLF3OAkthnL8Q1gqPirT3wK70l929DCWe5dKJ1xdchF4iPsYHs3sGWP91
NEYeaZuzVecNLzx4wlyTLWQ/3WOzUb7fKyBO1hOaLWleyxdm91wQnwUq//XuCHuS
EX1L5nHnlDiOvnxjNKjS9E/I/S1OFXlsufCCi4oLvY8GF51hERoikdBAqELlOC4z
+87KPyzZy1VUZb6FnR7TZf8Lvu9XBZyPmq/MjzNEYsnw4/eouKRiTg9bqPNRIGkM
g+v1+ZjyzrNMnSkpzGNEBmDdAO8+wznzrikQp9AwAirqdLZJkCM=
=J36/
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
