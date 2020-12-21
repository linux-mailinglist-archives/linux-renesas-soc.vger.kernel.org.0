Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777AA2DFDE7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgLUQHe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:07:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:48224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725777AbgLUQHe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:07:34 -0500
Date:   Mon, 21 Dec 2020 17:06:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608566813;
        bh=rvt2O1Qz5N5TZMf0qNsbllRsLgNiV7JGyIZ4XUTUZbY=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=RpCYbFKlyb2HD4MQt2A/TTwtlVMrYpEoXbD3Wzaeb2a4bRHoISQnp+vdiOeMZXFHd
         ut+xekK0R1IuaeTpgMZdVtoTY+Cgg7mCqdeCnULbQEawF+65eFcGd92zxYBHe6WHlm
         5Vq8CB8Wjr/cB0oxqmV+fEVO9B4QDonW/PHin0J36Lcjf+95/g2xoWGZ2tX7fpaWOb
         My8MjCZw3zPIvceCA1P+KB+PEtgSLAJNySARMtU6l/jEQbVTmPDSWdSvSHLOL6xPBH
         LqobBeXqxUkqKOwjfXafdg7b0r6w28SCuSMlC9pBkDfUifTUW5ynV5mjdwbqFOmykW
         HBlPHnoxzCVUw==
From:   Wolfram Sang <wsa@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] arm64: dts: renesas: r8a779a0: Add dmac1
 placeholder node
Message-ID: <20201221160651.GC2585@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
References: <20201117090329.2128904-1-geert+renesas@glider.be>
 <20201117090329.2128904-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline
In-Reply-To: <20201117090329.2128904-4-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 10:03:28AM +0100, Geert Uytterhoeven wrote:
> Add a placeholder node for the first Direct Memory Access Controller for
> System (SYS-DMAC) instance, so it can be referred to from other device
> nodes.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Alternatively, we could omit the DMA properties in PATCH 4/4.

I'll add quite some devices in the near future and I like this
placeholder a lot better!

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/gyBcACgkQFA3kzBSg
KbZ5GA//eNJQDwIzz9/AYl+yiNjB7LORC+hFjF3N4dGJt/P3V6VKOWf7FhhXgQwh
aPGlIbW+MvkUhF8Y3g/V8Zkl0Lpp0MlGcanIFfCsTCZ9qwYGtPbAq1kSC6EJ5RPn
AVj88qH0xJSTpvPq/CLC6TYDieqX/lMvulUr8P6TOHS4ZbGTOWibmJ/gLzYs3Pn6
ZHFA70DFqzeV6ZfuuJ8ovW1aMSKOc+uerfdyn3OLKx69Qaxuv0NX+nlcUEh0gMQC
NB6GcD/FZu34yEPwSD2BawsxPFBd1WEAalNUbCGTcxhaY61usO6ofiUtzZIEKbC6
qaM/oJFi81/nEWCn+eosP+KEyqb8ufcz3iEfObvNv4sTmCB4n3gJv9dOvToDVytd
ziYUgZsEBaEPGnuPTcdz5TIG7qPPAw2phAfw1OCKHuYoTv/LXe+H7JjxbtfgQady
3vcw7Z1kXMZeKqfbZHD6DuvmFoHfqtpcFZqqyJr0RNpclaXtYNkPROaMhABRDJ3K
JF3aALr/8kfd5kz5iMGQJwWvZhSJ/ZF+yWSIL0QlRCSjZy8xepmzQ8AKz+2LSMpO
qp7gV/+K/adtr4urlFYEKbOlhhFtzeeRcSFrzRfQG+Len52ZWuJNVWX7uVxunTEt
d0FWtPjJk4GWnjFzxOPHVq6TSjWd+PMcxTf5LXrgZreW1nsYlZI=
=h4ff
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
