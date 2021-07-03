Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF803BA931
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Jul 2021 17:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhGCPYM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 3 Jul 2021 11:24:12 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:39122 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbhGCPYL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Jul 2021 11:24:11 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 782861C0B79; Sat,  3 Jul 2021 17:21:34 +0200 (CEST)
Date:   Sat, 3 Jul 2021 17:21:33 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 5/5] memory: renesas-rpc-if: Export symbols as GPL
Message-ID: <20210703152133.GA3004@amd>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201126191146.8753-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201128114145.GE4761@kozik-lap>
 <OSBPR01MB5048DD433E56143A04961153AAF70@OSBPR01MB5048.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline
In-Reply-To: <OSBPR01MB5048DD433E56143A04961153AAF70@OSBPR01MB5048.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > On Thu, Nov 26, 2020 at 07:11:46PM +0000, Lad Prabhakar wrote:
> > > Renesas RPC-IF driver is licensed under GPL2.0, to be in sync export =
the
> > > symbols as GPL.
> >=20
> > It's not a valid reason to export them as GPL. Entire Linux source code
> > is licensed as GPL-2.0, so are you going to change all EXPORT_SYMBOL to
> > GPL?
> >=20
> Agreed not a valid case. That clears my understanding wrt GPL exports =F0=
=9F=98=8A=20

Actually, you have just acquired wrong understanding of GPL
exports. We normally export everything as _GPL unless there is very
very very good reason not to do so.

(The reason EXPORT_SYMBOL even exists are very obscure usecases of
modules ported from non-free operating systems).

Best regards,
									Pavel
--=20
http://www.livejournal.com/~pavelmachek

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmDggH0ACgkQMOfwapXb+vIH7gCeNMaIHxMthiCDl44FxLuT0mj/
C4oAn34uyHpIcHWzjY4zofQgs3Vu7Ncs
=KTFS
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
