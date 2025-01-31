Return-Path: <linux-renesas-soc+bounces-12799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA07A241BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 18:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3779166CFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 17:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F9EB1B85F6;
	Fri, 31 Jan 2025 17:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQhMM4sj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70A99136351;
	Fri, 31 Jan 2025 17:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343862; cv=none; b=OOk2hJ+TXpWVfmCiHBbreAIP5YRW3UNtLqyfWeBxGDs+I03AY2SX99WTYnEQ96J7OpsnsVug3jPKwzw4koa7Z4HnM5HVgk26aM0mH+nTzqD86vX7zVdjuOB/wTDmDu1KDNY9v94NVJDff4l8xickPwGXPSWZRuiVwHqIgKGw68I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343862; c=relaxed/simple;
	bh=YUkx2+2MpIcN2520NWvGXz7CIn7+CYXPWNKN8Rh35Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHuZnYmnvkP95/6ni4DgahZ9B0I+BffiVS3A+3FMnh4/oK99wi54rIUZeHJkyBjC73sW9P2eiCpvDBv9Fc5A//NElsonrlK40SJ8MUGqFrWe7l0BnzGrF2dSR+gwO0Q/r2JJNqd/jGvu3zEUYjWYomExnRHpXwbQIMfWR4O9lNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQhMM4sj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 554EFC4CED1;
	Fri, 31 Jan 2025 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738343860;
	bh=YUkx2+2MpIcN2520NWvGXz7CIn7+CYXPWNKN8Rh35Eo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQhMM4sj1nCwStKx+TM22+JalOuTFvpGT3p24L9xIZFH3f48zh29Tlnd425CI75fF
	 5r8xZXjsfVG7UcBoXm3wOLniI/gwYn7V2MflMOfWmT5QxjKcfeHTKZfj2vBGlonHsS
	 4RL7PtVCyYGYKfSyRZfbg0dw0o+yzTP8vJh9bM6AQaz3wlXuJERrTfdLLAfxYxBkgS
	 VZqBD3ZC51b68wifxiEiXvBxpqp5EJJjB5D/gcydlKQ0+GBQwkWwYwwjaNax8Jz/bO
	 bdwWfI1YyRMepCp9SJmE3IfPlSm2VZkVRdSfIco2l5eej9wbW0E4XqBIiCFn1Vn3d6
	 KzGC5I7D3fX7A==
Date: Fri, 31 Jan 2025 17:17:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: mmc: renesas,sdhi: Document RZ/G3E
 support
Message-ID: <20250131-dangle-obtain-30ffa8a44083@spud>
References: <20250131112429.119882-1-biju.das.jz@bp.renesas.com>
 <20250131112429.119882-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2aWd9LJ+bsJ8g84Q"
Content-Disposition: inline
In-Reply-To: <20250131112429.119882-2-biju.das.jz@bp.renesas.com>


--2aWd9LJ+bsJ8g84Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 11:24:16AM +0000, Biju Das wrote:
> The SD/MMC block on the RZ/G3E ("R9A09G047") SoC is similar to that
> of the RZ/V2H, but the SD0 channel has only dedicated pins, so we must
> use SD_STATUS register to control voltage and power enable (internal
> regulator), for non-fixed voltage (SD) MMC interface. However, it is
> optional for fixed voltage MMC interface (eMMC).
>=20
> For SD1 and SD2 channels, we can either use gpio regulator or internal
> regulator (using SD_STATUS register) for voltage switching.
>=20
> Document RZ/G3E SDHI IP support with optional internal regulator for
> both RZ/G3E and RZ/V2H SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--2aWd9LJ+bsJ8g84Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ50FrwAKCRB4tDGHoIJi
0mTTAP9hMeaxexsvfROzaDoowF7ghWEzn8zaXnkyG2lhXeJgGQEAwYRi02ArAkkT
L5DAmPQ0lCwQs6yMpQ3EzuOUqoCoqQA=
=x6j+
-----END PGP SIGNATURE-----

--2aWd9LJ+bsJ8g84Q--

