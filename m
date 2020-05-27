Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77F041E4092
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 13:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgE0LyF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 07:54:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387528AbgE0LyE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 07:54:04 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6162D207CB;
        Wed, 27 May 2020 11:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590580443;
        bh=2FN6V2Bc8sz3AaUvRY4owSeT4u5WXLzsQVmPSMXVha8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qvmKG45Xosnox8Te7B624Cte7KiuLnU5FrbBGqe/V75wDC4vUmilvxjmPDH+K2A6t
         DQQQSpD+pPrYtqcp0bgyMnRuM4LRojGgmM5l76kr1C7y51VaL9WzXYW7bpAcL0VMGC
         rc/Zw+pvY2AfiATzLngm4gtvf/z/mBB+rPSOHqE4=
Date:   Wed, 27 May 2020 12:54:01 +0100
From:   Mark Brown <broonie@kernel.org>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        alsa-devel <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: ASoC: renesas,rsnd: Add r8a7742 support
Message-ID: <20200527115401.GF5308@sirena.org.uk>
References: <1590526904-13855-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1590526904-13855-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200527112548.GD5308@sirena.org.uk>
 <CA+V-a8v0i71MCTNTPVD3XHuyGZiVjzuCkCUnvoUczeMr416ouQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline
In-Reply-To: <CA+V-a8v0i71MCTNTPVD3XHuyGZiVjzuCkCUnvoUczeMr416ouQ@mail.gmail.com>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 12:32:28PM +0100, Lad, Prabhakar wrote:
> On Wed, May 27, 2020 at 12:25 PM Mark Brown <broonie@kernel.org> wrote:

> > > +                                 - "renesas,rcar_sound-r8a7742" (RZ/G1H)

> > I'd expect a matching patch adding this compatible to the driver.

> The Renesas R-Car sound for RZ/G1H is identical to the R-Car Gen2
> family. So no driver change is needed and  the fallback compatible
> value "renesas,rcar_sound-gen2" will be used in the SOC DT.

Then the patch to add the compatible string will be trivial.

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7OVNgACgkQJNaLcl1U
h9DQggf8DKvCvZ6r8V/Ss6bD4pHqL2Yyq/wR1ZpZO7bN5fhE1FxwBVjx2RufOMzj
osUhS28vEnDIrIBvKEvV6qdF5dEVBkh7VrYYCR4BqxINs5ByRsSuNuISAlK4v7pV
w36TNJlM0wH4uArDhqBNCKyEYB0Vkd49Q2VzPTG/pkgPj76r5vzOQRIvcp26rdQD
LY9MWMMc+8HYG6oQv53vlrbsdwTkPoG0rCvYJ76hcfBLXZmAYx+LkUHSswv/N2cK
lFY4ar8/CYY+/b5OowXlkY9w1VxlTY/BGwLeIo5igjjAsohWhacQ4G5deI4h/558
YKwwAXc16S+O6EIixNq4ljOwNBD5DA==
=PorF
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
