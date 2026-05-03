Return-Path: <linux-renesas-soc+bounces-31905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMp3J1yP92kEjAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 20:09:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 031FB4B6EBA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 20:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F8FB30086C0
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 18:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8084F39A05E;
	Sun,  3 May 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PamGlYs/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3363590AE;
	Sun,  3 May 2026 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777831770; cv=none; b=uwR4+vRyACajRwyk7tLifHSH7LqnrCV+JL6ClnQnIBEmx5QG0Lgj/BO1hRDc5GPJKJ9u5Miz59YXa3A+Iy9tcwgYX1NdxP1iyqhlkiWK7V2La/MGsnUEGnTDcDW3OQCFL4PhNHwxRyR2Jy9NUnlHZgCVggfo0GRHUAvpyZTcU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777831770; c=relaxed/simple;
	bh=PNshguIxTl4GJp7I1c2BUQ1EKe5B/TBcOdJ5hudy+5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0tLEZSbleVs0a/fzeCBiBScg39DdXw1KZ8RUgYKLx5ABJSJtjNuB3HFT7lY03JwpGtREg8bJ9SoDULyj4aWDbZrSFcy1Jy8jrsXusgD/Ycnns5k2Cfw5cXdHGSbLIATCs4xlwN5pFGuiNMAPZEATgvZv0c5vtZU825yO3teUm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PamGlYs/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC161C2BCC9;
	Sun,  3 May 2026 18:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777831770;
	bh=PNshguIxTl4GJp7I1c2BUQ1EKe5B/TBcOdJ5hudy+5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PamGlYs/ZwXpRIaoXrQegy5PszNxk/y9cZMZfNbPYtu1RbkQQt/1+fjEVfceCrxX3
	 vHqqomXBglK9bskAB+oM9s6p6T4iXP94D0eVxJXgrReRb/O8EAWl2hJhD8LTDKO1X1
	 gGmkISg+aUA22JhseGgE69hbf4VWvh2jn55xg0hJ//znhmd+8OuvJgddCx3QNMhXaC
	 Ut2B9mSMV9qkpLOxIDcZywRBvbyitAqj3hzA8F9oyFQ4i0Aj2Gel4RVtQMg3KwwxtE
	 zxc0WcDmREtNHLhnzhjuEh0R/fOy0r2lDL5mlITVHV9iI4fdeCVONozerNeWu+lVxK
	 0UfEjLFpTdq5g==
Date: Sun, 3 May 2026 19:09:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] schemas: Allow clocks: property in cache nodes
Message-ID: <20260503-vagabond-barge-dac8ececfc11@spud>
References: <20260503154439.27362-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eM0xHKcgk7arIq0j"
Content-Disposition: inline
In-Reply-To: <20260503154439.27362-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Queue-Id: 031FB4B6EBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31905-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,glider.be:email]


--eM0xHKcgk7arIq0j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 03, 2026 at 05:44:13PM +0200, Marek Vasut wrote:
> Renesas R-Mobile APE6 currently describes clock which supply the cache
> controller in their DT using "clocks" property. This is not the only
> hardware that has cache controller clock controllable via some sort of
> clock controller, for example Altera SoCFPGA Cyclone V and Arria V also
> has controllable cache controller clock. Allow clocks: property in cache
> controller node to allow users to fully describe such hardware.

Hmm, shouldn't these cache controllers have dedicated bindings that
enforce their clock requirements?

>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  dtschema/schemas/cache.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/dtschema/schemas/cache.yaml b/dtschema/schemas/cache.yaml
> index 73d345f..dee1cd5 100644
> --- a/dtschema/schemas/cache.yaml
> +++ b/dtschema/schemas/cache.yaml
> @@ -33,6 +33,9 @@ properties:
>    compatible:
>      const: cache
> =20
> +  clocks:
> +    maxItems: 1
> +
>    power-domains:
>      maxItems: 1
> =20
> --=20
> 2.53.0
>=20
>=20

--eM0xHKcgk7arIq0j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafePVgAKCRB4tDGHoIJi
0n6WAQC+uQdAl3MVRNz6gWaCxG/Ka7dQmw1C4FssO+r/KRc3iwD/WqudPKI1Kuix
PcPTmIbr/yWmQcaar78FVil5wnqJFQQ=
=59Jr
-----END PGP SIGNATURE-----

--eM0xHKcgk7arIq0j--

