Return-Path: <linux-renesas-soc+bounces-2311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D98908487FF
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 18:46:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91D8C2861EE
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 17:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD015F54D;
	Sat,  3 Feb 2024 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pct7gfC8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC65F873
	for <linux-renesas-soc@vger.kernel.org>; Sat,  3 Feb 2024 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706982362; cv=none; b=G8RzkATR3Ld+e0hDG1tPRfXQyMvRG4SrUOgzSF6VGlMswWrZ5lwKD9UpymzK9V03Ga6qlebayNfPDI7nWMo7sdy2XfErDLLalnHZ+srBej9JYOUaP2zxis+/LDS1+whroUIL1ST3ztDv506CvQiX/wN32GQicu4CUcuHTxIUjU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706982362; c=relaxed/simple;
	bh=PtU2kL5Vr/+iG2te73D8Tr+Aie4HYRVEBkFP3JjD1vI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+IpDF2Cxg/0HZhf+5w/499mHw2ROshgg6AOOMqeGkAgYFbkPA5YFNFTp9LIdPZOvO8iD+GjKdAj9RAIn/L4V6JVgsQkVXkYI6ZQAspTX7IdgSViHzaT3Me3mjA23iqvvcxuu3Lp6/KbmOpF3mpRzqrOpiCdHtoqW4F67BVZXuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pct7gfC8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8E9C433C7;
	Sat,  3 Feb 2024 17:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706982362;
	bh=PtU2kL5Vr/+iG2te73D8Tr+Aie4HYRVEBkFP3JjD1vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pct7gfC8UCunTwdXlXt2HDQLsxb56UwQzI5dStA0fZwmgqL19g6Z41UUQOvRuKmd7
	 564YMSgsYnnBxQRmCY60FGoV/Ik3eB3gO2OZvfUqo88pOS490djujcGXhOwLFmMPGK
	 SGbIiubSmxxI4EpSL+THzgz1/W42XgsiU5squxJDCu4u5zxP1dCgtUJ80KrcZNtouZ
	 8oXCYb0mIoYm1/MdVrUoeNdJMllYEtGcY2aV6Z6c7GcwM31vR1cmtY3axrRRi7csCz
	 o+qU/57YCYth4px5fxvaCftF82j51rN8KTUK78GP2PyO/SFHH57tNdZPxbNAHQR7Bb
	 mdwdHMBotCoOw==
Date: Sat, 3 Feb 2024 18:45:58 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Enable
 watchdog timer
Message-ID: <Zb571mpzRXdop0ej@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <cover.1706790320.git.geert+renesas@glider.be>
 <cf6effafd9e0472a457eed9d84a834abc3e1c833.1706790320.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RyIMIWdyY1op0nWx"
Content-Disposition: inline
In-Reply-To: <cf6effafd9e0472a457eed9d84a834abc3e1c833.1706790320.git.geert+renesas@glider.be>


--RyIMIWdyY1op0nWx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 03:09:17PM +0100, Geert Uytterhoeven wrote:
> Enable the watchdog timer on the Gray Hawk Single board.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--RyIMIWdyY1op0nWx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+e9YACgkQFA3kzBSg
KbZ6vBAAsCRZphO+mpPLeBb06n+zwHQxoT0gRuKQyifts+zZdXMOwiyYlgQG9z5J
B+0Sywf5tqI/M1soV+sStwQCiCWi0/EkzS1xq7kWwm28rCUXJhtnsAqpNaN2p5D5
Qr8wDwlV4zvmgHhr2EUHzyvxB1zRYqEDq6zCoYpb2bfaXmunRckZyCjoTzvBcFEV
GWnRBGYHOaAKdrgyyK+LXbMHhrogYDZxB4OJgeEMftQs/1246PYXI+OtQnEXF6fU
sWLdV54N7m2GrR83lkURX9Dwx9EsdCSH32Y7nbVxW0LN7pOZ/vswWwBXhH+B5ZS6
9jgBZICpAznW4jLPz0pqJLCOgrJPswrho1SGwNB9H5nPfA7E4XZrGNZI58T3I2WF
L+J3sKExWe1G/w4Vhsm7OsYIjE667bdvB4O5Pn6Hth08NIJDNAXsHFJQwwgaaKGz
b11mguJpk0gV1ivm9onf/shE9YfweuFGJ8C8w/TivCcwlJ9RhUyCFIzBR3QsUZhr
Y8s+ll2P+G7moihYo+DqHyWI2IZk+4bpIBmArVVbX/pA5cq1hIjN3ojZ15KIs1sd
oGUfKV07HTh5ASNwmdVpA0mhbNQqADs64RtymeVdXq0HNcWfoPzTJ8kRx5TXNhZ0
W6wtFYpnoVm+qD9NG71tETeJp5jhpbBIgA2foCmzmUsz6xMS2iY=
=fBP4
-----END PGP SIGNATURE-----

--RyIMIWdyY1op0nWx--

