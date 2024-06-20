Return-Path: <linux-renesas-soc+bounces-6522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3A590FDEB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 09:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51CD91F24F22
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 07:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9B64D8A9;
	Thu, 20 Jun 2024 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AZn2oVNb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317EB482C8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718869203; cv=none; b=k3hGnG1INCWhFZdIEB+inL33GhM8TZyLa3TTzz1obEY6b7kpjJDmHgsBkfqQTF1R/+lVJjfJhF1WT7eqrhfV2WhyEn0Avua717X/logll/cEU7m/i/98Vg1jZNu5PMx3e1GAxM1xvoNc7nsFvGRNd61Gq0Qtx64cCUUCZdA7ZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718869203; c=relaxed/simple;
	bh=/yPsOddln1Esdy1u8224EnBJL9NW6sXJz7xHSt84Uxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J63Y3DY3nF1nRlZvGJnPhbvaMSZrpW5PbKD40AQiO+UjLc50zXOKEkFPDca7G8pevdfkXYDZWsiXIWFEZvre/Shd1ijVZ4N893wCaw3RDyPOTZHS/kd3c4eJjWu7l1qCOSO7ivfRZedeQMBxbmLkW57YnxB1NfHpl/bUnyUDPes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AZn2oVNb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bGVr
	+yK03jS/+Uz4gbUSq4VhW8opj+zgNA5uyq5XFro=; b=AZn2oVNbUjatESfxtfvo
	g9Vs+Z1+vmJTNMPzGTVq+DU1MHCNvXNXDCq1C31C4iQQvN8B/lLqlQB3YdWUBa/2
	9MysEn4I9s+pFFa2HSTKFgaqPaHzkzTN1lFejJhlFnw4zx1WC9wmdmUz3Yt0W0a1
	x/gdjkCFZLtYyPRCn8CNt+oz3xmXZwds5inJ2uinfj0jQcwsoxSz94uNYYkVxRRs
	ayQF7yuUtaSAc5vu+Z2uZMZ8Dryshf43DwG/YlIbVslaJ26588iAr7TlKjWAsomR
	C15X68AddF9Ye0GVrfbJlGoVDo3wm3XXgE9Nswo61ismm8YoN1afxJiG2uZ7Zddh
	1g==
Received: (qmail 928080 invoked from network); 20 Jun 2024 09:39:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jun 2024 09:39:52 +0200
X-UD-Smtp-Session: l3s3148p1@yyOYa00bXqEgAwDPXzjQABqqX1QYyOSW
Date: Thu, 20 Jun 2024 09:39:51 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: linux-mmc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Ulf Hansson <ulf.hansson@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Message-ID: <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, linux-mmc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Ulf Hansson <ulf.hansson@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
 <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="33ovhsmrkgytchwi"
Content-Disposition: inline
In-Reply-To: <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com>


--33ovhsmrkgytchwi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prabhakar,

> I did give it a try with platform_driver_probe() and failed.

Ok, thanks for trying nonetheless!

> - Firstly I had to move the regulator node outside the SDHI node for
> platform_driver_probe() to succeed or else it failed with -ENODEV (at
> https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c#L953)

This makes sense to me because it is just a "regular" regulator.

> - In Renesas SoCs we have multiple instances of SDHI, the problem
> being for each instance we are calling platform_driver_probe(). Which
> causes a problem as the regulator node will use the first device.

I see... we would need a reg property to differentiate between the
internal regulators but that is already used by the parent SDHI node.

Okay, so let's scrap that idea. However, we need to ensure that we can
still have an external regulator. Seeing the bindings, it looks like you
enable the internal regulator with the "vqmmc-r9a09g057-regulator"
property? I wonder now if we can simplify this to an
"use-internal-regulator" property because we have 'compatible' already
to differentiate? Needs advice from DT maintainers, probably.

> Let me know if I have missed something obvious here.

Nope, all good.

> > Don't we need REGULATOR_CHANGE_VOLTAGE here as well? Or is this implicit
> > because of REGULATOR_VOLTAGE? Can't find this, though.
> >
> I will investigate it.

Thank you.

And happy hacking,

   Wolfram


--33ovhsmrkgytchwi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZz3MQACgkQFA3kzBSg
KbZX2A//e7lZCY3V/QM4Kxz/32nrGxuFsbxpiA5GWvyWGqNLNrbbheU+sQkcRVF9
Om1EyiYx/xWGdoTpSrQyislS0dRLIBw6BRs8XTq5iBO4iFGyoqhY/5t0+f+eNpc3
TN9FnvuKFEI6BzuuBoHlJfBtJY2oCDtuWJU5eW4AheUFSzCP2zUDEanbSVBxEHDs
giF7r1eYCCBH4k8CqryVsl6bLSdpmoO5S+tQpW9df0h9SE10dqtyLG++1UzyK4//
n1E4trQRXHoWUBgK2IgDYCLD6JWAox4LI+oxSSYievnRKMIMZ8wnoecWNq1JWwvT
vtuYIVAAbkVpTwrbGebxhHhd/wA5E8ns7eG7zdgmOUV1RAK5AhtW/lBuKR2B8ACU
zWlDtQkibA9vf7a3wAwia8tMczbPoKzlhUI+okEVukI5Hngok91fitnfGROMV7gA
XbNChfWtxkKXg2VoCfNcx9b1teHMn4F4A4jGToCIjCe5Ux6MBsVUS5LY1kSld1YH
p730G8T9BoDcPjqWPwhXL+X7fkuGLx74DE4QbGTZ/NisYl/PYxa2UNyud1GPp7oB
j43cInw/bppQ+vcbK4R36Q/7IvCdo1ZbAQh+e0V6FlDEnCl/c2Quo3QWsnruc2GM
XV9rXr0n+vj4uRcsdqRHTg0jHJbLZEv+GUr+Y5tJlTpuDOl9JtA=
=Gdi4
-----END PGP SIGNATURE-----

--33ovhsmrkgytchwi--

