Return-Path: <linux-renesas-soc+bounces-11682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B129FA594
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 14:02:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 104B31887D59
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 13:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343E02629D;
	Sun, 22 Dec 2024 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Fsco7Rvy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966011898EA
	for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Dec 2024 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734872527; cv=none; b=RMVxAP0+Nqwl5RbLvBaBjuOCsrX4stCJ4ur/Ce778tmPZ/aFVmywC4YIk6F6+UoTgN/jgWSQdK63T2CD9okyPSBDxCS6ZRld30CSTgyOLqudY6kS680yY5+9W+S0oDJyZf9XgEWW43BZBIbiYzqn6pcieCd2bND4o/FPorEC4g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734872527; c=relaxed/simple;
	bh=OEPu8ltssuGJNYY1lpHBO/6LXA2holgaepxcmsNJWvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oK7oQwtRHjhZgN96+8XqEZ/YiZW/HxWw3GfJZe/sN1/2C4TY1Xmjmw3+f1zw0luIu+8z2J/pmWfafKeK6xa0QNimGTVQS/YHh7fpOpyUtwvG+x8OSHWGs4hPkPwBJrtunh5oVvXW8pL2RX81GyeRUeVwcAt5YObJKHw3xPAXRXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Fsco7Rvy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WaGp
	Z2jEV6MPpMcBJirLQhp2uZcCJY3JRSvxNa06XUI=; b=Fsco7RvyxG+na70Vy4XG
	U0EW1umIGlLY9TvLd81VZEVyuDXmOpXcamsvQ5VzoqNgBBrabUd30ALpBGmb8mYw
	8muOzH/+OIEtWNI8c25AF6+/pbQl22mDNgeBba+y5pJaz8WqjvnatvB40FMt2bx0
	1gs+ysWWCv3mXSHW2EfWe9evftbQKXtw95BRAmlWfLmQB28fi9YwvmHIfPGSliu5
	HUNjBxa6LGWTWHs4xZvB4RfIE5Db3NehMFF8vjDYT0DQyDgOsHbZE6SFiCJ6TEC3
	gx576ekCTS64fTOfmvAVJfgHh0vWo7B6fHjSn19VCV9UPUNzwBJqNyQ5Dud+RX4Y
	IQ==
Received: (qmail 1594082 invoked from network); 22 Dec 2024 14:02:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Dec 2024 14:02:02 +0100
X-UD-Smtp-Session: l3s3148p1@qV9kfNspfOkujnsY
Date: Sun, 22 Dec 2024 14:02:01 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH v2] hwmon: (lm75) add I3C support for P3T1755
Message-ID: <Z2gNyermLc1i3Tkb@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
References: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>
 <103fcb15-e550-4d3d-a243-ea3ccf98e76b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kavzNwdj+/s5qG1s"
Content-Disposition: inline
In-Reply-To: <103fcb15-e550-4d3d-a243-ea3ccf98e76b@roeck-us.net>


--kavzNwdj+/s5qG1s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

> Should I apply this patch as-is, or do you want to send another version
> using {ge,pu}t_unaligned_[bl]e*() ? Either way is fine with me.

I'd like to play around with these function first.

Thanks!

   Wolfram


--kavzNwdj+/s5qG1s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdoDckACgkQFA3kzBSg
KbaC8g/+MhVQTtKKqo/fPai6Qk3JtsKQpEKE6ZCNpa730Ir8c1cJYJah9xgOw0RP
UCICZIYBe2Hv3kVZKbrx3vEY1MkGwNHI3vPib6ZXZJUbhKc0K+inh27K3nns6Pnk
qPRQbn0/ZzUE/ayDwBnsQj5axJnYZBGxUKhOYREwna4KNXWvMTwqZdfxZXxrvpRr
bXAKo46vmahcYVMZJCHn1llJjH7b1YGjNy0gr0M8PXZczW2yK5nN+jLm1mlkTxu9
74Kq7Hokz4jRxVjO84dcffqzTfmnbEkudqTtCOLQwtRqwqnetZDLydW7YfRipMl1
+EyJpBaHTw+OZY/ofq3HOSuuprew3xX/dnLWNha9cZ30eiuLXgQ5uNdlICLm35Bj
C5Dsl2B9owpNE8tqxam05yZavg60ptADKaVlLphuSvcOQdTqD/egZmTU/NxRRQ6M
RAnZfiObsZS24qiclMHzpVjvaVExv5rTNR4TcoQYt47I2BAUXoMlF/UN8Oq4ql58
M74Awnoipv30vkL24rs3uRC1kHLZ4EIMhUYSA7Ek8k1+lQ+yhjyuQMqe8AQ6E4IJ
jgsewHtK388jlWXTzRwOqyHoBUagZIAIyMbMDLGiDQWTkNLF3ikhW99hwhi9Z4rc
JRZTfKTASHG6OmX72ZtrqySo5N3hswyimD3TVWMNR1F+uxw155c=
=fC38
-----END PGP SIGNATURE-----

--kavzNwdj+/s5qG1s--

