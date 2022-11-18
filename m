Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6385E62EE58
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 08:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240778AbiKRHaj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 02:30:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235098AbiKRHai (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 02:30:38 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9690D7CBB8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Nov 2022 23:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=k1; bh=6BDMktOgMUD2ldPPkir2l4ux38iY
        3N/ETKWch67lsEU=; b=GJRZBgXttL1Nyhk4MzFT5+lnAME+jJNI7n4AnLdc4AIC
        GJpw69sPyxR0TPFQISjYX7jevfs/ooYyFAwRgOqx0JWG4huhKSkIe2CPPvOdyg1y
        NBJQZIusjziCxyoCUBnrdCoA41fITw33CzFkSN6Sy1gU2NsA7DMmqRhfU7dl8sw=
Received: (qmail 1625973 invoked from network); 18 Nov 2022 08:30:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2022 08:30:33 +0100
X-UD-Smtp-Session: l3s3148p1@9oszrrntXuFehh99
Date:   Fri, 18 Nov 2022 08:30:30 +0100
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH] clocksource/drivers/sh_cmt: access registers
 according to spec
Message-ID: <Y3c0lpl8zzKMnRPO@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
References: <20221116202110.1770-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdUVmapwN_OHpn4RtQebZCbEi3avka+2MuWpCk59g5UyLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="8JpcCzJFSc8JRkEj"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUVmapwN_OHpn4RtQebZCbEi3avka+2MuWpCk59g5UyLA@mail.gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--8JpcCzJFSc8JRkEj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> unsigned int (everywhere)?
> Yes, this is the result of a long-by-long division, but it should be
> a small value anyway.

OK.

> > +       /* Tests showed that we need to wait 3 clocks here */
> > +       unsigned long cmcnt_delay =3D ch->cmt->reg_delay * 3 / 2;
>=20
> DIV_ROUND_UP()

Really here? reg_delay is ensured to be a multiple of two...

> > +       /* We shall wait 2 input clks after register writes */
> > +       if (cmt->info->model >=3D SH_CMT_48BIT) // FIXME: Really not ne=
eded for older ones?
> > +               cmt->reg_delay =3D 2000000UL / rate + 1;

=2E.. but here it would make a lot of sense!

> > +       cmt->rate =3D cmt->info->width =3D=3D 16 ? rate / 512 : rate / =
8;
>=20
> cmt->rate =3D rate / (cmt->info->width =3D=3D 16 ? 512 : 8);

OK. I had it without the parens and it looked ugly. With parens it looks
good.


--8JpcCzJFSc8JRkEj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmN3NJIACgkQFA3kzBSg
KbbtJw/+OaBnqZ3Prp1Wp6hOVRwkBIcFE7R9LWVhXeNuobDLRfZZ/X6ueO0AY4PC
5K1F3IZwFtxjBlvL9hlUl/gKByjfVZz/MzRHLL4NZfCokz/o3u0T3tRsbTzCvvGo
Y7TnulaYy3PnaAxjBpHCU9/tLiu5TQbvu3u4k4yyP2clyF9uR+ZEcdQ37gymz2j+
mbCMMBw8SQBOeFDJAwv+CFNTzC6jpfTvv+0KBkWDyYb1oxBVffe+rYJMYGgaH0Qq
V2LgVvJa4aGxw0kqZqPl0mDx0fGFkjzws0ISq/v2kRdEuyR6fJMPofK0tcNd7L8x
M/tdb0ugJkyrNuh6CUhbeicPzPBZMUAm8EC7DN5nGObcdYtUPLsLch8iW59YK5ei
J89VIJgYhIfdP8Nakq7G0S2+j/g4mOFwnDm8zxELMcWHsdoJcEd7eYdq3bQF/ULq
RrDiV+OFJgH8KODGeKq05wu4RGwOjS36ALGrsxX9I+Gu1UDUbJw3IvAWUsltKCFm
Jr3ghflhoFvwrYcUaupt00duM8u+N5MAGgXC+xS9AuQQif8eXIc2g9DiLn8YvzAz
ztabBEuuhiz0IEIijw/c8oG2gN9hj6MANcNDjMu+rtWaXZzor7Prc+Gtp4ku3Vy+
5NvZqJeNailcJAbNsw9/vw2K9evjSgLANpeOCOnCankIOLlN1gI=
=B2A8
-----END PGP SIGNATURE-----

--8JpcCzJFSc8JRkEj--
