Return-Path: <linux-renesas-soc+bounces-9150-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E33D79888C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 18:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 996DA1F24C47
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 16:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C86E1465A9;
	Fri, 27 Sep 2024 16:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Q5e7oQGK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B2E17ADF0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727453334; cv=none; b=PlbHf1ySIqkt4byZK4QA3JdIWXw6sU+WwWjX+d0u6P3rgOX8t05aCjLhbqz7bPQqOK9KHsWHcDJRRYVFiodaNHBhy/Jln58rwJQBLw8870chZIaAEnJy77ONL7OVSSWVtNCnqT4AxIT5dWSja56mj6faOob4mfsUtRVN+KnAVpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727453334; c=relaxed/simple;
	bh=2ZknEnDKQjeTHbg+bssPjnSlC9WX7bKZyms3plLuT/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huvx3AL7LthoYcrsXt65nvTkG/0/rnhdzfs65PerJ8irTuo4delnNrEuG25lXkQrMibAYjod71uwIM2aDAQiYASwV7Z9VRoBxIwtFGIZbSvf337Ws7HTdYP/VE6nIDSBeuEIa0poFo+lbfUi7T0a3VRiHmoao6l9oH21mM6ufKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Q5e7oQGK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2Zkn
	EnDKQjeTHbg+bssPjnSlC9WX7bKZyms3plLuT/8=; b=Q5e7oQGKaZkut9WDWOh6
	zr7No1k3/ZyyPF96X1+Q8Xe90GbNNDRwmImFqXLA4eSatO3f6lYnqGkCKhBsvuOf
	4p/IrCCuPxXFQw9Pv8NjUF9X60etKHhxSU6G9BtzFFRIUd3reAMOqiTHzZFtP/eV
	laVA95IlkokpaiusHQvtLkYk4ytFVvXxXYcfyhyHtAYFf3/3Q+w0mflgrbDl7Su9
	OWmbWhIQGYNCU2nv14Xf7dyD0pcyqdyAuk/sGCvOnXMlul0yXCW7An/ZOg4kYvh1
	191JSDj074Z4xAs9z6pH5DwZBY+8x6OiZBGE2k8zKXMdLLzPpgb5MFY/pmKLfSCY
	sQ==
Received: (qmail 1384884 invoked from network); 27 Sep 2024 18:08:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2024 18:08:38 +0200
X-UD-Smtp-Session: l3s3148p1@wuZkERwjeIkujnvt
Date: Fri, 27 Sep 2024 18:08:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: renesas: rskrza1: Enable watchdog timer
Message-ID: <ZvbYhiG71dktoIh4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <fe72fb72acde4f5d9f8bd1a012435519592bd2bc.1727441772.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v/nP/xcZy2Rwr7UW"
Content-Disposition: inline
In-Reply-To: <fe72fb72acde4f5d9f8bd1a012435519592bd2bc.1727441772.git.geert+renesas@glider.be>


--v/nP/xcZy2Rwr7UW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 02:57:37PM +0200, Geert Uytterhoeven wrote:
> Enable the Watchdog Timer (WDT) on the Renesas RSK+RZA1 development
> board equipped with an RZ/A1H SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--v/nP/xcZy2Rwr7UW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb22IIACgkQFA3kzBSg
KbYk2w/8DhHUOEIstigA5SKaRWpMpBirsDhbr9ZKxSgZ6FA7lqJ0bmBmznDYtqB7
tI1lg+ZpefIg3Sb9yGv8xMLgAcgxN0RC3xpkP0n/bf6fLFilPKFvo5UYWY4vaeYb
3qxaqB/qB0Fi6BvwnOJiv7NMDuDOJ+Qm6wp7d1fcYAuDkKeedPKIGcQd6NTmKvOA
gxV/2QxdVABlw4MBvWTr1apKvNdpe2RPiybhQL4mMoP1G15dsxeaV4Ttkxr/t/jE
VaQKix8zp5TI/bftYdnR5uImIHTqOxO1myAOA5XznUVk4s1uHOBT/AfjBe/osoNY
QR5S6Ua6KyC6Ql0L0MTEnRrYt+FTehEAhOEYIaT6X95vg2JfGFYDEzwAoLkAZ52C
SAGh9wCb0D4TCL97QEUM+7nWIC38vdbfWCE8L/wa7x41CgC5FbZDqwnNwOzNno64
syZ8ln5sUHo/8/1+ec35mFWPbF83oHKtY8UFf68jrKh8SKsXhdaPLH6KPaEVdrx+
B+OW2W/7DeAgDz5AfYsz5zt3n/vtDAJWBITeJBxmRzgoadstvClol0IlYg0uzG6S
jQP72hUd0ZZuNY9TwaW5MOed3Bl4MbsozuMYChXkiVRPn0ldTQqDeqSYd5WOMuDH
csYsNlBu9AovmczX4DPSCNN5vJ7EmgDyC9pvFZ50cdfX6Xdai4M=
=tFZX
-----END PGP SIGNATURE-----

--v/nP/xcZy2Rwr7UW--

