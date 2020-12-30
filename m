Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEA152E7AE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Dec 2020 17:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgL3QFy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Dec 2020 11:05:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:50500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726185AbgL3QFy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Dec 2020 11:05:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DEC9221F8;
        Wed, 30 Dec 2020 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609344313;
        bh=alwvyalSzqkwueIvgNTDsXp8ft+mNhk+UgAyYGvzG5Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KMsLd/6FZb4Rv4xQQCKbiDuzIhkuS991o2YFOpiD7pjULcwhRAwfGisFOWRUP0CO3
         EhEB/DeEKygBHb6AxEwGy1KPKPgq771KjSbiQy3cTcjGetF7qigJ2Wy/M0E3iIop6x
         8MO14vMX4SSTYZWnPyjpI6eaXSa6n87RSNk3wKjauWFeoMcO88FoFVerHEizEFyefi
         66lVNFDC9l/G0fvcdlWd/NgYepPcLoLPxWrpOeogiQhs86VdLF8lq0g/BSL1wOCMH8
         3XrM5XY0ene3Zzsd4SKQp7f5bnWOIiKmPJCUJVy+ssJpzq0e7sfwf/U6VjRUWdN9G5
         xgK5V1YqwQIyA==
Date:   Wed, 30 Dec 2020 17:05:11 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
Subject: Re: [PATCH/RFC 3/6] clk: renesas: r8a779a0: Add PFC/GPIO clocks
Message-ID: <20201230160511.GC23641@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Pk6IbRAofICFmK5e"
Content-Disposition: inline
In-Reply-To: <20201019120614.22149-4-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Pk6IbRAofICFmK5e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 02:06:11PM +0200, Geert Uytterhoeven wrote:
> Add the module clocks used by the Pin Function Controller (PFC) and
> General Purpose Input/Output (GPIO) blocks, and their parent clock CP.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--Pk6IbRAofICFmK5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/spTcACgkQFA3kzBSg
KbZywQ//agtsEKvaIn3QCLL/T8JKV/xAsMhehXIi4ZsCumVtTgeMqrkGVQ9H74ON
KvpqBd0PLROXcjxlmCq5OHGHWCsh+zMJUqKWt/poQ+4Ygcatg70KqSwFDn7NeiMe
4YacFOcUXHXtxrFH61zpdiZUc+xxdNJbuhwWcYzYyoIWBK9W9wewBPlRlTNihtiJ
scciLmkcHGdjEI8asOk7urSEo4juhppX4C+skfrvzyJeFVPWUnRGeaF/oJUreoHO
Zt9otq0v3QdwmG5OEkQW/0OfGO2npQsxpx+EhGo23mielddPLdAWmtQ5I1h7h1PH
SdkvBVXhGwK2euEiLmo/SoPkWj5fB1/w9oIIpAXic+x853EJ2ZZXCag4Iu3DiFxR
lgHLTGX9QNWAC/ZVD95v56XcXvwy7WsVneFs56LxU0iMqIGzmy6N+72AWcTCiJgB
vsSWF3pO5onBOtU9KeCf+yC2N7wJzQsVUQvxtxOQ80OfHLZbajG/vXfhSzPyabZM
8WokuVxdpStDir5A0ecMHpBaYgC1ScKVTQga+htFcF+9Fug14gHUKU5FNpjpE75h
2VHvpsP0MR5DVJTy+cPsTia2YgQlh+QG2Y3i1MCpZ5b1oaFnuVoDVU3NorlEvWrE
3HBsvxm3IbLjLub6wfmkcOOXN1tuwmnQKkwybGxXSkxdG1py9tI=
=+hIS
-----END PGP SIGNATURE-----

--Pk6IbRAofICFmK5e--
