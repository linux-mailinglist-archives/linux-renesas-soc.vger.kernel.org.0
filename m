Return-Path: <linux-renesas-soc+bounces-21181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E52B40056
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 14:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCDF63AC2A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 12:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0BC2FCC16;
	Tue,  2 Sep 2025 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSVWNYDv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71892C11C9;
	Tue,  2 Sep 2025 12:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756815456; cv=none; b=aPz1/97cZd/ZvvbxLJCEOmdWwu4+wg7Ekv9dlR1w/HUZffZmcPH/x/qox6Zw1GiuiPXe0O/JareCtBlxaNwJ6frcMKR41gjTC/nLrUHqEJjevDtBrRoGF0dV6y58YL/OIRjrUsbOAWts8StjMK3QsKWxd8Reiqm5RB+1y0UhKPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756815456; c=relaxed/simple;
	bh=3/mypePnJRDUzhOvndfzVAOYSe0h2vW0Tvh9JFz0G0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSLvHDJBHHyozkHQobpCVk1z0piPrnQsk6uO+p/shuvrRb9SeYxb6N3p0aaiS4DGegTZzGfMK+uih/dfMMLZkpvZVyMk4Ri7ERBpIQKGfRoZelRNqNlKpizGfW8v0WfoA5q78QJ19Z6ND0gX3DTHJ24LnCJf7DLlzM8vHqAVLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSVWNYDv; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6188b5ae1e8so5559399a12.0;
        Tue, 02 Sep 2025 05:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756815453; x=1757420253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42U15/348cdGUsar34UpC/0xXX4VsKca7Fk0wm1luRs=;
        b=kSVWNYDvOVub/DhWgVqsu0F6bRSJuc8n2aniyhXAAhi3iVdiYMkfvftOFFhreN2taP
         yjOmt0IAQWOi5GLH3G6oyCy39c+QEuLMH7puAfJ1MnD6EaWqcl0843c+zinsBaRiYmiz
         zmSWG0t39q6GYBxK1vPE0+P8i7pSgBMe5jpqNw5Q+MElVPeW0sVVob4ZuI4DZFy9qLc6
         4EQGO5w01ZAKXJBuTlGs59MZODkTMnrmkHQjmdht7tHoTEus5n5+Wj26daBOsYBp/oGh
         b6ChZK0sj5RSpr/ZmpZXJFRWquhLW1CLhiMLZhBBEohu0m4bbS3Kaosn2n4Du6gG1FS6
         axKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756815453; x=1757420253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42U15/348cdGUsar34UpC/0xXX4VsKca7Fk0wm1luRs=;
        b=gKyZzPV4dC2KLRAIAPx/MbnpTHTPThScxlNDoQIZmcm3yK9oxLlKPtpLoJmNCHZOYP
         PXDj0yFHJmdrwGXipoOt/JU/HsljanCSeqVFEhmulgnrar7kzycoQtL/Ma/Kz0r3Wt/A
         R/lqIWD5BSMOXv4kMnuGSspN6uhQhohS+udDCFP9s4z/8ibhCh7e1qM/35ZYLqrNPxtM
         I24d4aSpXKmQ/LXRtDKMjv4lVHtNBUse2rnr4NiezXI50WvCM2NN4JMjzBKuZcVf/V6G
         AxL2Z2H88kVcvLf0l6cd+07kyMp8L/oixPlvCkkIpdVuSbEFZbfxZA7nD+1uxYLObMoO
         eHAg==
