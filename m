Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B320D458CA4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Nov 2021 11:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239369AbhKVKuG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Nov 2021 05:50:06 -0500
Received: from www.zeus03.de ([194.117.254.33]:52436 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239341AbhKVKuF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Nov 2021 05:50:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=oghwl1qnDj75n7yfdlvKbT8CzK4L
        du0DzUS85sTtTRw=; b=yBmUWFyrHEQfyPvHSFMC7c6EXnJAXtJs06UYTrr6HVvs
        LN9i9NQ+Tc08o38ChAMHXo5SAPKn2u49Tr/JPloGv+vtiP74h8ADr8/MTRrsbwP0
        LFKA+lpwhrAcqrupb5XeV6HzvYEBLKHt5ote8ZosqKkRp1gpG4DxHYx/AF+GYeE=
Received: (qmail 761530 invoked from network); 22 Nov 2021 11:46:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2021 11:46:57 +0100
X-UD-Smtp-Session: l3s3148p1@PMIBWF7RetsgAwDPXwnCAFkDAkP2hjT7
Date:   Mon, 22 Nov 2021 11:46:56 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks
Message-ID: <YZt1IGvXr8sO3Rvc@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211122103905.14439-1-biju.das.jz@bp.renesas.com>
 <20211122103905.14439-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zm34zFuq44kjVJ62"
Content-Disposition: inline
In-Reply-To: <20211122103905.14439-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zm34zFuq44kjVJ62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 10:39:04AM +0000, Biju Das wrote:
> Rename the below RZ/G2L clocks to match with the clock names used in
> R-Car Gen2 and later generations.
>=20
>  imclk->core
>  clk_hs->clkh
>  imclk2->cd
>=20
> This changes will avoid using fallback for RZ/G2L high speed clock,
> if "clkh" is not used in device tree and also the code changes in
> driver related to this clocks.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

The bindings match what we discussed. Thanks!

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--zm34zFuq44kjVJ62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGbdR0ACgkQFA3kzBSg
KbYq9w/+PwY4hCRYAXEb6Rt9RLvUzYi379L2WM8FXggj4EtpN4NkjITBaF6xPsw4
aLMvieOhk7PO9kd5+5b/T6YMzNnMV+bDqwtNBQPza30sQlh06vO8dnFzJnI4/3cA
mUKNu/tC0W0ZZGiCvtGEA9UvMK+KV+fdxSHlbleEYFiY9vsfoX61/IC+DmkgwFxI
iANui2BbmB5c7MtS5EwmTOxsZ13ayR4QgMLKrdnHvnfcyvWjkTYHflVj94jkSJpU
bz4HNjrFmrRG2/q5nRUUDtirqs2bvwz45F7GM0kzxGiJaAaLZEQ0CsXOxmbcIVb6
wWZ7dXjnxYn0Q9Y4wJ7VVfBIbhneTCsXhCg/o+7nzvp/8jBSmkmf4UEZ3r6fiwOw
5smdLqP3pFfkiOomMYIzVA2pY/qN/rUUs/mXeOKs+5vxlWF1ns9jwUp+MeqsyQQN
vg0O0t0rnetrT6GFot4UF1OlJWKwyGMEpul4x7pnX2/c+oEGxRv7gmIdBGVQHqfW
7Y8pmC2IChg9k5lIpRArIet1SuvXGRI4Bf+ufIBBkLqMt+NkN0EkDnK4y8hHP0n5
rwLqaxDIR+LIPjSaaSVHbb4QySzweBOeHVO3HdJ91LD1yV3isI+PIere4QMYEzj/
/ceILluQT6QXfY8PZtxa6D0gEFPskex6k53xBg205thjY48ZSqQ=
=Bz4w
-----END PGP SIGNATURE-----

--zm34zFuq44kjVJ62--
