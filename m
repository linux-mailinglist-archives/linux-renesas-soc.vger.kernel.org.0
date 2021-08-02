Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F1F3DD57D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Aug 2021 14:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbhHBMRC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Aug 2021 08:17:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:33244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233609AbhHBMRC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Aug 2021 08:17:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8706E60F35;
        Mon,  2 Aug 2021 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627906613;
        bh=aruJN456iKjOdaui1yZ5IM6E3s2UHMeouUaIGe7Uk48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CwcNPb08X0tnsznd7v0rls02wmboPUEQKxkSgqpA2/qZT0hmfOwAQMi1MpeOBzbqb
         nLgVnDZJJ2MbLLSmZ3ntK54BrA0EaAZWzDboe/hR0wgasLFftQFIYb8mrEBeUsYpei
         p7Ft2WcLuWfOay0dOQ74mPphwrcYJSO30BmHMr215jdupNzafgC67501t0XdMPqP5k
         U4HxWXtG8TbQlqci2RA0hdUbK8n8fgtbQEdds2SQ/HWXKX43k4t61U++/OvBfuJy79
         W7GBcVa8jsmsNnoTxBm2SDkTh1H+e3wQhfdJbTJgtMz5P5qcuhozUkNrXH9AjyTFe2
         8PkB/Fp3BzZuQ==
Date:   Mon, 2 Aug 2021 13:16:39 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
Message-ID: <20210802121639.GE4668@sirena.org.uk>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <162767143674.56427.1812897829636885311.b4-ty@kernel.org>
 <OSZPR01MB7019905B23FA514DB08987DDAAEC9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kA1LkgxZ0NN7Mz3A"
Content-Disposition: inline
In-Reply-To: <OSZPR01MB7019905B23FA514DB08987DDAAEC9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--kA1LkgxZ0NN7Mz3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 30, 2021 at 07:13:24PM +0000, Prabhakar Mahadev Lad wrote:

> There is a updated version of the patch [1] which was posted yesterday
> due to change in handling DMA slave channel configuration [2]. Both
> the queued patches need to dropped.

Can you send a revert or incremental patch for this explaining the issue
please?

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--kA1LkgxZ0NN7Mz3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEH4iYACgkQJNaLcl1U
h9AmXgf/eDI3wHtrWjkrJbTZI9d/ge9btttmXn7UWAZyKt29MWnhLql0NzpASGfl
+vKH275BfwlAo9WUitiIO5oMTcpALZVYnHVKFAUXtLbgxXYGp7Um3fL7lrksUEDV
//Jnt2t+72+p22fsJbK13APhGvKzXsAgfaGBFB+1PZMnqTEtn9XrwxuUyq2d0BWM
1ZG4cQ4XcNZvrwuJAa7gtaWcIGX5TzgNJQ7C+IHHL9qxR2h0Pi365Ar2sSivRoJq
a7rJoHqVPjpI0FFs7xLUYowlKxwniR5/0cpgblvLqGMtrwO5qMwJu0rEY0llxknZ
FMRI7JEgDgLDiGUHE9qxIl2Es/q5Pg==
=zdRi
-----END PGP SIGNATURE-----

--kA1LkgxZ0NN7Mz3A--
