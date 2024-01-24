Return-Path: <linux-renesas-soc+bounces-1784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B279E83AA92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 14:03:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698EB292869
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 13:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 238DB77642;
	Wed, 24 Jan 2024 13:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy8qMGQu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29BE1C33
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jan 2024 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706101323; cv=none; b=B16JYKNpPJfrK0G2tKbe9eDL9c3SUa6d515ry9GxQgtFIluX4xxm7+0mgDaobwLY6XfgImY3a+arEBeQNXN7efdeyrc8WlLwXuxVejYKjOdSe1g8XDQy7uHyeSj65G9Jt5HDSwBkZC22DmULmRqlve7keZPRfLzqVlCP0dGANEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706101323; c=relaxed/simple;
	bh=ATrQdZ6wU+2ovD6AhnINcLM8HNh0NhlP6UGD06z+RbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcrddCKMVEAw25hq34+Ysdz04AdlA3JoV6pUpn4iLmG7cmO/0hcGSfSIw569L92qryvbyX0bY4MDw8W2wZHUvSgZColf7+unKvyL0cflQoFnavQF3Vy9IMPskfGiUZHezhDPDkfTKU8cIBdezo4HnSpMJ6i1ptDQOnhT74M8fMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy8qMGQu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C7CC433F1;
	Wed, 24 Jan 2024 13:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706101322;
	bh=ATrQdZ6wU+2ovD6AhnINcLM8HNh0NhlP6UGD06z+RbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fy8qMGQujU1DVgbsJYRtddl+yl1L53796tLa0RXa9K8a4N6XPs/faNzP5P4w6eAYK
	 IM7r9J1/2T9TUGXLDbMyZCP0RhauVhyWvZWPCUMRG8kODuTrQiyDxfWk44HCvay//J
	 xR3vBaTFYN/oRLFYkqHIzhTWK6Mo9YhFgAR4/kO6ojrkUsj+iqrgCIqGjzvzD//vzl
	 jlbbg+ue7RtKmfNZuSe2wkCn2Lr6IAEcufiS/IxgvcyZfhWRfLQZpQSVnFHo3kzOLy
	 gXs5Me9S5wUn+On2wMuwB1old4h0Z8vHf24wqWNx7Sx5JQz8KifIyCxh3l0jUsU/Un
	 x67kaLj3z4KHQ==
Date: Wed, 24 Jan 2024 14:01:59 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFC 7/7] arm64: dts: renesas: r8a779g0: Add White Hawk
 Single support
Message-ID: <ZbEKR7GO_aeHsmwe@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
References: <cover.1702309604.git.geert+renesas@glider.be>
 <7f9c840ed44dfd57da545e87b5937b58f35cb9c9.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1COQrBRE2jNAlgYu"
Content-Disposition: inline
In-Reply-To: <7f9c840ed44dfd57da545e87b5937b58f35cb9c9.1702309604.git.geert+renesas@glider.be>


--1COQrBRE2jNAlgYu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 05:01:22PM +0100, Geert Uytterhoeven wrote:
> The White Hawk Single board is a single-board integration of the Renesas
> White Hawk CPU and Breakout board stack, based on the R-Car V4H ES2.0
> (R8A779G2) SoC.
>=20
> For now, the only visible differences compared to the board stack are:
>   - The SoC is an updated version of R-Car V4H (R8A779G0),
>   - The serial console uses an FT2232H instead of a CP2102 USB-UART
>     bridge, with CTS/RTS wired.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the HSCIF pin issue:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I like the split up and the naming. Makes sense to me.

> +/*
> + * Device Tree Source for the White Hawk Single board

Maybe add "R-Car V4H" here? Maybe even "Rev 2.0"?

> + *
> + * Copyright (C) 2023 Glider bv
> + */

--1COQrBRE2jNAlgYu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWxCkYACgkQFA3kzBSg
KbZ7GRAAkRV/iw2v0kK1VjulqdGThOFJSbPyUN4pFnj3bPsIyLPsdLidF+BbRybJ
4ycxBbuqC0GY6RNEj1eGxVgEaJs0qAIeOsAe5/e+So057VOI40N9cHdrqPbddQpf
TsVGkvdkyANGYWG2iDJfHu+zAOdZJGACMVUd1eWO0wEEIhygEU/ut4kiHOMKgV6l
p6ZdSPIeESwI2M0EBtj7mWzGV2/9BGKsUV0id+DjbYiMDyqAGag0w2m2Rn3iPAQF
LR8GKy66NkiC7WV0ODMK0DPiVwY4nFwixxqh9/lOa3qI0ehVJAWZa27hlkNI6GAg
+omTMPXhBTEa4fKoK1kc+6XzZim4Ev9k0OOmwSd3P6TkzhwLDL2viBrdyyOequII
h2qGO3k7Cwh54wshx2kR25sOCbmCS9SmVUBCHVoWP7PZD2arR+wWzdFfvuXbHFOU
+YpWDrZPNIDfDadwXCtS9y4kO9aEo2HCRS3l8Zbw9BiRakkr0RautegUf375knXi
WzprOKFrpiQ6Er8JyRaTtSZRobcZ/C7o9qmgQklY9KRvUkxU333w8UoQhb8YXDe2
q1wl60bvrGgREO8ZVOkg8it6RYmS+oMS5M6iK1PEFphKIZed/80MJmSLrgWHUTEl
GPou/vCHlsqT6EDOqDjSTaA0NPQHY8GyGFzKrpVM3fgCI74nOr8=
=4ve9
-----END PGP SIGNATURE-----

--1COQrBRE2jNAlgYu--

