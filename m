Return-Path: <linux-renesas-soc+bounces-15116-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06154A761A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E0B33A813F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 08:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245291E0DB0;
	Mon, 31 Mar 2025 08:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VfHsMOgy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F381E04AD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409444; cv=none; b=NYfAC6bL8cyxSPREql+FsEhzcF9mahRFw0+ZPAt/lPc1slWkitM8jsRTR4hWCsbxroc8dgK4As2/A0Kt8nTG01YsAeRx7fnkvcqluF85tUVBE6xlBRq0zyKd35lS8n9nPwWmdl8ydLAR67oiUDXPHezcgKuvRU3iq1AoNmfuGNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409444; c=relaxed/simple;
	bh=F35N7TWFYjJ7ANI3dLJVqWx0xveYHlvK0H63K4OxevQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5Uw2V8x8FwiX3n2l0awo2S6cFCTi2XlA+eGHZQoqsp2i683IptZo9LpTh2AjeaElUWNMUHUOvuMNoYIJp+e8cd8AQuytwYeCd5mngd8tnj6IARO8vs3GQWFRWUwQtlK1JR7y9CdYxvByTcR+EayohQ16eVKJZfGbecOP/rzPPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VfHsMOgy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=F35N
	7TWFYjJ7ANI3dLJVqWx0xveYHlvK0H63K4OxevQ=; b=VfHsMOgyQjZcR4NYHIEm
	Dtd+/EBQJXi97Vwg03rqoC/oFt6WfibjsFy/nPqW8XPz9A2WfXG3obW3gK/T5VxG
	9TFdxPiouKXrh3daLuOTux8Iac6GpMRHvmdwEEfxqLo83SPiN/81H2Wg44PtWMlj
	csVMlPHHfuOKBXLipa5h6XEn1fLO+Hlr10bwdRjJv11IVQwsSkcVbdbIH+ygn78s
	8GatMGJvomW5JuYjsFolW4aJVWpR+8knwtycNGAPSg0WuCkjuSsCpXqCXjFip4pH
	AvAhqU2z3OVi6Kmo8B0aPuioONUT6UsxXvDjFVQRVSYPp7aLdV20lx/KyZ3ydTUY
	qw==
Received: (qmail 1155060 invoked from network); 31 Mar 2025 10:23:58 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 10:23:58 +0200
X-UD-Smtp-Session: l3s3148p1@zDJDJJ8xsMxQ8qei
Date: Mon, 31 Mar 2025 10:23:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] mmc: core: Add support for graceful host removal for
 eMMC
Message-ID: <Z-pRHlwL1ntGgUuv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-5-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ly1LidqAp204xhiy"
Content-Disposition: inline
In-Reply-To: <20250320140040.162416-5-ulf.hansson@linaro.org>


--ly1LidqAp204xhiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 03:00:35PM +0100, Ulf Hansson wrote:
> An mmc host driver may allow to unbind from its corresponding host device.
> If an eMMC card is attached to the host, the mmc core will just try to cut
> the power for it, without obeying to the eMMC spec.
>=20
> Potentially this may damage the card and it may also prevent us from
> successfully doing a re-initialization of it, which would typically happen
> if/when we try to re-bind the mmc host driver.
>=20
> To fix these problems, let's implement a graceful power-down of the card =
at
> host removal.
>=20
> Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ly1LidqAp204xhiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfqUR0ACgkQFA3kzBSg
KbZmsA/+MSe5j+xssfRcbFVm0zOVlROt+nNdJ/JizmteUo1q6fkUSIbZyglzfnjl
JsFGVO65GtyCNf1rGdLNXhA85MlKcturETyxFErHRVPcTSlNQRelMghiJ/7KU/0R
YJdEkneR1fCnPVkFdZs9ILCfrHl71tULXKzB9HSa+iMHGIgeHIKvxiWIJvpYsBpJ
ronFMkxruEOH2/bOlZ6EwHDH4SMzyYSgo0OZENkGO+pMC0KJtvXQFm34r5VfZBxX
uTh3RzeWd8Rzs47ey6qUq7lnLis3FWAYxojXHuJ/AS5zkNXXQEqbq9fhizS0eiZW
PEFkYwT9liykQ9qnMuhPYebTeMdmuS4lJtr8je0/Ym+v75eDR8Ju3zmi70fDmlJ0
6CVZCCMRS9xWcm0e7xAKJ79T4VUng3sU5GucpFVolfQlWu/Dn41pCdS9GcTQH5dN
hF6s5BeK4tSqYqTkgUYs6iJgONPc3R4N6G/H3VonY6nmF1utf6alPxhEKig/xKP7
uYQ4NXzX4ZBn1JpJu2DjagMq6LPHUdyhS/o+yE5F0o8yHHGs/Zh5F5DY7hejhf4t
jEi1qKhVBGUhwt3XwF1G+3TTZsUWcWzP5QTkevbqyxNKnD6JCxNfyl6Wt4sbjr/V
4VAM58/jRJDTS/Nk+adKdg/tqUTaWCb/5hSYbr870YqnQpGYiKQ=
=aA/r
-----END PGP SIGNATURE-----

--ly1LidqAp204xhiy--

