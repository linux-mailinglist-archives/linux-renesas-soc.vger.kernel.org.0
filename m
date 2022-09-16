Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 391D65BB248
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Sep 2022 20:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbiIPSkU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Sep 2022 14:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbiIPSkT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 14:40:19 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16483E742
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2022 11:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=0+F515Z3weuzFzgjfh7BOS0gg0Fk
        s4C58c1ehzBB3ns=; b=cjJ4ScReTx7oY/cnOZpFRmxyGkISpJkB2X3CjDVH1ig8
        NKQfBaKVFmnl8MnKzF2vmeaEM1AtJjBjkNBdQHCx8zDYNxuS6JeqjU+TbvIgpUMc
        TwQwOTSx1NFImCQiJIqPIe6xE2d1TkaUTTvFcjSiEJuBDpEshvKBpLsHPhiSJAA=
Received: (qmail 3500957 invoked from network); 16 Sep 2022 20:40:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2022 20:40:12 +0200
X-UD-Smtp-Session: l3s3148p1@akUJsc/orrdSjfsd
Date:   Fri, 16 Sep 2022 19:40:09 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add margins for main clock and hs
 clock
Message-ID: <YyTDCeL6FXB4UdKE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220913161506.1817432-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWLRyW_6oTxK1eWXoJ0e=XS=p90yQPHB7kJANTj5Xk9vQ@mail.gmail.com>
 <OS0PR01MB59228767EFF2C9FA75D01B9486479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922BA53872389BBDBA8A72E86469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdWJ+2VHe1--FrzaekSe=Wfn63GrGvpdjZ3uUUKacV=7Bw@mail.gmail.com>
 <OS0PR01MB59224F0CD24972487904C29C86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922B3C19E9806BD30A8FAEB86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592274E1073EDEB237A615B186489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="h0EXZZ9iJf63wJOy"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB592274E1073EDEB237A615B186489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--h0EXZZ9iJf63wJOy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Biju,

> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 6edbf5c161ab..539521f84e2f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -128,6 +128,7 @@ static unsigned int renesas_sdhi_clk_update(struct tm=
io_mmc_host *host,
>         struct clk *ref_clk =3D priv->clk;
>         unsigned int freq, diff, best_freq =3D 0, diff_min =3D ~0;
>         unsigned int new_clock, clkh_shift =3D 0;
> +       unsigned int new_clock_margin;
>         int i;
> =20
>         /*
> @@ -156,7 +157,9 @@ static unsigned int renesas_sdhi_clk_update(struct tm=
io_mmc_host *host,
>          */
>         for (i =3D min(9, ilog2(UINT_MAX / new_clock)); i >=3D 0; i--) {
>                 freq =3D clk_round_rate(ref_clk, new_clock << i);
> -               if (freq > (new_clock << i)) {
> +               new_clock_margin =3D (new_clock << i) + ((new_clock << i)=
 >> 10);
> +
> +               if (freq > new_clock_margin) {

new_clock_margin needs a comment explaining why we need it and set it to
that particular value. Otherwise looks good to me.

Thanks for doing it,

   Wolfram


--h0EXZZ9iJf63wJOy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMkwwYACgkQFA3kzBSg
KbY+1xAAlKn/PVxXaJenOz6gcsKMruXSoq5ZOn0OX4sc1VASS0N/67cdfhr7a4Pc
dzTIjqs2ZyWUHFb1J1/ThAb7XXguErPN8ZxmwYMEbjG4xgRtZvcJ9a/PZlX6EDT+
yp+JEOndQ4mBwIooXob9pc6ymjCtBhp4sDAyMKpiqzieNfOQCt1ly+qBySV3XO6a
huTq+QirAzR3dx3ZF1eA9yBiupXYLPkfGwJW/KVEq3onr/kK6i4mbDiPc3Ekiezs
FOuA9U52WyMrsF4rftrdNDhTcPl73BA9EaWLm+Ipdt0pzTlYOMHBDqCmkun27uy+
2bOzMszkF83KF0s1aMjvod5pCddK0D2F5OntBdIcrR1EIkOrpQSXMKG8ch5xMG7h
+g2M0Itw/x8SU/GVupGWDNCsx/6WUyFvZx+0LaWkqVctDsaayOstuCxzNaVZgNdh
SPvQri/WwxBX7Z9cBGyOYye6FXnDfAXw9iqut6UQhE2YcnyYLv7v8b+odCge9ZX7
Gqagaevm3cg3nulfL8/5Yf1QCRP87TJW1htDwcRuRof4eyNaxYyjqsQe5schO+EA
+LGdeMXHCLSzKzwjcCwzJQA1+/6sXROuXEUmekTT5/FZ5MEsskxqeJ2ifwyGreDI
MgvzGF89a0UfkLc+EI46f/Czs9PaRZA7taR+0KEcCkAsvOThGsg=
=nzdm
-----END PGP SIGNATURE-----

--h0EXZZ9iJf63wJOy--
