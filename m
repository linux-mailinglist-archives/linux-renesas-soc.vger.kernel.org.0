Return-Path: <linux-renesas-soc+bounces-6589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34684911D09
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 09:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 553C81C21D07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 07:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D479E16C858;
	Fri, 21 Jun 2024 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kmXCFdKX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FAD16C6A9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 07:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955777; cv=none; b=IyeLoLOxg4V7bznOD1ENWb/J98yeAWnYnSPVBe26ZkhrftNYK/mySzUsQ/YlzDNIruLZFtdiMOaKYfMQ74M9GsFeaobYTlGO1Qd8JD4MuOFFiHgt0hB9A0vAnIcSWmVEDd95P0CJIuqFcyaUXMp+KIOzJXrwKqyfuxGUTwvrxwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955777; c=relaxed/simple;
	bh=T1sN3oQBJsAz9LXLb/VpxF/ym1YwCX6y2N4CYy7iVPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fooK6lJ+Ndv6AppWzk1VgeS25BzR9WKYetdRcUViSwP9us3gPs/r5wxs4glmCEHCjS7z4hk+MCt7KA8aETBA5pqrYPYVC+piVqAUl/kmMHfHVa56/PQ1Z4B5LbPJBNO3kOU3pgsVlFIgwHnrq20cueGXo7r0matxtOej60QwIvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kmXCFdKX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pc76
	Bb9ebpjxmrC5oUNX063Vhn/KxpYxrUvSJUatGlk=; b=kmXCFdKXYDX/wbo1mYCB
	roK4TR71sjSrRfFyUcy1VWMQ0yrOvttxXAOe1mTThUQUPor3zjg2tFrIlLXouX2U
	MWtbmBofn51X5L8YhFdfIi+IVUZNdv+kFBEYqodl5Bk0GnSzpQzHdxJyTcap18PT
	iHuU1+sOuOIK77FyvpmYS0kZYxnPOCJcs4Nlu2qOrZ82zuhjMO3nwwtRjMb+rgap
	upY1/IUPPaqH0OCmHJZXMzRubPoUI11fdR6DUtIIGKrMgLUY5/oj0J1aCvAIvc5o
	9xeWVmNZGPmdZJkToUDe/fEdmV9lvWbRx+yjsCZpFwB1nionHyrc93xetcAQo3dC
	uQ==
Received: (qmail 1282990 invoked from network); 21 Jun 2024 09:42:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jun 2024 09:42:47 +0200
X-UD-Smtp-Session: l3s3148p1@tPDnk2Eb9NIgAwDPXzjQABqqX1QYyOSW
Date: Fri, 21 Jun 2024 09:42:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Message-ID: <kphyk4vpp2yxikuwob6x567ob7nujzxi4z4smyqcpwgrrqdded@ujmtdavcdjdo>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Prabhakar <prabhakar.csengg@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU0oFH61fHNp2txOOJi_pWihKrK=UdETrzBs-bDeULTqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6evv3y66pqz4vm6z"
Content-Disposition: inline
In-Reply-To: <CAMuHMdU0oFH61fHNp2txOOJi_pWihKrK=UdETrzBs-bDeULTqQ@mail.gmail.com>


--6evv3y66pqz4vm6z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Probably I am missing something obvious in the big picture, but why
> must this be modelled as a regulator?  Can't the SDHI driver handle
> this register bit directly?

I suggested it because we already use external regulators with SDHI. So,
I preferred the design where the internal regulator was just another
regulator. Then, the SDHI core can just keep using regulator API. And
not have two code paths for internal vs. external. Did I miss something?


--6evv3y66pqz4vm6z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ1LvMACgkQFA3kzBSg
KbbKxBAArTp57QUYbPmUUMhl1n08MWTNsevfeTz9PYxCuVRK1lsNzej2WxBa53lC
6msflVdMyS9puB//h92gU4Bvn+fIAlo6ZLLuqz0dpgj12KFQMyBJ14Y3GKd+ixbc
FbKbLQJSjE9hmptQo4OnBqRf6NfNKJzydg1DEumUwUdNW5Bt7wiHsG+xnGsH0kNs
2gkMY2A0JMHGpmMbNKa01Uz725T7k6saNnnZFYfwemMSO/tEzPz72HY1nUrkO52I
ZL1zZmHSaOQrc73me4mmuYJr6KjvlpyetZpVboTw6NlosBv2mHc/ITctuQZ+1Nkw
1p5Nc26ssXHA5n0FBY0uPPKrxEtu02Rn/sH8iy3pL+9rRzTgQ7NdXggBvfkcDd9d
C+Jtwo4n6s51edasXcNWjSNGA628WDratc5jNpaakB3QgKWU2XhFe9ztRHE5RiZN
9sMV4PDGD7Hacm8YGhFAYLgA+3lSWD8jH/qXHgiQaLVwom5/D+LXApvrCr7fClID
cCGqd71ufUqyZ0ZrRkYsas10G/K391Zdp0pevdV8XXTE9IU7mH94W2l69XPHAxNJ
cjmlNOsLBMZqtNVTby+ZbgjD9w+n9fhvMBHWalCnrpUJChskesGgE1gAqXsygDYm
8srVpgmPEoCwAoFa1QDr2v3PwzOxQ0VZlcLzUXpAYhPBVuHn+vA=
=h+fE
-----END PGP SIGNATURE-----

--6evv3y66pqz4vm6z--

