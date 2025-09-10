Return-Path: <linux-renesas-soc+bounces-21700-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D2B513B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 12:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC6ED485F35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 10:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F284B3168E6;
	Wed, 10 Sep 2025 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IuaQ81rh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595522FF65B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757499509; cv=none; b=Riv+0/RGfKUWZ6VLfNgOg+kUupPNKtOGrSmn8p+lkYAOjrYxhHrBY/YsZoCK5Nlp2v4Qq6AHItdX0QFyFHGNrroxLzVXBdCLGoLWDe1wzBf/A1ynaREkD88CfyasTusVWLcFBdpIuZBdZtn5+ZJvin5PV+Z4oTKpSOongbocLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757499509; c=relaxed/simple;
	bh=pUSy8i4pFmy/zmoPlHaRlnvRxhJ+o6yafXGacXCrSR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ef2C2+sM+OUg1fTZ+lQ/eMFWLhJiVjZ2PbQq4vGyp5ZLecVVyegoW8u8P4FaZfayUx2/NnoL2xdZOQuFDLv7QCtnSQalrPJC4pwHjYZQQ+7TVp9Q1kY+/qUZcfznfQqupOvOaLHWsTiDvgK0bxrWoYKO/JQ9HORwZNoNMo9JN+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IuaQ81rh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CJ+M
	D8YzeVsq/xpythvaTyAC3To5rI+Xi9AsTN9btYs=; b=IuaQ81rh38h2Hl5RmHHZ
	HreEBySZKc64Tx3kWScdd4W+X1gxzg4yX7ltplUwcpdet6/Zo/PrN0BZN+liaLtw
	yHTFYVWZ3dL9KbRWQC2Hpn/Tr1Z1hT3CtK6aszZDsQ6KZhcmnVgHfMjLTjGeCJQa
	Xjum2EGZvlYQMXcw4WwM7d1Shb/K/kOpTKSe65301aecgeGDvwZo5TUxQ0QhSw/f
	pwyqbTt21um0+Cn5/acCnayOTgOHS1q6vJVKrKMcDrbOxG9r7rncgcwyu61ybrtM
	5cp6TqGi6wt5BHNISeWa3J6NJxAl+GRf8zF6AshyknBKbsWa9NkiUEW2LlB+2tlL
	qg==
Received: (qmail 560856 invoked from network); 10 Sep 2025 12:18:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Sep 2025 12:18:17 +0200
X-UD-Smtp-Session: l3s3148p1@9BtAvW8+QJ8ujnuV
Date: Wed, 10 Sep 2025 12:18:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v2 0/9] Add PCS support for Renesas RZ/{T2H,N2H}
 SoCs
Message-ID: <aMFQaQhn2So3T_oi@ninjato>
References: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aLwm2fbi3acKlIgH@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tJk4KSjWRS5EPtob"
Content-Disposition: inline
In-Reply-To: <aLwm2fbi3acKlIgH@ninjato>


--tJk4KSjWRS5EPtob
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 06, 2025 at 02:19:37PM +0200, Wolfram Sang wrote:
>=20
> > This series aims to add PCS support for the Renesas RZ/T2H and RZ/N2H S=
oCs
> > These SoCs include a MII converter (MIIC) that converts MII to RMII/RGM=
II
> > or can be set in pass-through mode for MII similar to the RZ/N1 SoC. The
> > MIIC is used in conjunction with the Ethernet switch (ETHSW) available =
on
> > these SoCs.
> >=20
> > v1->v2:
> > - Dropped regx in title and description in patch 1/9.
> > - As done for other IPs used T2H compatible as a fallback for N2H.
> > - Renamed pcs-rzt2h-miic.h -> renesas,r9a09g077-pcs-miic.h
> > - Added matrix table in the new header file.
> > - Corrected the resets check for RZ/N1.
> > - Updated the commit message in patch 1/9.
> > - Dropped regx in config description in patch 9/9.
> > - Dropped patch "net: pcs: rzn1-miic: Add PCS validate callback
> >   for RZ/T2H MIIC" is this already taken care in commit 508df2de7b3e
> >   as pointed by Russell King.
>=20
> I plan to test this series on RZ/N1D next week, hopefully on Monday.

No regressions found when using the 5 ethernet ports on the RZ/N1D
board. For this series:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--tJk4KSjWRS5EPtob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjBUGUACgkQFA3kzBSg
KbbzQRAAjVPcydjLGZs63Ha5mu3EK9/MgZpkIQZRY6lbCXwg/dTSQ/7Hy/pgOKW6
y/r5g6yBPLQ8KiEYovrZ9Y8aHI6tXSJuRzsQ48M5Tp4EzsJm+tGv4epWqdKAa60x
ZGpI8vytpoDOk1DlGZqQn9lyWdlHGZWcqgap9X/DRUGv10y5UEZQyrbPgr+I1QO9
agcr1KnKytg4pgZdgmD2TA3iN8uVYsKOfH6sS2SCBNlLhjZkH9zX+pgSyWmQ54BZ
9tqKqo3aTmk5XjEl4zaS6rcmE9zZOQ3KPjH7fCzNc9Wxzx9eYg/Pg4tLKrFv45aE
cH9ZSvPx2aIrEqNhCQsJjpA8RLd7fCH/Xzii+F840BSsNtZxbjdxSwxTfx0KMcJi
fuMEtKgwVU5txq3/EHdbk4v59FbN1DBNIkf895jpdv9oc1uINMV4HC2PX1kzue0M
fsWuHtI/4O6AGRw9ZjsI2+d69sCBWL0cFtsl9sgiVVO+NzI3oI3NRSwvBexoYG7z
jVb09ngzJdaV+Ho1xXGHQYxfbPxSV27zNjW5V0UlyUB9lhZlVPtuNp3vFyWHjoN3
ITnCNp7KmKgzJzWT9eMvlZV2tL0SGtCAZHOMlBuxVgjs4L5FtZqo6JYPiiIXZcJV
NOHc04NgbeicnQ8ONcp9ayCkoJ2rlak7KQlwjhyByYxTT+UxGJU=
=AHfh
-----END PGP SIGNATURE-----

--tJk4KSjWRS5EPtob--

