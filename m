Return-Path: <linux-renesas-soc+bounces-11448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3D89F4634
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 09:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA19D7A4037
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 08:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42B61DD520;
	Tue, 17 Dec 2024 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KHgViOQJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D235F1DB52D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Dec 2024 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424868; cv=none; b=afi31cGoCIg7UFkcuv9o851qX9x8rIlX1OvoXVoiHxpUyS9jkSIqLiAoV379JnCurILWzJnFxZx8EVZV7NEokBuUCNsWJKwQ6VyqWFCfuDcdATC2/h6ElTCSdYtEilH6UH0h9Sc3ZnSSv3W+w5bxnhyQkHcRw3pZjFl5KUYRLTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424868; c=relaxed/simple;
	bh=UrR/l/IxrSGWrivOqJJaqgB0lQOL9KBgnigWIF5L9DY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rD/oZxIkQrZgugVz1YK1/yMc3rkqGsRgC4UOyKPeremdLxayBO0h2zKq9XbZDog49HZ2i/9Q3lCp3nndncqktz5Cm3BHizUR/oJ73gmxvoZvR5NGUDXbs2NlmphMucy8fHZA336Eg7MtdBud1qbl3GT8Yo4KtRh8jDY39Oydebg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KHgViOQJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UrR/
	l/IxrSGWrivOqJJaqgB0lQOL9KBgnigWIF5L9DY=; b=KHgViOQJQWi6jFplALXj
	o4JjbChY0vYzO5430yYjcgOx9AG4TpjExoATSYlgZy8+IA8w5Vz3f7QlFyl1v/xt
	koi+RWbGXbGHF9CJ39d9xSk6zRAWnLXL/ZU9joHzlTDNZHuY7i4OpCcVR5YcqRAk
	Xf3sMqr0AQAeWRdAwC3iNN6GU5H7zhxCqTeX5DcMXoPtbetLmnnjNh54Fo2Bcmw7
	K5RAAojkmnhxFTjDufQP/iXzoJrINd9kk0IzE/VTPwLAQQ+rWm9KIHrlskM9B3+w
	mfpx7lbZhPJb8zRbGHI02iHb8l+FWs9CHzfElJfM5LrgqZsG8qANkrOHu4YRzBbo
	zw==
Received: (qmail 4002372 invoked from network); 17 Dec 2024 09:41:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Dec 2024 09:41:04 +0100
X-UD-Smtp-Session: l3s3148p1@1HTkQXMppOkgAwDPXwAQAA/MfjDm1Sk8
Date: Tue, 17 Dec 2024 09:41:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Yury Norov <yury.norov@gmail.com>, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [RFC PATCH 1/2] bitops: add generic parity calculation for u8
Message-ID: <Z2E5H3-vNIi2_6oT@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
References: <20241214085833.8695-1-wsa+renesas@sang-engineering.com>
 <20241214085833.8695-2-wsa+renesas@sang-engineering.com>
 <Z2Dg6ydwN6CfxgTe@yury-ThinkPad>
 <Z2ESttIzF4kX7JA-@shikoro>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0kKQvGYxLpX4xztM"
Content-Disposition: inline
In-Reply-To: <Z2ESttIzF4kX7JA-@shikoro>


--0kKQvGYxLpX4xztM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I hope that both patches can be applied in one go to avoid a dependency.
> I'd think the hwmon-tree is a tad more suitable, but I am also fine with
> bitmap as long as both patches go in. What do you maintainers thing?

Second thought, we can ask I3C to take it. Together with the cleanups
for the I3C drivers I would add then.

If this is not to your likings, then an immutable branch for I3C to pull
in would be helpful, though.


--0kKQvGYxLpX4xztM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdhOR8ACgkQFA3kzBSg
KbaEVg/+NcuHBoZdEsMUjVPjfUFpcSdDlT89Ucwt6kpb3ZWnHz4pBVWEoJE08VML
yPWZKTXIbLf6Snx3OYjgSDHVYBtEjJDEcD3iAzXgvJgxZQ3YMjc8cjFRkRfYQokr
F2Ep3T7Rdx0KZOlLJ/QitI/QHIYekLizCnEJHDddkYxt7BDQDXzUSBmbbdCvedb7
1b/HwUrltxrN0e6L2CyacDig7KahUDjYTzgE2Img9ukZi8RoNXxLZb2f+FAg1fow
jPkf8onH/6peC9hfuFlOV4CoSMy0le04Vsnpam1G/BpY0zWWGQpQ9QV7xnjl4XaU
ua4M/tqYQBAEAr7fwFNX1YfqLFDg58XLD/ZIL6ZYu+gcw4r7TsHE4D1QZxaQIZah
hM7mL4N1jDu8C8jXDnBBSJETZ+tbpV3Iecr2qa8jfOj3Lr2ktz/D3najpoZSrOYd
hBiwLxQ3pLktPzV6kSs+Iz7q3uhLk49Ym1HziY0gtkTdeqbGXM7UZbzMgMK5Isqn
4ISJHc9dPO2XJdCfXw5zPaauEyQenXZ6CkHfwSr3PASD2oftzyrOXrCEGr1AlCnh
mq/Ex6iF8EGPDqIxDGNBSHewcFb9eMm69zPC2MgK36uqreGIOKhhnoeFdAA/vfZT
TldDK2iejR+7F8DK/RdwBErxhqZlmQTdNeZyhUhJJULJEyKmaN8=
=X4Fk
-----END PGP SIGNATURE-----

--0kKQvGYxLpX4xztM--

