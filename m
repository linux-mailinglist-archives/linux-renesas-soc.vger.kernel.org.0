Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82823890C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 May 2021 16:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242711AbhESO1U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 May 2021 10:27:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:49628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240243AbhESO1U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 May 2021 10:27:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCFD4611BD;
        Wed, 19 May 2021 14:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621434360;
        bh=6yfdFVgTRSm3LiFgn0MQ2bYc4DYpvun17cnYBqZ0po0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bVDzAPD17U8TZ7Bz3V6QJiduJoagQ7QcsSdO/BSjLz7KWTnpa5iVe9R98WccROWwU
         Gu80MgVPSwZo4NygXSTHe+uGwEFf0J7pVZMACfoR8PvROJnVmkUv0RGlJUNsEmrR1U
         QRZzeVT2b4DpeiDwgYHmEQfz+cRc2z0JgT8N1tuEZMxFh6iyqS/C4VtGwFw76Zw3X1
         sUDcI1QeMBEez7O9KVFENU8PhMRRbDxNPb7rc0qvqkDApCBL7AlUuvRpsKXHjyVDVy
         Cfoi++iG2FXNsCra1m/yy3X7wMZH5vLPp0IWP+rJdSLx0aGDVEVPsDbp3flcBRCXq8
         bRpGBY/h336Gw==
Date:   Wed, 19 May 2021 16:25:57 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
Subject: Re: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Message-ID: <YKUf9TVcKetApd1J@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9gvrP1qfpxRahseQ"
Content-Disposition: inline
In-Reply-To: <20210514155318.16812-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--9gvrP1qfpxRahseQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Uli,

On Fri, May 14, 2021 at 05:53:18PM +0200, Ulrich Hecht wrote:
> The TMIO core sets a very low latency limit (100 us), but when using R-Car
> SDHI hosts with SD cards, I have observed typical latencies of around 20-=
30
> ms. This prevents runtime PM from working properly, and the devices remain
> on continuously.
>=20
> This patch sets the default latency limit to 100 ms to avoid that.
>=20
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Well, yes, I can confirm that this helps wrt the "always-enabled" clock.
However, when removing UHS cards, I now see this regression:

[    8.659916] mmcblk2: mmc2:0001 00000 29.8 GiB=20
[    8.677304]  mmcblk2: p1
[    9.622918] mmc2: tuning execution failed: -5
[    9.627385] mmc2: card 0001 removed

It is interesting to see the "execution failed" error when *removing*
the card. Before removing, access to the card seems fine. I haven't
checked further, so I can't say yet if this is a related or seperate but
now undiscovered issue.

Thanks for the work so far!

   Wolfram

--9gvrP1qfpxRahseQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmClH/EACgkQFA3kzBSg
KbYNGhAAoeW+mQOJt9GrEDU3PzlG21py9TLWf/+zFylvZ496n8/PjjiUhAlfrQyB
8H/0TVPhwnql952CNljp7XTlvwrVy3I24EpdS67PXSPr5G73ZEDGEOcs70A2XDnn
WZTgk2s08KEnxOjfezStkHpeqs9VzpN2N1Le1jme7VniBQDlwAG+2WF2yk/UiQy3
gmZXiT74F/a51L/+0Gz0P/WLwcVvsXP5FhRI6ZzfP5Y1UB23Q0z80k/BRmm7DbsI
XZwhyPm3xinZsRg2Lr6H2vz5AZbRsbnN8PRa7MlsCIkoYBid9T31drOAfL3xS0Pn
TgA/MJ6f3TuhneKvtkt/Ue6vPmTPLlDdv0ngesIq3kBwKHofkuUqDNkw3s+JfOmA
hprFhPzqNilkFix227bTaxIHV+Ez0D45S2R+Q/gg2vNlEeryhdZ5pfkXBxQbJnTn
1DnKPFjNhuD7KTd3d9/jxBVacYK4aAqNlyzh0+o+qU0A1LZhTcNjDjcZlbxT2wdr
ok3OmIwDcULmaKl5Flmv1+06HeMa7kM/sP+78/AG/tNrVqAe1fHlHF/8/tllGbUa
i3/sPJhqDeKgT/BYCW5PcFdfmkvUOU35T5331oXti0WRbf0IYRpDaVgT2h/Q6C+k
LjMDFj2Hxx6qC7wFgfir0v3AsH3D8qrMZ6OepZKcl9JZxHaEZE4=
=0fIV
-----END PGP SIGNATURE-----

--9gvrP1qfpxRahseQ--
