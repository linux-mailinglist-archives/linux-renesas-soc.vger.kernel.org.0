Return-Path: <linux-renesas-soc+bounces-14817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE3A706B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 17:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C6677A3F06
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Mar 2025 16:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B20125A359;
	Tue, 25 Mar 2025 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="E9CCbP46"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9344C25D525
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Mar 2025 16:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742919846; cv=none; b=aY29+EGTdfw79Sq1IBPzMu4lazhzcEugcR1wKiDtm+J2/5MrsyG3woHYS3fl1Ne14IPNvsRfBxVryUr9xxiQSlhSTb3L0K5k+rO5hfuFSCCKppxWPChPyHAgyHqXb0PbzZkEuRUPQyUI6ppoA1dM4BN7Ns427nQL1SqK+I1ZZI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742919846; c=relaxed/simple;
	bh=SkaAQPWYiyWWb1uQW+QosWn92clRniCC0jqu12xmOTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEIGlcvN74H1A0Tdg3nKRX0JHaWOAGsmAfw2X45QKcWii6q2YJiONm3LvXWRPq/aL4YPAuIdrWPUxiCBcHrbaEQEMXbzqAxzw+MhrZqpjqHzuPZoLC1DV7ADBCN3umsQGVvxNnjD3qcYMmZXiY+b2bLAeuI2mZlWpcjqg+orLB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=E9CCbP46; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=SkaA
	QPWYiyWWb1uQW+QosWn92clRniCC0jqu12xmOTo=; b=E9CCbP46pK6x1tlRPqpa
	mAwuLhc9nOBe9T1FNCUD5/no6YKZAjyAcotLZ5UWLrqUytHf3H30ATMCGPuWyeWh
	4pL/eT7mfz8/3zuLgPhyDJ1XolwJ4Ls4KkBW27ATtlEzECNZhpDxBxM7uy41NOv7
	QRndRA/pH1JizQIDgM+O9JPxou+mGvuSbN3QKm4viX+V8CxwYd7bZM66AtrW682M
	QvApWYm4HuzfQ36/6ZdfkNTpe5CaehPUgX4XITIBstiqfR3x5lIL+QneSjAVz/5B
	xPrOuvg7Ukz0GdsnyLttGdmAFnHpKTav0spyO+byhmwkwQKwTTv7ExieBAhA0pH2
	mQ==
Received: (qmail 3150723 invoked from network); 25 Mar 2025 17:24:00 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 17:24:00 +0100
X-UD-Smtp-Session: l3s3148p1@OBHrJS0x0Icujnsv
Date: Tue, 25 Mar 2025 17:23:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Message-ID: <Z-LYn4pYBjWP2yTq@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250325160904.2688858-1-thierry.bultel.yh@bp.renesas.com>
 <20250325160904.2688858-11-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ILpDOsLtsctFtzl"
Content-Disposition: inline
In-Reply-To: <20250325160904.2688858-11-thierry.bultel.yh@bp.renesas.com>


--6ILpDOsLtsctFtzl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 05:08:58PM +0100, Thierry Bultel wrote:
> Define a new RZSCI port type, and the RSCI 32 bits registers set.
> The RZ/T2H SCI has a a fifo, and a quite different set of registers
> from the orginal SH SCI ones.
> DMA is not supported yet.
>=20
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your work!


--6ILpDOsLtsctFtzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfi2JsACgkQFA3kzBSg
KbZSGxAAtZvYqs4yrLRc3jTSJ15MhxbMQGTtiYNUqhD8rQmBIJJru5FoHLv+tSBD
K03sEwhGY6PDTUxUZnpqrzKQTiLtVn3l76y/4AyYFNidQcGBddjIr5zt5sBttmKi
3IfQ3J3CX8cL8y4xboMsqaOdWvWViM7NmNAqxCD3Y8L4Fmwri7q5Eh9G8tc7E4m7
6Oluy00xeDQcm91RrBuwMx4mrwcCHOSebqbOPyPu3N2DTdkl1CaQShZ8nklkxyeq
vRfdnRu85Y0KJ/r536cs/clKPEYYxen3duaRpPafArm6bBM4j7x9zClndZfVMpY7
Txq7ruV447iA7/VoCdyYlEA14h+E2i5mT7PLPxJHvA3WAWkfc2kvNDGxRmaU+LYb
JrOsyut7bB6Cd46QSFFtu+l1GIyTByqbrx0yFSGmvWrL4Ga/+IMJ3otrsRuj17tM
yldWAfNl7dsxngft4cBruUodropifwpuuoVK47SKar+IpUQFAGmUoQr9VOwMDbCk
JGGEtb6dT/aUIjR4ygqJSk1oKcgV4DjZJy2ObRCt4QOOlqp3kqPQsBRDgfiOrelu
0dSvzKSCTUPqi+7YKu9AyLWTVVkpINBl5W3j190x0QtWM5EPayVeGeTqhFLnz8tA
5J7AahFrjkGxL3XNX5/wge/iMcepEDNpe8SkCUFT3eoqoWgB8Xk=
=JiLv
-----END PGP SIGNATURE-----

--6ILpDOsLtsctFtzl--

