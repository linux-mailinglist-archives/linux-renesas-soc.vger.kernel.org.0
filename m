Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF87479661
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 22:38:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhLQVis (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 16:38:48 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:36764 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhLQVir (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 16:38:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 61948623C5;
        Fri, 17 Dec 2021 21:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5946DC36AE2;
        Fri, 17 Dec 2021 21:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639777126;
        bh=xyfICOKWLBJApub7Y6RafRN3miUrNkHZMnQYdnxMgBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YQH0DbzKunAZk6lUVtUaA/8g58mLSKS8syDifLTngXcLffH+UT48YC+DvG9e4m6KG
         Mc0ISib0dYTQMaDajrEURZ0u3iQ2NjWty3nVic4TeP2lIxhPn1/5wXQdwdEmhRKs7+
         shpabEzzohjq1URhdF1O122YA1LZb/YTJLQ8CpxjEGEkGdZ1rOzTbbeMAc4grbyuLV
         gz0PpkwGvhE5V/esOvGUqnCDSVdDSNDvVUGbjbME4cmqcATFy5YPlU1DN9XWlxqi7x
         5HgrEyyoc9nvlu9sGkvcgCBm1Hb/zdkf/oDLZSszBjIUpuMtFX8nq1iJcBTFDqcP3L
         EpZTEdWkVap/Q==
Date:   Fri, 17 Dec 2021 22:38:44 +0100
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
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v6 4/4] ARM: dts: r9a06g032: Describe the NAND controller
Message-ID: <Yb0DZNt67Z/vQdXI@kunai>
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
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
 <20211217142033.353599-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xNxXFQLHAm3OQbhA"
Content-Disposition: inline
In-Reply-To: <20211217142033.353599-5-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--xNxXFQLHAm3OQbhA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 17, 2021 at 03:20:33PM +0100, Miquel Raynal wrote:
> Describe the NAND controller embedded in r9a06g032 SoCs.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--xNxXFQLHAm3OQbhA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG9A2MACgkQFA3kzBSg
KbbKcw/9Gj4vDEtHiQUn45fiJ1jemYKtK5LMG57sjetmZSxRVOq2CjUAfpNCLxGQ
GX3eQdTBXCuzFq8etP4hKJLi4Wh2VR0NZswpCnw7e8vHX0fg6vZt3C4DZ6qchs8U
lVVNGneCsIjfYK2UA0UJgkEdhvNP4ShgUUMprQTcMCXuJInRvGZija/qGsi918lc
wsYxoKpxol0M3bXAwmS/A6xkAbCDWoZODSYIDq4EwdhgqfCCByEFAF04VKltNxQz
G6TiFb43oHcofpcrFiMEG1rjNDr8WPYGOetKXtn+IcI8MdlVURPONF7sv0XY10CZ
qaca++EzOvrPEN0eTDnWwGTkhm5oujHNGtWHCBfjxmsiqGZEc+gZYOHGnFrUN5Yf
1NdQF/Uiau7YHLpoDJ/M2N8va6dTeMNBuewJxw5UhvY6O2tUhZHiqxMxwLxuB4cL
w17jCepy5I6JuGZwCrzuc7TdlQp8vUa3nIwdaHX1CUqy89OF5O1ji7xGyf+7fxG2
myEhEctq653dkAIyzKgVJYcscY+iZMDZd285D68AntfiSyTuLyhS4o3uzUbLadWf
4o4fmxa9YKUFhJRxsxhpLBaGSXIYP3MquiDK3jltQ1NbXy4yGpRm6rjjflFdf22L
MmKo1cef8LARCW0hJU3irpJSyegezfvT7VrIa0vHJ+1F0VilU5A=
=DO2J
-----END PGP SIGNATURE-----

--xNxXFQLHAm3OQbhA--
