Return-Path: <linux-renesas-soc+bounces-20476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E810DB25767
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Aug 2025 01:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B48D1C8227C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 23:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786E32FC864;
	Wed, 13 Aug 2025 23:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tm5ut3GE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499F72FB96F;
	Wed, 13 Aug 2025 23:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755127262; cv=none; b=lvn6xUPzljhOnXktN7NKX5i9Vq6NboCZTytOayk1wBieDU/YhBLqwf7QZD8/xpzARKgCWS6GbAVD469yadhvo/ngtMd42pjP0RkowzaUj6HlW6MpEakAm08DDBGsvrTuG7ARQ5QZGLz5ZKveKJBvC2y4YEFC4Ro6pOUxb/CEJas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755127262; c=relaxed/simple;
	bh=7QHaI1fcoxBUlAvp1V08Z9TBDjmmxs2AxZfKfYjFpL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iu+yla3JCRC8OlcS1CFSKSikJzjIVf0NGooh6tXGH1lk9hoAX7pbDYHtrbuPFCa/hG55xBUXQvirDzMo/DtMGlClobBpNpe0UcUnj9MvI/gAXmDeyhs/0ljdake/OqD1wzKx7A44O9W9ATba1gKwTKTkZKtLpZQuvex3klM8ZlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tm5ut3GE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F92C4CEEB;
	Wed, 13 Aug 2025 23:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755127261;
	bh=7QHaI1fcoxBUlAvp1V08Z9TBDjmmxs2AxZfKfYjFpL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tm5ut3GEOG1mFe2/aGoyOYmwODnxtNuPOch6sbjlPY7ccBvevVWPqB1pxoClOAZtV
	 zU/jCBmD3LCfpfAIfOwZwacdBvB8lJeLm/Tel0PWiK3f/8ly9t69Uqh8JIM7Aq6MEC
	 /oI9ogGtua3itoEk1odrFe65POEROXSBKqfOgry85wLdsvehMp/+KhnJZah3xDWd8W
	 ncGd6oT5ppLIJ0wH2vkLVb3lXNHad23PKKUL5HPzzOSnjVy5GQzOkY71taiyNENVnc
	 CJXOTTFQ7W65780n0gSUE8yro8QFBts62NefoWTwQ/Gvu9NoZaBL9ZWJHLXmCOR+AF
	 MwUuF+bma0+7Q==
Date: Wed, 13 Aug 2025 18:21:00 -0500
From: Rob Herring <robh@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, p.zabel@pengutronix.de,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com, biju.das.jz@bp.renesas.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v4 4/8] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3S support
Message-ID: <20250813232100.GA950521-robh@kernel.org>
References: <20250808061806.2729274-1-claudiu.beznea.uj@bp.renesas.com>
 <20250808061806.2729274-5-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250808061806.2729274-5-claudiu.beznea.uj@bp.renesas.com>

On Fri, Aug 08, 2025 at 09:18:02AM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas USB PHY hardware block needs to have the PWRRDY bit in the
> system controller set before applying any other settings. The PWRRDY bit
> must be controlled during power-on, power-off, and system suspend/resume
> sequences as follows:
> - during power-on/resume, it must be set to zero before enabling clocks and
>   modules
> - during power-off/suspend, it must be set to one after disabling clocks
>   and modules
> 
> Add the renesas,sysc-pwrrdy device tree property, which allows the
> reset-rzg2l-usbphy-ctrl driver to parse, map, and control the system
> controller PWRRDY bit at the appropriate time. Along with it add a new
> compatible for the RZ/G3S SoC.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v4:
> - dropped blank line from compatible section
> - s/renesas,sysc-signals/renesas,sysc-pwrrdy/g
> - dropped description from renesas,sysc-pwrrdy
> - updated description of renesas,sysc-pwrrdy items
> - updated patch description
> 
> Changes in v3:
> - none; this patch is new
> 
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 40 ++++++++++++++++---
>  1 file changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> index b0b20af15313..c1d5f3228aa9 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> @@ -15,12 +15,14 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
> -          - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
> -          - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
> -      - const: renesas,rzg2l-usbphy-ctrl
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
> +              - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
> +              - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
> +          - const: renesas,rzg2l-usbphy-ctrl
> +      - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
>  
>    reg:
>      maxItems: 1
> @@ -48,6 +50,19 @@ properties:
>      $ref: /schemas/regulator/regulator.yaml#
>      unevaluatedProperties: false
>  
> +  renesas,sysc-pwrrdy:
> +    description: The system controller PWRRDY indicates to the USB PHY if the
> +                 power supply is ready. PWRRDY needs to be set during power-on
> +                 before applying any other settings. It also needs to
> +                 be set before powering off the USB.

Where did this odd formatting come from? If copied from somewhere else, 
patches reformatting them welcome.

    description:
      The system controller PWRRDY indicates to the USB PHY if the power 
      supply is ready. PWRRDY needs to be set during power-on before applying 
      any other settings. It also needs to be set before powering off the USB.


> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: System controller phandle required by USB PHY CTRL
> +                         driver to set PWRRDY

Indent by 2 more than 'description'

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

> +          - description: Register offset associated with PWRRDY
> +          - description: Register bitmask associated with PWRRDY
> +
>  required:
>    - compatible
>    - reg
> @@ -57,6 +72,19 @@ required:
>    - '#reset-cells'
>    - regulator-vbus
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-usbphy-ctrl
> +    then:
> +      required:
> +        - renesas,sysc-pwrrdy
> +    else:
> +      properties:
> +        renesas,sysc-pwrrdy: false
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.43.0
> 

