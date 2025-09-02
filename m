Return-Path: <linux-renesas-soc+bounces-21154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED032B3F8F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 10:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB023480D41
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 08:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93B22E8DF6;
	Tue,  2 Sep 2025 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGT2FOX2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8591E2E36F4;
	Tue,  2 Sep 2025 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756802705; cv=none; b=EGjGtlwCA+4/690KlMITKVYzlSpYCHYuxuwdqZhQTKOMwkKWO4wLPWjLg9bMt/PfYQTVBfpWoURaF1fC+gfT7AAUWTHwncBa4CC3wMJBAB9AwmDIig4Tvzz4qIQNhs9xwj5qnBeI86drinWyjNqQBlhBvfVF45SZ+M7X+fsADZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756802705; c=relaxed/simple;
	bh=2HMvFldIf4W22/qAW2cax0Qg6e91/8xocc74yW5+qaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+px3JGnkL5dEBFTRazkLuLdF5iv++gmNx2xbMCitsF/aK274jjMN47N5JX0JcDJNb2A67w/vJNPHlE7mfwbcPoJNapZW/esVgjqn1swlwehz2/EpLC11QSps+p5upvGwyDGvSIq536kMP6LiMkuQmtoiedq2EUvZbtA99SltaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGT2FOX2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FA7C4CEF5;
	Tue,  2 Sep 2025 08:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756802705;
	bh=2HMvFldIf4W22/qAW2cax0Qg6e91/8xocc74yW5+qaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGT2FOX21NCjI8lkfzPXhHvSw7MIMEcTvxczG7rJQFZQdKXm8+ACeNRTSbZQdWKdl
	 aHb0rt2APIB8rPvQsOh4YSP1RHgP57qsnYSIDv/O5RWDmfIJ5MFVrzVXqnMujKuH37
	 4uqqnl14CVIe/TVRsXAxN4BQKHZKhJpNRjyIhDl3R4g+2Qttu61y5mEQguSSOKFeD3
	 aUh5lT1eaeEvVVd0aDZAEMmU9Xe7/EeJY74x3B1BqQwNHhQZSxLQEsagJUksJTnezx
	 sIRZryCr/K9gR8WStKe8OuBtLzv5d4MsOaIOmdzQPfWco8I/NTPEf5N02rIq9UjbfO
	 9CD6TfR1fCdIg==
Date: Tue, 2 Sep 2025 10:45:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next 01/10] dt-bindings: net: pcs: renesas,rzn1-miic:
 Document RZ/T2H and RZ/N2H SoCs
Message-ID: <20250902-enlightened-hidden-copperhead-4eefdf@kuoka>
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901224327.3429099-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250901224327.3429099-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Sep 01, 2025 at 11:43:14PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Extend the RZN1 MIIC device-tree binding schema to cover the RZ/T2H
> and RZ/N2H SoCs. These SoCs have a MIIC converter similar to RZ/N1, but
> with some differences:
>=20
> - RZ/T2H has two reset lines; RZ/N1 has none.
> - RZ/N1 supports 5 MIIC ports, whereas RZ/T2H supports 4 ports.
> - On RZ/N1, MIIC ports can be mapped to various endpoints such as RTOS
>   MAC ports, switch ports, EtherCAT ports, SERCOS ports, HSR ports, or
>   fixed PHY ports (covering PHY input indices 0-13). On RZ/T2H, ports
>   can connect to EtherCAT slave ports, Ethernet switch ports, or GMAC
>   ports (mapped to PHY input indices 0-8).
> - There are register bit differences between the SoCs, and RZ/N1 has
>   additional registers currently unused by the driver.
> - On RZ/T2H, the switch is connected to GMAC0 whereas on RZ/N1 the
>   switch can be connected to GMAC2/HW-RTOS GMAC.
>=20
> To accommodate these differences, a new generic compatible string
> `renesas,rzt2h-miic` is introduced for both RZ/T2H and RZ/N2H variants.
>=20
> The DT schema is updated to validate these differences and ensure proper
> port and reset configurations per SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../bindings/net/pcs/renesas,rzn1-miic.yaml   | 171 +++++++++++++-----
>  include/dt-bindings/net/pcs-rzt2h-miic.h      |  23 +++
>  2 files changed, 148 insertions(+), 46 deletions(-)
>  create mode 100644 include/dt-bindings/net/pcs-rzt2h-miic.h
>=20
> diff --git a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.=
yaml b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
> index 2d33bbab7163..832a49877a29 100644
> --- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
> +++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
> @@ -4,13 +4,14 @@
>  $id: http://devicetree.org/schemas/net/pcs/renesas,rzn1-miic.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Renesas RZ/N1 MII converter
> +title: Renesas RZ/{N1, N2H, T2H} MII converter

Don't use regex here. RZ/N1, RZ/N2H and TZ/T2H....

> =20
>  maintainers:
>    - Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> =20
>  description: |
> -  This MII converter is present on the Renesas RZ/N1 SoC family. It is
> +  This MII converter is present on the Renesas RZ/{N1, N2H, T2H} SoC fam=
ilies. It is

Just list the soc families, so people can grep for it.

