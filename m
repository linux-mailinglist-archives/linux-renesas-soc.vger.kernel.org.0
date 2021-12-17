Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02113479659
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 22:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhLQVh3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 16:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhLQVh3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 16:37:29 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D91CC061574;
        Fri, 17 Dec 2021 13:37:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DBADD623BE;
        Fri, 17 Dec 2021 21:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCD7C36AE5;
        Fri, 17 Dec 2021 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639777047;
        bh=QX9eoTmdYgVC8Rce8OzTB67gJaOLDMxWmsBK3LeWfYk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O0rwfNsVmqwki+DDQlty5BuW3EBu92vTMi5plo6U1H3et5r/pKKNju/7USCP469dc
         4SJks8bdE9mGd8UsMDWIfONP6ZlBK9mnpKGQmgCvoC1kjcXH8ETwnNvVNsbxcFHArH
         BEp/hRR3MPWgNQZB0WrJKZlUdkNqWiaxuzcutUit69gcxqYmKXkOo1+ImjxEeJB0/6
         /NgN7vXFX3M145KNUJRWqCjCM0y1CtWGmd/CEzfHAQfnePj2ElknAT3juS00N5qekr
         8TbXHYclzVSd1lLix65q3NPJkBWYfL0PAmN0aHsMOSPkhMTC9AMCc6outXp2ah9EBB
         Et/dpNLIFWC0A==
Date:   Fri, 17 Dec 2021 22:37:24 +0100
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
        Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: Re: [PATCH v6 2/4] mtd: rawnand: renesas: Add new NAND controller
 driver
Message-ID: <Yb0DFEsjlScimzU2@kunai>
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
        Ralph Siemsen <ralph.siemsen@linaro.org>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BnlVJ5G7tN0TUvEW"
Content-Disposition: inline
In-Reply-To: <20211217142033.353599-3-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--BnlVJ5G7tN0TUvEW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 03:20:31PM +0100, Miquel Raynal wrote:
> Introduce Renesas NAND controller driver which currently supports the
> following features on R-Car Gen3 and RZ/N1 SoCs:
> - All ONFI timing modes
> - Different configurations of its internal ECC controller
> - On-die (not tested) and software ECC support
> - Several chips (not tested)
> - Subpage accesses
> - DMA and PIO
>=20
> This controller was originally provided by Evatronix before being bought
> by Cadence.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>

As I mentioned before, I can't test the driver and have no bandwidth for
a proper review. However, it looks really good from a glimpse and I
think we are in good shape for Gen3 additions if we need them somewhen.
So:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--BnlVJ5G7tN0TUvEW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG9AxQACgkQFA3kzBSg
KbbEFw//XIE8XtvyCbxPj+leDzS57Fu7Yc+wwqYIs9cbDB2kLl5CuXQX6wOX6Fqp
8jhdu3zr5M+wkLXw2SeWmyGnZEXjIxPmsmhHSNkNt885h/RoK5rPTadIx5L3IZey
1nha1nkJbgn9uqAEmSfxqI51wIzCAg2qtjPR7fMKbWQSodFyp6bQec9vkkypEj0x
kLbmm/R3jQioRIIJrC/jSzEgR+QE+PEzyiElnE5ix8pqdpm3wlWsP1lG9mHzLlom
mve8hXXrCZRtP6EAmdzLEiz1Gl1H4aThx1GblBBf8wR4K29DaKnmgbog/Ekk6lDo
5TKVfEfW5Uu6+3JP5L3CBHaVk1S8xFdouMzSfma2jcsXdwTB0VDHPsedZlbTVGT4
NvAPek2dgGL9q3Z0hAfzsxmPQoEXIo6W7i+fajuVeR09SWE/mxvMwqKMOn+K2mp7
UI9rDxMhK3bEeiJ+ajuxTLuPOl3WkGaEVIocrRDUXHSM6xb/eZraD1CXgvX+U9ts
DtUDSBFSscpnkCZasfT91wo49Mj8UGD273RRKASwsyKi2fMQgvQBPH/pch3sBfc5
Sn5r+YzjrVf5GSFMyl8TvIutg5DfgLo8k1Rt1FRZMZz1b3oTz9esvPjILhjIXEq3
i/rP556V1LElDKDewaHprUA/dBpSIVO3PGS5juYtjwYzS8fmAzY=
=ftDR
-----END PGP SIGNATURE-----

--BnlVJ5G7tN0TUvEW--
