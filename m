Return-Path: <linux-renesas-soc+bounces-24274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DD4C3CCBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 18:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75C56625E7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 17:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4976334DCFD;
	Thu,  6 Nov 2025 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBXSnnF9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6842D8364;
	Thu,  6 Nov 2025 17:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449409; cv=none; b=Tou9weQEohSMUpATOkW8bX//RnjID8PK1umSIzJqK60bkyHcwx44leSldLLYBUev7RA14EB1Ba9+yNkBVq7lb4qVqd7TEl7cp0+oJwwik/Zu0BGQIr7rRYVwmzStLTyotOG1Dz0ACt1PKNMn8rVSJjEbe6e8aY/CC0rNVmhONrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449409; c=relaxed/simple;
	bh=m2R6rCvNW5OaSjGYhwlRezMk4Up1eORABKGwhXYzmkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTn6X+ZCtQMdAvHfXHLv8r0yyKt8X1h3VADLK1ui8rI+Fs5tN+m2NxO1uQs/NIw2YWMnOc621hZsyjgr6SpF6wDkMtpIr3k3FbzvQvxLXQcBhjw4KoNixmlncEp0+gibo+wq7hrarCs9m9JSwtZXphOTh1TjtPY8mhkFia4RzFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBXSnnF9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F685C4CEFB;
	Thu,  6 Nov 2025 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762449408;
	bh=m2R6rCvNW5OaSjGYhwlRezMk4Up1eORABKGwhXYzmkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WBXSnnF9W5vKavhDwgGuHzbE3prgSH7iJhiScZwimP5W/oBKLACeVHIUUeBjrv7ws
	 GxsgN0bp3CF7lD0o4BpXql8NYOTcoH8PGzczGp2mNPBgBLtjW4sR3mOZij4KQ9G6dK
	 8GtAe5plrOTzdoRHNREXUHaRBSTtxmH4qUWk8eMYxHBdMOmqWAp+eQkcnWu/4ZygyH
	 /Yin43oaNzuiBwcrmmW4HaW5ym81Q3B1bCfmeWIDWwCMak0upGr4W4kRvMiPzLlJK+
	 mYURV6HaVUklalFX/RXFXCfyVcGSNPTRJbiDKJoDPQRL7qPspwNLdnKgtQPzPciiP2
	 nWcxhxx8naCHg==
Date: Thu, 6 Nov 2025 17:16:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH net-next 03/10] dt-bindings: net:
 renesas,r8a779f0-ether-switch.yaml: add optional property link-pin
Message-ID: <20251106-finisher-fame-8ec10b3d09f7@spud>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
 <20251106-add_l3_routing-v1-3-dcbb8368ca54@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cwPvpkMHZjNpCD3l"
Content-Disposition: inline
In-Reply-To: <20251106-add_l3_routing-v1-3-dcbb8368ca54@renesas.com>


--cwPvpkMHZjNpCD3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 01:55:27PM +0100, Michael Dege wrote:
> Add optional ether-port property link-pin <empty>

Whats this <empty> about?

> Signed-off-by: Michael Dege <michael.dege@renesas.com>
> ---
>  .../devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml         |=
 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether=
-switch.yaml b/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether=
-switch.yaml
> index e933a1e48d67..54cd427d8ae5 100644
> --- a/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch=
=2Eyaml
> +++ b/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch=
=2Eyaml
> @@ -126,6 +126,9 @@ properties:
>            - phys
>            - mdio
> =20
> +	optional:
> +	  - link-pin

Missing a definition for the property. "optional:" isn't a thing,
anything not required is optional. Clearly you didn't test this. Please
look at what every other binding does for (what I assume is) a "boolean"
or "flag" property.
pw-bot: changes-requested

> +
>  required:
>    - compatible
>    - reg
>=20
> --=20
> 2.43.0
>=20

--cwPvpkMHZjNpCD3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzX+gAKCRB4tDGHoIJi
0tEuAQCWq4RbckuVsJIWA5+9HT/0p63wpkODzDl+RSZ6QSkQ4QEAmJaQNRgoql/p
uGtYFpurnwbUPfWrRuHTMD+NcnmEngM=
=+9B/
-----END PGP SIGNATURE-----

--cwPvpkMHZjNpCD3l--

