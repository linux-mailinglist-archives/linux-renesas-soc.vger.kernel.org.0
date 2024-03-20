Return-Path: <linux-renesas-soc+bounces-3924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E66E880BB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 08:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B013283FD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 07:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 776C71EA8D;
	Wed, 20 Mar 2024 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OK4DKWjs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A761E519
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710918640; cv=none; b=hIzGNeffLpajzhxzT98vn6hg15CM5KqzHWgDpxzdABSu2Rfwb9iBHKu5eTXluj7rWUpBrVOrw9i/pb6KJ7f0OsS4wlvYds8PxbJ5Ma0Rayu2BQKLeerhcKD0EEDbC5B/02kcop8xzw/MPX8zjlWDEoStm/a3fXbETHUN9QMVsb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710918640; c=relaxed/simple;
	bh=enAXnBMJHgtHUmNtY4Ya6JT9pZzpoeFYY7r5l2pwjtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQ1CnAysF6bAiGA1wP0FbKmp227482am4ZnMNrknu1M6DdKYaXyetAcR80nlTQ7mNEM0EX3FTP4n6tUdQ11ePeEOxJWiK5bPrdr3Zy/E7uYrdo7QPHJFhRymEjlUhANB/QGyQxzrnXoM9+el7nKJj/G8kdSVzBkpZQxOSm+SppU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OK4DKWjs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E6EC433C7;
	Wed, 20 Mar 2024 07:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710918640;
	bh=enAXnBMJHgtHUmNtY4Ya6JT9pZzpoeFYY7r5l2pwjtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OK4DKWjsHUJCgJfkze2AuH+VpgRERhUg03nEddP8OMwpb7yyNcnQ8QFPBwuArEaD/
	 I6seou+EercdmkthHBRaf4rHXvYedNWAr6EVkJe0d9s8KmtzHFww3LRpDzRR+TkarX
	 3skuWUsNacrF2/UkCMthtsiT3R0hOKsitk6xLzlXcPsAVSUHa3F6VKh7XE/zxsja7K
	 wQsjqS4Dg3bqk7/ZaORdvLIoBhL2a3ExyKgfkA2i+cbNGHXzsxm1NEYidxoGjOO3e/
	 kYSL6DYk6fH9yrddoy8QRKFX087WTLwG+1XON6ie2E9Ix27BiBwEySLTQCAERl/bKu
	 0DEyCiO54Otfg==
Date: Wed, 20 Mar 2024 08:10:37 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] soc: renesas: Enable TMU support on R-Car Gen2
Message-ID: <ZfqL7fBQD9-9YV9K@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <b7b9fdd6f517a8b29bf5754e7f083d3b71805130.1710865761.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9NyoK8fixIV1NIDy"
Content-Disposition: inline
In-Reply-To: <b7b9fdd6f517a8b29bf5754e7f083d3b71805130.1710865761.git.geert+renesas@glider.be>


--9NyoK8fixIV1NIDy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 05:29:55PM +0100, Geert Uytterhoeven wrote:
> All Renesas R-Car Gen2 SoCs have Timer Units (TMU).  Enable support for
> them by selecting the SYS_SUPPORTS_SH_TMU gatekeeper config symbol.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--9NyoK8fixIV1NIDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX6i+wACgkQFA3kzBSg
KbZD8A/43rl9SRYgxJ9wHeF5C2Trjlsu5avrFSQL5Eq+7NTss2zVKoUrteCIaXjb
0VeIgACS3o2Prl94uWe2zvD4dPH80WIwmeQfA4P+u8xS21IHznZm4dc3U5DYOUlV
DHUF77NI5FaZkSiexWOSWcARsLYYMFv0SVVGcz4ssVx0ArWGgZsYX0KKQrib5Ay9
4X8KBi7RWlFGTAL2smcoS1WSuQSAS9/SoDGngYsM3WvPPy3eKnAGxA63un7z6473
BzSX2aI+b1hbfBVWQCAWkg4Z5XI+wpHz2uEQo93Ix1kzMxotNUQzuzD7yQnI+Mtr
UA5XSwtR5OpuJBtHrM8NHWMWWnSJHXTW2US2G3Vvem1kLZdtIOjNpmw7gA6vwRXs
sJ+KQlFq31SC9UUzNgWk3ER7swfYF/+b5ktJJeFZhzj0hzQmBTceXQu9wkwFyu3+
M34q0VptfRFl80UT39uSxiQWAUdNUNsyFjSnk+7PefS7Za3M21tqjn6/Sa7LUBaM
rqmm0+MsgcRJpMqeyGeUYvHrXWAh1GOCrmXRIRuxIkwTxSTo87hQN6jzb6QndrT/
ehTDpo2Hyx7Gyr/PQ4rrJYr/3AnJU5wsctzjvaMsTnXP2eDtKXWHUh0JjMmpFiEH
LKFpYT4JBqXXg3VzOlJo9z24nowSxxxLa70ZPnLvx46VuSeSRA==
=PSK+
-----END PGP SIGNATURE-----

--9NyoK8fixIV1NIDy--

