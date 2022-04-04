Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56A374F1293
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 12:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238223AbiDDKH3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 06:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355082AbiDDKH2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 06:07:28 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD693C4A0
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 03:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=h+S2GNuODYiqZrSl+P93MBMsEOEZ
        FlsfIZBrpSPFD2E=; b=zqtEpClHQD1cWVWLRAWQ0/G8KKVDjZ/ORJwjb4MU8kNe
        2cDVvRltLj/k2W4OmYjtrjOanXW0TspKvyTo74y0/KE/U0O3j3xzv0TXyKBtbanR
        bNe2OfWw5ObxD3AuattJSWtr7TwZjJWHLJgFB0epWjVsjDo9CVrC2Xh5Yj1tBAw=
Received: (qmail 1811985 invoked from network); 4 Apr 2022 12:05:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Apr 2022 12:05:30 +0200
X-UD-Smtp-Session: l3s3148p1@i8WoRNHbqKQgAQnoAHNmALK3JllQBOZM
Date:   Mon, 4 Apr 2022 12:05:30 +0200
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: renesas_sdhi: special 4tap settings only apply to
 HS400
Message-ID: <YkrC6iPhqNJ1L/bF@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20220401124523.42892-1-wsa+renesas@sang-engineering.com>
 <TYBPR01MB534124CB2EC22945D75C1737D8E59@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EE1MN+obPG+8mwuY"
Content-Disposition: inline
In-Reply-To: <TYBPR01MB534124CB2EC22945D75C1737D8E59@TYBPR01MB5341.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--EE1MN+obPG+8mwuY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Previous doucmentation was vague, so we included SDR104 for slow SDnH
>=20
> s/doucmentation/documentation/

Oops, thank you! v2 sent out now.


--EE1MN+obPG+8mwuY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmJKwukACgkQFA3kzBSg
KbbThg/8CwxkR724Vtq3y40xljcLVtgHRkC9ej6TJTETNXusbGVCJpvW0jmiAm1+
3WV4HyuiJ2lU/4yo/q8IsnCFYBJ9wdIU1vJUYHyJAKYH4K9qbYaP/uvuoL4wx61t
VICKLJcfacAbOFvRxajO1f1j86nxbVJp/ms409uUMl1R9aIJlg4EZKPmj/LZCqK4
JBtRtHjrpPulzlww6TkhyQZp9G+4W7NH9eD6gs3SmzvO/CeHtiw/5hlO/b5I/JPN
8thS1KZnrMu1lUzshPXgJ7YTlmmo8a3sXSimSd4O2FPu+A366ySvk6C5ayLJfT5x
UjhV9Jai6R1APBwBASIMa9K0Wg7jfrNC+72y0WmUhRrSy9GhFZ1GMdqIv4J5A1DB
c4XpWhZM74O5L4aTocIm2IuLDWsjjxg5R4F5HrrC5y3a8q3tskcJuPyVq+UtWwjf
t6TvwRhJn89RuVRxU0U9Iam3flzeqPu5N7P/2P2CwJHng/7+D1dObGavJru6Vve1
vtHMF6OZSuRZPjIpyMIQNS0oDhPw/YAi+8X84WERKtKF+pcx8EXAkDg23Js2ddVR
wfLO4/91nsxi7VQffTG1K4IFbDz790A8rZdrc/vphN7iEdQYIZhy6HAl2nrx6hJW
r2GJv17YiONe5vYfhPFuNVXGKoOhGQd4oot3Gyk6wr5yDS61+CE=
=NhPL
-----END PGP SIGNATURE-----

--EE1MN+obPG+8mwuY--
