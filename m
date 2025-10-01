Return-Path: <linux-renesas-soc+bounces-22524-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9CCBB06EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 15:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C74A417BFF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 13:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA882EC57F;
	Wed,  1 Oct 2025 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C9/GOsoC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B02ECD0E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759324211; cv=none; b=QdK9oXvvUe/O/uVED4FgrVpbcuzksSCuZjBe1z181VB+97FE9pLDUyKCjrTLCIeRBOfgR72bXD15v8ewOtjOQxrbDRVGAX1I8PPGuPs2lJHY1Lb4Hl2TZOdmRyz0Q9PKQW1xg4gfSqB2Ebi01pBMAenC8tk0Gh1INBGctJYJ4Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759324211; c=relaxed/simple;
	bh=k2wehfMJ9zNABRnampKd9+8s54NFSilboBDC4Y/Nhak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH5Qy7mPYJdDXrdLcKDPrdO/b1GrMz1apOnyzx4x0FyH/h00l8LbmMAit+nL5PwPHs+7z2Ke/Bc6ZxPutGeNMPJJfPHiqKs4cwgpUW1F14Pj2vDCg9Ti6xtEjlfZLHJ4r6/pj6CL+LaWs8TdQ3ZZQVrjMNFSW7QX7s+rrQPt3Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C9/GOsoC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ClFl
	KEI3IMGBmmVYwNK2ojq4MkUXyMS8XuHQ/sY74kw=; b=C9/GOsoC4OiWu3t3iBbJ
	0sTppRJcl6/XL/ZnU90BhOOOPfR1wiFFnguVmgDbx+Wzv+QUsYDxtwr8J4568wuX
	1l7HMTUfMvoAZeETUY4caQFXsGlVd7vKb6yCRlyJHNIQ/U6xgsO/yghPVRD4yGbv
	0mN8QQMTaV/KdPhh8g19VK60t2oSC/skArWOTxHboUDYcW3U7P84GDrZx0NJfOVX
	/qR9M6O6io08gWCCPa/SpDd1DPqMdieAykGewOtbCZ9Ounpvls7OU50bf/zPwWH0
	3s3zMfD9OJjSQ+yutWxk7Y1sUdIztbZ2BZ3e40O/9slRw3Wad1N2bhhlKzJMQqrT
	+Q==
Received: (qmail 4052449 invoked from network); 1 Oct 2025 15:10:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2025 15:10:06 +0200
X-UD-Smtp-Session: l3s3148p1@WcZblhhAZo657tsh
Date: Wed, 1 Oct 2025 15:10:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH 0/4] ARM: dts: renesas: mtd-rom has no clock and
 power domain
Message-ID: <aN0oLZekzv8gZETr@shikoro>
References: <20250930101656.33435-6-wsa+renesas@sang-engineering.com>
 <CAMuHMdUjPCO=zVcY-XYWrPMy8sQ0iVM6_H5OETp3Z7sF7-XuYw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dmjiWPeRQAownVPf"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjPCO=zVcY-XYWrPMy8sQ0iVM6_H5OETp3Z7sF7-XuYw@mail.gmail.com>


--dmjiWPeRQAownVPf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

> Does mtd-rom go through drivers/mtd/maps/physmap-core.c?
> Then the clock domain is handled through Runtime PM since commit
> 0bc448b49e8a017e ("mtd: maps: physmap: Add minimal Runtime PM support").

Thank you, Geert, for the pointers. I will have a try.

Happy hacking,

   Wolfram


--dmjiWPeRQAownVPf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjdKC0ACgkQFA3kzBSg
KbZuPw//fCCKELYmVSDFcgeOFr7WZeMXEs4hjBlj7mLxgm2N5fG1ggAAIuFjCEpt
Na25iR8Va4hVigo8kbNFx14Xx+syl/SBJDWjET9BGgkZP/qC3ojgzsdbJM5GbkWS
WOpVb09XgXvobVYtCcVXM/EBAaOsv1GNLIpgF9oAUwATE3gk4mgTxVibJn4wJmNm
4UE0AkzJ4bCMMXw5VCHexKONwfzA8EkpwcItMg3inpBCKUS7JkuOvKWTDOInOBQv
eJ9wF9/jF64/P9dos7h3G3ddnzFgnV5Do/9/SANLbS1ZJFiKZsteTblC5wXIa3dL
APzyWAHIbnvIikaBTKqB5KgdQNa3S2dwGigFPLcgJGzGtPD7QBl7aTizAO581gs/
2jLGhiJcx4bvqO8bPe5qdYQHSbZOaKsz/61AygLURXv/NSzrDQwvBZ8++ZwQ6jrL
fXsD0r2PTvAxo/xq+Ci51OKIIaPiae5zvlQVI6aSJYWlnUxQ4jg1hh10/WpKpZCc
2PgX+zb7VtQMqftT+PDmu1Wiwivd8J5W/pTDk/7bJgG0rgCHGASaQS6Y3itO4BJH
2g/KiLJv+vYtjjkjme8nJQwgLb3CPgFB8ESqYuk9Qxe0brzJCEAmi4Ly5LjZ8o15
D5V/DtmVL2aSJJglRbCETjI3JGbzY1J17DKGG28p0a8TuM1PvzA=
=2JL3
-----END PGP SIGNATURE-----

--dmjiWPeRQAownVPf--