>    responsible to do MII passthrough or convert it to RMII/RGMII.
> =20
>  properties:
> @@ -21,10 +22,17 @@ properties:
>      const: 0
> =20
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a06g032-miic
> -      - const: renesas,rzn1-miic
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a06g032-miic
> +          - const: renesas,rzn1-miic
> +
> +      - items:
> +          - enum:
> +              - renesas,r9a09g077-miic # RZ/T2H
> +              - renesas,r9a09g087-miic # RZ/N2H
> +          - const: renesas,rzt2h-miic
> =20
>    reg:
>      maxItems: 1
> @@ -43,11 +51,20 @@ properties:
>        - const: rmii_ref
>        - const: hclk
> =20
> +  resets:
> +    items:
> +      - description: Converter register reset
> +      - description: Converter reset
> +
> +  reset-names:
> +    items:
> +      - const: rst
> +      - const: crst
> +
>    renesas,miic-switch-portin:
>      description: MII Switch PORTIN configuration. This value should use =
one of
>        the values defined in dt-bindings/net/pcs-rzn1-miic.h.
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    enum: [1, 2]

Why? Widest constraints should be here.

> =20
>    power-domains:
>      maxItems: 1
> @@ -60,11 +77,11 @@ patternProperties:
>      properties:
>        reg:
>          description: MII Converter port number.
> -        enum: [1, 2, 3, 4, 5]

Why?

> =20
>        renesas,miic-input:
>          description: Converter input port configuration. This value shou=
ld use
> -          one of the values defined in dt-bindings/net/pcs-rzn1-miic.h.
> +          one of the values defined in dt-bindings/net/pcs-rzn1-miic.h f=
or RZ/N1 SoC
> +          and include/dt-bindings/net/pcs-rzt2h-miic.h for RZ/{T2H, N2H}=
 SoCs.
>          $ref: /schemas/types.yaml#/definitions/uint32
> =20
>      required:
> @@ -73,47 +90,109 @@ patternProperties:
> =20
>      additionalProperties: false
> =20
> -    allOf:
> -      - if:
> -          properties:
> -            reg:
> -              const: 1
> -        then:
> -          properties:
> -            renesas,miic-input:
> -              const: 0
> -      - if:
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,rzn1-miic
> +    then:
> +      properties:
> +        renesas,miic-switch-portin:
> +          enum: [1, 2]
> +      patternProperties:
> +        "^mii-conv@[0-5]$":
>            properties:
>              reg:
> -              const: 2
> -        then:
> -          properties:
> -            renesas,miic-input:
> -              enum: [1, 11]
> -      - if:
> -          properties:
> -            reg:
> -              const: 3
> -        then:
> -          properties:
> -            renesas,miic-input:
> -              enum: [7, 10]
> -      - if:
> +              enum: [1, 2, 3, 4, 5]
> +            resets: false
> +            reset-names: false
> +          allOf:
> +            - if:
> +                properties:
> +                  reg:
> +                    const: 1
> +              then:
> +                properties:
> +                  renesas,miic-input:
> +                    const: 0
> +            - if:
> +                properties:
> +                  reg:
> +                    const: 2
> +              then:
> +                properties:
> +                  renesas,miic-input:
> +                    enum: [1, 11]
> +            - if:
> +                properties:
> +                  reg:
> +                    const: 3
> +              then:
> +                properties:
> +                  renesas,miic-input:
> +                    enum: [7, 10]
> +            - if:
> +                properties:
> +                  reg:
> +                    const: 4
> +              then:
> +                properties:
> +                  renesas,miic-input:
> +                    enum: [4, 6, 9, 13]
> +            - if:
> +                properties:
> +                  reg:
> +                    const: 5
> +              then:
> +                properties:
> +                  renesas,miic-input:
> +                    enum: [3, 5, 8, 12]
> +    else:
> +      properties:
> +        renesas,miic-switch-portin:
> +          const: 0
> +      required:
> +        - resets
> +        - reset-names
> +      patternProperties:
> +        "^mii-conv@[0-5]$":
>            properties:
>              reg:
> -              const: 4
> -        then:
> -          properties:
> -            renesas,miic-input:
> -              enum: [4, 6, 9, 13]
> -      - if:
> -          properties:
> -            reg:
> -              const: 5
> -        then:
> -          properties:
> -            renesas,miic-input:
> -              enum: [3, 5, 8, 12]
> +              enum: [0, 1, 2, 3]
> +          allOf:
> +            - if:
> +                properties:
> +                  reg:
> +                    const: 0
> +              then:
> +                properties:
> +                  renesas,miic-input:
> +                    enum: [0, 3, 6]
> +            - if:
> +                properties:
> +                  reg:
> +                    const: 1
> +              then:
> +                properties:
> +                  renesas,miic-input:
> +                    enum: [1, 4, 7]
> +            - if:
> +                properties:
> +                  reg:
> +                    const: 2
> +              then:
> +                properties:
> +                  renesas,miic-input:
> +                    enum: [2, 5, 8]
> +            - if:
> +                properties:
> +                  reg:
> +                    const: 3
> +              then:
> +                properties:
> +                  renesas,miic-input:
> +                    const: 1
> =20
>  required:
>    - '#address-cells'
> diff --git a/include/dt-bindings/net/pcs-rzt2h-miic.h b/include/dt-bindin=
gs/net/pcs-rzt2h-miic.h
> new file mode 100644
> index 000000000000..c1f35fc0f1cd
> --- /dev/null
> +++ b/include/dt-bindings/net/pcs-rzt2h-miic.h

Missing vendor prefix. Filename based on compatible, unless this is not
for Renesas?

> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2025 Renesas Electronics Corporation.
> + */

Best regards,
Krzysztof


