Return-Path: <linux-renesas-soc+bounces-15090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26941A75D0E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 00:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 859C63A8983
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Mar 2025 22:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5955D1D7E57;
	Sun, 30 Mar 2025 22:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BoIuDbgO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C432D7082D
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Mar 2025 22:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743372478; cv=none; b=FDq/Z8yk7ZRQMVC1PrBz0h4oHtfaXmpVqC06+y/bm8zn15pQ4yom8mxvzkCKA+fu+jKeZMqkRx0xhT74PF4eVKko7O3wJlyd0D5SOYiRbMwl6ECgP/ofZMQEh4VgRnO/3DndamgfDiqZF8xvFjNnVuyGQNfNeeGIzw/TtpEvYCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743372478; c=relaxed/simple;
	bh=ohfxjDX9fblLKKTzxOdM6et4/HX8MMaKN2vHJEhkhQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGPdzd/heF0h9o6IoqmCSFezuPlOlwykkGcOWP+1/mkXq6md+jHH5bM0ETUfbT0v6l5M+PE4Wt11B+moeWxjroAcisF4b+ifsKQdK2++f/BLad47eJ0l8vQABQGHrm1j6MSH4pmsPQZRv3VVNN1tSC1ccJsRdjQ8Paimko89hII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BoIuDbgO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ohfx
	jDX9fblLKKTzxOdM6et4/HX8MMaKN2vHJEhkhQs=; b=BoIuDbgOdrgRasCV9kOo
	PxfHsYfCy8rkKXt3+FfnkRObgVyXzv8MsJH1CS3u9BnjH7Y7F7VOws6+NV5pwv5R
	EB+QfnU89CNHAepjVFqJIDg0YpaQGARkjgeClBXSJa4Tl8vddIlMCu4E1iFewqec
	+qBkLNT9R8714o/ohD5M1heKK6h5MnfDlhSlzZKpilo2285XAo3g7b3E+lpU5we1
	tIzJkSUTTjYysE+5xIlw0cczYnIlU0k+ps4+G+GKB7ySDwW07J9i1GxxeXsP7yBg
	ygjnVpAtu1i8YU2wnUGqHtt8BCD43d6qgo7tam2efxUE6Dixj/+lqmQ048ukGNH5
	Uw==
Received: (qmail 1004929 invoked from network); 31 Mar 2025 00:07:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2025 00:07:49 +0200
X-UD-Smtp-Session: l3s3148p1@OKHDiJYxFp5Q8qei
Date: Mon, 31 Mar 2025 00:07:49 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>
Cc: ulf.hansson@linaro.org, salauyou.ihar@gmail.com,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: Fix error handling in
 renesas_sdhi_probe
Message-ID: <Z-nAtQ-CZ8zMUWiK@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>,
	ulf.hansson@linaro.org, salauyou.ihar@gmail.com,
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250326220638.460083-1-ruslan.piasetskyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WHsS06c/awOKTr4T"
Content-Disposition: inline
In-Reply-To: <20250326220638.460083-1-ruslan.piasetskyi@gmail.com>


--WHsS06c/awOKTr4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 11:06:38PM +0100, Ruslan Piasetskyi wrote:
> After moving tmio_mmc_host_probe down, error handling has to be
> adjusted.
>=20
> Fixes: 74f45de394d9 ("mmc: renesas_sdhi: register irqs before registering=
 controller")
> Reviewed-by: Ihar Salauyou <salauyou.ihar@gmail.com>
> Signed-off-by: Ruslan Piasetskyi <ruslan.piasetskyi@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!


--WHsS06c/awOKTr4T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfpwLEACgkQFA3kzBSg
KbYtEQ//U7CzloYofUyXsJzdVRGE18961OpCyxbc9i7x+0QBZXoTGpQG/33BFqnI
KiMvjLxEqmtHUKFCU26KLAEuIoJ+FmMsS8iEPyvymyZqsQk05tNG0cDdYNPB1YBS
XeYD6K43WBresADsqgNrRpWFxnfH79HZA9IP6nR6IpjmVOP2mA5LvtfRB+DI2P8u
oT+WWehZMDreNqiiHTfgImy5TTI9alw8dwdb4waChDKtHqYR1QZT3z2spb5XTGAm
d/PRdAsYMkPP/HosPoMszQxvwhQtWMazyNCplVIf009eV62M1SI8O+kTQ/y+s/dz
2sAdwUJafuS/3pbR4ueNmfR3bnnNBGAmLKfisT2x1C70O17ixS3TKT81v6u1M032
NJ8MbbuLts8Io8Hu7rizKjUFpQfHvoKE+3r1DxaYqrUPLXGlNzPwl/w1Vnd6qf13
LYZ3MZXNmX+lsf3Sl+6FZurn2tZSChaA4LUFBhAiAocxCAisoJpcghpm7JDbQEfd
D96n0qMzPKGMLHWkif5OmaURgHmMoeF9117ib82Ov/T6K5d1nZdzPzofi/+LolFI
C1fxT7Ya4pvm6br0sgduTHyqYeYzy2lnKKwm55NxAj7CwIK9PHxXTRShUm2ftCjU
4FjQmoE2Mbxu/frn11/p6sGqGuXiSCdN0wnnjle+oTFdFAsMaSU=
=Lcuh
-----END PGP SIGNATURE-----

--WHsS06c/awOKTr4T--

