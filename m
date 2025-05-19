Return-Path: <linux-renesas-soc+bounces-17183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEECABB506
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 08:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B65C31884B30
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 06:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF2824466B;
	Mon, 19 May 2025 06:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VCwKl9og"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FE1DDC33
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 06:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635695; cv=none; b=Jg2vUA3a13MNKzIhzVfaBHjW2wvH0pkuZomASlPI+eIHB9T6Gg5gyIGWXXIpHLzFVWHVDldm6HYYcB/idlx+9vtEkmvmCpr9D75rqwbENgX0hBHSY74ya2hhpY1OOlFlwqls+b8dYROWVSJVbtMSyighMBvfCM8mU8C6yW1k/rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635695; c=relaxed/simple;
	bh=ZzWrZIzNv7FCA60AVJMVClV8tpAwbaYHCdojX1DvWt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0EVl0/DJtMn+0wg6hXfIR7msfGd4v/w19a6DncS/4O44D2X019vNGSuqs7irgFMfGP1T+diYBqTPhikoBHyyR5aJAXczNBE5OlygeXS5g2MvtkSi9BE0btN2flOMlDtzBOi+BhHatTjGvuReiyu6fjKGPnBDYOgtE76DtvCZL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VCwKl9og; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZzWr
	ZIzNv7FCA60AVJMVClV8tpAwbaYHCdojX1DvWt8=; b=VCwKl9ogFfNHdrxAdIE7
	nddeo00qwgInkvzcd9Dtcw6c2dmFDNJWidZWGWOcRzKkc6+94iYLIcY0Tq55VGD9
	K3qjTYmKlT5oDgUlOS+TMptkrH6AMpVqkcwUGuHzT8d6iewzPt4vMY57MkHH3Jtm
	2Sk6xOZ72IZJCKxHk/q4yQUeARYt9SJlfiGqoV0Hyk0IccgirhNwccqwnbXHYgfd
	oTqkvQlWHuM4QJj5fPRBNdCnfFZdxkaRQC1ZDNNQ+DRb00KzSvPWxDwINMxKhcuN
	/b+2iXhpRYpTRlYNXdtYwfiqI0aBtauOzd5H++25/ySmDC5LYic4pi7btAG4tf73
	1A==
Received: (qmail 2349233 invoked from network); 19 May 2025 08:21:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 08:21:22 +0200
X-UD-Smtp-Session: l3s3148p1@chkLJHc1YJ9bRaAl
Date: Mon, 19 May 2025 08:21:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Reduce I2C2
 clock frequency
Message-ID: <aCrN4TCplWsxNPVE@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	geert+renesas@glider.be, magnus.damm@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250518220812.1480696-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L7aQLVtzTEpVJPok"
Content-Disposition: inline
In-Reply-To: <20250518220812.1480696-1-john.madieu.xa@bp.renesas.com>


--L7aQLVtzTEpVJPok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 12:08:12AM +0200, John Madieu wrote:
> Lower the I2C2 bus clock frequency on the RZ/G3E SMARC SoM from 1MHz to 4=
00KHz
> to improve compatibility with a wider range of I2C peripherals. The previ=
ous
> 1MHz setting was too aggressive for some devices on the bus, which experi=
enced
> timing issues at such a frequency.
>=20
> Fixes: f7a98e256ee3 ("arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 devi=
ce pincontrol")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--L7aQLVtzTEpVJPok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgqzd0ACgkQFA3kzBSg
Kbadag//U1Ke7hpuRWmAvEygCdhBd6w8kKyCaoPCPwhT8Vq1Q+A61ABA4Ie95ysn
A65LHjLsqvgloHF4uQTVAfbkKU79YyybUdv7XZzKcUNmi8TPFOhuwLej/NVaHJFn
Gf7WOx/fwggkUQcbN6gX13LqX29Jxzrakpyw6IzPKXASyDaMfcw/wSicBVHrhlWu
GSeb1xal5PihlELuq7MC4RfvXUzK7hFt1HDDcwd7dm5L8EYmjv5/I/ztQyTPWWnE
NKUMW1GKIbcJCIuIGTZkS//rbxTZwCJvXuB2nq8iuKG6QDj5K03I+8Yqc8i2X6/t
nNR/uvdcgMrGvrLlMMFH3X27J47K2hyyCBfZg9K6jzZAjZVXf9gvKVsvK6oDOzF5
RcLtc/7XXuuw+q8jp2wmPsWVuyUhOd4wWZ80KXuOVLHbo4PNB/nRDvfEjQF7uDOP
vD4O9uPux9gA1mnN6JbyDh2+hrfL4She26/pOe3yx+FqZZJcHX7iQ1M4Xiw1fPvI
CJN/Tgxv2iJIBV4guYu+yrANWaME3CcZtKQe38TIwSMtLR/jnvrCjZrBhdZbvtTH
Y4X/bwyGfeeph5LJnXkUDg8lMh8PdNiebcEy5g6yxE0OZFeq6Xt9YeB99BKwG56p
QfQ8ahMuv7OXTxMwv5YNN3oHAaJ1IbCDGb8gJQ0M0+J98AodzRQ=
=0ZBV
-----END PGP SIGNATURE-----

--L7aQLVtzTEpVJPok--