X-Forwarded-Encrypted: i=1; AJvYcCU+nP+t46J5fnam6X3RRbeZepRaBCmgcU6aIJk7rdS4M6AGt3S9X/+8zTduaFQUrv5py04Q/eeUUauwl51e@vger.kernel.org, AJvYcCVKZyiX3ll6n2l41v5+RGWnMA2mkC1oyGE7agcpek2js5LQkFhpqKJBUl7KOEZlwcNI0jzbUgb2/2Wm@vger.kernel.org, AJvYcCVivb2Ibq3AudN7iwVoORswlZ2Ouo7eCUJY6GYLIfr9rx9hKDcnHA2Mv0cyVJ0Dbv+zpA2d5DMHkVOP9+G6bRbWDMQ=@vger.kernel.org, AJvYcCXVW7GskPgP2T4fSBXkbj8JUG++fYENA7Z6ESDUjMWsrDP6X4tVP5zty0B4oD+X9CZLEPBC2YJr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmj4bYo5Bkk0XViWXy0ZPrMHBCP1UALkANARsF1qncrdrDglPr
	VyEE3hv1wlAlQl4C9AX+oglFn9A6OTqFqvkS6pv4GsDvOoJyS0tW4yqgJceIAyGpFGV2PbZ2EkI
	+j1jIVJXGeOBN4wIR4RJBQWD9C8bTxW8=
X-Gm-Gg: ASbGncv9K96IA7s12D9qFfcS0BpvBWoJo07iEwJKNuCNz0BKqybLMnWlE+0/cXLPKa9
	zHkNk2GnZa6QvGQr6cv74cfjLCoQ6HrCRgPv5O22seCEqIJHPSs7Z+B5r3VlK1TssI4BeiGajEp
	BdKgEpiCw7iMJDTooQbPsirEGwq7oOxhDXCgzuvnNfGSWUXatJ2hvKGFKWBo226F0M6+RJcZvvW
	cQ3Z3lejUUBUVj17iC5elvJJs0poqqGMIjG45mpqByybVV8jCs=
X-Google-Smtp-Source: AGHT+IEY6ifRLT0JiWdPcioO0Hkm95EYxod8iArKpPf75fvBrdryW7qlJWrp5KlqLLS4W+5vCXQxFZlsc8+QUu2qk1s=
X-Received: by 2002:a17:906:2692:b0:b04:1896:1236 with SMTP id
 a640c23a62f3a-b0418961257mr708211166b.22.1756815452790; Tue, 02 Sep 2025
 05:17:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901224327.3429099-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250902-enlightened-hidden-copperhead-4eefdf@kuoka>
In-Reply-To: <20250902-enlightened-hidden-copperhead-4eefdf@kuoka>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 13:17:06 +0100
X-Gm-Features: Ac12FXy9DVpjObuZ3-ixuDeS5Kbpg__4JszfuiG4LvJTm1hlGpANpZzv3qTq1To
Message-ID: <CA+V-a8sSiNQ6W-ggmL8PP_G1sFq170DS1LJLFJs_WW0RC+XVEw@mail.gmail.com>
Subject: Re: [PATCH net-next 01/10] dt-bindings: net: pcs: renesas,rzn1-miic:
 Document RZ/T2H and RZ/N2H SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Tue, Sep 2, 2025 at 9:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Mon, Sep 01, 2025 at 11:43:14PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Extend the RZN1 MIIC device-tree binding schema to cover the RZ/T2H
> > and RZ/N2H SoCs. These SoCs have a MIIC converter similar to RZ/N1, but
> > with some differences:
> >
> > - RZ/T2H has two reset lines; RZ/N1 has none.
> > - RZ/N1 supports 5 MIIC ports, whereas RZ/T2H supports 4 ports.
> > - On RZ/N1, MIIC ports can be mapped to various endpoints such as RTOS
> >   MAC ports, switch ports, EtherCAT ports, SERCOS ports, HSR ports, or
> >   fixed PHY ports (covering PHY input indices 0-13). On RZ/T2H, ports
> >   can connect to EtherCAT slave ports, Ethernet switch ports, or GMAC
> >   ports (mapped to PHY input indices 0-8).
> > - There are register bit differences between the SoCs, and RZ/N1 has
> >   additional registers currently unused by the driver.
> > - On RZ/T2H, the switch is connected to GMAC0 whereas on RZ/N1 the
> >   switch can be connected to GMAC2/HW-RTOS GMAC.
> >
> > To accommodate these differences, a new generic compatible string
> > `renesas,rzt2h-miic` is introduced for both RZ/T2H and RZ/N2H variants.
> >
> > The DT schema is updated to validate these differences and ensure prope=
r
> > port and reset configurations per SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../bindings/net/pcs/renesas,rzn1-miic.yaml   | 171 +++++++++++++-----
> >  include/dt-bindings/net/pcs-rzt2h-miic.h      |  23 +++
> >  2 files changed, 148 insertions(+), 46 deletions(-)
> >  create mode 100644 include/dt-bindings/net/pcs-rzt2h-miic.h
> >
> > diff --git a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-mii=
c.yaml b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
> > index 2d33bbab7163..832a49877a29 100644
> > --- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
> > +++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
> > @@ -4,13 +4,14 @@
> >  $id: http://devicetree.org/schemas/net/pcs/renesas,rzn1-miic.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Renesas RZ/N1 MII converter
> > +title: Renesas RZ/{N1, N2H, T2H} MII converter
>
> Don't use regex here. RZ/N1, RZ/N2H and TZ/T2H....
>
Ok, I will use it as above (s/TZ/T2H/RZ/T2H).

