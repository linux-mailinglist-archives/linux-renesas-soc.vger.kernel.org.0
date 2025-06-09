Return-Path: <linux-renesas-soc+bounces-17969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1D6AD244B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 18:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75C561628F9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 16:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1904321ABBB;
	Mon,  9 Jun 2025 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGpygfuQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E260620AF98;
	Mon,  9 Jun 2025 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487308; cv=none; b=cGwR5PGODrLwp8qaVBQ7TWyWkX6O514CWxQw0iopRGiKztKnS2379eTdUZX4MrZootnp9XwbM4Nc39gRmajaOOu84BUWqcJY2u//h3AOKEJ8d6cQWt5tbfDe7cbW8/aVM2+HHPsm+l41I0hiJ4PqbZe94nb3DDFkI2mJEU0HvHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487308; c=relaxed/simple;
	bh=n93YRT55tXc9tbl3XYCTeVbqkoJGRfkc8a+57xFlO9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsgE4BHTjGBHsSPFalKdrwmNmHpFdZ3oQYTfY74WPejPSZ6Sm4JCs+ZK/MrtUvmxZrbAfYBV/NiVadlREXsXNlCwGWpCp//RQRLbS/f6twjpXY9LewAWwVRicwuer74opfYfwSrNWZG0ZyYvATKQhmlRzReawUQZLyeh71qDk2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGpygfuQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A5DC4CEEB;
	Mon,  9 Jun 2025 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749487307;
	bh=n93YRT55tXc9tbl3XYCTeVbqkoJGRfkc8a+57xFlO9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGpygfuQD7nH/8Xgo5iqvTCx3DHg226iju7zdE+0x3iNpM8PJynWLc9ykM8jJLOAD
	 8ZZYTIzbCDgkIdYnujLlz/A7+NJOtRd1LxFCsCblq6OpqM3NTntCy6RZM6Bp3duhQR
	 Gf/7Sj5ggOVDzjc37/9CYZ4g6gZWqSVWpChksf44DyfSLbuIy7ZKMTDOFbU33ISXs7
	 +ljgs/DioyNPg8ZtrAIhrp7ujPEantS8d1UKkcNuoJOA/yRAo1JsHsqQ34Y8mSMBTO
	 vAOufuVbwKh2WQeu8KqV9BwyOpvAm6mW4KaC9pP2xh1+iOjYS04X7L0sRTi8s5l7lr
	 V2eCpYjPEdu1A==
Date: Mon, 9 Jun 2025 17:41:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ili9881c: Document 7" Raspberry Pi
 720x1280
Message-ID: <20250609-habitat-oxford-a9abba471303@spud>
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jIsME3oLcJFkBqGc"
Content-Disposition: inline
In-Reply-To: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>


--jIsME3oLcJFkBqGc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 08, 2025 at 04:28:16PM +0200, Marek Vasut wrote:
> Document the 7" Raspberry Pi 720x1280 DSI panel based on ili9881.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--jIsME3oLcJFkBqGc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcOxQAKCRB4tDGHoIJi
0lmPAP4pIv3sgq4LD66AOamHXrQc/NzJVU0NWG2keJQb3rlYKgEAqYAKGnGLeUuJ
p/l7RxdEHGzoMyn/1VAOoD80Ay55sQs=
=agje
-----END PGP SIGNATURE-----

--jIsME3oLcJFkBqGc--

