Return-Path: <linux-renesas-soc+bounces-2313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4E848808
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 18:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4370EB25216
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 17:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACA15FBA9;
	Sat,  3 Feb 2024 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQE1kvLF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8544A5F57D
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Feb 2024 17:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706982817; cv=none; b=WI0EiGcIMaK/6mVQVQcTm9TJIvkPXsNerlA3znLEWYMNsIXQFzfoJr6K7xoR7hpUQwbYg+cSMTyqRFXMiJXfxBQKGsrj28dM/IMaJcqL0GgVmR+nFlqgHIB1WSNj090mhqW+BayzeabahpxsbdfEMLh2RTZ0lY1YGV9klmxHgLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706982817; c=relaxed/simple;
	bh=z20GpsIijQXuQE/eSrKBJc4zBg5JpJUEKVZfjXw/Q2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLaCTWUGQyf8idJ6ilpM/VYQByqQGXdS4uJRZvcq7N0YF+PwxOCXaDwBxyvxh7AvqUSaMibiGbHAksCqE00lpVfB4E3tVEMT836uaRi1FKIjEJpYZUqDe9eoTFO5fgCBZ+fWZ0ElKmmSM/xwDyJNjPy8PhrszVOIt7GVpTAWKxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQE1kvLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77941C433C7;
	Sat,  3 Feb 2024 17:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706982817;
	bh=z20GpsIijQXuQE/eSrKBJc4zBg5JpJUEKVZfjXw/Q2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQE1kvLFhaALqTiWtFnG7FFZugIFbttNDdl1ZeQXYOi7Of9iunmiPZSO7uxefo4CV
	 QtdASWYv5Yg8SnTq0blJ5e0XGDX08FdENbUZxA7dh7qsAl9qGEiPXJDxFd2552ibbc
	 XtScbldqxhf74jPklnBTYUpatHvtVfx/Mir52jSmmF50SMozZuv+CWL8NuqRqL1kxr
	 P9HGwIOTjejmbo0GQkvcylk0Bn38VvOg1URIkyz5MO+DTGCAPvdSEmc7psQ/cXCZp9
	 LVP+NKuBeb9NYx+ZgdqU2WeWiiOAQprV15KZ0GuHGtMGqeeBSrKwhseoE97wn9PwcV
	 xFIdD+bc65b6g==
Date: Sat, 3 Feb 2024 18:53:33 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Add I2C0 and
 EEPROMs
Message-ID: <Zb59ne5Y4YJZ_RlT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <cover.1706796660.git.geert+renesas@glider.be>
 <960595394a274b675f1ec9ec1c324e4cc1ac1f77.1706796660.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GFIQHN4LiCAcmG1g"
Content-Disposition: inline
In-Reply-To: <960595394a274b675f1ec9ec1c324e4cc1ac1f77.1706796660.git.geert+renesas@glider.be>


--GFIQHN4LiCAcmG1g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 03:14:34PM +0100, Geert Uytterhoeven wrote:
> Enable the I2C0 bus on the Gray Hawk Single board, and describe the I2C
> EEPROMs present.
>=20
> Based on patches for Gray Hawk in the BSP by Hai Pham.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--GFIQHN4LiCAcmG1g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+fZ0ACgkQFA3kzBSg
Kbb1Tg/7BWYR6Z8EDaJnmdNYX0L1vIuhuwtGRcK9VnPaMWVy1h+onWqOr++qPM3i
PG4EBjQ7jNrh6uz1od66KnT9CAgQEUo9pp+0A/WD5m0fDojNdNmFWqeR8dNY24d7
7Vr3Gv2XBobIyx0RaZZPL3S8oq9Min8bGT4E1DWMhLvYcsBGRHihXzfFI42dsi0/
AY7LtTHnvPi39yf6sPwcVXb/bnw7oPTHdMUaGKPHSVt2YCaSkuTSmTWg+RjUvOEk
iopm8zGT1TcwoNmaq2AHwYwBi76OhTSnHdknKTXbz1ld8aB0CpSbbFSxQXfHy9b1
FW5vEz1Cdan0ENxoa8dWgUO4vU2Ur2gZ13RNoswyQ/Y3KW52u6ERmH8KeGt8NYG3
McFPnsT/lft8NbFrtUe1Zt/VYq1tw2F5KstrrmXzt5rvtacTDRm8FaaoDLDkdZzx
8cMJGVbHoiX9T0A0faFa943s6OPxBCCVRAtUV4aENnBNuONpKxZ0MB4QVAvQIzI2
3Kc6PEUVAK3MBRioXskOtmHRr5UQBPvqNoamm5cYHpyHYeUyazDmRnTX3OspWi7Q
UJsl+f5Ytle25Twsjoaw1HBa18hMMMEa8fiknqFGH4SWqzR3RZeDkWXHTsUBGf1j
L6L4TUVWcvDWpFGmPg68S4k2dx7CA3GpdnT+7+Mc9xhHnCv8/b4=
=ej9x
-----END PGP SIGNATURE-----

--GFIQHN4LiCAcmG1g--

