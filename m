Return-Path: <linux-renesas-soc+bounces-23734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D68C14434
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 12:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 925E9350B15
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 11:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3C520010A;
	Tue, 28 Oct 2025 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KuynEqqO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4145025332E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649610; cv=none; b=CfeL4Qwpj2FV2fNY4NjfHVOdf5sVTh0lp7k6MtqEfnA/BCIxMZt0syczlqSAoE0zkmd2E4HlXXBa1kJHTXJq6aqwM9nXxH45dhv6SvEyB4hVFRQtyhxs66lETbi0atDMsRshqiwGC9ZLY4pbefo96L0KbPRV0/0HmGMA223C/dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649610; c=relaxed/simple;
	bh=NxN8F9dwOB8Xps21VmfRDk5KhXDMGPv35yjbpoCClto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tk4fztyVbwfovSVEb36eKoWd9QFmiDNFIt3qC5RR4Fvxp2z0p1pxgrjClb7BhIHzUi6CiAIPvxSV2iPi8/2weqdJuGVnXibFg4mhsgM0ih+F5uTtxTi0eKqhaSs3nhtTPEtfo2hs20F2s5RpRk+3lDh+oXN1FUH7hBhRPtePi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KuynEqqO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NxN8
	F9dwOB8Xps21VmfRDk5KhXDMGPv35yjbpoCClto=; b=KuynEqqOsBF/N7u1LVLj
	Uyg0o9jerkLoeE9Wzf/G8YPeWWpJldpTB/4cAGzMNCnNQCEXuPSMyyLB9u7ILoGh
	MVXsWULuex3siFc7GeotapHj/xyUGP+njEkAt7KWiD/J9jeShIg49QU7z3WmmL/J
	JoffFqo0yeO5HxAO3Amljef1seO0RLYhLTroifu2XI9jwOIjxzbF2evhwUK9idKp
	g9uhy+PCuJ4g1pt5dqsQPC5cDIIeptwE59uDgEi3R44HjC47PqipnuoKS44J6DJp
	z93tqjcr5rsyML7NQRIWQIJjTZKQbzRz5W1oDyzPON4SKSlj6gYQja4gCFveOT5X
	Ag==
Received: (qmail 3987474 invoked from network); 28 Oct 2025 12:06:46 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Oct 2025 12:06:46 +0100
X-UD-Smtp-Session: l3s3148p1@upP7AjZCVpMgAwDPXyjKAONDL9E53Fzy
Date: Tue, 28 Oct 2025 12:06:45 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mailbox: remove unneeded double quotation
Message-ID: <aQCjxdl0PkTtEsmZ@shikoro>
References: <87o6prsl2z.wl-kuninori.morimoto.gx@renesas.com>
 <87ms5bsl2a.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HpUTDxm9UYFvTWTh"
Content-Disposition: inline
In-Reply-To: <87ms5bsl2a.wl-kuninori.morimoto.gx@renesas.com>


--HpUTDxm9UYFvTWTh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 04:32:30AM +0000, Kuninori Morimoto wrote:
> It makes Kconfig strange. fix it.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

But should be a seperate patch IMHO. It can be handled independently of
the MFIS driver.


--HpUTDxm9UYFvTWTh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkAo8UACgkQFA3kzBSg
KbapuBAAl4dzufPs6sVo3CTSTzCf3x1f8dBLXGcDvH4sT0QHGFTM8EUkIw4tzMBP
ExUyqJLurbo9nLH3j4T2Gfvw2NSGsB2s7+hquZ/OvUsMn4GsZaEVTYn9cj9WXR5Y
e3Lf2J+7130RQ7dWOXEGtgTmiWOpQQJ4J2DDvhNEnGtiz2+H5b/gmGt3iUjIHPdW
nMriBCs3Br5/nZFYj95jRPUyXSZSVIzi1RxQWxdogtv8FZtUlH7v488n7HxNpFy8
ntzngGGmhNWVkJBdVl40gboeavws2UWc7Q4vjWSallxBxgMNes6Jz04MltCB8F5/
RnsGWsu8z6oT/GFsJGl4queF4i1uSL87rrLN2iwmegtX3Wv71u+Z8v/NnZS9dBRn
lcZ5xFyxcVH5aXuEMsai8wSY9CvcA8w+mTINlfn6oRU+ptdlvYlMYVqncyU0pHbE
JCVHPFaMHNaSEowo9OxKKmebnwGF105BSldRU+n+v6CPYCtUJGshICqyZBLxAY+2
yRMwj0YFJlkTIpD1Ab8Pc5onDD7NxAZvRpHvYYjxA/BB1gEI9BGzd6BhNDzvP7Ib
Xs5/UwYveMAl7Vzs3SZzG47hRWf5IVk0x7URKibGO27DlcWUTGKZ3msDFANgrYvz
YVgODiJyosTB3R2JxtE4zxI3fz36sB/ddJx8BGW/ScF13z9HIdA=
=6eAE
-----END PGP SIGNATURE-----

--HpUTDxm9UYFvTWTh--

