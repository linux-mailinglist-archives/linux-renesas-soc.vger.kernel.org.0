Return-Path: <linux-renesas-soc+bounces-1780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605983AA49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BE531F22AF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 12:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7226B7763A;
	Wed, 24 Jan 2024 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0Kzfo+B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81877639
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706100577; cv=none; b=mOCQn+Qxpe608z+PeLo6+OcZihPzhVdMoS0cOWBC9lMVBByhDerl/PaZFN8OdmyZMZBpYKGuWX8Xu5tGyc/EYxr4wlSny3NwUM2Gk92uZ3QVt3YLLLsNSWp1mCWQTyTtr4x7uT+tqGRVAK+q1g8U6gbsw7pUrGTtbYMXb7Fzb/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706100577; c=relaxed/simple;
	bh=i4bDurkbL4DN40IsX7zxXD9WIY9yH4nISnKEFE/PsWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWgEJvH8giRHNGTbq7N6Lciyldr2rexg997n8pvpQ+IvpsDkB4jniaizDt8K7KcsWox37IRJNcNYenFZr2o+klB6tNjq62/jMaWedMBvkrIz/a3px69WvU0TxFBXDpRNbkowDzjd8CYqnU7QDhVVDWf+cVvo/b61QRWOyBFtAJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0Kzfo+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C787C433F1;
	Wed, 24 Jan 2024 12:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706100576;
	bh=i4bDurkbL4DN40IsX7zxXD9WIY9yH4nISnKEFE/PsWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E0Kzfo+BJieFC0hIStuuQJihTs1gNDYXta704Mu5+Nlz7+9P9uTn5cml31/r6+vQ8
	 o4JkMMjSUJIx1noOowmz1IMWz5TnB/KYkkXR015vGLy4diN2J1i8F+nyLb16G1oncr
	 u6mIj25VoAEZr7Okw0HUxv1sbEMsLRy+ANhEiHpwP1imGMRci3v3PKCnuhev730WRy
	 YTfrvNIx/pVUTBPv/2JmMwByM16oaXtV1KXnXVxBH9dlT/yxXML3XhgyU9y4bc996u
	 hwq3Fx5dX3YBj303GeOM31B5QPyfRn99UOy76uKsCZDiZYbIdwDwDhauOwaEafMkrv
	 Lr9b9XssaTfNQ==
Date: Wed, 24 Jan 2024 13:49:33 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 4/7] arm64: dts: renesas: Drop SoC part from White
 Hawk sub boards
Message-ID: <ZbEHXc8PrOeRN9q4@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1702309604.git.geert+renesas@glider.be>
 <9d0c5ecad6472e4c8a8cea0ec6e542193ca03a42.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rcEfqE6QOLN09g7T"
Content-Disposition: inline
In-Reply-To: <9d0c5ecad6472e4c8a8cea0ec6e542193ca03a42.1702309604.git.geert+renesas@glider.be>


--rcEfqE6QOLN09g7T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 05:01:19PM +0100, Geert Uytterhoeven wrote:
> The White Hawk CSI/DSI and RAVB/Ethernet(1000Base-T1) sub boards are not
> specific to R-Car V4H.
>=20
> Hence rename their DTS file names to drop the "r8a779g0-" prefix, and
> remove any references to R-Car V4H.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--rcEfqE6QOLN09g7T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWxB10ACgkQFA3kzBSg
Kbbe6Q/+Kj1wQUrFIiY7nAdIyd4oPbW5C1DyrCMXqrurKz+izy6xMRdJGUoVwoGm
Kwup6Mud0MxXnim4gg98PR/lOihFbLkqiy/ENiOX8fYle17kodLXPgDPb56BKmwM
XLrhxDjmLAQXqzsjhO/NiL9NJz9HstACAzIBV8ieD/SGmRvGl0DjAjRQWnGOJZW3
NXqb2wQSK42vK1tLsqJoojXWSpdpmVZJ4sVs2gOqGfXC1srBJAAj8p9qiVecLi9f
pxNqP92WoPhgr6uBuGadld0ofceJNT+ZNwSzPy5559ces6QYVwNuhRFdbUN6KLH/
mVVQDrGaBJMRxUPvCBUOBvWgWDMhEoonOeZ/3Zd+FEfDuKZqywQwXxWkuGiPCzNj
u2q/Z1KlCuhiKacVCH6YtFzvvbCa8iBtMFb7UmysUAZY5W4O4N7AFOLFp/akyEcD
/LGlshuHchkkduv7X7jarJAZeNKbTu5vCa+Ss99x2nalVp+xT0oC8AqzeLYU3w8I
/fs86dsXh1CtGv2gT5GCxfgNnZKvqAvWTM/REl2iyOupG/3qMiFeKQXNoK5M+iNE
SinkY8PN5LNipV9NPdAfrXgJlx+pooBbqX9zSZ0BzZTsbXr1IBmJQZOZ8rDOAjT/
QEODgfCYeUTJszTCU3m+ycty3dGoQjjBIbUXVLGaG+0srSl9wwc=
=9QCt
-----END PGP SIGNATURE-----

--rcEfqE6QOLN09g7T--

