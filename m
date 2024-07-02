Return-Path: <linux-renesas-soc+bounces-6992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 291D092414B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 16:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D920B2887C5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 14:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A07F1BA08A;
	Tue,  2 Jul 2024 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RX2OAH2j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6266A1BA067;
	Tue,  2 Jul 2024 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719931857; cv=none; b=c4It55WRvwqqUXDcaNUYyjWYZEMV3GbsLrnD1L6Nva1UeEBLqMkDJi1LpudzeWt0NskHjVhQ7LV24Tv3l25956t+oAwMCFb75hpKuOgUH7mmn0mOrg1qOix+woXpXJE0dtZ9ni+tTHKycdiPUCmq7KUWVJG78sdfWxtYV5F/fCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719931857; c=relaxed/simple;
	bh=8GrPOQF7l2Z/Xp7PSkYsxAUyYslALDELzdKgK4LRHng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y81L1ZHGo6YFsrXeS5SO/VqlI5I6n6e4EBIs/dU1G9Kp+XvQwDZNDXD7w76LC4pH/oarH3cBOi1JuWOlXrZ+W6avh+j/dteG5dlzmiXJF9hFv1tBOwUtt4hC/211McJ5Lc6kmedgyQh3fS8wUITR4E2Go5/QXgofDBGOqokauQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RX2OAH2j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCC6C116B1;
	Tue,  2 Jul 2024 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719931856;
	bh=8GrPOQF7l2Z/Xp7PSkYsxAUyYslALDELzdKgK4LRHng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RX2OAH2jOC1pBLdx4TgjQ4WdYGkOaqVhb5dftZ+HQsnCCpOagSiT4Xp4PbQXbVYCS
	 XNNexN9pjXHEZgLTeNnuVs9QYPsS+nLUoims1bD7/NcDj4E0ULvLXSWPB2+0Wv1HGr
	 7I/L/3bk92LgrDWac+5LtCxzFuH0jOV06slRy/qVxxy8o8yda4O5YpKdZ27ql+QUDC
	 y+e3gR5RBqslS9oY6xPpGXb5Gz1Egeyj6+YUUCbUFB7aJqRr86Le5fY+xQq+trhEVo
	 wGpQo5xbtwS6X0b9s1p3CIvTtu1dnBJuKW4DJT39XHbpj1uTtZtFd5Pz9Jd3Etzu+t
	 62hZWtUo+uh0Q==
Date: Tue, 2 Jul 2024 15:50:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240702-choking-glitch-d97191325ac7@spud>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
 <20240702094630.41485-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6lv1T1DM0q9CXqoQ"
Content-Disposition: inline
In-Reply-To: <20240702094630.41485-4-biju.das.jz@bp.renesas.com>


--6lv1T1DM0q9CXqoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 02, 2024 at 10:46:13AM +0100, Biju Das wrote:
> Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> SoC, but has only DPI interface.
>=20
> While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
> SoCs.

A new required property is an ABI break, it deserves more of an
explanation than "in passing..."

>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 32 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.y=
aml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 08e5b9478051..c0fec282fa45 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
>        - items:
>            - enum:
> @@ -60,9 +61,6 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          unevaluatedProperties: false
> =20
> -    required:
> -      - port@0
> -
>      unevaluatedProperties: false
> =20
>    renesas,vsps:
> @@ -88,6 +86,34 @@ required:
> =20
>  additionalProperties: false
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g043u-du
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0: false
> +            port@1:
> +              description: DPI
> +
> +          required:
> +            - port@1
> +    else:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1:
> +              description: DPI
> +
> +          required:
> +            - port@0
> +            - port@1
>  examples:
>    # RZ/G2L DU
>    - |
> --=20
> 2.43.0
>=20

--6lv1T1DM0q9CXqoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQTywAKCRB4tDGHoIJi
0lOBAQCn6PdPFpKiaDN6FCYz31fxa5IjoRWeN/XXq3MNDAxJhgD/dIVSUf9g00XV
mUd+njn3lrmTYC6+QUKQ2SRpgGexgwU=
=hI46
-----END PGP SIGNATURE-----

--6lv1T1DM0q9CXqoQ--

