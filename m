Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE4805F1A56
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Oct 2022 08:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiJAGmU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Oct 2022 02:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiJAGmS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 02:42:18 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E657925C79
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Sep 2022 23:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=/89nnS4Ca4Z9ELgqt6mLiZHkrrWq
        x7Z0teg6BVDd2Dg=; b=JvPC392QlBSi6u+Y/oDGSjAp0tE5XEU0r6v12zPZfH1T
        Lw5USGODj87CWvU2H+4/L3xLOVNF2mRQayOJ1QQJdrTSEEe2GYfRs3CRkhZAjHok
        a1jK2pXEAAPgFx4pkFqnX7liGlJParavvDX2ipUge7P55m+zBnrZ6i1oaA6p/Ks=
Received: (qmail 858644 invoked from network); 1 Oct 2022 08:42:12 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2022 08:42:12 +0200
X-UD-Smtp-Session: l3s3148p1@C2QGafPp18kucrO7
Date:   Sat, 1 Oct 2022 08:42:11 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5] mmc: renesas_sdhi: Fix rounding errors
Message-ID: <YzfhQ9gFgGbCafid@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220928110755.849275-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdU+0Umi1RiLxdR5MCV2FZvi7a9HuS8EFJtx7JksQBP4eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LhyXKQm22sMbRxbp"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU+0Umi1RiLxdR5MCV2FZvi7a9HuS8EFJtx7JksQBP4eg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--LhyXKQm22sMbRxbp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2022 at 11:09:07AM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 28, 2022 at 1:08 PM Biju Das <biju.das.jz@bp.renesas.com> wro=
te:
> > Due to clk rounding errors on RZ/G2L platforms, it selects a clock sour=
ce
> > with a lower clock rate compared to a higher one.
> > For eg: The rounding error (533333333 Hz / 4 * 4 =3D 533333332 Hz < 533=
3333
> > 33 Hz) selects a clk source of 400 MHz instead of 533.333333 MHz.
> >
> > This patch fixes this issue by adding a margin of (1/1024) higher to
> > the clock rate.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> >  * Moved upper limit calculation inside the for loop as it caused
> >    regression on R-Car M2-W board.
> >  * Removed Rb tag from Wolfram as there is some new changes.
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Still works fine on R-Car Gen2/Gen3, so:
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'll test this patch on Monday.


--LhyXKQm22sMbRxbp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmM34UAACgkQFA3kzBSg
KbbDsRAAmvX22ffiiTnFr1/d7ZhmEeffxj5M63kbRDb8RkkURGBAWkAkQaJG9blt
rKu0ueXSKCrxjVQu2ezMtFTednwwwXAMEIbjwkHEpnNLub3ZJcNzzfQaTfFGavI7
4u1xdUHUPM4+t4KaSHCRHOqUMxF3Aieru2EHfMY6yCyaFnuecb9lfXxmz9dmjqbt
0+74tTdJLZPiTDfA0BL1m3+njPfgNyB5gNfe0295cYOaxNuG3z7wVf4s+QQVhkPo
oxIoDNwRc7zjSPKQDwo56FhwXIZVj9lYtPWjLGt7NQUC5tHXsQD0t2oHPXIgaS6I
UT8dICrcXWe2DyYHi8H/QI+NzhhB96Ozl0jelMAWXKwKDDDzc3yKDi8NVZG0u6Ki
C4h91v3+xHJDECv2q8kQpRBf4Dav3d9qQu1haGeEWpjQiQP38fJgrZEyxvlapfZ7
RJ5tpQy7AO/Rhr3eNod+CG3e2guaBtDspSiYN62hROJLTVDXcME35L1TUzDRAr6C
9SVq+AUh+BrSQaE7nnpdQE7Z3Lo6AY7JNacAOlYvZCmBImau6Epi6Q2FSCanMicC
9cruWLYLw5RLLkKqrgV/2HKVJ8qyUMQ1bRZPoWwEtvAqoolfRsyXeo8eQWo97wXt
ODby7q6Cp5d7MVwarylbEWjTEs6QZIJvNGQoLeMwFkrd54+/B9o=
=h/pB
-----END PGP SIGNATURE-----

--LhyXKQm22sMbRxbp--
