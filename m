Return-Path: <linux-renesas-soc+bounces-24035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A4BC2CC6A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 16:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1009B564E8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 15:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F77320A0C;
	Mon,  3 Nov 2025 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="f41YBBC3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7498F314D1D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182745; cv=none; b=WL9+sxsvnfrLSCVDfe6zsZym7V1OBiyScmHhgiUVMBG9W7XDOgu7DaBQj/xpAeoGaK2eyNADD4L/vp7Tmr1oQ57bqHrqCgwOjWT5jh4s/wz4kH1Vv5+3082VEeXTFKybyaJ4dna9qhp+K7YWmu0RmcHh7tctYYLTrpCa/kLiIQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182745; c=relaxed/simple;
	bh=cvcwRv0H8OU0hYLPpoawuIqkAKSUgu8rnGIRHj5Ps0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6eOppzBSLWkCkZfi6OFOlp9+ZzQhIhpsJDB0m56MaGv3N6/zV78JJhEBNRxGTbFxf4YyolNHC/8omDBVxEGxUDjhpB+r92tM8R/SEkXfGxYiW+79Qac8rV8r3xbd7COoggprFnTpXetbYaJdGMMzaPx0X2/zl1ViNEHNZvDokc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=f41YBBC3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=JYBs
	Ouzm0OuzV+gD5jJz01cLpN98pp50tj7VUddi2rQ=; b=f41YBBC3nZsbCi3QzCSi
	WbfhhPsOc1/RgR3XFjZ0Tz0nTGIQFJ/m5Y0rqDVb/dwbqArWNp7Um4SJzbbOyDtS
	UdgN6BKvzPiBg5SX7Lv0bmTmUIkTF3s7VFtbw8+1nPozKftm/Shmcy1oUqptQXZ7
	iX+4VKizacDPHUhRr306TMhUMY2yj8OXuTRF2Fzrt7z4RWa87VDkOqdmXvuapvxv
	FYsuBP8D1A1UcuCPvdPt4qTtd510l1/eVMxnhGJvB405nWoys6jRZziQPzRr/9rC
	RCneA3xQwkmu9vGQLtjBUQO06zGql+TVhNTQuR3igEc4qy7Nn1uA05N8tcEvkDnb
	xg==
Received: (qmail 2265056 invoked from network); 3 Nov 2025 16:12:18 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2025 16:12:18 +0100
X-UD-Smtp-Session: l3s3148p1@dskoJLJC3jFtKPNt
Date: Mon, 3 Nov 2025 16:12:18 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] reset: always bail out on missing RESET_GPIO
 driver
Message-ID: <aQjGUnu40hdhSKR9@shikoro>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
 <20251015205919.12678-5-wsa+renesas@sang-engineering.com>
 <35f619a73a83207b83de095967014b03b7d3e8f0.camel@pengutronix.de>
 <9ba9f4b1-5bdf-4242-aba9-8035571caa1c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JZ7gr+IhwBjh+HIH"
Content-Disposition: inline
In-Reply-To: <9ba9f4b1-5bdf-4242-aba9-8035571caa1c@linaro.org>


--JZ7gr+IhwBjh+HIH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > [1/2] reset: always bail out on missing RESET_GPIO driver
> >       https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D25d4d4604d=
01
>=20
>=20
> Why? This wasn't tested and wasn't reviewed... there were objections to
> this patchset and long discussion.

Only to patch 2? AFAIR there was no discussion regarding patch 1.


--JZ7gr+IhwBjh+HIH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkIxk4ACgkQFA3kzBSg
KbainBAAiK2sGoJVz8cigw4/2xwSg+pLlMy5IjHOhgGRny9IScIRQ0DXl3TcuhMc
WyPFOFGkRHyQ9wfQIkE4iKkHEVUC2FUcwKQXPZ8haHk/wEhid1OJe7iEPPrbneiQ
K72cSOyTflL7OT3JKhSWBdHtYL7D6b/iV+0RdbcxdVTVDe+T/C3RPamGaKU7lobI
1LOvdGXRVTRFqNj3NLzEh9H2vaJnFUeFvfstqHOXJsYO4FswFi9fZpDFEr/0359c
ER06AbXlWJriHJYYEwgn79bu7djErpLEu6EGpFO4SPGlh674+IYuWFU0lvTufd4j
IcFR5umEjBW8OOZnwwlWy4wX648Xtu6H/gv/ux5kNl2BGT/4m0FKJ/SbwRlgGiZ2
yzXSu+TxZVMZ7mBjOwkmwoxo4TNv7fWm1BJLiTtOZX1hiI4EVK/TXHqUqF0sCJ6T
wBGjg8youbM/qybqfu9W1WTTTUftLdRkhgImKayaBmPSuuT9eRmJgYKCJFkk+MgU
Yc4GT10q6l8x6m1vedm4svN6gupZrx8ueIg9Rx9ZOhA6jkgDexQ3Yx8UIGYAKvJe
F7OIwqyKTQs93nXQhjptrU1tYMhNZAd4RCDckMygmS6AOqdflhIFx+aS+KV278cm
RPNUihO3EmOZb1nKGs8OT+r0kPF6yJ0b/03KO19g6xHDIHpcRuc=
=l7W8
-----END PGP SIGNATURE-----

--JZ7gr+IhwBjh+HIH--

