Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D533B7CCE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 06:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232902AbhF3ErX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 00:47:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:52074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230200AbhF3ErX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 00:47:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2D7D61CEF;
        Wed, 30 Jun 2021 04:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625028295;
        bh=MpUk3OYLLrhc3PgZfixiENrsTeYhLR3bRUUyRsso0j8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GQDfAOsNHCezM3alLXe0ZqFsDgRY6UGSI+J7BWkGgnjlLO1zrzd0rbtebJKz0gzlL
         gGdYsCTGtlC4rlmnoJqT4lBXlJgMH7vzOPNHy/l7j/HnpvtaHWbMRwSe2lT9zRUGUI
         VQqAL20hHrrtIcnZ2MDUj+/mNLxgYCwsClKaMCKDIDRPi98BSYqQl4f8l77/wmrxvy
         UjNDQI5J5PAfbRlpBsF59fQ5ue/Pb3/nEvv+sxYqI1PgkGgVhBwPkSf7V1W6/gMCfM
         QDETXDmOD+diJkolR0ZMms7kYs9dTT6ADCmwIzIS40KWBL0IsG2qHSYZvhAKEjsNeV
         /2OJmdIFi0r3w==
Date:   Wed, 30 Jun 2021 06:44:52 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
Subject: Re: [PATCH] mmc: renesas_sdhi: increase suspend/resume latency limit
Message-ID: <YNv2xNjvU6Ptddjq@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org
References: <20210514155318.16812-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fv3Q2RGIDfOHAIe9"
Content-Disposition: inline
In-Reply-To: <20210514155318.16812-1-uli+renesas@fpond.eu>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--fv3Q2RGIDfOHAIe9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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

Ulrich is right that the tuning error is just a cosmetic problem
revealed by this patch and not really a regression. We are working on
fixing this cosmetic problem. However, this patch is good as is and we
finally have RPM working for SDHI with it. I tested RPM and
suspend/resume and all worked nicely:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--fv3Q2RGIDfOHAIe9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmDb9sQACgkQFA3kzBSg
Kbaj3BAAnjOXYn/J9vqJqpZPVhTrwY7DPwxiiahom9vtrI53r/SV6Y/yEkd82vru
rFwRBZG6521xz919XOe6bAs0Zo6UtrkoQvGMKxxjrl3t2Qod9PRkAPmWJUDk8T4v
8Zgfya5prqzrDZ70Hg8sw6rXQV7E+JWmQd1Rx1AkhEBL75P0Ha2ElMnIB1qT/E00
hdDvVvbTWUsK4hbETRgc6yxpLgW3WuQ83JZQUpiQv1FYanyvoX2+mPbtNTHDczfP
fBvHX5nCjg/3AF3U9RDirOEdAoNxUqKFaMHeD8Dde8+DWPSrESMAcjoj9Z0Ufima
UAlHyQ6FByg8HFA3F5HExDkitxI99R6VOecKxf4HuNhmLxlCIrqz1uo3c4dS9WE9
kxn2yV8VIEtnPyfGlhdNs3rqzCJDogxguOvekMvNb8YuJ4ezOcP/xM85un+ZYaeQ
a5UkzrcYj7Ns5hJgstDh4Kw+nmaGBo/1AF8lVl9hm/0g8mqMeBUaCwrN+xnhbsyS
5fw3Ni3lB6CSoPjyvQDH7qZn7iJN22L5tW6zM2dsL41PkaDtejE/Hv/LUYIRnkHC
M2uI2llUmRJy5nOeQGfflEoySdc86PgBUCPjXgDJJqiaM4iL1JV4FNAffWUs3FC7
Eil6rrzhMXjD3RJ+8M/GH+T2lCCilUSQkZu0J8xTiCidmo4nZQc=
=gPKX
-----END PGP SIGNATURE-----

--fv3Q2RGIDfOHAIe9--