> >
> >  maintainers:
> >    - Cl=C3=A9ment L=C3=A9ger <clement.leger@bootlin.com>
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> >  description: |
> > -  This MII converter is present on the Renesas RZ/N1 SoC family. It is
> > +  This MII converter is present on the Renesas RZ/{N1, N2H, T2H} SoC f=
amilies. It is
>
> Just list the soc families, so people can grep for it.
>
Ok.

> >    responsible to do MII passthrough or convert it to RMII/RGMII.
> >
> >  properties:
> > @@ -21,10 +22,17 @@ properties:
> >      const: 0
> >
> >    compatible:
> > -    items:
> > -      - enum:
> > -          - renesas,r9a06g032-miic
> > -      - const: renesas,rzn1-miic
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a06g032-miic
> > +          - const: renesas,rzn1-miic
> > +
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a09g077-miic # RZ/T2H
> > +              - renesas,r9a09g087-miic # RZ/N2H
> > +          - const: renesas,rzt2h-miic
> >
> >    reg:
> >      maxItems: 1
> > @@ -43,11 +51,20 @@ properties:
> >        - const: rmii_ref
> >        - const: hclk
> >
> > +  resets:
> > +    items:
> > +      - description: Converter register reset
> > +      - description: Converter reset
> > +
> > +  reset-names:
> > +    items:
> > +      - const: rst
> > +      - const: crst
> > +
> >    renesas,miic-switch-portin:
> >      description: MII Switch PORTIN configuration. This value should us=
e one of
> >        the values defined in dt-bindings/net/pcs-rzn1-miic.h.
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > -    enum: [1, 2]
>
> Why? Widest constraints should be here.
>
Ok, I will keep this as is and just adjust for RZ/T2H SoC.

> >
> >    power-domains:
> >      maxItems: 1
> > @@ -60,11 +77,11 @@ patternProperties:
> >      properties:
> >        reg:
> >          description: MII Converter port number.
> > -        enum: [1, 2, 3, 4, 5]
>
> Why?
>
If I keep this here and just adjust the below for RZ/T2H case I do get erro=
rs:

reg:
  enum: [0, 1, 2, 3]


arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: ethss@80110000
(renesas,r9a09g077-miic): mii-conv@0:reg:0:0: 0 is not one of [1, 2,
3, 4, 5]
    from schema $id:
http://devicetree.org/schemas/net/pcs/renesas,rzn1-miic.yaml#

Any pointers on how to handle this case?

> >
> >        renesas,miic-input:
> >          description: Converter input port configuration. This value sh=
ould use
> > -          one of the values defined in dt-bindings/net/pcs-rzn1-miic.h=
.
> > +          one of the values defined in dt-bindings/net/pcs-rzn1-miic.h=
 for RZ/N1 SoC
