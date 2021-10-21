Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BBD435E71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 11:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbhJUKBY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 06:01:24 -0400
Received: from www.zeus03.de ([194.117.254.33]:51448 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231334AbhJUKBY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 06:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=2BkjldVqIQHsO2/nJKSdoDqWxO9j
        oBWYCAvLIzZmWFY=; b=xEXqv0C8blQN4bmvQA4uhrh30wrprnSu2Z6tsnilUoCE
        RuRny0Xv/beEosSQ3v2v1vHS2tTxFHayfuLjd5875JlFu+Xw3rVx1cqZRGCnceUg
        3Atkvvx5MS92uonvPTKYFiQzw8HGUrXJnnQQ9IDBrzdEhtryfUcp4ohiAWMpjWg=
Received: (qmail 3297087 invoked from network); 21 Oct 2021 11:59:06 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Oct 2021 11:59:06 +0200
X-UD-Smtp-Session: l3s3148p1@MYbO8dnOUrggAwDPXwvHAFIqwjQGZDAy
Date:   Thu, 21 Oct 2021 11:59:03 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 4/9] clk: renesas: gen3: switch to new SD clock
 handling
Message-ID: <YXE5597s0BigDNzu@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com>
 <20210928200804.50922-5-wsa+renesas@sang-engineering.com>
 <CAMuHMdUdjNXkW-F0-aPR-o6uQaHsYz=yKf6RhC2tvxRpdhDzhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Fzu4nAS5Zwnu60Ma"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUdjNXkW-F0-aPR-o6uQaHsYz=yKf6RhC2tvxRpdhDzhw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Fzu4nAS5Zwnu60Ma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> BTW, the diff looks much better with the --histogram option of
> git diff/show.

Thanks, I tend to forget this option.

> > +       if (IS_ERR(clk))
> > +               return clk;
>=20
> Missing "kfree(csn)".

Ouch, yes!

> > +       return clk_register_divider_table(NULL, name, parent_name, 0, s=
dnckcr,
> > +                                         0, 2, 0, cpg_sd_div_table, &c=
pg_lock);
>=20
> So the SDn clock can no longer be disabled, as CPG_SD_STP_CK
> handling is gone?

Yes. I thought we can do it since we had 7f2c2f38c1c0 ("clk: renesas:
rcar-gen3: Remove stp_ck handling for SDHI") anyhow.

> > +       if (ref_clk =3D=3D priv->clkh)
>=20
> "if (priv->clkh)", for consistency with above?

Can do. I even had this originally. Then, I thought the comparison makes
it easier to understand. But it seems, it is understandable enough
without the comparison.

> > +       /* Fallback for old DTs */
> > +       if (of_device_is_compatible(pdev->dev.of_node, "renesas,rcar-ge=
n3-sdhi"))
>=20
> I think it would be cleaner to check a flag in struct
> renesas_sdhi_of_data instead.

Because new SoCs with the fallback compatible might show up?

> >          * Some controllers provide a 2nd clock just to run the interna=
l card
> >          * detection logic. Unfortunately, the existing driver architec=
ture does
>=20
> The core looks good to me, but I have to admit I'm no expert on the
> SDHn/SDn clock relations and the various SDHI transfer modes.

I am really glad you like the changes in general. And you point to the
reason for this change. All the clock relations of the SDHI transfer
modes should go into the SDHI driver. Now, we can control SDnH and SDn
seperately, so the SDHI driver can do the proper things depending on the
mode and the quirks of the SDHI instance. I really think the clock
driver part should be as simple as it is with this series.

Thanks for the review, I will fix the other minor issues soon as well.

Happy hacking,

   Wolfram


--Fzu4nAS5Zwnu60Ma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFxOeMACgkQFA3kzBSg
KbZJiw//adK1B2h5aFyw8G7OaJmbX7n06XvCmgVQYnyymMca1Y+CDxa70QxJgpY6
TY7dgsP+PcdAxaNrejM/V07RC7Zydj+G6wXY0IErHPUZNlCOdsfcBFIBStJx9itJ
atG2Eg4v58RTWd/D1FkEO1wk5Oh5q5aM6j2NCkzuhyQgvHfJNbQqu/nsLR5t3z8E
wHRiut5O+ncydxjHu/OxPxzODm7bM04mT2HSCPVzHZd9c3x8WL5NqJoYD6D4OEy1
XUdwBy7LAitynT2SR8iVSO5d/U4iN+5pyQVtxQNhv9MD9Oktg9WaH2NhPpREQ5sc
f+8DkKgzWv78tN6l0IoDoHtVoH4jMoElZJtZRBiajA2lQT6M3Kq8lzekFMsU4BgH
MctaPp8AYQW+SpcmUlJeyZV0xV9uidAuDm/Wi394QI5QBgDhBIZI3Txcm+dcfQKh
ap8dwbDa75dxYaIg0j+CqtnbcH1iFo5gN/WDNlkpqqtfN2P+JzJF8RNNiqCmV046
wJjCSXYMidMrZRmDK2ZsqpxY5kpzyzmtgCEPCS+AaRXpYFcV/NfZeRp1d7FjkUb2
Zesri9IJa8TG4oBtMg422gJYeiXUdxZQnBGzQJT/0GJ+z0KFGxwQaYLXsiS0euNl
hsOsDNFBq2KHfizZ7QmeJdi7bDBKEgr5X6AM6ElJ+l2TaUTmnTo=
=j0V3
-----END PGP SIGNATURE-----

--Fzu4nAS5Zwnu60Ma--
