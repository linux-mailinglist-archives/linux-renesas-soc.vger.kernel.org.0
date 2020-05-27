Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B782D1E3FEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 13:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgE0LZv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 07:25:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:57804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgE0LZv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 07:25:51 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD7D6206DF;
        Wed, 27 May 2020 11:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590578751;
        bh=oU0Y/5u25huOd72JaBmNFl5U1KrJrZttts86TRQdAFc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NXm3eC/74XUS9k/zL2j5RrjTjlWlgrAMk2dRRne6SHvHh6vaV0IhcqR+WOSBg6g1u
         IiI7B9chF7Hd/V77ZpvINKa+B1SfRn0AI/7Ihl+avmo5G1yjFPXHczozSdNUc6inBF
         ZZLsgYDSrWG5OgQeNVFaqM/GCZEQUbJ37YjQUa7w=
Date:   Wed, 27 May 2020 12:25:48 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
Message-ID: <20200527112548.GD5308@sirena.org.uk>
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zbGR4y+acU1DwHSi"
Content-Disposition: inline
In-Reply-To: <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--zbGR4y+acU1DwHSi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2020 at 10:01:43PM +0100, Lad Prabhakar wrote:

>  				  Examples with soctypes are:
> +				    - "renesas,rcar_sound-r8a7742" (RZ/G1H)
>  				    - "renesas,rcar_sound-r8a7743" (RZ/G1M)
>  				    - "renesas,rcar_sound-r8a7744" (RZ/G1N)
>  				    - "renesas,rcar_sound-r8a7745" (RZ/G1E)

I'd expect a matching patch adding this compatible to the driver.

--zbGR4y+acU1DwHSi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OTjsACgkQJNaLcl1U
h9DwwQf/f7ybVQEernStDVG3TFsQK7/YunjNpnQ29AOR0oZ8z5Rx4bOF8GWRtBLh
NooWHgqGXUTPz33IDGptxlvTEwjH3GL+z8EW72NAnagxLCl1bs0IOjMvbDMLX0CG
qhvcgAr3oR+PVOZDB8BXvotNJ/hcF6M6kvdPd1LWTa2usE52u0dg1Zb/8uoYCWyq
calyH03qZW/1HxVgpjJRNmpeGrroXofyxLo5SSQQR1laFQgRxyxwiWAIWl5n1yO5
tcc80ocEq1fipR69xRCkQU0VrEFBHZIZwm1prHIxWD6PRfn/W9/0P50tLMfko5ut
fTPwT7eahVymkQkdtM++bNorrkfusg==
=BGUJ
-----END PGP SIGNATURE-----

--zbGR4y+acU1DwHSi--
