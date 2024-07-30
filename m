Return-Path: <linux-renesas-soc+bounces-7620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D42940E2C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 11:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11A32B270A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 09:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BAD1197A76;
	Tue, 30 Jul 2024 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="kV0/KLBw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430E19599C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jul 2024 09:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722332453; cv=none; b=QYmLdOy7/2GjHB20OTmS8j6ss/D0BhAQDKHXW5Xi54/tuYCKdhhVhIUc8JL48TZa9CXBLGVJwsk7pzWlGFPBdVGyY012A1nWsYeViyLKqvp0nSw0fssUmXjZOT3CvtEacFWR7j6AtOJARwoPx4VxKH7IAII/p2K5QNqO4Jb+2d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722332453; c=relaxed/simple;
	bh=+f2w3B8aOkHpr8vJUhaO33DY5IcVlppEB9Kp8RBnpRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRM1BP7QRX/tjZ6PfjtTOTVFIrVQT3Pf3170a9cedKkmB13q/lW0K4e9Ba6ZJdjA4I62NZ3XrmwVtlRyvurO2IM+M9ZiLhcMjFbhArD2Q4DXX9MrjFLgjbqKZViNtIvMESTgqakD9pMv7CqTKlp0b2YMXVBr3+PyAfGafv3Mip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=kV0/KLBw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+f2w
	3B8aOkHpr8vJUhaO33DY5IcVlppEB9Kp8RBnpRQ=; b=kV0/KLBwUUMCnAnT5zv4
	N39feE0HpQLXtd8XR8z/QFdXHsAkZ9Wrgu2RyO4vGGnqvO5JzbBPPl7gcTNrZslx
	AUSQ70FzXeSkMuuddf95PTsPKPTh+20oonM22K4IsbegqKU8UXGpssSNwHQ/Hbv4
	ttEuIXLyUhgpNAi0a2ETchSrPjXglGZHqW/DhBODz9+w64Xm/vo8gUaeEM6Tp81h
	DFcbatryuWB9GGWUGtoA37hhO1+DaZ2E0weqkAzbnB7+m/b4M3Y0XbaNin4yCDwT
	duHnSxZKtD7XPuBT1Shp1yeACLDLBysWPC/u0A0dAoj2p2fHOJGmWafeUjH7ZxrB
	tw==
Received: (qmail 173229 invoked from network); 30 Jul 2024 11:40:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Jul 2024 11:40:42 +0200
X-UD-Smtp-Session: l3s3148p1@euVoxXMesp9ehh9q
Date: Tue, 30 Jul 2024 11:40:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFT 6/6] arm64: dts: r8a779h0-gray-hawk-single: Add TPU
 support
Message-ID: <Zqi1GdsynDj7j1Ut@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-renesas-soc@vger.kernel.org
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
 <20240725194906.14644-14-wsa+renesas@sang-engineering.com>
 <CAMuHMdWMMU6FOXH8wCBy+biqAG4dqrQe52F5-TF9xw3Pogi64g@mail.gmail.com>
 <ZqfoFdgtSzDMPq06@shikoro>
 <CAMuHMdWoMuoY0p5ks=56aybawQXk0Ck4ba-Dx=JQdaSBehStig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UUE2S2HIwiO89lZ0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWoMuoY0p5ks=56aybawQXk0Ck4ba-Dx=JQdaSBehStig@mail.gmail.com>


--UUE2S2HIwiO89lZ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Perhaps there's a mistake in the register addresses for bank 2
> (and bank 4?) in the PFC driver, or in the documentation?

That would be way better than pins somehow wired to low and being
unusable on the board. I am keeping fingers crossed.


--UUE2S2HIwiO89lZ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaotRUACgkQFA3kzBSg
KbYrYA//a+KFYuEo/BudfxIiVoCgm84OHOHfKTTjt7iYQb7H/gKhWbXRxgzOCA0x
yYhpigfObYq/pCzVrSj16slAn5EW9TKiJylaAOWHx4UnDi1qiuG3/jgo0t29KjMm
KM7jiuYQVU46CraChiugA7SAElaRZa5I5vBHcvX/e4dGIx5SQOeOvTOQWTUoHkx8
qbhqA4GsxUcpkES9DDQGSyKJBTLZgVixZNxshHV518WZnwGFnXrODnFwz2PYlrxU
LTaIQVMqiankA4CMWFJ8Q+AMb6EVeTFBsd5ob2G3e8uUjw3rYkxs45F4ER739aQj
52p4Z+TntAKHq55bgtMd1BHMd9KTj/IvhNykz4LjDsAXv4GXrEGxdQMM4xMPUYNf
Pf5nOTRrFdGYGk3tDIGRrMkJtKQjwKrfnggUfqqsx356/eaIvBZITK6lRxMcbvG0
Z4mCKnAmExYyv5dw5ZM5x81dySs+cdacNA8NXOEuEMMJ9NmvTKTBQIyCk8y8WJhx
fAqmKks65qdgw2qmTVFEEH17C1etmslOG1uRqywMUY7hKc9+YSHvrqpwjOxj2IUM
VETrSZV6+FO2w/KKL7PRcXUGH6AHM1a9Z5mE3HzdA03GwKjMCouRS8B4z0H8FWuF
k/ORB8Gv5o64PoAP9vh0wHAdcpfuHIZDvvWtUqzq78NAGWmcBIs=
=f06L
-----END PGP SIGNATURE-----

--UUE2S2HIwiO89lZ0--

