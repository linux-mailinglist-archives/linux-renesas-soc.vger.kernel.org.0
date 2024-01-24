Return-Path: <linux-renesas-soc+bounces-1781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 449A783AA54
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF7CA1F267FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 12:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 793632BB03;
	Wed, 24 Jan 2024 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeJWTrOn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F99134CA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 12:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706100781; cv=none; b=RpH9pow/l5y9gNQSnwoc/aS8TkFZT1oDFm4HHD5N1g5k6YeTbl4useyyxsv7lNv5pGdpANeVjZXw37XYAFTfoGIgKafuat0An8KjZ2QZ52cdVjfDPN9cmOph39NLcqMU/XYjd/uAJk3oWRCfp9DbVQk0GaJE3VaW/sxTsdHoOlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706100781; c=relaxed/simple;
	bh=u2rFHUt8VyBleF5xRXCrqJPnrFCsq8DUzalN5Awc58c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSdiDlgd/o72ypDAHNqHQZ5kG7wKTQMYNKGqmTa3lUMkILXu9U8jLZynaZTeCTQXnwiCWK9AJd+DSRpHFrd/SpmdyMqx+7QD6n7ikbtZQ6cu++vof0OPTr1E57MRdW1SQCjZOBtB9W2Zs3s5cjQ65teCYQLEBzRQ2W69E59mifw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeJWTrOn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47BCC433F1;
	Wed, 24 Jan 2024 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706100781;
	bh=u2rFHUt8VyBleF5xRXCrqJPnrFCsq8DUzalN5Awc58c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XeJWTrOnqzTilqbAOKoDHyb3ICzPiVpVfAuzTYrBm6G8dp3/msNdbAGBpgv2OZRUt
	 x9w/CYpLplfFSl7dqr0LWrjmeMdmDoKNMv9hZvOU/REBoW7uMdmQYn0wwsgkBf2cr/
	 Q67Wmzdg3vXZcRUYIs6DZodkme6idbBGdvJaC/ZdK7AIkV/xl60tPihv8S7tPspqyb
	 5ANSOD4kKK9e3mXxYzoxh9RgUH++VjaLAZnQH8N43yoUsist/LOdaPLXlucVqmYMO9
	 QE+Aj9o9y83P9GJNtw8ujquW10WqI4sxjMVtTBserbe63ewWW49V5SMsBdTll7IjOk
	 AkhyxCg2YFfPQ==
Date: Wed, 24 Jan 2024 13:52:57 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 5/7] arm64: dts: renesas: r8a779g0: white-hawk-cpu:
 Factor out common parts
Message-ID: <ZbEIKRyd82rMPGuy@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1702309604.git.geert+renesas@glider.be>
 <e9a9f541870450652952bca2b50603f9f8be940a.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hAZJQn7H9WBFCEKT"
Content-Disposition: inline
In-Reply-To: <e9a9f541870450652952bca2b50603f9f8be940a.1702309604.git.geert+renesas@glider.be>


--hAZJQn7H9WBFCEKT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> @@ -25,6 +21,12 @@ chosen {
>  		stdout-path =3D "serial0:921600n8";
>  	};
> =20
> +	sn65dsi86_refclk: clk-x6 {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <38400000>;
> +	};
> +
>  	keys {
>  		compatible =3D "gpio-keys";
> =20
> @@ -135,12 +137,6 @@ reg_3p3v: regulator-3p3v {
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> -
> -	sn65dsi86_refclk: clk-x6 {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <38400000>;
> -	};

Why was this moved?


--hAZJQn7H9WBFCEKT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWxCCkACgkQFA3kzBSg
KbYkMw//aUExwuzeQg50XfAp1sgzVhsZN/iJ0nCo0vT3o9wZoBE0XACKYoB/r6YO
JnaOA2EM3R+XoTIkFy1Hv8Nx2/qHpl3eOwRDSO6FJt0jVIY/+SLA1v3197zJLJ/+
OynaT7eu4UpG/Gnu5jE68xQ5mLrBIT1oh4PvgYu+BIdDQpNMDrVSlBCIkb3/lDik
7MLssE/HpzUhvSF8ebxfcNkTrkmmIVGkl+Pe/MU5iItNN0Ho4bLRkUh6PDkjsQXR
h77ULV750zKKz6+412Sro75J2V97Q1xzyrCfZnF+FlJes9zGJYYCNgrWFT5ssPkf
0wzwpnsEu3cb9pPeRPvBvgptRz8GgtRmK8jwvge2AJz5Sc1VeZG6V9ECpaJqN96z
WWIuCZXUjECZBc+UAtm6JBTeSQ2OAyHXkCUGxBC3AcSGS4PShnYQ+hxbvOCRJ7L2
wZhK/9rhx4qCrCNvISpECk504LCmsWOsik2AmxQqpE6cuC+MaAnUr7tC91TngkM5
yA9jq3f3ljiy+8D1GH1KSFdmANLOSGvBBg4sExvZGq2IbniEhk3/b92lqD0qGglx
PteWan6L46DrBWp0HpVXmLjWevmrr1NWQWBkXTgK79lq7O11Z0VufKmiJPmnejlG
JPahBiqIQDYpBy1oFBOHKdbxLn8ZNlf2TB9rRsNg4K5pZ1XNUXY=
=KOzD
-----END PGP SIGNATURE-----

--hAZJQn7H9WBFCEKT--

