Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5872FC33D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jan 2021 23:22:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbhASWVQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jan 2021 17:21:16 -0500
Received: from www.zeus03.de ([194.117.254.33]:35792 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729681AbhASWR1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jan 2021 17:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=Tvs8pg44S10SnvU7Vfn6Lyi1Ih2C
        n2uq3D4AyozPauE=; b=qg6kMS/whKZ3RVB00xvRN2S/4I6YmcquDb9RvNWZgQS0
        QFcuHjbonM1SfmjlL9lnN5kLNUNJydeAfH5wM32f0CDy0+hgLiYyV1YrIHUa6LTq
        kDImjJgj2zKLcpEg7/gj7w+Hh6Q2Oa3AS8+0+c1xQCc/Z9HWr6EgueriPobyfMs=
Received: (qmail 1218336 invoked from network); 19 Jan 2021 23:16:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Jan 2021 23:16:34 +0100
X-UD-Smtp-Session: l3s3148p1@DARzMEi5FKQgAwDPXw7XAOd/1ZKxv5fl
Date:   Tue, 19 Jan 2021 23:16:24 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: serial: renesas,hscif: Add r8a779a0
 support
Message-ID: <20210119221624.GA3651@kunai>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
 <20201228112715.14947-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <20201228112715.14947-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 28, 2020 at 12:27:10PM +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Can we apply this via the serial tree? Or shall we take it via
renesas-soc? Thanks!

>  Documentation/devicetree/bindings/serial/renesas,hscif.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml =
b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> index c139c5edb93e..512a84942f78 100644
> --- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
> @@ -51,6 +51,7 @@ properties:
>                - renesas,hscif-r8a77980     # R-Car V3H
>                - renesas,hscif-r8a77990     # R-Car E3
>                - renesas,hscif-r8a77995     # R-Car D3
> +              - renesas,hscif-r8a779a0     # R-Car V3U
>            - const: renesas,rcar-gen3-hscif # R-Car Gen3 and RZ/G2
>            - const: renesas,hscif           # generic HSCIF compatible UA=
RT
> =20
> --=20
> 2.29.2
>=20

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmAHWjQACgkQFA3kzBSg
KbbushAAh8VZmaIq8BcIedVSLt9mwtYU9iJ6PFD4s+QwcHaLo3/+HeRPj2y60X4h
2TgvgKZrJ1jj6FEe/lrmxJ4b+Ja2Gd/2lNr0ZEOj2TNTIBTN9t84TdgFQIrkRDD9
smBgo4IZtdrFLcAjTDEwO5yWcMdHJ+2IVl5ZYRlLXltAkaHlHdWvdJkgHQl3QZi2
SOR/pQ8FT4dUqTinOa53ZbiljA/8DEV8FbxxMPoDaUeda+d8CnVT2txK4LkeDx6c
kQf/MC9IRfihh5F57OcSuIAWTt0gMRhW8H9aqkFZ4wMQhDfETOxiZyySbnmcALS0
IE9PLsOTKvUJvq3QT11IAmUe7F5fidbsOUDFGQEU/uQXYflQ6njy/A+n3hsBURsl
A8AKyySCX1llZSJPZ+MkXa8eVqy7J9j98Ktu9J8BPvC929QjgFaUl6yvD0fzAK0p
sLz5/kTfRwT/36AFs5acX+IE247kTk/+prliAaBqN+HVrWO9tNRHwrX0vEAC3TQI
bnQPPaX6ytkZqaibXTXkx6JBNUFMDunhQvSiHVZjjEPYq5tiPxNdO5l7jvTfq3bA
favvJFCPQr+IjToQhi+IK1dvFG7A1CXa0z4lCMGw+uzxTdb+cTK+Pfsu0zDZSqmy
VKiwozDpVpe2WCFbW1brt/H6ychnhOenuzt3ILlqivHEuB9vwSk=
=WX0p
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
