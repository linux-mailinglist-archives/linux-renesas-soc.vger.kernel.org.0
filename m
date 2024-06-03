Return-Path: <linux-renesas-soc+bounces-5770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3471B8D800E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 12:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 664C71C237DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2024 10:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6623824AA;
	Mon,  3 Jun 2024 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ut4t6zjf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0745A5821A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Jun 2024 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717410801; cv=none; b=KePLYzot9DY84v/sHb9M4dTpLvN6P4C3V3rNnWjbSsiRp0mjC655o5rQDl517jqydpeHKPPyyWJ4Cjq6Njby169GnLU6m+ImEou4v1gIYVQEpzvCttp8dWYbaYMIQI4Fo73Ql1ntQxv0gwV2JyapI+AWohLyHv6ZYj4YIRi1UBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717410801; c=relaxed/simple;
	bh=dlRXRsmbEo+3qiZfYfdttteDZKqG4Od02eHxicX2vYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xf3qxAEzVL5oYFL56WKxr58P3etpXgHIlJJLG+PWLZa0qSZ+t8VeKU3kHMqMfIbOZT5Oj5TSSiH6DYfdzkUN30xnQm5iLFxeZ6mryQionFS92dDhJoQTE2bjWVYSzEhI+r347owszGqunCZrwiTQC2K44qB+rPNvM5lV8lIXJmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ut4t6zjf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=dlRX
	RsmbEo+3qiZfYfdttteDZKqG4Od02eHxicX2vYU=; b=Ut4t6zjfab63+G5YnB3P
	LLnflgtfA9jEA8vcIo9mtl9L/6yUge9KoDfIzFhSiFd9vwLayYO1gUvzmHSQgMKr
	u/M6xCFdgG/xz6N89Hay9rTSV5PnHoLpbnl8fpRVhFRJapCMdglEPx5pMgZtFb9m
	RXCFZ1TBeUFsU4YQcgRH+sYyjTrPET8TXozU4La8/P52SwSk2hTeiuTH6Y/m6Hku
	YR6VU+4ayX3mAPJ5oOJ281iTz1487YnMFUR5Ix2WO7+kevslDkEOu4t5S6wQI6SP
	2QCMr38pfwLXnyBh++HgZPOhdoFgAiocB0o+blv9NcSEdlkBosmvq7gCcByXCCwH
	SQ==
Received: (qmail 1921677 invoked from network); 3 Jun 2024 12:33:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 12:33:18 +0200
X-UD-Smtp-Session: l3s3148p1@3qqJ3PkZ3O0gAwDPXzLGAH1eNELjOc3g
Date: Mon, 3 Jun 2024 12:33:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-can@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org
Subject: Re: [PATCH 3/3] can: rcar_canfd: Remove superfluous parentheses in
 address calculations
Message-ID: <hvx7ae65p5a3zqifhoskkqq2jo3olwairlarx5atugpr6f7rbe@mpygss4dpzxu>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, linux-can@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org
References: <cover.1716973640.git.geert+renesas@glider.be>
 <b5aee80895fa029070fd37d1d837cf1c0ecb52dc.1716973640.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6qktic2hincfwcq"
Content-Disposition: inline
In-Reply-To: <b5aee80895fa029070fd37d1d837cf1c0ecb52dc.1716973640.git.geert+renesas@glider.be>


--p6qktic2hincfwcq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 11:12:15AM +0200, Geert Uytterhoeven wrote:
> There is no need to wrap simple variables or multiplications inside
> parentheses.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--p6qktic2hincfwcq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZdm+0ACgkQFA3kzBSg
Kba3LA//ZqwYVFUTAYjbS8w5UHicvZp1au701fV24seVIOM/AJFxJqJWteZKVIEO
EcpVTYtiU62xOqHnjvPDgengvtxcy0/Pmr0GY1+Cl6vHM2bCvC/9ioSrYwPyEvBk
F/xGfn+9NdiCo43djfC30Q7KlqFHg9JO0Pz2IoiCkJalFY0inYMP8sEvcxw8h1FS
lNic8+bP0YRGgc61RW+f+L3jg93Fy0FO29Tr4t9XnAjwhQcvd6Jop87y6eh+l3ap
9elRN317Sq7GgnQfIjlBttX4xaNQbQyHM2nELcKw42Znbr26YOlswEmUJKoUDGSQ
cjzcR598706oeoRtNTuqT6k5cOj/UjoMbhAieawmlZuOr0zorQn3R1m0UwoRiKV1
4D8j/gRbsDYkGgIWhPLEKQhTouaW0SIr5elowqH01B/IePNujhkWQZ/InHNliYHq
vae7Yjs8LloEJpY7LfXelpZeixT752S54oAcZoh56r/KsPCu1RXziBypILZraQlT
XNfnNyMCh2tLAIknrAatg7NhhOAX+r4cacQIMTqlV4nEnGFXPbACGtRaN+Rwq4od
5CuYwe4JSRDBeCXc++XiYRFy3NT3XFYkT5sKQvRuqeCB0QBiPYile+/0//CnmC7y
AVkxmJGIw5Ub9v7rvZvKVci15pvF8cNbTv/KV4i8sQHGa652hQ8=
=s4IV
-----END PGP SIGNATURE-----

--p6qktic2hincfwcq--

