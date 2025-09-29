Return-Path: <linux-renesas-soc+bounces-22468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53925BAAA04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 23:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DFF83A9E4B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 21:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F329226CF1;
	Mon, 29 Sep 2025 21:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cQCx0zwU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132474A01
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759180498; cv=none; b=H+Rstf3+xD9Bl+mu2X+QTHwZlnEVaEe/l+lpYwHvGFdcAdsCLX7Xc0HVmMf8rDyWnyGGSlokjIPP4xaTML+hzj3taea4sWlHv1B1cRqoMP0wfCzzTr+L6tz2a39/iOHFRY4d95MZD1AF9OmFnlzz0rRwabln4YnxwUBPTRZJNhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759180498; c=relaxed/simple;
	bh=NMk37LTpCAoqvwW6OaXQlLj5jL8pRH7uhmKLUfA8jIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jU0tC/+twjho/cpxspAkzFFCCmdUoKZcNlMOczlTfboOMnu87iImmDrPTn40aNNSdciSSyyudOCXKjrvi/9MNbhZGzOHuHTzFrhlhnqHR/4ijDWAiYQGtC3MiTjqJFrSortTtD8YyyV3y1e6Q0x/I6paxqN2JvgEPJrGr/sKleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cQCx0zwU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NMk3
	7LTpCAoqvwW6OaXQlLj5jL8pRH7uhmKLUfA8jIo=; b=cQCx0zwUgsjL5p/c3xnU
	E+R7JhzhPwuekJ9QjdAo2B9qsBbsBp90mY16rxEDZUc8IUiQrliK6kLNnF4HHM7F
	V9UbWbuXVmc5G0zLW8DQ1eC6J+jaUdlvY87WFDl9s5Q/d9M4P+Jhab/Mosb1sMEm
	bdkZegfsDPaXtTp+0EVErNx+rm0eAt6pnHSvCiBawON18At/PHmTExW5sxshf4WA
	VuaMnPCncwmar3d7+Wkb6aMUUZAqdkasQxIAQf7IKpCWSBmXMTYKSJlBEWJBVeAP
	qJz7Q00Wq2z447ZxhtFAZbpC8gSm8dUmov0E5xkLj6z1Q/mfbz+/bj7LPsg9F3Xn
	vA==
Received: (qmail 3393055 invoked from network); 29 Sep 2025 23:14:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Sep 2025 23:14:52 +0200
X-UD-Smtp-Session: l3s3148p1@AwZSIPc/itUujnsF
Date: Mon, 29 Sep 2025 23:14:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] ARM: dts: renesas: gose: remove superfluous port property
Message-ID: <aNr2y8XckvuaRyKW@shikoro>
References: <20250929093616.17679-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWrMB5ZdRgX0BwLJeOgJPecxm_kw2J=RcFegdZgtHwtYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KNF1YoqDd1V31sw0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWrMB5ZdRgX0BwLJeOgJPecxm_kw2J=RcFegdZgtHwtYA@mail.gmail.com>


--KNF1YoqDd1V31sw0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think r8a7791-koelsch.dts has the same issue, but currently it is
> not flagged by dtbs_check because adi,adv7180 uses slightly different
> and less modern DT bindings than adi,adv7180cp.
> However, according to the schematics both Koelsch and Gose use
> ADV7180WBCP32Z, so r8a7791-koelsch.dts should use adi,adv7180cp, too?

Well, Niklas has a Koelsch and would probably be happy to test his new
Gen2-enabled CI with this change? :D


--KNF1YoqDd1V31sw0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmja9scACgkQFA3kzBSg
KbagVhAAigqEtU92HWGhumIV4nru8jkJrjbvz9hdDcG40KiDibRGul5QJwfqhYBB
2KV7QUpe1q1+8+910n26iK3+mDObN9tWW5XpnWedCX5ImyzP2HcserOKPnzAEXVc
JT0RxxqFWSXhMPufkUX+vniy2ES34bguZ+e1KvXUdFc3j8uLRQzVTfebCOLoYwgO
oMIfwZjyj95QfKVCIq0WXy4oE+uNUsecC6UxC+osj6xNr84fK/T6+nWpAePUAPZm
eBrzyvNhTBiibxLJP/RHcFkmu/S55pGmKGuHhZJgIcqd58ravrDZaNTsjjVXqtY1
PXdcyXaZ/dqhgZZbGTXRfU0Lz3DQYC/lvtUMd28Vm/nPwnA5xb/+MustKm4gMYzw
ssXp18VLiyEVMyMG8NnKvyQCVCD8aUlE7GpWo4uhDeetu4zfqu0O0JzJJ4E8xDc2
5A/hTCAV4/oqrKTVrdR7/sKTKkKL9tIzaIUqQ/Lw1x+WpfbTY5ET5ukwf+9LDyWs
8D4SmI+cx5ekqeCVw+b8cBEXk4VEbkvudcWpuwan7MtMF9lTiv1VARyLMaK38IMC
VJrt+T/s5gNNeeGaiVPrZV13uvJV15HStCC11YkHwrsc7Oey32U4HRxoqILbHFDb
+uUuDJWsk/cFL+yy4gGtIHl2bb6Md+CNDiogM7CadOOOIaaHYP0=
=VoyW
-----END PGP SIGNATURE-----

--KNF1YoqDd1V31sw0--

