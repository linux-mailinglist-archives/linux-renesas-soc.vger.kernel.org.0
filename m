Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27338102DBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 21:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbfKSUr3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Nov 2019 15:47:29 -0500
Received: from sauhun.de ([88.99.104.3]:39314 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbfKSUr3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Nov 2019 15:47:29 -0500
Received: from localhost (x590ed545.dyn.telefonica.de [89.14.213.69])
        by pokefinder.org (Postfix) with ESMTPSA id DA19C2C0505;
        Tue, 19 Nov 2019 21:47:26 +0100 (CET)
Date:   Tue, 19 Nov 2019 21:47:26 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mmc: tmio: remove workaround for NON_REMOVABLE
Message-ID: <20191119204725.GA1454@kunai>
References: <20190917183652.7310-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVYYveVeF4+16vi8zk+0yVZMMJnMvKbLms7CbQ6w00uVg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

thanks for the report!

> Interestingly, this patch has been part of renesas-drivers since the
> 2019-10-15-v5.4-rc3 release, without real issues.

Huh, interesting. With which branch does this appear then? linux-next?

> Today, it was fairly reproducible, so I managed to bisect it to commit
> 7a7dab237027939c ("mmc: tmio: remove workaround for NON_REMOVABLE") in
> mmc/next.  Reverting this commit fixes the issue.

Hmm, probably we should do the revert despite our discusstion here. And
then resend the original patch after we figured the cause of this hang.

> The issue can also be fixed by:
>   1. enabling the hs400_4taps and/or hs400_disabled quirks in
>      sdhi_quirks_match[], OR
>   2. forcing use_4tap =3D true in renesas_sdhi_check_scc_error().
>=20
> Salvator-X(S) with R-Car H3 ES1.0 & ES2.0, or M3-W ES1.0, the issue
> does not show up (probably because of sdhi_quirks_match[]).
>=20
> Do you have a clue?

Not very clear. M3-N is not a 4tap-device, so this can't be a fix.
However, both disabling HS400 as well as using 4tap will prevent the SCC
error checking in renesas_sdhi_check_scc_error(). I'd assume the SCC
hangs.

I am working on an issue where the SCC hangs, but this has to do with
always providing the SCC clock (SDnH). I don't really see the connection
of that to RuntimePM yet, though :/

Can you test this simple workaround patch instead of the revert just so
we get an idea if these issues are related?

Thanks,

   Wolfram

=46rom: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 27 Jun 2019 11:05:06 +0200
Subject: [PATCH] WIP: clk: renesas: rcar-gen3: enable SDnH clk for HS modes

When switching to HS400, we shortly need to switch back to plain HS
mode, but we still need the SDnH clock, so the SCC of SDHI can work.
So, make sure SDnH is still active, then.

FIXME: needs verification from the BSP/HW team!

Not-yet-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar=
-gen3-cpg.c
index d25c8ba00a65..043ab6ed9d55 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -263,7 +263,7 @@ static const struct sd_div_table cpg_sd_div_table[] =3D=
 {
 /*	CPG_SD_DIV_TABLE_DATA(stp_hck,  stp_ck,   sd_srcfc,   sd_fc,  sd_div) */
 	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          1,        4),
 	CPG_SD_DIV_TABLE_DATA(0,        0,        1,          1,        8),
-	CPG_SD_DIV_TABLE_DATA(1,        0,        2,          1,       16),
+	CPG_SD_DIV_TABLE_DATA(0,        0,        2,          1,       16),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        3,          1,       32),
 	CPG_SD_DIV_TABLE_DATA(1,        0,        4,          1,       64),
 	CPG_SD_DIV_TABLE_DATA(0,        0,        0,          0,        2),


--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3UVNkACgkQFA3kzBSg
KbZOTQ/7B6eBJbnmW9Rru8Opu8vPDdch0in8T8HhA3VmDlu9P8ikTqY94IraLWKU
qoi472Zc7T/S+LdSBHSn7Qtu+VotuspSf2Qp0wEIs80P4B2rPtma9SEnHvwOw3VT
c0nYHP1278YLbxW3dbUHKN7d4mFJzddj46dhqgsUIgRXSqYlGrGwsQaZ/KefizxG
S9vgVBRwZZQyF5L0OPBQzREKpZV4w+BoZZ7xAjnq3hz0dPZUlymLb4krjoxb9bHz
+bGDARH4ppMVxJT32BNCuPXuQtBCrvaGhnLTReIuedHJL7K78Rx9uwQn4C8atAHE
LxZ0ohlPfYl6lgSnmn2c1iC3zWFLMY6/R3spdc4H4wZ1lJO2ipb2yK7nAnG6u/E9
8lGvQpHKXqiO9D3AgRFD1JGIsEySQJj51q/0C16PlVW0iyfCliEQuWsmTRAglShD
KasRjC9+/nMi+PvmFc7CFTQAunULCNR+XKcTtKJIyOctLZxzJ5hBbC+bjMCg1Ua2
veNdS02YeDbYBv1fMX2m4qY0+nxw+mOyVE/3xhR3pjDh5HhYkGXbEAw67SjEOnbQ
O9i+Gq2ZMdFRyN2QzMf6r2br3CTNjYPv2kgMirHeTOK18zBPQnRG1sKH6ueZlWmg
OB6pii6IMLK5n4A/tRG/b6EvXuoqFj2M05sS9G3x9iWAT0LP2gc=
=TgfA
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
