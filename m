Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E142E370B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 13:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727044AbgL1MQL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 07:16:11 -0500
Received: from sauhun.de ([88.99.104.3]:42092 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726847AbgL1MQL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 07:16:11 -0500
Received: from localhost (p54b33d88.dip0.t-ipconnect.de [84.179.61.136])
        by pokefinder.org (Postfix) with ESMTPSA id 99AA62C0509;
        Mon, 28 Dec 2020 13:15:29 +0100 (CET)
Date:   Mon, 28 Dec 2020 13:15:24 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 05/12] pinctrl: renesas: r8a779a0: Add HSCIF pins,
 groups and functions
Message-ID: <20201228121524.GB10822@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        hoai.luu.ub@renesas.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
 <20201221165541.27679-6-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline
In-Reply-To: <20201221165541.27679-6-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2020 at 05:55:34PM +0100, Ulrich Hecht wrote:
> This patch adds HSCIF0-3 pins, groups and functions to the R8A779A0
> (V3U) SoC.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for HSCIF0


--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/pzFwACgkQFA3kzBSg
KbbiYQ//av3hvQj7SFJzhoHAwrFdk99fuG2i8rHCJogLQDzMo3YUWBZeU1Pc0qI8
VeFLr0fnjrlIfaCgtgztr9K3nUICYM7NHi3U8CH21ePPDed6xVKz388QwgbSXEUO
rJlBt6ROPEwHm9rRoeRZ1btsZAqf2e8t6afoA3QULVNQdLLCgUJYFJGfA98E1Irt
d6Ez4dOYBPuPQGYvDvDizAzVgTPCeZScrJsjEdZ0/e1RDrJlSMgL9fZZt67yNK1g
8eS0ZBXYXxivMQBTIobS8YSYtCC4Od0lOG0UUFsdDdekiYdLtpqaVihbTYEJhtmN
tBj9+Nny7pd3Rleq3aT1p4nI0hhuJl/mGwrg5wHrBAjEEa/3ZPvrGYY96/HcmbDC
HgNNGSW8BiC9O3mjDUK9ww3bXMqWiuzJAA9KqCK8m+0HfaEEb1QhRin6TqrHdafU
V522yIEW6SB5EAXgSfTyOKgd8WIudgwrFzT1HZ2vi/ICjnZI1b58HC1M7esMcxyh
lW9MAapr9s+m05e0AmefZHgj4q9GuuzUXJKYuUb2kgHMBcGXO183rswCNT7HZPeN
FixLrqYDWoNYRLozNPbPG1OS64A7x/WvoLdY+Ew/j0E2g81DPFbjgBjMP+GhMrTV
4bp3UMtK2qeIMLfCKuELHALbF9kXnckbu03e7KeUOwCMYrHdj0o=
=U5lA
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--
