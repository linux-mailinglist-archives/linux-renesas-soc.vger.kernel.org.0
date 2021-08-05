Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A14B3E172A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Aug 2021 16:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238790AbhHEOpl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Aug 2021 10:45:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:33252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242042AbhHEOpW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 10:45:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97E9F61102;
        Thu,  5 Aug 2021 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628174708;
        bh=TvLn9ZuasSfXRw3iZBv/5f7AAqvlN30bFTdP484ThlA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CwCI7/3yyamkLk1Nfdrgve1VCG4NNGFzIItPKXBVZf1Fo6DGgUdGnLAlVY/8ogIWE
         szZKJ0/FUc4uYAI6yW9V72CC3WkUjt/oXS1vP4nAHwMtMzCaYvdT6bM+8ipDVx9UNt
         MhvSoQyUY5PWvweN3mEB5/V7WHSVO247OvCAyAH4t3x/+l0Cq4uHUfj96hGCaC0fDb
         4DkomK+cu1m4HF711LHdNFKaceX90k6yVZIkYcVplPdyxYm3i8NV16fLM413XbxAqL
         jzBUAHaqqyO4++4ijNralFJjKwev0qZ6NhJMc0qwS3GMoWXhtu101spK1VeUuwgx69
         YZKMIy3ZHWA/A==
Date:   Thu, 5 Aug 2021 15:44:52 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Add RZ/G2L Sound support
Message-ID: <20210805144452.GP26252@sirena.org.uk>
References: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dT+85zccSFkyJC53"
Content-Disposition: inline
In-Reply-To: <20210729172311.31111-1-biju.das.jz@bp.renesas.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--dT+85zccSFkyJC53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 29, 2021 at 06:23:08PM +0100, Biju Das wrote:

> Biju Das (3):
>   ASoC: dt-bindings: Document RZ/G2L bindings
>   sound: soc: sh: Add RZ/G2L SSIF-2 driver
>   sound: sh: rz-ssi: Add SSI DMAC support

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--dT+85zccSFkyJC53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEL+WMACgkQJNaLcl1U
h9DS/gf/SEn8sYZfcSYAo2NGTHR61NlHi3R1HIpFNOtn5bqM3XcXgM/jGJLFYQpp
avDf0natT/t1I0H/JCeWASeYYiAR9p5eLwsu7TiXahOKxOv4OwZrCrnKeW021Zve
h7q9AQDHZNvY8xvhmSVo0Ni8wM2+MAvxmCQTl7iDxOAmspFN464GhKhV7LmwSrab
8rfmmIWnc1B5Kvsbu4KFlP2e2X2qsTFh7aob5Nx4kAJTqnxU9XQBIPFgZxHXf8fW
g4NxUdztmehIMenvS7DC0dnYeg1FZWPSTF5dfgARWM6rP1xLVV5d1Syoe/nkR1Ap
tEaDkRtYL3Qdam0fVomHh1ZQXUWsLA==
=8gjn
-----END PGP SIGNATURE-----

--dT+85zccSFkyJC53--
