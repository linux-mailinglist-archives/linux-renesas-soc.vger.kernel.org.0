Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB0C2E7AE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Dec 2020 17:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgL3QGq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Dec 2020 11:06:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:50740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbgL3QGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Dec 2020 11:06:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5BF421D1B;
        Wed, 30 Dec 2020 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609344365;
        bh=UpqNGsG+wja/cfpuYPIxFnaBgFjZdxSZs9FId9QevGA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z6IVsEkAJ+7ZS/Xuw3kBQNGMChUfW1WIeBqNbIyXqOK6emNcMQwf3/uISDSCYVmQE
         X7xKiBJAkUCbP6QD0374ZV/yw+AghDUdSGZ1CL8HfqgAQj2Xboh2nfEfsFucKjqEvk
         KXCS3SrMw0HrpwpkacGAMeQDJ2UQgRt8N733wmxo91cvgVSyY7+kiQS5OhLs7+uT4b
         jWxZ2tBG/QD7A0qfCBDnDs7aT0rvOynrXYDeHB9/YbntdIpz+GQS4QkkrAYvVDKyYQ
         Wv9lOzvvmQqVDcew2fuTQlJ9WYUj1ToaCjGmkPI7o3zMISHZKvpnwMs3G9JmOmu4qx
         FOe6FsCqmJQVQ==
Date:   Wed, 30 Dec 2020 17:06:03 +0100
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
Subject: Re: [PATCH/RFC 6/6] arm64: dts: r8a779a0: Add GPIO nodes
Message-ID: <20201230160603.GE23641@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org
References: <20201019120614.22149-1-geert+renesas@glider.be>
 <20201019120614.22149-7-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ey/N+yb7u/X9mFhi"
Content-Disposition: inline
In-Reply-To: <20201019120614.22149-7-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ey/N+yb7u/X9mFhi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2020 at 02:06:14PM +0200, Geert Uytterhoeven wrote:
> Add device nodes for the General Purpose Input/Output (GPIO) block on
> the Renesas R-Car V3u (r8a779a0) SoC.
>=20
> As there is no node for the PFC yet, all "gpio-ranges" properties are
> commented out.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ey/N+yb7u/X9mFhi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/spWsACgkQFA3kzBSg
Kbb1zg//RYp2TvfejzlzQsnk7JciDjZSphKlA3FrqEhDxJZUvUYCKBDC8mN6cXFe
b7JIAnEt0Z+TtsOZerIdlKFazJjpBc91jtqA1IgRxtYd0NOC+vqYwVPITtuiISzR
EXogB/mIQott6A9sizOPH20MCR+8OFYYoGegCJPHiKfWdfTVXaQ8rJ9pLlpHuR/7
FeVXYNLTbM7Z6n80vK7rmY7aW0JZQSDwShx47NRfMPX0H4t2qD7h/rzcKELLoSEi
S8lOyNwyO1SWup+GTma8T3JW4cW0nxIxFBPOEVfeI/nfmZIj3unbgekGhafFFnon
2DLWHFbLeQLKdJP0M+360eiciDOAVLchpvDAwvwz+7H/S5qPo5zxjAPYJpqHH60c
XE2dYRiGyRBW6PHiAjmswoMIkiI2DaC1ECYCb1ADaquXnZoOPzz7p6Mohbxnbh48
NCXJxaifBC17pAbteFU561oQuNMzByk5x33JiZztvFyV/MHbtgeX+UMZGcjdorW/
ewYbAKLgx7Mbc+NTsSeE45U4CNvOtzGmSKmaO0ijZRilFxAWIMgBq+znIdZVa1ns
Y2/4iwsni6N4e2HojFGscxUs5vCkHQ2dsJngUDAcMz2Q23C8ui6Z5frl6JJuFudS
a+p0R9bVfDNKg4A/oyThNsqz3OtPqIolFHUuGDTvXkdYHVbqwJU=
=wJOm
-----END PGP SIGNATURE-----

--ey/N+yb7u/X9mFhi--
