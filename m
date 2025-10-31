Return-Path: <linux-renesas-soc+bounces-23952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC29C241F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 10:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B140A4F2372
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 09:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E57330B13;
	Fri, 31 Oct 2025 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="f/Q1rD4P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AFF34D388
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 09:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902369; cv=none; b=nu/ytvGU7sVIcq4vU4JP1jryvR1C61DAEShsO3v8N9Wwpl7inDtvU3UtenRrhy5sBXDYGHRrhXp7W5HCiTCOnmMcUtWNdHgAk1/z/jeo5dq95dBPo4wHvDzlH8KemmcFtz2RWO6RyoF3OZX3KgnN4Qa/z0hPUhTeAODh6lyP4ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902369; c=relaxed/simple;
	bh=BJxQY+xLPvnWfaCSVMYFVyTr+cMyUpIvaEl+qUYNWCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frqqWyHr4q7RVzAPQI7ChoJG4xfCyMziN2VbDSKIK+cJVD3JTwWyG1lElqFM4ybvBxemDN9xnCOcoUpsPCiFKbzpfrPj4Ek3RGkCutxKb26RddjOqFJaOa9lR4cn0zx6pTr7py82TxCCvQT4W7bBz/Aubxp6DPjacr9YuzXlBGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=f/Q1rD4P; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BJxQ
	Y+xLPvnWfaCSVMYFVyTr+cMyUpIvaEl+qUYNWCU=; b=f/Q1rD4PcRBzVXiigaWh
	KcCxaIgJtz1cNmzXCVuyhUNZPxeq9k1IoTp5SyQ+porTzgpa+wKKTtgm0z/ChzdS
	sWpuirwRyGqYmVEhs/2Ea4dNZ6cp5mutznyhVEZ1NlJl6+SB7J/XLfeeQt8w75an
	IYCwjlm5bU/oWMTItee1z1c2uYgwRpFb+QOinryOjd7PuK4U92Q6nbX+I3SeSDwt
	P5cdrAuBghiudXmGJtixWNznX8QU045jsl+L/ArljxuXbJeKl0sB29zuupbG4dvc
	vB/KG6QFDlKS+InxqD2+yqogEuAxOFRKSKN8lxNZV/TTbT9CYdZxfQlyPX+lMp7y
	8w==
Received: (qmail 1046186 invoked from network); 31 Oct 2025 10:19:15 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Oct 2025 10:19:15 +0100
X-UD-Smtp-Session: l3s3148p1@EP0H3HBC2JUgAwDPXyjKAONDL9E53Fzy
Date: Fri, 31 Oct 2025 10:19:15 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/LOCAL] arm64: renesas: defconfig: Enable GPIO reset
 controller support
Message-ID: <aQR_ExMPobYEag85@shikoro>
References: <3d14309943541d370d92768e8448a6a6ac2e0985.1761901540.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eUVH0aLsXaMTTUSU"
Content-Disposition: inline
In-Reply-To: <3d14309943541d370d92768e8448a6a6ac2e0985.1761901540.git.geert+renesas@glider.be>


--eUVH0aLsXaMTTUSU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 10:07:20AM +0100, Geert Uytterhoeven wrote:
> As of commit 690de2902dca98ae ("i2c: muxes: pca954x: Use reset
> controller only") in v6.18-rc1, the NXP PCA954x I2C mux/switch driver
> relies on GPIO reset controller support for proper reset operation.
>=20
> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Closes: https://lore.kernel.org/r/87a51um1y1.wl-kuninori.morimoto.gx@rene=
sas.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Yes, this sadly requires manual updates for now.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--eUVH0aLsXaMTTUSU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkEfw8ACgkQFA3kzBSg
Kbb2ExAAtSTLVTiXoF0zg85YdqFSUWAFJhi+nav07/cp9BJy7C1udKJioIvjEv25
oU/pKHRzCDbDBdyAYN7PzgRpVxReEckIyFeX8W3kG28jTaz6kj74bbOjlE50ewGm
P/braZA2oF7+MlIbpaFA+mcIim+OJj+KRPNQhbIxTVU42OW5MLWOGasveMy4QuI+
QBWthcj57Mk5TET1tORZGXcZ7XY3qNpGXeSOSUDKBQTmdGmhRwE/W7x5pNz4wRQy
9GN1Xd9jI3tsxN4+Cj4XX6hVRKA2Ics3TmzGItMnM7nRf4UqZdQh+0w2jfBuC8xy
rc7CTMThJqLEnR2fzZyBZf+l2Y3FknjbV7jXKttRY91To94APMgdSav8izPxYXGi
Bl5oGHgbVjmC9xylq7lVDu79PET/kxORaCWXNrwdoaBvcQLAN5Sm8aWKMwRJFL3B
ETMssKQhuPLBnae8ycoyu+XBatACTkL+pJQjIzPq9XxFmOowDKBH7r0A92x25MyW
Tc3f0MHUF7fFgAe2KXbnkU6zb+YpAB/tVYGVe6kk1yczoHi4io2sHiy7I8WwUn/R
gxOB3v/ou7NAWd66K3ZO1bEG6aD0KWKqf+oVxHfnUsHy19/JsAoQ2YjzpkPOMrtd
VLzlUfCTwyk/VcGoWwI5IZaTuMPtFOdYiCrVkt/cuuIlWVnkEww=
=9mgm
-----END PGP SIGNATURE-----

--eUVH0aLsXaMTTUSU--

