Return-Path: <linux-renesas-soc+bounces-9328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1C298E936
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 06:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 984541F237C3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2024 04:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80917BA49;
	Thu,  3 Oct 2024 04:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kjBIZLg7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32851758B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Oct 2024 04:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727930988; cv=none; b=JBDtAbhT411aA7W210llCdMjbzCKLFRSwY0sOUBt5cU7NY0PnsHE6uy+QYFVMzRCW/95rQm4D0alBLXK7l1lbPXpHhw7e3dS1jvUXBI6d5wHFDdsI/MB8Om+1niSwxwClBgin/u8E9WEq/T9dfMVLoyBWHG7XYhzW3T4MlMYl/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727930988; c=relaxed/simple;
	bh=/dpUHJbX/rANCSHxOt/tEB8dKfMs5LYy/ArO5HY8uNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLQQmCJfLqQEcwnBB5CFQh9j9UwVBN2ujUTMWl2e28LiiV7cbHPeXYsev6ObeIEHCzh+uHFHNV3WDCdxokFmnbQkSKKw+yPm6milVJeRe5kUkaO5HxSZ8PG7kqiND04/mQ1SnkNB27cRl8qRiHW7zdOB5wiFOpE0tgzb4ye01fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kjBIZLg7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=/dpU
	HJbX/rANCSHxOt/tEB8dKfMs5LYy/ArO5HY8uNA=; b=kjBIZLg7dbfUGXI1czPP
	itKgoi6JtbSl8kyWJcTunJ4VeDSVGMSt3l8BCZ89UdSFfQE4KQyiTAal0xju3yuI
	1BWNGWAbC+N0tC72wpSDUJ7bpONULnuGHiGmHpt/Rz6hbFFEvDyOD4VU5v/HxgWC
	MmzmjsASqfmWn5gpoKbAV8JjhofvBmewqqrQj9XjAoRpbvGqODgXcuWcWO4Rad2Q
	T8n1YDUGCJHXLuRvgO7aJ1j6QwMFFiYf4yj7C7LLHY+4A100hV0ldXa8hJtWQI5i
	WfT6KK7uRC4eF6cVxV1jBVyRF+Q71UQ8FRIPSGq9rl7pngdsIMObyanBoE4XeQbU
	gA==
Received: (qmail 3049726 invoked from network); 3 Oct 2024 06:49:30 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Oct 2024 06:49:30 +0200
X-UD-Smtp-Session: l3s3148p1@AhKxR4sjptgujnuV
Date: Thu, 3 Oct 2024 06:49:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: memory: renesas,rpc-if: Document R-Car S4-8
 support
Message-ID: <Zv4iWrRFS1rzCeQV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
References: <87jzephowk.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9L0mFAm8o2TlQrs1"
Content-Disposition: inline
In-Reply-To: <87jzephowk.wl-kuninori.morimoto.gx@renesas.com>


--9L0mFAm8o2TlQrs1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 03, 2024 at 02:59:55AM +0000, Kuninori Morimoto wrote:
> Document Renesas RPC-IF for R-Car S4-8 (R8A779F0) SoC, which is
> compatible with R-Car Gen4 SoC family.
>=20
> Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Of course, we can always have the binding. But there is no node in the
upstream S8 DTSI file because we were explicitly asked to *not* upstream
RPC support for S8. I can't sadly find the mail anymore, but BSP commit
92e6619c6bdd ("arm64: dts: renesas: spider-cpu: Disable SPI flash via
RPC") says that RPC access is handled by OP-TEE on that SoC.


--9L0mFAm8o2TlQrs1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb+IlYACgkQFA3kzBSg
Kbaelw//Qr1UtsOq77ulVhy9Ch6ERo1dVDGPjCPiCJpdpjdJJPlNHlWJ6w+LRIB2
c9DfUHt01y1Uk5J6yZgwaWICQB2qTNkZsaluBDidenS29/7EoxsRstvgB8bluYnm
PeqJcpyngyklINYKACGqKPsb2vCeRTn5xpeVTpQ10aSHQH8qgk79OnctfGXxOVey
vYtHmpewFsAcc2zIWqPhutuqS/mRWmlhvTTT5WvnL0V1UwQt4Ypm5jB+f7rFEQjr
Mgu6HxVlhzdwrmTRC5ErzYrcmpkRezQd4GhXplhrZDuftU1ErJ0ePlben2brj08T
GIhZwqCicyxYtxIs1KN0L6QDtFRVa4lpTT/+kqLFmdG4NYTC4VXSaRAYfZCkbK3/
kesWFrWHo588Z93mKdgrgVHyeva6QK1Q941FmJy8G0tRjuX3fu60zBSZYKX7Eh5p
d69FgqJh+fOyp9yp0XhodJXUfQJMHkMcu3Qp0vO1owzfELUz0RTN5stm34ZyakgH
COyxaxurtDnylUn3AvGN73w4k+c+TcZeIzhFqUnayS2nayUfQL7T0jgFjv2qXWIi
oQT6dfVY6YcyYpmJMLBnY4G8I/kgV8pZFd9c6BwesV5RQX009biQuiZSr3LfmO5d
e1tDIdKJeLSXXTXp7WCVeWvSzX7dPEbIJegBMi2Af6lYhCF92C4=
=BuF8
-----END PGP SIGNATURE-----

--9L0mFAm8o2TlQrs1--

