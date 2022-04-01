Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC164EF761
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 18:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345831AbiDAP4r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 11:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354623AbiDAPpd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 11:45:33 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E866A01F
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Apr 2022 08:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=FEFxfssSSTU22YXch7aVrtelpaE7
        WagHES7sL502rZY=; b=Ziz9m6B1gzVQe1cPSM8+XVqJcbrztrHyNP2UDvUnVShN
        YuGTd2peo4vynJTtteFDOswuel+Y7bM4mTdxJaYN/LI2Pasebj+8s2WNjdk6fpuh
        wUcgUUtgi7xxCveP53JS9iMpewnH6/wni9mHNKzxmVB1fvnRI4siVf6YTqbdUiw=
Received: (qmail 784814 invoked from network); 1 Apr 2022 17:20:50 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2022 17:20:50 +0200
X-UD-Smtp-Session: l3s3148p1@s/7hUpnbNKYgAQnoAGGbAFirbAEmXd1u
Date:   Fri, 1 Apr 2022 17:20:49 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/6] mmc: renesas_sdhi: R-Car D3 also has no HS400
Message-ID: <YkcYUatquGqQHynX@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20220320123016.57991-1-wsa+renesas@sang-engineering.com>
 <20220320123016.57991-3-wsa+renesas@sang-engineering.com>
 <CAMuHMdUso+a2UqMTZByGQryj+GvT4go4GB9EOM60D1Ue9oMi_A@mail.gmail.com>
 <YkcTQCZceQcRQo5A@ninjato>
 <CAMuHMdWDPncJ7Rny6ZOxbgUMnTJPzyu6kmmYUUPkHVfuqi=7NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zRyTQKlt48aTGFvG"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWDPncJ7Rny6ZOxbgUMnTJPzyu6kmmYUUPkHVfuqi=7NA@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zRyTQKlt48aTGFvG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> BTW, SDHI0 and SDHI1 don't have the DS signal neither.
> Does that mean we never support HS400 on these?

Yes, those don't even support eMMC.

> We do have SD0H and SD1H clocks.
> Upstream DTS uses at most sd-uhs-sdr104 on SDHI[01].

Yes, SDnH (and SCC) is also needed for SDR104.


--zRyTQKlt48aTGFvG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJHGFEACgkQFA3kzBSg
KbaiMhAAlPO2o/VoeXigCGmDrnKFz+QOl8rQa0+s/+yjT7mvLmEs4G5EmaYweRcv
tiVcMjYqGvj3PPK2/B/k50akz1SxDick2KrOOShwQuUb0amAcX8VwWAWIsaQG6Eo
cDMKsYGZqSDtRSVTzu/8A00zMzLuL3vi+4QK28XLnScJj385veRq/EP9k4qaYpmF
sh8EJ/C2J5Weq3REDSxiBD3CYMRurxlsPtyqjOj1Ld0mFlOza/+jN0Befrafg4rS
yoD5TmKVm/bOgxMZBUx6g9eTyyYqw94nHnePXt6iDYSp5wEDCGeVMyGQ8SBdA8bG
MveI96dExvS6Gt8RTBbhAVyA6Qi8qtkKPP7vPzRV2X8+71TpqmyO2Q6gt8cx25km
3ED5w9JTwqrInqteaYYO8FIA1reiWwYmr4SL7cL9WthLmcWstdLhwDjfXbk6DsCV
Ts7+PO73oqVuGaaStmVlezDyW9N71Xy9h92qtn/qXrZOxOcoZE+dyrHXPis/Eu41
YRUBbgJnpvFxbQ1xkAZrNrDyExbJSf1WYI7IkDsYpQnNgGyE2DEMXNOD/vmy+iUJ
zPw90FMCKs9sL3AX9ReeHfI3zXfVUHoIYeZOtuIMxrp1LgJ7tp81d2xfkOXSrSEv
0dz9c7aw6cYjMD+jZDD+zewIGsasYSrWY7S6EYvrOzfJIsZwN58=
=UH/u
-----END PGP SIGNATURE-----

--zRyTQKlt48aTGFvG--
