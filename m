Return-Path: <linux-renesas-soc+bounces-15227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81555A776E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 10:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2622188D1ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 08:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3211EB9E8;
	Tue,  1 Apr 2025 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jiCdHi33"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68411EA7E6
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 08:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497412; cv=none; b=cXvo2ZfJJQdKt3cZcul6zDkGfTZGkJk+9aVkxvhfTOkBGAs+xxoO4hWtFEJRLDiEsUcccuGPQ5ngUVVWNgqByCjebAFyVuOX511JJ1I5FpiEq5QYNFaN9O2LTAdnY2bU5RxdlkyBQoa4tZy3IIDOWum3a8YNWL7h9ygAjZeWYvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497412; c=relaxed/simple;
	bh=27mmY892E6wIiCVrJEHKV/S2RKeCm89uDRjCMylKIN8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFhvhcR+ETWUFTeaIP827C9Dg/hqvXSlbTBLywXvE7rDXIbzaalsEV5Oi2+IR05EbvGimzlddEdB+V+irsewOjD0dxHn9SbzjrrTbiZBnMhzTJcMrHadtk/I1udKoJyMEZ+avwfNqJkFnt9F9nIX3q2vv6wiPVAl166QDQqbwMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jiCdHi33; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=27mm
	Y892E6wIiCVrJEHKV/S2RKeCm89uDRjCMylKIN8=; b=jiCdHi33tGWjGXA88o8k
	eg0gjPdToU92TkKDeHO4DyjvMrG8k25PKHt2HJYNgmK141FgfVEeIzwGDwOsi4C7
	PRrZtoV+bKdzhz1znoirzXCZPl0cC1AUi9uzIdnIfwR2wQct9OheRojDJbGdRVGq
	g0lYUNg+cNyWFRUhaEEEuVT2T3QPYswXqaottBBuIk5Iosb88DIRPCQmTNpCc9yC
	JfWc/Cf2N6iACfYM8Wz7C8qBJBI8Q7Za5z/mh1MpS5XLjFTgggJV4+WcmF0no9TA
	t+S5IDrXOz6db8OLmyI9pfLt41puzFg4mN5a6DfR4Sy4zwGzgMSgBv7YlEzQxDPd
	Gg==
Received: (qmail 1534659 invoked from network); 1 Apr 2025 10:50:03 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2025 10:50:03 +0200
X-UD-Smtp-Session: l3s3148p1@P/Bpn7Mxqp4gAwDPXwSgADIEZgbhJYA3
Date: Tue, 1 Apr 2025 10:50:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mmc: core: Add support for graceful host removal for
 SD
Message-ID: <Z-uou73DUQoceMj5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250320140040.162416-1-ulf.hansson@linaro.org>
 <20250320140040.162416-6-ulf.hansson@linaro.org>
 <Z-pSq5e9MXTX3qfe@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ToF48I1XcfM4hum/"
Content-Disposition: inline
In-Reply-To: <Z-pSq5e9MXTX3qfe@shikoro>


--ToF48I1XcfM4hum/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 10:30:35AM +0200, Wolfram Sang wrote:
> On Thu, Mar 20, 2025 at 03:00:36PM +0100, Ulf Hansson wrote:
> > An mmc host driver may allow to unbind from its corresponding host devi=
ce.
> > If an SD card is attached to the host, the mmc core will just try to cut
> > the power for it, without obeying to the SD spec that potentially may
> > damage the card.
> >=20
> > Let's fix this problem by implementing a graceful power-down of the car=
d at
> > host removal.
> >=20
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I couldn't find a card yet which has SD_EXT_POWER_OFF_NOTIFY set, but at
least I can confirm that the actual code paths are taken:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ToF48I1XcfM4hum/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfrqLcACgkQFA3kzBSg
KbayCQ/9ENKNTjnz60IpIXkrfrVsl5EOayLUpw7H9gswST50Cn2u1dLEdyy/5YD7
mUB0C9vimOhbWGX7PS0RhfcSVfWxsL3ixc4NKl3XxBqzecFqNjvkJI/eiNY/pbFj
0z+3+uu0NUVLGjxIBdU+F/wncrdpKQV5yDMP2bhAtPDPz9i8fVlA4K/aQ8yTcTCO
RzVKvobEck88KluUKvPhbcqn+w/cCMjAaKaqtaLnh1YVAx0p5EAmwVdSaJ54hkKS
VAsvzi0r5roA6FD/qIKfP9m/3Z3JubbVyOcd4rrmfECuA+z9E4P0qqDt0tMpWV6i
0MuSXjCSFGSdQsBpK8uhe+LtQCJQF3Er23XFE0TRe5/fiKtovCb+h9Jd2BC3p1lb
V274fiN/KRZG+pWCO9DYErQs28iACOdC+T8Nj2GYVSxQPgZMDaoTPS4Iki3ruYRn
wKbrxScZq4Kbau6Sq9wWKvsGkz9p6OWUBsCW52etrLXvN9chhVDyfKyxEayqsawB
swd7iWdby3KefvmAzI77nas2CCy6YhTTVKIp8F00aAQentWucEPohsPCa96fgVYA
nNch/rVv/JDWRgMb2kaaKIHfxPEBM9xaOKhSWS0D8LAn4dohfyOB3kvsRiWg4G/e
/elUi4y4is6CIljh1vqfvS7WBNzAgoy5G3ej12B38IZetROepco=
=aQ0j
-----END PGP SIGNATURE-----

--ToF48I1XcfM4hum/--

