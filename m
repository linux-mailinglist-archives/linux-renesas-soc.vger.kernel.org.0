Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC175B6BBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 12:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbiIMKhY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 06:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbiIMKhX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 06:37:23 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1760D5E33E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Sep 2022 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=TOhbtUdQoEnnvzK9ivpMolvk+0pF
        UTZpik7Hko90mLY=; b=xJo4/CRFfK/vpbU/NXfjDl1jwqKXPstizyESZKftlfar
        bL4wvEgXkOPfMZ+fBYpPMdCS9gGsLXKM6W73jnQYFqfmjTFi2WbNQBCvEPagEssX
        OMPMMeeHk1/FS+ieibgdZk8doyHYQA24MlISwC7ZrqGe/+4Bt7AHlDDe+nCJszs=
Received: (qmail 2101636 invoked from network); 13 Sep 2022 12:37:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2022 12:37:19 +0200
X-UD-Smtp-Session: l3s3148p1@GBC+mIzoHuJZZcFI
Date:   Tue, 13 Sep 2022 11:37:19 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Message-ID: <YyBdX8Bsp9cnuZ9e@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
 <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com>
 <YyBV1VDQZkyZ6Sq+@shikoro>
 <OS0PR01MB5922B00508A1F6F1B409AE2A86479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SHCw7+lk+MjdsKkY"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922B00508A1F6F1B409AE2A86479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SHCw7+lk+MjdsKkY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > Perhaps the "if (freq > (ccccc))" check in
> > > renesas_sdhi_clk_update() can be slightly relaxed, so it allows e.g. a
> > > 0.1% (or 1/1024th?) higher clock rate than requested?
> >=20
> > Yes, we can do that.
=2E..
> This is how it ended up in selecting 400MHz clk.

May I ask you to implement it? You have the HW to check which margin is
actually needed.


--SHCw7+lk+MjdsKkY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMgXVsACgkQFA3kzBSg
KbarMg//c1V3odLQBVdxNJ2/qtU+wG8/upvXAybzjixt8gw3+IHKyLocTEq/US0C
CodTKRX89NONbnfbX5yXUiTtxsuJNU8UwR3LstkJsq87dfrHvNSgaFIy7fW+fmlv
l6NTpjB237UehccmWXTM2Coy2BXvgmByLDgHGpKC0QMNQgi5nbg/JJ69+cCDs2VF
yQptOvP1NPbrKLiINHeo/JYg3cQAwY4nYcRMeFxShHXXVVOwB/2H9bz0RO5EHYVv
trNiolr6d9LpHmWn3j0fnuArDAaQ81t4d834xqs2xeDMlRUp2Yx6REEwmMs8Hs/J
YV4LPw5RDjWbg9aO/aju+E4ezO+5iiEoIcfLEfcFw72pWGdWhs+o6WjhU1uDroKJ
THaGMxz1RApbZQ7ej7wo5uH+QiQnN/8+8YeSp1ROFYmbftzZa9a6V1aSl5ChFsaS
2pQXcNX+mykyf7DRB+vh25hmDJ4nLcu+spPXQ40jhsXwtnKqqt0wTTcsM2R8EhOq
XA982tcpwFIvADki0I8I2Tk8suF9GBJ19A0gu2P97epbKQFsOdHyLA3CHbpwbEP9
ES1XSGpI2PIG21OTPs2gBNrlP7+YWKq+fkSDhesUPxT+Ha84chr9k6eICmv2GcYz
LYvSdYkTA+J3luEeBxtrEybLsF+Pc3/3eAhizrbALO3jn8wI0kI=
=Ewkw
-----END PGP SIGNATURE-----

--SHCw7+lk+MjdsKkY--
