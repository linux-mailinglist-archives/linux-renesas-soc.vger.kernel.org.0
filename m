Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4A444E5D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 12:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234766AbhKLL7U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 06:59:20 -0500
Received: from www.zeus03.de ([194.117.254.33]:40284 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234702AbhKLL7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 06:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=ZDaCpJGOGV2HLwzFukT+9f4fU20V
        Ber3U1nQiuedgQs=; b=U8GEQrZiGRhiimhxAx3fPJ8+UeTjuZzciaMEuM+F9yXO
        dJ/6jallSuKjs/EVPop1q/YlyTvHFuaLy1gmhafoHdAmNUB013HvTcgl94ZL9LWH
        jOmzs02txCPhr0EU4/QZPXKNGQiqcZZi/B8iFNHR22LCjdi7qvFu2MvxfXEAGWo=
Received: (qmail 1352494 invoked from network); 12 Nov 2021 12:56:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Nov 2021 12:56:27 +0100
X-UD-Smtp-Session: l3s3148p1@csbzJZbQ2M0gAQnoAFqiAcAEyXqBia2a
Date:   Fri, 12 Nov 2021 12:56:23 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L
 bindings
Message-ID: <YY5WZ1r10EphBJEZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20210817090313.31858-1-biju.das.jz@bp.renesas.com>
 <20210817090313.31858-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVXpn7X3Tm_ouq6DVUDP4mxMO8EObFjtfEU4pX6sodo9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tvb6xc1+wzU+EAg9"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVXpn7X3Tm_ouq6DVUDP4mxMO8EObFjtfEU4pX6sodo9A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--tvb6xc1+wzU+EAg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

> > +            - description: IMCLK, SDHI channel main clock1.

Sounds like "core"

> > +            - description: IMCLK2, SDHI channel main clock2. When this clock is
> > +                           turned off, external SD card detection cannot be
> > +                           detected.

"cd"

> > +            - description: CLK_HS, SDHI channel High speed clock which operates
> > +                           4 times that of SDHI channel main clock1.

"clkh" compared to the Gen3 bindings to me.

> > +            - description: ACLK, SDHI channel bus clock.

This I don't understand. The CPG-MSSR clock?

> Does this actually work with the current Linux SDHI driver? How are
> the extra clocks handled?

It may work out of the box if their HW can have "clkh" enabled all the
time and this is their default. Gen3 has recommendations to disable clkh
for slow transfer modes, so we need handling of clkh

Kind regards,

   Wolfram

--tvb6xc1+wzU+EAg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGOVmQACgkQFA3kzBSg
KbYw1w//Q3Zv+1pPXdP7FJz24jhX2HoU0UBLvoePn5M3RILCJWEkV7SF9ObkpCiw
yMpdF+/IJyBFmQM1J0Mks8HE1ZD9la0m1BBkV+/5+hdNO7XS2Md9EenSh5KO5S9v
zxi6K2pEmrOWviVGLMNnXIlx3MBn8ZWA1cVrS2q/fkznr6pznejJ5R5ZkNQnJoCu
u7gpKRtF+2kxd7x3jdgRtp1cJGCJKYxY43bpNeTSRVxZsjzR9i9wWSXqKRAkw1NZ
qFLxLLsPoVNCnQsvu4uaCNaA/JUfabq+bL95sWnXN89bWJ9qdsDxvlZxb8TITv9I
74wDxKrXuYMwV4kTY0Nv1gaLRQMgOCzy/uP6fgK3qFDMjRfNHmFSYooth2wxKfzQ
GCrCgMaodKjXSt3q4UtIOSqWSszRpbXQ630d9mhwvvOx5AOWguqokduL+2TxFqIY
A1sGq8zfJtyqbL1xjJUNFqe52EFNkszDLxCtiT4vVLQW4/nqf3q20Jezfz/Xyp0I
zymCcYQk3lncti93ojMjTBPCrldyT14Npqg/bdayky0VMFkufJTAlt7Twj5vuH96
0wG0ElAyJKY3WWyOblnxNx1ho+I/3omK0pOqg+XEdVQA0XwwwiOIaGvwmkxDwxyh
pcVrO+QesYxayqvwOI8b2uDIbQ67EbKlMKvFQVlLXhyRE0C+c14=
=qT4R
-----END PGP SIGNATURE-----

--tvb6xc1+wzU+EAg9--
