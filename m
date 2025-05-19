Return-Path: <linux-renesas-soc+bounces-17213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E9CABC1E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 17:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADEBA3ADF93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 15:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CAF9285418;
	Mon, 19 May 2025 15:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="g74IFDW5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA9A286420
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 May 2025 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667678; cv=none; b=Rzvh1Acne80EbX0RThAd1dkpuZ6GEVw9fnwz6Fh3kpeJHVWue81rARqL8rstrLGx3LPGcGG+E4o7Ej/g2U4Z/Elbxgi51l7l81YnePX/mQ41Jtio0XqmkpEjcq616CC/ec26Hxb28LaEaT2jyRA9GcnDrTIzM3U8F07Jrwvm2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667678; c=relaxed/simple;
	bh=qNVVWenUO4XWo/JHN6YcXvLpUtMhhiMFX5R1egOkoa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6ioO9tv7Ot1r6s5jUkbq2q69fzv64tAoS17LzS3RL94lSZXYaM00tZJz37a0Dc6gzXAUcYIErv1jIAofMKnxFecH+PcrHfYkgpIaTFJ3u4zZyNpAL4MrCBJm9L/Lm4jiElLbKlcEJFFa5kJS011bbcfduVHJEoCACZAE1E0OoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=g74IFDW5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qNVV
	WenUO4XWo/JHN6YcXvLpUtMhhiMFX5R1egOkoa4=; b=g74IFDW5kTkYT00I3rBN
	8r5S/M9tsSKrF+Ot7+LtGNVvcwqFTXHJOrZiRm+jRoDUsEHZMlL8CLMVIXJcZZSg
	3o5VyRr2Bz43P/4OPZ5g+BQ0oYyTdVSszHySgmQARSs4DEwMxAc0eOuTdwPExQ6c
	6d7MWXs/yE24PRrQnh/jMEIEf9px0OH1ppT8u6D4RaYGLa7ZE5m7lrhVyMM1ujRP
	Yw7DGIDmMJkJI5j0KKJdbuDDBssmfsIEa4y/9DIkM5QamVq5+czKDGOkUZ7qkHQU
	boCkKuGTbFG7V/rUWfTxASAGpD7KDr6dT/eY0k4J0APhBIVT7sVXHzUUunqec57c
	aw==
Received: (qmail 2536472 invoked from network); 19 May 2025 17:14:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 17:14:33 +0200
X-UD-Smtp-Session: l3s3148p1@RgO+ln41mJxZz6uL
Date: Mon, 19 May 2025 17:14:31 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aCtK1-Yn6u8-n8mU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
 <aCtD7BH5N_uPGkq7@shikoro>
 <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N50p7v0rMXI5QQZ1"
Content-Disposition: inline
In-Reply-To: <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>


--N50p7v0rMXI5QQZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> ... so clearly the suffix is "-foo" or "-0", as we usually prefer. This
> should be replaced into i2c-X, by dropping "gpio", instead of using less
> favored suffixing (one without -).

Hmm, I can't automate this because it will then need to be aligned with
the bus numbering of other existing non-GPIO-busses. Which is highly
individual per board. That means we need to drop this series?


--N50p7v0rMXI5QQZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrStcACgkQFA3kzBSg
KbYZUQ//RQF+ICoSYNeA3SyfK3l3mO5YkFWpb1eSl1CAHUe3Bdh1xCjyYZUIa8aF
v42eWw6HeFyz/+CUAUcM2+YCoYc8wdrQtdg8MnTgieCzd3c83h6LmaKfZd39VxJY
iqPJ/hj9vFjd98/s3XtWXflp4Lj9MYcbMds/BJDUz4R3C0lxCr+RjOSrJsk2ElZn
PTYx3W99n3jXAVdEb4TQbeC1Vy86wCC+kalPAZhLsmks2tWCBC7a7MBqqNNDmQwk
7+ACg1UYA3hBKrba8/DmxMIHGyhneP/aEwLjQv4hH4Z6GFQZYZ+jotqz0wdVfGgh
WYKtqFVKrZYzHm7KQ0P0uh1iguOzQwVFLvdtzSHeytmSRp1adWr8UgiA3WmJOuf1
3CvIPZv/SjRvD3l1Fcv5cfiiGjKGtX1tAf9uPICQUQOqJ5skuoNWP+HCrvm9vpqn
L6G8Yv/wQNqutzaCYiw2b3mU1NFbpLqEuLyzGjG3wPdo2uhFeGVP6YxIK92n6Ixb
hJecCPgi2hbsUi1JbY4AlcwPOQaKLGTX4LtZjxFHaqeNqVp1ZZ79lK5mXWt1P9tT
k2FoqxvvPaikH9HUKjPDQU3ukjFfC4ixmMJh9XZcpGMcw/dCeD3H9qKxCPW/XF2c
eGIptUSzBXjTXZCqAM6XQbm0HS/nQhwJ3HAS2rAwHveXAuotLx8=
=ri5t
-----END PGP SIGNATURE-----

--N50p7v0rMXI5QQZ1--

