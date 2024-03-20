Return-Path: <linux-renesas-soc+bounces-3931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB4E880D1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 09:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EEDE1F2191D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 08:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682F032C60;
	Wed, 20 Mar 2024 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtzjQZ6h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1E2BB1A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710923672; cv=none; b=MOFS5DwWUre4VkxsXc9YByy3CKaCI8zXTTf8a7Q56ppxdZ6k8R6SE8mPnilEKbM/Jt+wNDUN+p35MDz57MC76hP2rZez3at3vg5b5SzzN1sdHgYX/6+nX1KInUrJI+UvZlEtqR/XFbplZjRU1plpKZDXlNXFsnC/BaYlVGbhGi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710923672; c=relaxed/simple;
	bh=V4yOTkQZEp9Ehct/lijhmR5PM9ahoFWVV8uJLjz0EQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUckX6RURsApfCgge31Fkt3gCJHGPCavsq8983vTyxHq991+hyz3J6XIZkobEb2UVNlk0HbVu7LGC2z1Fjx5Sr+tpQcpOmV+Ql91UwoVljvf5QGOn7h2NNi8/2snxM8qbkSp3KROPiwUs5Cvz2/FqKK3z08wvXnKPk88u2Zv31c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtzjQZ6h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56018C433C7;
	Wed, 20 Mar 2024 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710923671;
	bh=V4yOTkQZEp9Ehct/lijhmR5PM9ahoFWVV8uJLjz0EQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtzjQZ6hO9o1q9N1GHETHUO6m0ZRTErUZ+R6V5JFqlc9j3FDTqLmf2WxlSzvOg+/f
	 rGKwdxrO40DJNeWCRySbBJne/X9gVXLiAuEPa3sXBpphpK4LERZqQN8TpDpv46SQrY
	 7gJTWNRY/0MFhh51KXLL6vdqRjd7TbK4beDfc9AoEjOm7n4tez0um3374n0biWkS3M
	 AncnIhO0NgFA+essmqCNl4l0ymFaTYZwKVWaEq/1+mblbl2/pYeTcwXL7tz7NJhrLd
	 KZJGS12txoPtU+YC0GygJ1Y1ypZvvM0pPSHehSxYYHsZ2H/CVPUTk2gfEnubB8MD72
	 R9BykcS+ImPZw==
Date: Wed, 20 Mar 2024 09:34:28 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] ARM: dts: renesas: Add more TMU support
Message-ID: <ZfqflGGizKDALEU5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <cover.1710864964.git.geert+renesas@glider.be>
 <ZfqLY8Ej6kNnAMQA@ninjato>
 <CAMuHMdWeq6c8F=i7SgEt+HBBpknaEFTsrxM26OrDpjzOS_YTZw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iPEihJ1eaoYQqJr7"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWeq6c8F=i7SgEt+HBBpknaEFTsrxM26OrDpjzOS_YTZw@mail.gmail.com>


--iPEihJ1eaoYQqJr7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Geert,

> > Huh? It works on Lager and fails on Koelsch? Do you have a log file?
>=20
> Of course it succeeded on the next try...

Interesting. I will try Lager then and see if it fails there as well. It
is only TMU3, right?

> Perhaps a subtle driver issue, or an issue with the test?

My gut feeling says "the latter", but I have no real proof.

Happy hacking,

   Wolfram


--iPEihJ1eaoYQqJr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX6n5EACgkQFA3kzBSg
KbaYFg/+IrnzFG08gVYHbm54NX2xz43L7CheDDQ8IlDngJPewTX0SEn0cJwCNufs
n8AUJJKVB22VNHL+KCiRuZwWOS+DmEtI8Eoh2Rb6MBXGlNiejRX5qRw3jZwon3+d
eHOsHlKk/hwzoQXLBQCouYprVYOWIIMtuiardI0F4VuS6iZG0P9PbRiOvoJZU6Yo
Dxcp95ITZtgT/8yJsjkQU86YRSZGMKTLXHLG7auBAIoLQ0Q/eTgJ8m2hBGARfFx1
Vx35R0VJC7swI/MiCeLwKE2PqgPLVbn+CjjBbNyNLaG0FpSnhSzmop/6zGApq4u8
pXBvz8OSb/ZqJPcmyCz3bv463kFO9F158+amFqu5j4tVrvPQvqN7mMZ9S6abNFe0
xk9OYCUba8ns2T2MULfkqrhGZ+WaI2cVVOyddmrtXuF9uYOuV8JmqH39VS1+0TFi
FjQtOtxTUNtTFx9Iszv5YhJNhdjc1L71B5u7aZSSOllQG+vBnMVVfpLr2DWurAE6
Zf5sq2JOy2NRob54xg++vzEx22X5WkQVg7iE81KKymilwWA4MatDXxL5R0W4yu5b
oVCXeKbq2h+SSCW8PCLGZrCSLvJnr5ilxbb2yGnCUa0dSOVpu8FQgsa/TGhh7ckU
U1r+lWWAmSxdHTPq3slpEaDh9JXequSorH8mLHJ8H+VvyQLqdOw=
=/h0L
-----END PGP SIGNATURE-----

--iPEihJ1eaoYQqJr7--

