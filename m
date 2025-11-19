Return-Path: <linux-renesas-soc+bounces-24761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD45C6CE02
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 07:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 167D9352C73
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 06:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5775C3148BF;
	Wed, 19 Nov 2025 06:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YUns4i93"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391103148B7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763532784; cv=none; b=mBHJptpID6B0R1SE3WGgULtJJ0mS79bmpaW/8nB/W1lPEKyDoJV/yvHa1FDHftNS3M/wYvqvHtgGXFsfQieZQo9Qy4uESffnYLKf9cVQtSmMCMd/26NzC1ja+2245DToXnwnIKuyzSLb2xC16QAR8yoZ9THDAebF4ITZhLB9ixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763532784; c=relaxed/simple;
	bh=Yv/W5y/sqwx9hN7aLMhEeBml2ffZorVdDnP4AifAX6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQuemlZNjjQYa8EVXXzYdiaWlhjcSYQDmPrBjtpuOClTm0g+dUYK2Mh97yCqvdUIsQO/WFo6sxqZc6V5iywgwIk0gULFmpAMSYvJReMC6tx571FpWfWyMcqRb90eSLLyNT4dVxq7FUeFwQgqYdsJj8zuZXmvrQ73L8qsDevQld8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YUns4i93; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ooLB
	ZpH1XP4dLc68mVSjsKlUTpIH3Qv0G+oIFndpzo8=; b=YUns4i93ZsAy/bO03Iyz
	SS+fWgysKsSqNoGwOxAO9qyhq/TYwKy7D0IHeRm3QZUKTZ1sxopcrr4OlM8fNxi6
	KTSaGpUdq1668EhAIQfP/+x9Ts7BwDRbIacWyyA0AqDKKLiDmwHeE0DSiCn7X91O
	q0gUcH0KmHNP/xB6rZO/AkF+QEfv+dEc7HjM8SiROMKufQJH00oEi3beulQUh5Hy
	S8Xh7+yLJ4wDkclEVMbjDWuX/nHnQx5oRHR5LZCGsSjKKVJyzWFuce9M/T8OAj3W
	oEi9P5VbBRdtiVCi6yxeu9/tpMwMiskztp9+QaMh3SlksrM1LQA+rrbaa+gDsBI/
	Dw==
Received: (qmail 4017485 invoked from network); 19 Nov 2025 07:12:57 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Nov 2025 07:12:57 +0100
X-UD-Smtp-Session: l3s3148p1@Wpa5eOxDaOMujnuu
Date: Wed, 19 Nov 2025 07:12:56 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Add overlay
 for P3T1085UK-ARD
Message-ID: <aR1f6PMbG0N_9oAo@shikoro>
References: <cover.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <0babc991d3b2163200bc083ef80563931d4b639a.1763475830.git.tommaso.merciai.xr@bp.renesas.com>
 <aRyiQJsu6gob3Gf9@shikoro>
 <aRzzEgeetDFlE3YC@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6j+R5nZQemQdR0Ma"
Content-Disposition: inline
In-Reply-To: <aRzzEgeetDFlE3YC@tom-desktop>


--6j+R5nZQemQdR0Ma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Your suggestion is to keep only Patch 1/2 dropping alias line right?

Yes.

We could think about enabling I3C unconditionally by adding this to
rzg3e-smarc-som.dtsi:

+       i2c-scl-hz = <400000>;
+       i3c-scl-hz = <12500000>;
+       status = "okay";

So, I3C will just work when you connect devices to it. The I3C frequency
might be depending a bit on the I3C target board and how it is wired.
Maybe use 10Mhz as a safe value and add a comment?


--6j+R5nZQemQdR0Ma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkdX+QACgkQFA3kzBSg
KbYgJxAAjj0fJxUJAG2gr6lnmf8svZfpmUUQY7Sh7TaT0AeQOMKbJCya0qy4+Uxs
mPseP36pUSL3WDUSzXRwCPiUP1SpMqFnYittSM5+vQTveNi7zYznale71u1QNvXf
uz8N81+YW2dNvs2gsG+aOF7IITlUeYONH6dtw2yidcufxu5Rc6lIXot5tmEChgVy
E6O9BHJRqF8rTK4KnVVxH/m34xBRpwgJsB293Y+KW66DR5QtLrTSFbtBlAX8w9Bl
o4LOkVi1rRhi5S61zsNXFltJ+qhO8xf6g8IGyosOVa3XcAItt+jgYPqzUGTbc2nr
cS9DDuFkY8vh5/iwz11Dhb6OETgoy4aYB4P/nijEPKPK9Cf0ype3szNQNoALQt9g
xk3fhjvw08FLjT2a9+YQ/BTwzv5OmAGhqGmXqpAUsrdymIatBpfES2SZ94o8aQSv
uLNG6xce7x85NIe0bNAljPmymA17tzcZYQmlecVLsE9DPmvDmVWvSdwxwec7jYEy
+Ro6REzOPQCsNDkNPi4UfuGlqD3+oavKEKeHa2xYPWYhM1/PnGIvPyyT/6c3912q
7iazbWNuxGhw6pwAeZARIfdGE3KusCt7QlZLwRdgy0Goi1OBfwQ7xEgTV979uHIM
LoomJZQg07F/c8iAqHGeWUs460ZkBC/Lfv6hbrXaASXfwBBXUCk=
=q7ZI
-----END PGP SIGNATURE-----

--6j+R5nZQemQdR0Ma--

