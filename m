Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE6E5A4918
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 13:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbiH2LUQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 07:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbiH2LT2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 07:19:28 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4413974DF8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=rqx4smHd+iAsgBMF5sp0zWD7n5kz
        B2KdsVD2HWPjgrE=; b=fqlTz5L2b6WB5h9TsJp9O+R9U3d5Xb9yVGZaKPKrct56
        bNOKnd8LOuZOvV4d/dBijesvzqr5S9jtVUXiUHIPUOXCnoHRTYS2gQO5SJZCq8U3
        C3aFIEbTc9U4I2/13N2ILTaNhnaYr5HLNfS12E4xvctBBAprnFBcaDtaqpsQ1xY=
Received: (qmail 86280 invoked from network); 29 Aug 2022 13:11:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Aug 2022 13:11:10 +0200
X-UD-Smtp-Session: l3s3148p1@YMUoUl/nnLwgAwDPXyz6AKlRFcsoQyrD
Date:   Mon, 29 Aug 2022 13:11:09 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: spider-cpu: Add MSIOF node
Message-ID: <Ywyezf8tXUXjm8n9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220824103515.54931-1-wsa+renesas@sang-engineering.com>
 <20220824103515.54931-4-wsa+renesas@sang-engineering.com>
 <CAMuHMdX4q+NNf1Q=eRE3Qb8QvidJ5u_LZT8he+Aw76T45cmYWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gVcIk3+k+rdkdzbM"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX4q+NNf1Q=eRE3Qb8QvidJ5u_LZT8he+Aw76T45cmYWQ@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--gVcIk3+k+rdkdzbM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > +&msiof0 {
> > +       pinctrl-0 =3D <&msiof0_pins>;
> > +       pinctrl-names =3D "default";
> > +       status =3D "okay";
> > +};
>=20
> I assume you added this becomes Spider has an MSIOF pin header?

Yes, that is one reason. It has it on the extension board. On the CPU
board, MSIOF0 is also connected to the CPLD.

> > +
> >  &pfc {
> >         pinctrl-0 =3D <&scif_clk_pins>;
> >         pinctrl-names =3D "default";
> > @@ -116,6 +122,12 @@ mmc_pins: mmc {
> >                 power-source =3D <1800>;
> >         };
> >
> > +       msiof0_pins: msiof0 {
> > +               groups =3D "msiof0_clk", "msiof0_sync", "msiof0_rxd",
> > +                        "msiof0_txd", "msiof0_ss1", "msiof0_ss2";
>=20
> MSIOF0_SS2 is also used as the VDDQ18_33_SPI voltage selector, which
> is used as the power source for various components (but not available
> on the MSIOF0 pin header?), so I'm a but reluctant to add this patch...

Uh, you are right with the voltage selector. I missed that, sorry.
However, it is present on the MSIOF0 connector at pin 1. My suggestion
is to remove SS2 from the PFC node and add a comment describing the
situation?

All the best,

   Wolfram


--gVcIk3+k+rdkdzbM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMMns0ACgkQFA3kzBSg
KbZClxAAocDiwK4oi7VDXk9Cdu5dvKDYt2d0jN+Zdkw5bsem+isOZ9ZhDmgr3lzG
+ks9S/NPX/BIxqQ2qEWGI/4FBNDoUIQ/VU+73Hc8vSa8qEDqjYz2PG4yeBAPZcqO
voJ+60AN4Q5lPIuSQ8T2HJbG5ZVYZa29lGVlZ0SBakkXbVTqbrB8WTeBVtlFX3Uf
Q84rvlB7b+QCsUDnk8mDGYhKeAnALP/ALsSJb7cyEua48RsIVRHHJAmI49I7NpQl
T9p5cKifnIf3km1nEYipJsA0w2jxCLuIQinMRleVBxKdXlNg9N7uKpl+XI/zJODt
xLsisVa1jKe3fc68OwDocYcWxmi+aDSBSMVSWbbZxjr6eHqcBtpeH5gTglLZ9UgL
l+SkwQGem/n90gczIXYwt6BhwbcIQIDb2srtB02QAebS+f5pfR8Un1sWu9cusrGS
j52CkTIiuVSrHUVEUXhTg1G78ylo4nGdzlFmfrKJZ7BfLJmX2iGPPQ0sDPEBrHIQ
2xKUtbD5riMfwS87rIwrXMN5whdhuvArQLwN0Oeei4yeVoZ+SA/Ik7SYrnop55N9
TlS44WFsuPZGTrCcJEA4R7uYot6ZiyvG/sTzUtnqqoOABeHP/r4RoOC7w8diYfSM
0EgfMy+4Z/Hjo9xOFAkYIhQWGRaQIACfKHPGKaAWLGK8J6bXjaY=
=A+xu
-----END PGP SIGNATURE-----

--gVcIk3+k+rdkdzbM--
