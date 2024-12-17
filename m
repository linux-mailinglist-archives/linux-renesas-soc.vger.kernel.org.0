Return-Path: <linux-renesas-soc+bounces-11485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 584509F55EF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 19:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF48188B94F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 18:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2627B1F76A2;
	Tue, 17 Dec 2024 18:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHAUrmyI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC57A14900B;
	Tue, 17 Dec 2024 18:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734459521; cv=none; b=Rj2AnyqcpMq5m+tASHNydi2iKKZ2h1VLBeM93ACvvnyKz9Pq5EwdLYVetCkM17VQMfOEvIYWb2iE9vf1jN5RxlR1Eln/7ZjBLxx/CvLPsKOBkXM5X9BJxhrS9mHyntwAYxLtAQsazQ0oc4ONuPsia5Us9BZ5/HKvP92AbJTevII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734459521; c=relaxed/simple;
	bh=kSdAEiIXfeGQwQh1cMCwz9kB4jDFKEML4oez+S2XKh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqXAuChgaH/4vC45xnQgl+65TFJ1EvJ64dHOa/QdfexrGeEo5GYkc7M94Xue3MShHGGMXDcvd3w3Cryit8coXdIqaC71leuSgV5PFdDShJ3ELYrXcRn8wbI1ZTleoL62yKRXcDXb+pWB9PzUhYF/OrZ+wTpWkmfcvhFnw6IChzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHAUrmyI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B9CC4CED3;
	Tue, 17 Dec 2024 18:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734459520;
	bh=kSdAEiIXfeGQwQh1cMCwz9kB4jDFKEML4oez+S2XKh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHAUrmyIgLqeO83jRyyaDqKQyIsUP8LKwLaIbecjl82l/i3ynmOKqRSDO2DmxDdL7
	 qtGLPRBL4EnRY6OB+8XRi8AP1txBi46eJE4INuVDBtcnh24YRX/4FZcjFsKIIFOYt1
	 KvKF8XCDrtS53nX/vG04LYwrfshvjY0FK+Qi2U30eZc3Ngss3oh8H1UWUdhWTRueTi
	 dKn8kaBG4a94QW+4YMKFHc8zUun+WP9b/chh+HfWos1j1IeafGMH87/Fvfl1XVvGey
	 Xv9CT6Di4FrMRCtUPPyEpLnMJLxMko5nWLKabBYvuF2LHGjCSAw+SK1GKW0pG4A8zK
	 +q+AHY9YK1JtQ==
Date: Tue, 17 Dec 2024 18:18:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: lm75: Add NXP P3T1755 sensor
Message-ID: <20241217-pursuable-trustable-23678e5e4a86@spud>
References: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
 <20241217120304.32950-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0lWHcTBbnSLlxIHx"
Content-Disposition: inline
In-Reply-To: <20241217120304.32950-5-wsa+renesas@sang-engineering.com>


--0lWHcTBbnSLlxIHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 01:03:05PM +0100, Wolfram Sang wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Commit body is entirely missing? What differentiates this device from
the others in the file?

> ---
>  Documentation/devicetree/bindings/hwmon/lm75.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Document=
ation/devicetree/bindings/hwmon/lm75.yaml
> index 29bd7460cc26..c38255243f57 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
> @@ -28,6 +28,7 @@ properties:
>        - maxim,max31725
>        - maxim,max31726
>        - maxim,mcp980x
> +      - nxp,p3t1755
>        - nxp,pct2075
>        - st,stds75
>        - st,stlm75
> --=20
> 2.45.2
>=20

--0lWHcTBbnSLlxIHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HAfAAKCRB4tDGHoIJi
0luEAP94uoPxdXzRxPsOUSneyMNQqO///W8yzkzaYo0i7MFTzQD/ZyZezMDdy1oh
PVYwKFGkYdyaM6P1wNZlC1vQ4ifqoQM=
=fBbv
-----END PGP SIGNATURE-----

--0lWHcTBbnSLlxIHx--

