Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6425B6B5A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 12:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiIMKFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 06:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiIMKFT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 06:05:19 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FC81C925
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Sep 2022 03:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=XtEBPf5pH+My+FrJKHsY0t89YQ4O
        B+yz70I1kUtpI1A=; b=d8T55NlQPPXuk9AQJcb63ukBCGa5e+5OdhJSVSftImxz
        LlGMkdkthQCPrXQKGVBaWpJJCtizMjeo9PT5trSKB0joVPKJ2t7f+ilO0rfoKcel
        G+Wdns8LJOgRP3vpXzwB2FSNBKG4pKhgznH3kHAThJdeE4Y81CLs67yq8wmfs4g=
Received: (qmail 2090427 invoked from network); 13 Sep 2022 12:05:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2022 12:05:13 +0200
X-UD-Smtp-Session: l3s3148p1@iha7JYzo6IhZZcFI
Date:   Tue, 13 Sep 2022 11:05:09 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
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
Message-ID: <YyBV1VDQZkyZ6Sq+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HVNKWk6hhn/5bMum"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--HVNKWk6hhn/5bMum
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Perhaps the "if (freq > (new_clock << i))" check in
> renesas_sdhi_clk_update() can be slightly relaxed, so it allows
> e.g. a 0.1% (or 1/1024th?) higher clock rate than requested?

Yes, we can do that.


--HVNKWk6hhn/5bMum
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmMgVdEACgkQFA3kzBSg
Kbb/ExAAg2fU++qlIjvZgHuLRHIS2c1h94pn2/5q39QcPk2gwVKXQ2wA+SK8NmUj
tRNJOF9dxWfhVfXWO3kygEomskU6iRgm5s9hPjb9268vQYDz/uIVH7tZH12HBn9r
jmZhfBwq5U4bDJvqi1ccO7aUJRgEdIDQGNOimPZXtsqaKdsxQmiqVshMiddtAHJr
2c8ZJ5M4AEiWGgSsjT/Ggxd44BcKaaTm1PvoIIDW2j2OOJ84+qdK8fIGqJ1ttL6W
+B0oFI+J+gmBurmVUfs4pDDki3iNDqwZo1SRT/DMsPsyzn4B4Q8KMWzPeIi4nFEE
u3elU2LQ1Lske40iFVtgy0HXxcQ714Bb4mHNyhUeQwf2rPbYb2g2rvWyurayBirz
zui7YNs9aF4sqOb0uj2q1o0gwySVI8+TIhLNQFGNsUEraUYg3++9Y4bhtxdcCbCX
E1uv2BZvYhQqjTRzMmyI9QhUWgV89VPJtLkIItmu+KcAN5F/2jsVJijUNjpDEIdq
f63B4cuPYcO2aU4WOXgAyLnAPwslBEGy9HhdTvIyvng2FdDjrTaDbjX4CdoRAMpr
W7jKMKErGpyX4JqN79eumW0LJ2EuXXLqCOyajXyhgtTBVyl9FKtE/SjS+Ar9X9ka
jwEGUp/GntMdJsyIfS4gchKGvjUD+7ZSSfTiaqCn40lB+/tiu/g=
=36TJ
-----END PGP SIGNATURE-----

--HVNKWk6hhn/5bMum--
