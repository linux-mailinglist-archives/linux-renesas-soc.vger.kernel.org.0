Return-Path: <linux-renesas-soc+bounces-9040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E04E7985524
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 10:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8CB91C20A0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2024 08:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869CD157487;
	Wed, 25 Sep 2024 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="En4p2fKR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1A1581E0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Sep 2024 08:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251739; cv=none; b=OOA81yXGDtZcvKPU0znCDm4WiBlVVEYynMecpGAhFP/sbhTFTHHUibNpoKHoVgZ2JlM17Ua8vyfHO+4XaBzSFnv4dgMAQLd/jGr+mELltegiqGcLvYUWuZ2Ue2BXimNic8WfcNOJn7ehAZXNOf76X+h6mt7SVkLmbTomjD+M1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251739; c=relaxed/simple;
	bh=depYVt6fWOK3HfU3lEMXuCuvoggswBStzR6gwsqjmeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kg+OO3z5Uj9l84KAwPeej16+IWrWEDIkgmvFP7PjnZ8/xFBSgvmjYyu+wRZcjzHUqCf02rq8trKAqMcBbDdXDCurXw3EZ6KVWWQjKm6tI5o4MgwC9FGEX9r/b61p3oxUKLQnUASdRLfSp8fXRKseegctVbRwzvyK+1ON2vTCvfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=En4p2fKR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=L1Oc
	6AVo2jubjkejONS2UDmsZEVq2tV2ABI09U5+ngY=; b=En4p2fKR/Ipvd6jx01BQ
	syeDjmQAk292THvbOjA5c07D8LzW0itxryCEGvsqzXCwiSRgGHnIoExMAD+o3PyS
	OtvMr7drzafxc/ECfAdeajK6pzGfBgdotjAjqwah9O5IldKoOs5j1GlVGN+d03cp
	5oQBBoczJ+2hVuEmb/ONlTfhFDICNT2wUCpBf+ng3poR9rrSfk5T4g0evm1lQOia
	MzAZoFvx1/MEVdlmtphX6sB7kooUB0tnxpABL/6w0gKsP7lvqOZKzlSG4175U8l7
	AnIwdsnWY8MUCKEN0oRigX+k/QryOQmfSx5A553Rz44jFmq3RAEvQRDCz4xBB36F
	uA==
Received: (qmail 535317 invoked from network); 25 Sep 2024 10:08:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2024 10:08:53 +0200
X-UD-Smtp-Session: l3s3148p1@eGn9Ie0ieE9tKPDh
Date: Wed, 25 Sep 2024 10:08:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 0/5] ARM: dts: renesas: bring genmai up to date - the
 easy stuff
Message-ID: <ZvPFFEhbAtiJ0EWq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
 <172722909822.835713.6559556227241563232.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8yQYSzjm/Q9Qs7wq"
Content-Disposition: inline
In-Reply-To: <172722909822.835713.6559556227241563232.robh@kernel.org>


--8yQYSzjm/Q9Qs7wq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> arch/arm/boot/dts/renesas/r7s72100-genmai.dtb: keyboard: 'interrupt-parent' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml#

I fixed this by moving 'interrupt-parent' to 'key-1'. Checked with
dtbs_check now (which I needed to repair first becausde of a Python
version upgrade :/).

Geert, shall I resend the series or just the last patch?


--8yQYSzjm/Q9Qs7wq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbzxRQACgkQFA3kzBSg
KbayJA/9HPPaL9JOD9ynvZUe5xASXNiAfvWZl1pf8/LtDP8ZHhSxRXN14W18gSFj
KEh4xrV/Y7uzLbaI9KPb8+8r4VQxyu52lCS+jgz0jIw6CmZTgQfimc9VgsLOZ2tl
pDqfmHT0Dn1omHQNl1RRklNen3yKMIPj7c+mysXH4ZSpIILVG9bk86vXNQDvRade
KmDmFXeFqruxVyGnByaoNEyGuNVqke7Y4epcl8Fe9kpIX1ShAcR7MeIbHxQsWQhX
SIS5XAWpwsJAPAk/uvz5jG4MP3iTzFMhABcUQr2pj2l9GFDIoOheKAnMHEBm36fX
QEgVgPbKcAfH3XKeo2fIru0MnJfnQvrAVfd9Oa+1UNE/czMgwyN4jA1ppE0J2m8S
WRXW6TzezACpp/BrPaRm2+Tsvr3rnWzIyZCh9/BdkkLnKcZII/8EgnOVDr5sfODW
2EpUGbLItQk3Vsx5UxiSPJvT3m+0yeCQPcY1b8E+b8ULqb+QGNsBgUswxY8Paj1R
XeRhumXeB0Gj6ynfgwjDinxixSDOoFP/MZnhJqQMe+NhRFPjteG3jPZ4FNqFWyiF
d+OK1acCQywy6pkBu6RJpKzIWYYAxG5D9hWyVRktVTZxQ7/297RAElZmffNpM3r4
JDUwJQOGROrUfyzq+3OQ5El6fsVpbDuRu+0rnXUPScBkjOevBtI=
=FSL6
-----END PGP SIGNATURE-----

--8yQYSzjm/Q9Qs7wq--

