Return-Path: <linux-renesas-soc+bounces-2969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9804B85A952
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 17:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1679A1F2186F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Feb 2024 16:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74C837716;
	Mon, 19 Feb 2024 16:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YVe1S0tH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E0D41C8C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Feb 2024 16:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708361513; cv=none; b=XHyfjRV0UZUSEhQWt8SivjMWwsJfgiHTe1tzKRtiD2Xq9uTW96kcZ+IK3y+y10RMrT9kRqY73sC92TBRUI1m7U8eVD+gSm4fswWpvVDZx4pGust5ZwOCga5SNP0U7hPYGoeL8EPikHMw09Sk2Vx5TApSn48CQmGq1vPRTPM+SCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708361513; c=relaxed/simple;
	bh=8qc8j0m/QKsr5BDUjTpuYZ70qqxVKsCIto81++BS5Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6Ix/AFdj9j7B4Wbh5aMJ7Nsoy+28eR3tDNmmNHgQaxkdX0NUQfsICIoOnJNJFeoDnRBW5/ERn7VuSigGG7gOaS7RrPZqOTxDZ+SgXhIfHKxl+LnPSaAqZtr54E/FWnYdvfuod1qi7B8R4Wf+FOOx/bsEjp4V14jAaNBc/ubaj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YVe1S0tH; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=8qc8
	j0m/QKsr5BDUjTpuYZ70qqxVKsCIto81++BS5Ns=; b=YVe1S0tHMMd8p6QM94bu
	9ecnhIuA5K7v/wYP3mheKKJcZ1M8qBv+6GOm+fMDuuj5nZfpS7Zzc6uxRXQ9Z+AB
	HlAN/eWNu7A8MtBUZLCUUu4bdhqjk7z5DwpaLqmx0whvSWo+vwWHQ8/LxrRDkQaW
	cUY7m/LLfurvjV3w1sW2p1ShchRkgg13bOkHpZgoyfS/drBn2NfmZnFi+l9o3GDD
	eU+4wBrqbon4Lwosd7Afn61Wjec+IRz1DigzPv6QiDCQF59SKrvaTiiA5X9gMBYB
	YOPV1nn7QBdhYcHBIxHApMDy7oX2qWIkytF/BJcQCjSzTwEU+zYz9Lvs4GGjQaUl
	4w==
Received: (qmail 2983060 invoked from network); 19 Feb 2024 17:51:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Feb 2024 17:51:38 +0100
X-UD-Smtp-Session: l3s3148p1@moE56L4RZqoujnsZ
Date: Mon, 19 Feb 2024 17:51:37 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cong Dang <cong.dang.xn@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779h0: Add RPC node
Message-ID: <ZdOHGcqi2ZQ1xGI_@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cong Dang <cong.dang.xn@renesas.com>
References: <cover.1708354463.git.geert+renesas@glider.be>
 <26f9c5d5a7944db3813ed53459aa9c5767c1bdc0.1708354463.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2yPt8Fg4zkBhKI8a"
Content-Disposition: inline
In-Reply-To: <26f9c5d5a7944db3813ed53459aa9c5767c1bdc0.1708354463.git.geert+renesas@glider.be>


--2yPt8Fg4zkBhKI8a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 04:00:40PM +0100, Geert Uytterhoeven wrote:
> From: Cong Dang <cong.dang.xn@renesas.com>
>=20
> Add a device node for the SPI Multi I/O Bus Controller (RPC-IF) on the
> Renesas R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--2yPt8Fg4zkBhKI8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXThxYACgkQFA3kzBSg
Kba4LA//WoJehFlw1435PnyfOlM9QKW8ea8I4G29/EX0Le/quVubmjsOqdwBaw5W
cnGmTBGhanDkijkM2DaRSdDuVsNsA8q1nhYe8oSu08RpGrXA5yJ72Mdi9z0HZ8C0
xJvQ+XObNSZPYeC1yjdNKtur6/APE0+bSwnpXLdt47srB4fIsZcmfNXXsHXsRCWT
je2qkbvUpplcKHBXASb3TyNSh3LYfAc8Q0eVdFsIGNgn9CatWmR4D9Nf+pZ8Zltd
bpnkK71dD6+hQzMFoBEHaO6OAm49iUA8fbEz/7UUYPJtPtW4FSJWNypH+8Fr6LVg
rTz8nGvafFtfN7wChBwQBDbGQvQyEveSlqvQ8Vuwxo3630Rbs7Luw+DywcAp6bwq
Y7XDzfMUTNNHhr79Oq2r7o2MYYnVjc9qf8sg3BeEhls2A77f5fZ0IogucJCroumA
D4zUEef8Av2jxuMH+G7q68wSEfHRZOMVneMDutUbh443cnOmXZBRdkbzJuwTzE/9
Z8SsuO4MUbDaJJ4TKJwi71AziTIWIk0I7dcL9toijbK+bePe5DtlRdSk2keGQrRF
RNlN1SezDCf1kRVKj83MEZ5vk6er9FK6E7pMauwk+BY3srJDzSCvH2pEIT2CSeva
xZ+U0e+q/GzMvnFb+avJ+fXI9LZEeJRlhD0gFYPva8eh6UYRpSM=
=K8h9
-----END PGP SIGNATURE-----

--2yPt8Fg4zkBhKI8a--