> > +          and include/dt-bindings/net/pcs-rzt2h-miic.h for RZ/{T2H, N2=
H} SoCs.
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >
> >      required:
> > @@ -73,47 +90,109 @@ patternProperties:
> >
> >      additionalProperties: false
> >
> > -    allOf:
> > -      - if:
> > -          properties:
> > -            reg:
> > -              const: 1
> > -        then:
> > -          properties:
> > -            renesas,miic-input:
> > -              const: 0
> > -      - if:
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,rzn1-miic
> > +    then:
> > +      properties:
> > +        renesas,miic-switch-portin:
> > +          enum: [1, 2]
> > +      patternProperties:
> > +        "^mii-conv@[0-5]$":
> >            properties:
> >              reg:
> > -              const: 2
> > -        then:
> > -          properties:
> > -            renesas,miic-input:
> > -              enum: [1, 11]
> > -      - if:
> > -          properties:
> > -            reg:
> > -              const: 3
> > -        then:
> > -          properties:
> > -            renesas,miic-input:
> > -              enum: [7, 10]
> > -      - if:
> > +              enum: [1, 2, 3, 4, 5]
> > +            resets: false
> > +            reset-names: false
> > +          allOf:
> > +            - if:
> > +                properties:
> > +                  reg:
> > +                    const: 1
> > +              then:
> > +                properties:
> > +                  renesas,miic-input:
> > +                    const: 0
> > +            - if:
> > +                properties:
> > +                  reg:
> > +                    const: 2
> > +              then:
> > +                properties:
> > +                  renesas,miic-input:
> > +                    enum: [1, 11]
> > +            - if:
> > +                properties:
> > +                  reg:
> > +                    const: 3
> > +              then:
> > +                properties:
> > +                  renesas,miic-input:
> > +                    enum: [7, 10]
> > +            - if:
> > +                properties:
> > +                  reg:
> > +                    const: 4
> > +              then:
> > +                properties:
> > +                  renesas,miic-input:
> > +                    enum: [4, 6, 9, 13]
> > +            - if:
> > +                properties:
> > +                  reg:
> > +                    const: 5
> > +              then:
> > +                properties:
> > +                  renesas,miic-input:
> > +                    enum: [3, 5, 8, 12]
> > +    else:
> > +      properties:
> > +        renesas,miic-switch-portin:
> > +          const: 0
> > +      required:
> > +        - resets
> > +        - reset-names
> > +      patternProperties:
> > +        "^mii-conv@[0-5]$":
> >            properties:
> >              reg:
> > -              const: 4
> > -        then:
> > -          properties:
> > -            renesas,miic-input:
> > -              enum: [4, 6, 9, 13]
> > -      - if:
> > -          properties:
> > -            reg:
> > -              const: 5
> > -        then:
> > -          properties:
> > -            renesas,miic-input:
> > -              enum: [3, 5, 8, 12]
> > +              enum: [0, 1, 2, 3]
> > +          allOf:
> > +            - if:
> > +                properties:
> > +                  reg:
> > +                    const: 0
> > +              then:
> > +                properties:
> > +                  renesas,miic-input:
> > +                    enum: [0, 3, 6]
> > +            - if:
> > +                properties:
> > +                  reg:
> > +                    const: 1
> > +              then:
> > +                properties:
> > +                  renesas,miic-input:
> > +                    enum: [1, 4, 7]
> > +            - if:
> > +                properties:
> > +                  reg:
> > +                    const: 2
> > +              then:
> > +                properties:
> > +                  renesas,miic-input:
> > +                    enum: [2, 5, 8]
> > +            - if:
> > +                properties:
> > +                  reg:
> > +                    const: 3
> > +              then:
> > +                properties:
> > +                  renesas,miic-input:
> > +                    const: 1
> >
> >  required:
> >    - '#address-cells'
> > diff --git a/include/dt-bindings/net/pcs-rzt2h-miic.h b/include/dt-bind=
ings/net/pcs-rzt2h-miic.h
> > new file mode 100644
> > index 000000000000..c1f35fc0f1cd
> > --- /dev/null
> > +++ b/include/dt-bindings/net/pcs-rzt2h-miic.h
>
> Missing vendor prefix. Filename based on compatible, unless this is not
> for Renesas?
>
Agreed, I missed that I will add the vendor prefix and name it to
`renesas,r9a09g077-pcs-miic.h`.

Cheers,
Prabhakar

