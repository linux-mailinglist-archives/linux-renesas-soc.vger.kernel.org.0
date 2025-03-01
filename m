Return-Path: <linux-renesas-soc+bounces-13835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C28EFA4AAFD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Mar 2025 13:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFA641897B9C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Mar 2025 12:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4BB1DED63;
	Sat,  1 Mar 2025 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DujlRMhE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB731DC9B8
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Mar 2025 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740832919; cv=none; b=FEbtJrUlmFigWc6yOJTWjsJs4tSbIg1GcTUnympqOZ64uggFa+ukkGQxd+wAyntlQjyAn/EFRM4pgCtXi7EE9DYX5xJmor0II7+F9lE+aMZu4Plt0DLZbdIgqvPgzm5cYNohUIDIO6GVm3xeZ9JdO4Og9l5f5nb7v7wxrPy6Xzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740832919; c=relaxed/simple;
	bh=yQfNF7T0+QLPJDXu8d5ij5lIgX94ho+EMWPmZQB7gUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SR162KMRofd8KqbhFVFdAe0OlW2arVGu6MWJbdo4ZBVDcwNckBue0pBJ4JcQzZvXbYtFqM9NKmabVnnbLwKUevI6YtYnmG+JwGyHotER8jowGq1bYPJt1BZ2TgRBeKOTaL1tjiAuU5sGBDhfunmzya5369u7H92tuvIJHGiZMO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DujlRMhE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yQfN
	F7T0+QLPJDXu8d5ij5lIgX94ho+EMWPmZQB7gUk=; b=DujlRMhEIe+qSL0SMw7Q
	r3iYxK8kqylj+dY/nf7m6+OX6WfbuAV+puvOXnrVbab/bIaZkFKwm+kK3Yey/nVp
	nBh4glkcD+Qbp7xe8gf19f+Y1cyAyOQzGq8ot+sQgZpXtW0zDoDDnM5MS4Cu+Jji
	a4cJtTsEL5C/KIGFxMENIYZYYxoqTpZtPXHFus5AsMHsV/6qFg6+aIkzgUdYKRv4
	lolQGl/p+OnHZXIlHM3B35kQVGkgxOlXPT+hpVwYnzezF8+U69g7z1m3Hc/vNKeQ
	qAvMiXHDeMicZb238To4dK1lvp28yLk5KEPn4asXoVFoESfi+nPVepaTvogzjomM
	zw==
Received: (qmail 1614500 invoked from network); 1 Mar 2025 13:41:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Mar 2025 13:41:52 +0100
X-UD-Smtp-Session: l3s3148p1@VXFWP0cv4LIujnui
Date: Sat, 1 Mar 2025 13:41:48 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v3 6/8] arm64: dts: renesas: rzg3e-smarc-som: Enable
 SDHI{0,2}
Message-ID: <Z8MAjL6iCK4F59pQ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
References: <20250206134047.67866-1-biju.das.jz@bp.renesas.com>
 <20250206134047.67866-7-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8W9fP4d1d3YBYp/t"
Content-Disposition: inline
In-Reply-To: <20250206134047.67866-7-biju.das.jz@bp.renesas.com>


--8W9fP4d1d3YBYp/t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06, 2025 at 01:40:30PM +0000, Biju Das wrote:
> Enable eMMC on SDHI0 and SD on SDHI2 on RZ/G3E SMARC SoM.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

FYI, I won't review these board enablements. I don't have schematics and
Geert already reviewed them. It should be good.


--8W9fP4d1d3YBYp/t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfDAIgACgkQFA3kzBSg
Kba0mA//YbUdGti3wIM7QLEa4jhW6da+TQLQcTPzZKbNcWhy3AyI+/ee2UUnYze/
Kc1wqEbK2H3WNHoMuyXrNevUrxwAN78UN/HEYn2m6obsEgOIQvlDsgwF0W0OKHWs
LuWPx+JazLza1uouapFGTHUiF7GdzUBNO8ZlIBV7u1dY+9T0xrmGlQ/C1c0iC76b
tpK+86ppZPyvKFFHguqLiD5ObuL6M7GEEOZfnxWsf+TUgp1/lPR8ft/ZR8nh8Txg
z82pUUUId8TEBzeq6/EiNYXLTMdEoLKid+pLaF1qdgX+Q/w+/P+IWHajPVxiEfh3
oy3oNCXUDBUuqL39e/gbg1NHdwWEJq0oeDC5/CYNpzzbtbzNFLXrfoCnNN922jas
mR9Q/Ya7oSDOGWOECJz7GZyrUKtXS+0akdLkHUKgpqIzTcFgDaMgjOLRszH9lWSH
HBwi39eC9Yt6+kathtKpTd3n1yV1FfNBLEA4Ee4x0FKQwsjQw7Ml+aq/6UXWFcjW
lJun3hReNwoVEXOMBIsqYGkJ5U5v0D01DbhyPIGuNhvTWokgh9WxQhDPyce1+SQ4
8qlYhC7EogIaW5BjMKYuWiw5zFjKALXl2DQE3SzQuPlLQQasm1pJZa5fJSbS9VDQ
5DvGNt1yMqcVDUM9/JCC6aoRC775XAl8UBTu2ezpLj98u+1kXnk=
=u109
-----END PGP SIGNATURE-----

--8W9fP4d1d3YBYp/t--

