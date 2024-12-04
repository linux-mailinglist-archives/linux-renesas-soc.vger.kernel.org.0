Return-Path: <linux-renesas-soc+bounces-10930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C87799E46FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 22:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DCC5165DE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 21:39:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7FA1F540B;
	Wed,  4 Dec 2024 21:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FwcU3EnA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382C2192D62
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 21:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348311; cv=none; b=BcHmUtgdtAYDZXStDlxPJoiLReNtPIY5Q4CGzVb8AVJknN31KpzFRpZcXLCkWy1081CHPzNO5fjwCH3X/iwPBdAqUoV+tkg/LRlHPljeeiPKHsXksmM7I3KxbtjCoN1ISRMkQxepXkS4gLHNF2eTfQKATnKuHaABzKjHRtsCx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348311; c=relaxed/simple;
	bh=PEf0TIVTGAtIoNHi4r/UatjwkdUVK11dFXmdPoci8T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMtJme1lcr5tnKyI2dJQDb5CWnkp77L0nE81fW3vIdzHxP/n70MaUfkr4EA9yNiG2Eu5BxCzRFo9f5JKctFc4YvIro+KGhFPGkCyOlPWjxvsifkMRzWurRn8Jd1MCqZg8GyjaIphemdnuJ8ys69rj2J6PQUawtB0Jt57QmWp1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FwcU3EnA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=relu
	rSGfk4UWvf/m26HwWLUB2BXRcYs4tnMyP0GrJrE=; b=FwcU3EnAmLIiolpfr866
	3SeCzWrSjjYN9SFg/cE7Whjs1cF/tvVrTb0pdqr3axQUNFWJb6aInJxy81VE9hdI
	G/Cgltsk9tP1DQd+o1H6dEPtf1/heToaF+HHkcf3axKi0s1YNk3ou7AeZfoN3w7q
	E0wG6iPz9afAMD+UbisjcZz5RT8Ije+C5MPg/WuZRynWOWxuIQywcEh8BX5qZf8L
	WY7fzojQN+n6CiUkxmWm/S+WVy38Sf6f1p2p4yJxSMMu1ZbVI4RjIWAHcXkeQVu1
	7c260z+B1J8WzGbogsNGJbVeGsJQ3RvG4M8BXbL9gZvDTpJaMiNHe+W5Qbt2QHmg
	sQ==
Received: (qmail 3704914 invoked from network); 4 Dec 2024 22:38:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Dec 2024 22:38:18 +0100
X-UD-Smtp-Session: l3s3148p1@lmeYmXgoFpEujnvc
Date: Wed, 4 Dec 2024 22:38:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org,
	geert+renesas@glider.be, prabhakar.mahadev-lad.rj@bp.renesas.com,
	lethal@linux-sh.org, g.liakhovetski@gmx.de, groeck@chromium.org,
	mka@chromium.org, ulrich.hecht+renesas@gmail.com,
	ysato@users.sourceforge.jp, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH RFT 0/6] serial: sh-sci: Fixes for earlycon and
 keep_bootcon
Message-ID: <Z1DLyQdzUzJzRUJJ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu <claudiu.beznea@tuxon.dev>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, lethal@linux-sh.org,
	g.liakhovetski@gmx.de, groeck@chromium.org, mka@chromium.org,
	ulrich.hecht+renesas@gmail.com, ysato@users.sourceforge.jp,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DeUx3klT7io+wydR"
Content-Disposition: inline
In-Reply-To: <20241204155806.3781200-1-claudiu.beznea.uj@bp.renesas.com>


--DeUx3klT7io+wydR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

> in the following scenarios:
>=20
> 1/ "earlycon keep_bootcon" were present in bootargs
> 2/ only "earlycon" was present in bootargs
> 3/ none of the "earlycon" or "earlycon keep_bootcon" were present in
>    bootargs
=2E..
> Please give it a try on your devices as well.

Will happily do so. Is there something to look for? Except for "it
works"?

Happy hacking,

   Wolfram


--DeUx3klT7io+wydR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdQy8UACgkQFA3kzBSg
KbYIVQ//SkakjiEEA2dKMMQiuQ9f8TlGspKLHvZDLHL55jSr0JipzU83BgdSR8DJ
0N97uZ8tVroQk2/AxYqtxeiPpyAGTTIJR38MyPGqknURfm1EF5AB/mEXk63cCEns
TvN24BOu5GbVj0Nexpt3MMpQPJAOhib9Pp4pAnqrtrUgGym7TdA3+8WwMBQWnfmy
g15WVsofR+R77UI8VWCx/1LJy2q0O+SJqcmufdVAKKHfkEJMOZePuejKMAqRxjxm
bNCre46iYU8T4rfgiJp9ZiaVG1lcdQwgxk/UONbnvCT0ul5QRGfyIIDd+oGScAFX
d3XoGaf3nP08d/oElK5GFKW24NNfigDM9G560r8D6HDt1Uxc1FOMXOVOrvBHOfFa
kON2ZeV7cCrUZl/3gOeiQT0W2NUSlC6BlcCl7ReJnNBDCs+0zsgDJdeYA0ql7jaw
4wgV6QKul4yKyfh6fROvgFTpU/weMLtUcdyay7O7lN04H/yGJvAee8Oo7qCLBzGx
Vr8HS8D3Wqjh88qwIdZJ7JIKpkyhAMRXCEWwKdMXNw51RryWDuCoGk1chmnbkeQN
NqxI4L7Ha5XtiuQNXqB5guaJwQjLZxOIQxCbg6OrQnIzE4LngzQOUzSWPIoe2oH4
bPE9vYF17VtGOhrgzqERQl/J3DPzas9AVU6h3qtkC1S4tKj3Srg=
=4Gxl
-----END PGP SIGNATURE-----

--DeUx3klT7io+wydR--

