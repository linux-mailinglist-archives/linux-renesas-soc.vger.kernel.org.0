Return-Path: <linux-renesas-soc+bounces-17343-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C8AC0538
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 09:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF3D41BA4CCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 07:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19DE221DB3;
	Thu, 22 May 2025 07:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SctiR2lj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73842320F;
	Thu, 22 May 2025 07:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747897528; cv=none; b=sjkE8RmXzmy1Y7Y3KLEVCnsC2udVtQ7tPyVUGlXAipthd9d+CtMTjAY6aQjQJJRzNUhwpty/QhM8NgoHEaoO55mosN/lqpt54m6W7umrLRfp7u1vLvsPIIm9fbfqcxc2apDHwfauq15rNo86g7ciUXu5CIVQo6K6ucgUxGkECEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747897528; c=relaxed/simple;
	bh=VWZUBj/REVNh4kP8z0AREFQwTT+Je+Tioh8mPZS898s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siFpSuyHKJZVFh8pOSl6l8NnzkwZukXNnh/svgHMMtoxxr+vh64CS4iyVCG2shx/9Lioj38dq7u+3SW2k+1vsYhuxiUI5wT9viNTDKBz6oVdYyeDVyxdhnJ/b1Xqm0d5NYR2UB+BPnKU9tH085h0dS8pwktrhgPkWgV/47s8F9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SctiR2lj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69666C4CEE4;
	Thu, 22 May 2025 07:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747897528;
	bh=VWZUBj/REVNh4kP8z0AREFQwTT+Je+Tioh8mPZS898s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SctiR2ljnFggNEHBNwQZ7pwV6Czy+jXGZxP+6Xydr+nz70JMGdmQePJZjtmqqH65T
	 HUF8P/JVaHEpbK4WX0Q0IZgG9AiyK5KkjHRcpyL51FitfyyR859VSfvFQSIDLfuWgr
	 KloI3qBgqWwDgRN8TXyYPJySGa93Euc10v/itg4e7LXmXYzOX7F7VGfteCOWrQr6hg
	 8UN9NJHRGLNzOd0BEUC45bH1xuTdGPfUfQcu/hsIMAgoPEpPW2AEPjFWWTnfCGZWl1
	 FbGLl40TSxoXPqD7/LH/X5judNrKoQ0OF8mc7PoRiPi2w6gKGOkD6BRrPPhCuo7ndH
	 4ML4UiyN0unIA==
Date: Thu, 22 May 2025 09:05:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	geert+renesas@glider.be, magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com, 
	kees@kernel.org, gustavoars@kernel.org, biju.das.jz@bp.renesas.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-hardening@vger.kernel.org, john.madieu.xa@bp.renesas.com, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 09/12] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3S support
Message-ID: <20250522-interesting-alligator-of-youth-fd34af@kuoka>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
 <20250521140943.3830195-10-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250521140943.3830195-10-claudiu.beznea.uj@bp.renesas.com>

On Wed, May 21, 2025 at 05:09:40PM GMT, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas USB PHY hardware block receives an input signal from the system
> controller. This signal must be controlled during power-on, power-off, and
> system suspend/resume sequences as follows:
> - during power-on/resume, it must be de-asserted before enabling clocks and
>   modules
> - during power-off/suspend, it must be asserted after disabling clocks and
>   modules
> 
> Add the renesas,sysc-signals device tree property, which allows the
> reset-rzg2l-usbphy-ctrl driver to parse, map, and control the system
> controller signal at the appropriate time. Along with it add a new
> compatible for the RZ/G3S SoC.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v3:
> - none; this patch is new
> 
>  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 38 ++++++++++++++++---
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> index b0b20af15313..75134330f797 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> @@ -15,12 +15,15 @@ description:
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
> +

Drop blank line

> +      - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
>  
>    reg:
>      maxItems: 1
> @@ -48,6 +51,16 @@ properties:
>      $ref: /schemas/regulator/regulator.yaml#
>      unevaluatedProperties: false
>  
> +  renesas,sysc-signals:
> +    description: System controller phandle, specifying the register
> +      offset and bitmask associated with a specific system controller signal

Same comments.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: system controller phandle
> +          - description: register offset associated with a signal
> +          - description: register bitmask associated with a signal
> +
>  required:
>    - compatible
>    - reg
> @@ -57,6 +70,19 @@ required:
>    - '#reset-cells'
>    - regulator-vbus

Best regards,
Krzysztof


