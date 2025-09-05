Return-Path: <linux-renesas-soc+bounces-21484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CF3B45805
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 14:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9065C7B1D4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 12:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4AF32A81A;
	Fri,  5 Sep 2025 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="isbjS2eW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084FA34F47E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076153; cv=none; b=a9qbFeHWcBjJ8+5XiIP3CgQE9n1rkOfdpCdrdSDxjQtN8gGD5Qs6A+5YbzxwJnGl9HfhqUy8Iyv/MhfL1aE5luMO0Wfx5ofoTrRHXvoKzGiGNjCN+jnBkoKdS0ayC7N5Fe7V8tulwyH4InwI1cK5LAxSyk12FhO9AcpKV0/VKkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076153; c=relaxed/simple;
	bh=3eNZ5R0Q+6iX5ksEQtNAxndHJVB8qKKSRe4TN6Xjfxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+5giEgrmu37iC09K56eGH1Hd8go8z28Tlvjr3oAEdiwT5mtvXN9xIzPlEhvetfKGSKHFkwDIsjEN+q1sLjlf6H2RulLKiqIXlG0cO6ziqdAya6UOyaStGUJvQU6FD3JD5ZdkAfeRnJaypCfWMvg3aedkCKesby7m/3QPp6q6vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=isbjS2eW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3eNZ
	5R0Q+6iX5ksEQtNAxndHJVB8qKKSRe4TN6Xjfxk=; b=isbjS2eWM5m1XoXiIMP0
	QwMKcksYMZ7qGl36WPHsiy0lvNTmbiIzdAPS3omXOfYAow4ObxGiKNqB9TWvouuy
	YdDVS8uQ0vgmy6P+DraHnM79JEg7QVwPSmSgxui6EbFn3LiJS4ht3zjN2QupyLTY
	PfY+MEluqiTnajvvenxnnRDhuumrobqMMzMQDr02KSUSF2vz/F0IWRE2rWPuabS0
	w6Zj3V7sciPCoULmSiqFo7ltgiDhohf8ZsRU29OUCfXe57SsfsDS4TG2Jb2MJsAX
	sQhOOBqbuocLWpKjM0aBr/v8YZjBHmpQ1EZnni3OKQodj70AU/HxqmOfY/yuGzaD
	jA==
Received: (qmail 4051870 invoked from network); 5 Sep 2025 14:42:28 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Sep 2025 14:42:28 +0200
X-UD-Smtp-Session: l3s3148p1@D6ytKw0+luMgAwDPXxPDAOCjMSL5jkIv
Date: Fri, 5 Sep 2025 14:42:28 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-hwmon@vger.kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [RESEND PATCH 2/2] hwmon: (pwm-fan) Implement after shutdown fan
 settings
Message-ID: <aLratMZ69w_sF2hO@shikoro>
References: <20250904202157.170600-1-marek.vasut+renesas@mailbox.org>
 <20250904202157.170600-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k1lN0Q6TtU2DiBt3"
Content-Disposition: inline
In-Reply-To: <20250904202157.170600-2-marek.vasut+renesas@mailbox.org>


--k1lN0Q6TtU2DiBt3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 04, 2025 at 10:21:10PM +0200, Marek Vasut wrote:
> Add fan-shutdown-percent property, used to describe fan RPM in percent set
> during shutdown. This is used to keep the fan running at fixed RPM after
> the kernel shut down, which is useful on hardware that does keep heating
> itself even after the kernel did shut down, for example from some sort of
> management core. The current behavior of pwm-fan is to unconditionally
> stop the fan on shutdown, which is not always the safe and correct thing
> to do, so let the hardware description include the expected behavior.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Works for me as promised!

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--k1lN0Q6TtU2DiBt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmi62rAACgkQFA3kzBSg
KbanVxAApYP3N9I6ELZ9dYfUAmFeSrA8NGP1sVwTXfakPUYtAJo5w8kXbQ+ch+74
HFHRq/QbPrOTlzTO5CHHEQCklfL1fb5NfsB1M7vS2KKkRdiWjrcU9SyPHilg7LwW
baygIPE0T9qKkkKpVUKd5uW3KqXsEn5Oepj3I9LasOc7gAzlSyTE/2cR4qV3A8/8
5Zi1p9o6d3sZwCqu1ujcEUsViNGTyEmbW+bFwlRedO/DbXN4JsSpteJKxZFd5aG/
R5SeF6e9lvxvqxFbydEOYOfD4lYxA4J1vxD7LMrciDllF6pUAWren7tGtwvMzRs4
T3UMJ7W6fdkRH4D3LDHGcYcoxVBSI1RKVNm84oYx8DiCauwbe2vm61Asqr8dN0NK
2zXaYeUGx86BPAF47ky3ce5l87BYKvX2jo7yy2g8zUex5+wmgx1A38rNohH1uBVh
LflaRBD1Lg20bGXecB6KhTozFoP2kf0R0OwNwH6UvaCcVG+rZXiLPJGHqpg4rMjy
Qh7yioBX+jtm019wbmIPlUSpx15b0zX40U5uNVPWx3JOt25CClXREdwOxYt2KIj1
KBY0G3UM5H5iwRnKpO7oIEyG7+OP+DKbpx+aGhGX3pJ3Jls0pd+FIw9St7UEz5sh
Q6MgUncUt/7eTHzsPJ6st5x6c+m4GMGvOaUJMsHPPoItSeqIr5w=
=F1st
-----END PGP SIGNATURE-----

--k1lN0Q6TtU2DiBt3--

