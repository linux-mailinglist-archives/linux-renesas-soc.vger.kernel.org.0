Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 133D542215
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 12:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfFLKPY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 06:15:24 -0400
Received: from sauhun.de ([88.99.104.3]:58104 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbfFLKPX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 06:15:23 -0400
Received: from localhost (p5486CACA.dip0.t-ipconnect.de [84.134.202.202])
        by pokefinder.org (Postfix) with ESMTPSA id 94F182C54BC;
        Wed, 12 Jun 2019 12:15:21 +0200 (CEST)
Date:   Wed, 12 Jun 2019 12:15:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Message-ID: <20190612101516.xrlvqw7cls7eiv4u@ninjato>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
 <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ubnrwpqkzxqqz7qm"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ubnrwpqkzxqqz7qm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> File arch/arm64/boot/dts/renesas/hihope-common.dtsi contains common
> definitions for the mother boards for both flavours (including the
> eMMC). My understanding is that R-Car M3-N does support HS400, hence
> the need for the property here.

I won't be super strict here, yet I think it is more elegant to add the
HS400 properties to the board DTS files, not the dtsi. I mean we could
add them to the SoC dtsi otherwise.


--ubnrwpqkzxqqz7qm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0A0LAACgkQFA3kzBSg
KbbbABAAnmgC8ly7+YRT6ZDRmSAhWx6azitJAMB6tEyklT8JVLVv9u0XKIf+JPCN
9Aaz9kY9dTaeqYp1/EiKdIvG2Zn/BKvhTiRmFTeIea8x8TIDC+yGx+HtoB+m6wt+
UGJ4e+k3ovpBMmDkLaOoQF6Qqxl/vzgP+rHiBpuNzv+UdPsuMKWV5f7LwLArcoEq
IsZYTJOtMFHzzLVyB37UglTZLHwtlgAH+NyHlyGRNhOO4G7jZvP8Ckvb5cMniSJK
28+wtTF6fkgP1nk6DQV17R44GJ3CPv7BQ3T5taN8t+Ax2SCdBQlVUoDbSQakE5ue
V5TdQd96BdHoQpRbpNhpeNscRfEK0BpY3G579CSH2ywi39oeJ106CtFjDHo9UJnb
rCD9alPSs33yGdsxM+JBk+LP8K+p+CBrEXfLTnp8iZvDVwCjgEyEtkquFD9OhPCq
0cYYhzdnVNfzXLAjujnj/FWuclcwQgl1YXwzbHMfWHXvT5RV/PB4n8eIvlYlHDIN
K8kRuyvLHsSFznImDRBzLFAe0NcBbcijaq8djBnfpaN56ki/Rn7bcW01Grj315Yz
CEsnduK/NK8MHaJhlyawK+0Snu4TsvBToxEUJ3sa9z4DEFZni5l6MjuKo782nJK1
cI2CBhBLp86YkQ2VjY3mtaLL34KQ5ghabULsuAJh9mofVASM9gc=
=tY2m
-----END PGP SIGNATURE-----

--ubnrwpqkzxqqz7qm--
