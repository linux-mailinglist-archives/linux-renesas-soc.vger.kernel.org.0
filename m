Return-Path: <linux-renesas-soc+bounces-25003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED99C7B500
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 19:24:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72D913A1974
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 18:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C37C4246766;
	Fri, 21 Nov 2025 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pym6eGsr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDF221E098;
	Fri, 21 Nov 2025 18:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749451; cv=none; b=pn0ZkJeTw8EYD73EvWyK/6kfTD70+q6D/lK5M9CVxamkocV1S9j/eayZ4CVAyVB5aPsKsz6vwb7QQDN7kiSIHJ2Toq1MClirHnLjRAJWMXawaGxLaWtrQWa7Hp3kujuTs0v+lsDPgt4DPifpRHyrGdhlTwgsUle/ePCFM+UnhPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749451; c=relaxed/simple;
	bh=WLjenSCjWa8XEEDvvIHGWW6n2IZ7PQS4eefK5BUqRb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7a/2V/REPkOwhW1IPfZtm2fvpHJu3dhki852RAcaKJSICCxZeZYLwR2ZcgOiOYbFXDr6UIWGqDQV+PHuR/6cOQEnI6OhXZG5m0jd9etfnbJ+xvfS5KcxG7yqgb0qVEoVevJ8ZtED6EBSJhIWGlJsEqPnKoBoLUFhugymIzNyGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pym6eGsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347D0C4CEF1;
	Fri, 21 Nov 2025 18:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763749451;
	bh=WLjenSCjWa8XEEDvvIHGWW6n2IZ7PQS4eefK5BUqRb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pym6eGsrkOKumrM7LgpO9HvT5akwyBbD1DY7t9Er8blwCUsWvmasjGYXUfROxYzr4
	 Jkr6sz5zjgJNmiMzuiB1jsh2eK2PTEeEBCrQFJr/11JGvNgR9nr1Xq0fZdTVYRYK6A
	 TL7cJT1oFozg++zXtdkO0dW31IkI7mND5v4XgHYh3xrsPZMKNLY6pmN3jK/1bvWpXQ
	 evtzJktLrMeTNMVsTKNb43u9NwjgTkI9v0w1/O/BH7BF08ph5ZaWU27qi4QpMc2fiC
	 zp8UWY190uHqPe65KfsYM3/sbAshbx0FQPJ/6lXMrzXrKKJIUX+KrsdcI5Ok0Zw2+E
	 UF3hb2kB1rwmA==
Date: Fri, 21 Nov 2025 18:24:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 01/22] dt-bindings: mux: Remove nodename pattern
 constraints
Message-ID: <20251121-spring-slot-ec9fb6887565@spud>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
 <cb7c28ccf3a1b136e793b48720f816de7d5f75b2.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VKsNTaFTCye1rtHN"
Content-Disposition: inline
In-Reply-To: <cb7c28ccf3a1b136e793b48720f816de7d5f75b2.1763737324.git.tommaso.merciai.xr@bp.renesas.com>


--VKsNTaFTCye1rtHN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 04:11:50PM +0100, Tommaso Merciai wrote:
> The nodename pattern in  created an unnecessary restriction that forced
> all mux nodes to be named with the 'mux-controller' prefix.
> This prevented valid use cases where mux functionality is part of other
> hardware blocks that should use more specific naming conventions.
>=20
> Remove the $nodename pattern constraints from both the 'select' keyword
> and the properties section of the mux-controller schema.
>=20
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Funnily enough, there's another patch that I saw today that hit this
same thing:
https://lore.kernel.org/all/176373269741.263545.10849918874919174841.robh@k=
ernel.org/

> ---
> v3->v4:
>  - New patch.
>=20
>  Documentation/devicetree/bindings/mux/mux-controller.yaml | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mux/mux-controller.yaml b/=
Documentation/devicetree/bindings/mux/mux-controller.yaml
> index 78340bbe4df6..6defb9da10f7 100644
> --- a/Documentation/devicetree/bindings/mux/mux-controller.yaml
> +++ b/Documentation/devicetree/bindings/mux/mux-controller.yaml
> @@ -63,18 +63,12 @@ description: |
> =20
>  select:
>    anyOf:
> -    - properties:
> -        $nodename:
> -          pattern: '^mux-controller'
>      - required:
>          - '#mux-control-cells'
>      - required:
>          - '#mux-state-cells'
> =20

>  properties:
> -  $nodename:
> -    pattern: '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'

I need to apologise, I told you to delete the wrong thing in my DM
earlier. Only deleting this part was actually required, deleting the
select portion doesn't really do anything for your problem.
What you've done is probably fine though, since anything actually acting
as a mux-controller will have the cells properties.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> -
>    '#mux-control-cells':
>      enum: [ 0, 1 ]
> =20
> --=20
> 2.43.0
>=20

--VKsNTaFTCye1rtHN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSCuQwAKCRB4tDGHoIJi
0oFIAQDW2bAxzrTvDF1ukX42XWJsL5zccm84MH2+EOosxxP+5gD/RAup3FCsfPBU
gRGFV0fs3ohPxPBLD/iszdmUMqJOxg4=
=3axy
-----END PGP SIGNATURE-----

--VKsNTaFTCye1rtHN--

