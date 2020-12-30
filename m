Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1D2D2E7AE0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Dec 2020 17:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgL3QFl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Dec 2020 11:05:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:50438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbgL3QFl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Dec 2020 11:05:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 904F321D1B;
        Wed, 30 Dec 2020 16:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609344301;
        bh=gBbnr9r37JVrNlMyM4z2nHdnErUf9y39GYN7T0BG4c4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=niaaa1ZTSzD5knhYoAW9ZVz36dqmjXVOlkbTR/GYbDZnRLKatfQUhRR+AVK5ikGH9
         UElopiIGhGCe3bXoKyTUuTF4lRtKiifKxl0gGLaDk/2/PDRHvu7h2f3C8qVJRfyR7g
         d3LvX+7wkYguFcKi3ZrcGy9A3Nk/KZIbTX4gdB0y8H3snUtlqSxgLLVeUAXeXDAl2O
         upHn32UvPdAgw6kqIvpwEe1CNgw5spS3gXHLbN+5WAJB5d/TZNRzBkviXeWgckDO8s
         aNTP0sFQ9ifbeyGA7BxQacLM1/2pl2BHCcmglqIJSRs0uQ32G8aFnx8ExhNdb4yk8o
         LjtbJ3KKEC3gA==
Date:   Wed, 30 Dec 2020 17:04:59 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
Subject: Re: [PATCH/RFC 2/6] clk: renesas: r8a779a0: Fix parent of CBFUSA
 clock
Message-ID: <20201230160459.GB23641@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline
In-Reply-To: <20201019120614.22149-3-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 02:06:10PM +0200, Geert Uytterhoeven wrote:
> According to Figure 8.1.1 ("Block Diagram of CPG (R-Car V3U-AD)") in the
> R-Car V3U Series User's Manual Rev. 0.5, the parent of the CBFUSA clock
> is EXTAL.
>=20
> Fixes: 17bcc8035d2d19fc ("clk: renesas: cpg-mssr: Add support for R-Car V=
3U")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/spSoACgkQFA3kzBSg
KbYKJA/+LwiEywo/96fTOMAHzA9Gh2aHW2iV5uAT/meuvb4CQevOiv7WtDHFl9dj
+Tv3ZFMYb+FwpbTkUjPaKEMVXqXcoumP0bO+Rzqxizdm4botCZWyCOzryR6danY5
pVt4IRXWBp99DOnRhST19uGsLpdghlvBFpAzXm/2bayGPjnf/VwigxiyUh/gWrsM
3tMKPNzW4zz2MBOrSvbNF8pZ0DRLyiQJKldtpQuFxQmlUqUtSZwNdAhZFxgAXpV/
Cf/tHodxgNBl34t2cF4Fe8tO/ISwB5BCVUwlhJc0PDlNtiZzLoicc29JpJdRMbxw
xfsbShpy7Ne0L23H9yewyiBoGJ/f8y0tfyjR852SgNObrnKuXDE4e1B7vKjkgA0U
HpfkQJJjAaahUcA/EpVLRzD+oefV0vist5DaITVEPWRq5uejZPuUlrBx0T2foOeU
QklSepkn0teU99ONELSsmwtOqsFRKrW/QhB6JdOaw8GxfC2LEZdWc+hr0AKj1swy
KyPkF+OtkzMGQABrA7KYrIt3n93oKdCdQuBj6J6xGc4eAqdHcQxSmiMQAkXVS4Lw
LWfECxyqwHOmO+XzUQrZKG01IL/1KgiwN/G7X+W/qPHrgDmL4xuYzTJvyxRkLgP/
d3BeUh0r2s3piHobk5SQ4xoUyahYuSWuTp0Aa9DeshNIRw3FtcY=
=atS0
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
