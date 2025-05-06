Return-Path: <linux-renesas-soc+bounces-16704-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC2AABCFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 10:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4148B3A1EE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 08:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49328242D84;
	Tue,  6 May 2025 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BE8MOvP6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942A34B1E79
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 May 2025 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746519702; cv=none; b=SRkwpHu6hWqaxFZEC3F2OkeP37utSOeuYyF7sCSP3uwtMPekJdbX0NS3erL/eLzPpdPEfoyTDgZwIXlLIsq6RhET8ldp+k7RjasY8f147ES5AIuHTz9+meoq/AvY0o1MsBaunL+w9AdiG1ONiS/CjeYVhuB/A8cpt18ecsX855E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746519702; c=relaxed/simple;
	bh=ySdOVAKRm4BVjstU3QqFPwT4oPc1O1Wxy3st7teVSns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeiOYT9+chaHYY69fKRxNdGfUZfSGuEND5eAajVr1FkQLUE6Djqmw2MRa1Q+/v6Yon74Ua9yQ/NyoTU1RLbzeO28cTrHkgcxFBAiy7ODjOsiHjAl6JCHVyLixv7m2kSezsA/RDAlsou5FfPmId28gv4xBE8xlbocgiqEWLKFb+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BE8MOvP6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gmRI
	PpIqvkVAkrubDKFklVL04Xfv129vaIPgrm4Yy5k=; b=BE8MOvP6igWh7P2kHM9r
	qvWEmpQ3ei/ovfOENWsoiB83JOmtFDfwPS+HLGCu11suxjOZL0Jyv4nSy+ztJFkd
	pyHN733ZwldAZt9PKHFndS9zLAE24PGF4KkFgCXqKjoO5275tnHLrQ7U4DaWrLy9
	rLTx5VZMmeu/hIrjLt0WviNa9TxQgGs5tSU5CIVxnPVc/P8sJ23mDISSaTfr0Bb2
	vsbFUHHZFCNjnFVp8a3H/ZT02laMgI/XkDxTig0hf09KHO9m3wjglnzTbKk8G1Ty
	vMz7BjSJrU9TeodUBC5h5zezahWroQ9yr7aOHC5OxO8HnefHk7MM8rzZlaCPkwyo
	SQ==
Received: (qmail 2842625 invoked from network); 6 May 2025 10:21:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 May 2025 10:21:35 +0200
X-UD-Smtp-Session: l3s3148p1@hdn7TXM0umRtKPHL
Date: Tue, 6 May 2025 10:21:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: shmobile: defconfig: Enable more support for
 RZN1D-DB/EB
Message-ID: <aBnGjaWcrTVZ7n4h@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
References: <a40aa69832ef292497b9170e2ad607bd9dfd7e21.1745842538.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hUvouY1iMcx/SUJd"
Content-Disposition: inline
In-Reply-To: <a40aa69832ef292497b9170e2ad607bd9dfd7e21.1745842538.git.geert+renesas@glider.be>


--hUvouY1iMcx/SUJd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 02:16:13PM +0200, Geert Uytterhoeven wrote:
> Enable more support for the Renesas RZN1D-DB and RZN1D-EB development
> and expansion boards:
>   - Polled GPIO buttons (also used on the Marzen development board),
>   - Synopsys DesignWare I2C adapters,
>   - National Semiconductor LM75 sensors and compatibles (which requires
>     not disabling Hardware Monitoring support),
>   - Arasan SDHCI controllers.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I overlooked this, sorry to be too late in the game. Still, this is
good, so:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--hUvouY1iMcx/SUJd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgZxokACgkQFA3kzBSg
KbYgeg/7BVULVbm4uhMi0fHNL6npTU2SfYMCFPXBvtdT9mDgYb6py41zD+HkDDJi
7eZq2rkL6otW7WMh8RPmhttu1XTVzdBw8qnlMn0UDJ+zE3rL44iKa2U0VsSaTPzr
OL00YNU7E+oxTnv3RyPyZTMTDHfApXuoRRGdHUGOFmsHNWTvv3TxnbFmeXjUJ1Th
+guJfhGeQDIndu5yCp3H8aNlr4Ym9828j3feNUyWDWzb3R66xH+gTHrNyxEQt61B
8Jrxp/iYJv8jyBAkVV6jskyP1clTtmwJBSorNTmkQuCL2rmELmwUz1wULtC856mj
kKutkR8InfEOQgPmBkn204tkVYozHX9cDGOB3ZHQCUVw2Ws3E+pLoZUOShdXErb/
XbpJMwah6WGwfGMnHfLUf+H64UtlasRImoyxAbSZnEKQ0+9L8vUerS92MMVPEX/N
qbv1dpVmb2uputlarDDk+ozhdC3Zyx/9XMpGVHauUauEiwP7YH7dWpiebwOeSeIr
mFpDXcrYb5Dg6zrZvYRGw3DWDzcpO7YzIprlq1FWM1SU/9nXvOS+LfyTi16CoL9Q
At5qvSTezaChkysw+Oz+/UrfhAowQJEm2bHtI8QB+Sm5DNds5Wgi0DiZY9S9RW2V
cqDbw+guK+iKzvYHkQ9qNQbYSj7cNXhd08A0ZtW1mgy2Y0igwDY=
=88Zw
-----END PGP SIGNATURE-----

--hUvouY1iMcx/SUJd--

