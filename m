Return-Path: <linux-renesas-soc+bounces-30605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IYvHa2WymkR+QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:28:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C44535DD4F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 17:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1F1503008D71
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D5033FE12;
	Mon, 30 Mar 2026 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hfifa7pn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCB2253B42;
	Mon, 30 Mar 2026 15:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774884514; cv=none; b=n+Hz4HPEEguKc+HbEe66VaB369UgPC0vBHSbIT6RRfynYDq53MdAY4RM2QFaTTSQjz7JTIOsAuvolm/hdCSKglwsyys1tSRaM0qdUyw7AuvmRV0O6+Oe77VcUEHm//Y6jT3Ivt9QuqV2gA4oUKUmk764QutGJbDdR2dSPUv7du0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774884514; c=relaxed/simple;
	bh=dLr9IE97aBjxPIZhRnEAOelMA8nPQc0RVFhTr/xWxPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHxReuKVhVbAvgzqoE+CfAu0eB2lE30mmOZyYeUfpUfPr3c5YrdZg/V+jo9N5XNZbJpghcOaYDMxcdEzFeJ/6g2+humPhbuC12Dfqk76cCwT84qOCKNBxawZKDPV0J7syr1VZoesbPfZK2G4K/LOrod132qureV0ZYCEbGG6lds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hfifa7pn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FAEC4CEF7;
	Mon, 30 Mar 2026 15:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774884513;
	bh=dLr9IE97aBjxPIZhRnEAOelMA8nPQc0RVFhTr/xWxPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hfifa7pnY2K1tvImhulbUDiK1T4gOO1GJcAE3Pn+c8i+77oOPUm8JsVWzHPa/uYqV
	 ShxtjGoRqocpdr6mloGB5CEIXTUuozuRzsAK60ivJ6mWrHJY/tzp6FroOMjQrdT8g/
	 1FUuOMoyBZOSDv7CBWHA3awV71KM8A+VbRhSy14eS1+IpQTyy+SVmp0ak9p/qtcl91
	 2eqYcYof0VmIAFslinhqAg7mX0X10RhvOWpL6GmH0AAr/5Nee7HIoGkv+P03Sn8wrp
	 q7vaFHZDaJw1Dw+3i+g2RMOgyH6M63UK6BJUZWN9QH5tIO/aezz+hdEvldgvvHfe5B
	 7tkUCKtC4CWhw==
Date: Mon, 30 Mar 2026 16:28:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Hui Min Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
	ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonathan.cameron@huawei.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 5/7] dt-bindings: cache: ax45mp-cache: rename
 ax45mp-cache to llcache
Message-ID: <20260330-depravity-rake-6a9745d03ea2@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-6-minachou@andestech.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1YWh0I2nTEtlrVXn"
Content-Disposition: inline
In-Reply-To: <20260330102724.1012470-6-minachou@andestech.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30605-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,glider.be,bp.renesas.com,gmail.com,andestech.com,huawei.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 1C44535DD4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--1YWh0I2nTEtlrVXn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 06:27:22PM +0800, Hui Min Mina Chou wrote:
> The AX45MP-specific cache binding is renamed to a generic Last Level
> Cache (LLC) schema, as the driver now supports more Andes CPU cores
> beyond just AX45MP.
>=20
> Updated compatible strings:
>   andestech,qilai-ax45mp-cache    -> andestech,qilai-llcache
>   renesas,r9a07g043f-ax45mp-cache -> renesas,r9a07g043f-llcache
>   andestech,ax45mp-cache          -> andestech,llcache
>=20
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>
> ---
>  ...ache.yaml =3D> andestech,andes-llcache.yaml} | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>  rename Documentation/devicetree/bindings/cache/{andestech,ax45mp-cache.y=
aml =3D> andestech,andes-llcache.yaml} (76%)
>=20
> diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cac=
he.yaml b/Documentation/devicetree/bindings/cache/andestech,andes-llcache.y=
aml
> similarity index 76%
> rename from Documentation/devicetree/bindings/cache/andestech,ax45mp-cach=
e.yaml
> rename to Documentation/devicetree/bindings/cache/andestech,andes-llcache=
=2Eyaml
> index b135ffa4ab6b..5b97625edd37 100644
> --- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
> +++ b/Documentation/devicetree/bindings/cache/andestech,andes-llcache.yaml
> @@ -2,17 +2,17 @@
>  # Copyright (C) 2023 Renesas Electronics Corp.
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
> +$id: http://devicetree.org/schemas/cache/andestech,llcache.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Andestech AX45MP L2 Cache Controller
> +title: Andestech Last Level Cache Controller
> =20
>  maintainers:
>    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> =20
>  description:
> -  A level-2 cache (L2C) is used to improve the system performance by pro=
viding
> -  a large amount of cache line entries and reasonable access delays. The=
 L2C
> +  A last level cache (LLC) is used to improve the system performance by =
providing
> +  a large amount of cache line entries and reasonable access delays. The=
 LLC
>    is shared between cores, and a non-inclusive non-exclusive policy is u=
sed.
> =20
>  select:
> @@ -20,7 +20,7 @@ select:
>      compatible:
>        contains:
>          enum:
> -          - andestech,ax45mp-cache
> +          - andestech,llcache
> =20
>    required:
>      - compatible
> @@ -29,9 +29,9 @@ properties:
>    compatible:
>      items:
>        - enum:
> -          - andestech,qilai-ax45mp-cache
> -          - renesas,r9a07g043f-ax45mp-cache
> -      - const: andestech,ax45mp-cache
> +          - andestech,qilai-llcache
> +          - renesas,r9a07g043f-llcache
> +      - const: andestech,llcache
>        - const: cache

If you want to add a more generalied compatible to use as a fallback,
insert it underneath andestech,ax45mp-cache. andestech,llcache is far
too generic though, and there appears to be no user that isn't an ax45mp
now anyway, so not sure what this even gives us right now?

--1YWh0I2nTEtlrVXn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacqWmwAKCRB4tDGHoIJi
0jvkAQDi3CN5vV+aStgwXt4oRcQkKYMfS2J7J2wKpU8a77p5lwD9HNxDpxInwC/9
il505Wz41Ck087E3pY8AsuYysAnXDAI=
=V7yC
-----END PGP SIGNATURE-----

--1YWh0I2nTEtlrVXn--

