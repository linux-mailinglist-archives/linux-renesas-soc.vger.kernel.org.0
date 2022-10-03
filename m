Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B34235F347F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 19:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiJCR3e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 13:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiJCR3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 13:29:25 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2901A046
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 10:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=8s10QBliY2YKx7clxzAsnQl15RY8
        ul01qKGWYOlcg3w=; b=q1kxFlAjDeYA12ytoFPJX5Oj/MEsfMWyyS1oOlUmWeqp
        8ln0yJ4huHAhpRXdUxRoLd5jKNHNcH2uikqTEESN3Ocdj+y9wN2nCaFuit4vWgZj
        yUPkjQKiHDXQ2U6LrFR3yzkNkhyIKZbAynRHhTbs+9iW8v7jQuMLnGNSn1rmJEs=
Received: (qmail 251076 invoked from network); 3 Oct 2022 19:29:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Oct 2022 19:29:18 +0200
X-UD-Smtp-Session: l3s3148p1@rWfsriTqjKgucrTJ
Date:   Mon, 3 Oct 2022 19:29:17 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5] mmc: renesas_sdhi: Fix rounding errors
Message-ID: <Yzsb7SCkNDyCghLg@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220928110755.849275-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/67QyQbFSIL0lf1y"
Content-Disposition: inline
In-Reply-To: <20220928110755.849275-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--/67QyQbFSIL0lf1y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 28, 2022 at 12:07:55PM +0100, Biju Das wrote:
> Due to clk rounding errors on RZ/G2L platforms, it selects a clock source
> with a lower clock rate compared to a higher one.
> For eg: The rounding error (533333333 Hz / 4 * 4 =3D 533333332 Hz < 53333=
33
> 33 Hz) selects a clk source of 400 MHz instead of 533.333333 MHz.
>=20
> This patch fixes this issue by adding a margin of (1/1024) higher to
> the clock rate.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Can only test on Gen3 currently, but clock settings are the same there.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!


--/67QyQbFSIL0lf1y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM7G+kACgkQFA3kzBSg
KbbDJA//aUxtASX9Zo2yVdoxOzqHJbXUyoby1lEPTir2HV3YXnCIUrwaCmyrgUrY
Jrn7zZlmnahYVILy7piMn96rQFiVPt6hZXajj/g4jeMIlRafokvKTvj1KFxtiEoe
slOM+1T+aFpjIg0EbBr0k/c0NlPmWR5MgLHEomFFzgN8vex3p4JJnUzb0T5uHf79
gV4u1R3ohW8N0v/nVKhtbGjNnn5aoLyonuyclDQ1I1zpu8uP8/esYAqzj/PLAHdk
J/BHhN1iavY4spnHhOObzWKKk3nGljwCUtcUkknqdCYgbOwd6ln7ga4+lNOACIX0
KWOAX+gccpvoz9qVCMinxbEkbkEZxh5GH+wT+u4KDZRlBq+khuh1hEgC2pDGwkMw
QNLKXgp87NN0NhLpQpBe26VNCqWh3AWCNnCH3ZHgu8wijox/X5lmsxpX+yYerAnz
h46CUyxNYOMCyybgLBlcXRGVe9DKthVNfOjhaXBM0cBe1nEhR6FGNmn/L0ceuVis
hx3XdRM65mb7v4IB/2ZtKcB+cfV5bijqGxqdmlxoDedtDqvQYtDBg/xWS2VHvBpD
uRbHq4uF17PBl1QcjuKlHnfz1T2A+PpM83e5Jqqe4Q63qCJnLdHDThRVqaBAN50c
OEr5GRNMnHsUYAV1ItyrGTj+OMoYOsHHUiesaI2hMncs9P5Gd2E=
=gBT4
-----END PGP SIGNATURE-----

--/67QyQbFSIL0lf1y--
