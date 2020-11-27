Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E009E2C6D65
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 23:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729019AbgK0Wxb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 17:53:31 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:58666 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732220AbgK0WlY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 17:41:24 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 152361C0B8F; Fri, 27 Nov 2020 23:41:15 +0100 (CET)
Date:   Fri, 27 Nov 2020 23:41:14 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/5] memory: renesas-rpc-if: Fix a reference leak in
 rpcif_probe()
Message-ID: <20201127224114.GB19743@duo.ucw.cz>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201126191146.8753-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline
In-Reply-To: <20201126191146.8753-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-11-26 19:11:44, Lad Prabhakar wrote:
> Release the node reference by calling of_node_put(flash) in the probe.
>=20
> Fixes: ca7d8b980b67f ("memory: add Renesas RPC-IF driver")
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: stable@vger.kernel.org
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@gmail.com>

Reviewed-by: Pavel Machek (CIP)< <pavel@denx.de>


--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX8GAigAKCRAw5/Bqldv6
8uQsAKCF5JxFTCwkj5PdRoajSQqOtHrKnQCcCwC+vfH0K6In3vWCPtr9Z9dwjjo=
=3oT3
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
