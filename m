Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491E447965D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 22:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhLQVia (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 16:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhLQVi2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 16:38:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A1D6C061574;
        Fri, 17 Dec 2021 13:38:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2FE18B82AE4;
        Fri, 17 Dec 2021 21:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42240C36AE2;
        Fri, 17 Dec 2021 21:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639777105;
        bh=LlTsuvYGdJIWToCdLIK0HTL6oM6Lh5nGF3v2QsTfi9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QX9WXZNG24ktiQHd4/VqCAokw+yNsegKXP9FSCaDZRFHHEMzOUMNMOUvtJGQBbiEt
         KsU+Pg9cT9I4PlLQf7MHMmM9UFTkJKo0Akx55q/gOZufY89TV0lBK1JNPASHkv/N0D
         /C2sFvKir602AYFEl6ccAaer/Utq5WsYGa44r/jw/lTQ4cLAxfamANfJ8rFiL31NBI
         m6WIEqQZ4OXTc/P0omsvtpWxFrfyOMT6kEKabeLVeUpcTyZGW0WCEgB5PxcpE7Exd1
         VB5GaciqVVQicFcvSdpCzQKjV5JwH3t1hI6fVzvHFFeKtTkZyjTn3zLg2AvIi5xsqC
         mPE0TfSh8vlXw==
Date:   Fri, 17 Dec 2021 22:38:23 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas R-Car
 Gen3 & RZ/N1 NAND controller
Message-ID: <Yb0DT3GCSUCkHv1x@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
        linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/PSey1HlptoWKvFp"
Content-Disposition: inline
In-Reply-To: <20211217142033.353599-2-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--/PSey1HlptoWKvFp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 03:20:30PM +0100, Miquel Raynal wrote:
> Add a Yaml description for this Renesas NAND controller.
>=20
> As this controller is embedded on different SoC families, provide:
> * a family-specific "r-car-gen3" compatible and a more specific
>   "r8a77951" one
> * a family-specific "rzn1" compatible and a more specific "r9a06g032"
>   one
>=20
> More compatibles can be added later if new SoCs with this controller
> must be supported.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--/PSey1HlptoWKvFp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG9A04ACgkQFA3kzBSg
KbYHjBAAiVsvH3XYKGlctcrIqnHUa0ooJcygD0XPTU+7pr2yHulv6d7U33YgrR9S
MnwoiPhIpnNnolgg0OAp+fb+vL4sRbdd9ZuQXXoJISpSSxNVZf5k4dvgsz9I6rKU
KTYEbW+SVRv00sIbiMZqAEdSj61ls4Gl1cqNuT8EAF/TmnQPqM6IJPKo8yEQvZbv
lYTGdhTRSNhmkK1QWJyJrAoFrSAxKuj5v7M+z/O39Y1CSVR4U6QlLREodi6scTHu
06MAxzlKZJ0A0zvs1iUePq0lN6eQ1el6EcAY6kOcoj5xHlsQLrBIXR0J3D0o9vWY
quBJRs1B43XGU0F7FbmzBJ9dbz+wca0g24cp6YXUlKKp1CHG2qJzkleh3v+uSf2F
AkLBzW6jsR0SrIb8LPsYe2eMYo62Zm4fPo2W/6OxwGKzsFGM01K7yI2qw+WUqqVG
rCmgMHaiIPv959YS75evivltVjMd17Su27HOl5ldJ2JrX9oEx0ylMq+LAiTGH4za
zEaCkjTYmzPeasaGFMfWe5flziUO3u/HQxCvWD3NRd7uK0JAGA/KVLbHLqU4K69n
jLkoAf3tQrf7uSPUXUVJcnomfatWI5tMK7H38BTPoc+BjAiMsgSwuybWZnSbRL9m
Qqc8YNQen0hxPwYgIFQTTrgDzVC040B6FjJ0eluj3mlD4khSdFk=
=SLCg
-----END PGP SIGNATURE-----

--/PSey1HlptoWKvFp--
