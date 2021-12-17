Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90AE47964F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 22:34:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhLQVeg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 16:34:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhLQVef (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 16:34:35 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E482C061574;
        Fri, 17 Dec 2021 13:34:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0F928B82AE3;
        Fri, 17 Dec 2021 21:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C2BC36AE2;
        Fri, 17 Dec 2021 21:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639776872;
        bh=Kw0iKGdVy8Fi/XFJiR6dOzi8M/aGluWyy00V2duZ3g0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k83xh3KoXNhIJdROmeVDWCGHT1MqKE8y94KbU8NLPOG2wjDyN3lAABuSi8GBasuIj
         +HFx+sCv+DM2zdVTd2xLrAymkd0orbNE8NBgodn8C+IoIwGNe46XGR48Ysj6UTNa3b
         331pNO3k+IAONxCjbnA/30Mj1ZECVjUCcRzgSO0n0d1geX0wPlDGz8OS5z3CjfjS0G
         u7hb6Meg38lBApyQs5GExeota3Nu3EoIv28fo0EbqcRd8JtRVjJ8V6kZR18heKiB29
         R6DiQCX6R6adsrhtIT7rhWClkqk4Ox/7hk33yuTe61zAPPYLkFbU38yRXHJEpl9YUT
         DAWfNScuVoS3A==
Date:   Fri, 17 Dec 2021 22:34:26 +0100
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
Subject: Re: [PATCH v6 3/4] MAINTAINERS: Add an entry for Renesas NAND
 controller
Message-ID: <Yb0CYpCBFA/bQFjF@kunai>
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
 <20211217142033.353599-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YgipmO8J0jnQIUmg"
Content-Disposition: inline
In-Reply-To: <20211217142033.353599-4-miquel.raynal@bootlin.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--YgipmO8J0jnQIUmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +RENESAS R-CAR GEN3 & RZ/N1 NAND CONTROLLER DRIVER
> +M:	Miquel Raynal <miquel.raynal@bootlin.com>
> +L:	linux-mtd@lists.infradead.org

Could you add

L:      linux-renesas-soc@vger.kernel.org

as well please?

> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
> +F:	drivers/mtd/nand/raw/renesas-nand-controller.c

--YgipmO8J0jnQIUmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmG9Al4ACgkQFA3kzBSg
KbbyaxAAjM28xHUCttzmmsIUBoWM5VyuLEiozGDzNaFVk5nssyFKz7x3G1JZwCpv
lyTibV/kIiuX3Lmiu4Aq954kOnCZnWaMxpAV64cpvxcSiBty+avhbGk8nLMxaPx3
lCoI7ySHvo1dqvUCpjrX2mQZamGsi0vkyU1IcwHh3904FpoYUdDoX1Z7fggVr7PD
UOOph53HSOUqJJGs79UNsqGcrcK/R2W7bMTq9yhLQjMLjuNvl/iWWM24jxw0lurx
FBwTp3HliFu0vNFZFMyh0N0iZPy/J1+BnnWyCj5OFMYoH1rDtJ9mu3JRw2Cjirzd
5JpAZuuvjI2a2jnIqtouJ8iZMKv4eKz63Lw7nkPhKxLJxacLXWdvDAUtp6e2B5oo
qMmHy92NH6adu4+wj2ttWwBmxVNVOYjcugM7SL9rUqOhBuh4ALFDxvNKgdeaGSTs
FL2x1mIcuUv3g+dTxQpJYimDmZWRM+UM9PY7OF3VvLT6Twb6CDiWZ+7KlA8fjvrX
rxeSW11JhacxfV32bLbupswb2cryMlwO/Xee9DtftOhg5f0CDiSWj52lv+zJXcwt
p3r1NFFb2rtPnWt9bHmUFOaF4iq9aIYJGZBAgs0mf91r42l4q4DQ/Y6mopHIL8H7
1vUkFBVgCz3OPejJvQTuW4cuOVJrXILzlr7yfU5/5wl6fwa7w74=
=DqmB
-----END PGP SIGNATURE-----

--YgipmO8J0jnQIUmg--
