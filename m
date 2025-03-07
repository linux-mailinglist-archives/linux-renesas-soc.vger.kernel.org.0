Return-Path: <linux-renesas-soc+bounces-14158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFB0A573E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 22:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D590D3AC16D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 21:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68924257AF5;
	Fri,  7 Mar 2025 21:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aA14wcZM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F17240611;
	Fri,  7 Mar 2025 21:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383831; cv=none; b=HqYYAsAX5+7VIHiF6VSCqkIUHDV+CuvbUK7SUjeDJitopSBv71JweGYaRY2FuhiGfCZkjURCHEZDKuGfMCXKdeKe48/Dhk98089ImJko8CFowCZjhNSSqAzDWgxjBpVzlAv5DV8XVuZ+B6q42NuVOkZMpDkgh60bWCblos5RPBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383831; c=relaxed/simple;
	bh=ei7KxIb2sC6XawpE3OxNGmRRTY7xrpGWkiDH1HcKS0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TwnxNlTqYJYM5c4P+bv4YLkaOLq6cLV+l76xHef0Y4x1mgFUCMnGgR+4IYaPEcN2XGMMCPUtVemX6NNg7ZwytdXgs6NG6u7jDqDTLavXQI9FapA7zQKl1dllOOV5+v+6ec4wLhColGXmnEwvOEu1oA0qQjRkHpc/1ct8PGY8dMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aA14wcZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD52C4CED1;
	Fri,  7 Mar 2025 21:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741383830;
	bh=ei7KxIb2sC6XawpE3OxNGmRRTY7xrpGWkiDH1HcKS0k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aA14wcZMLqSOy1IX8iaMCXoD/EhuX+Vw2dgo2aBbS5Wlsa0lhIIRp4k/oJwyY6mlC
	 gOZ4/FiAGUyThXjPhVFJBWgZNg2X6J4YrLSYXMKFovhPNyQzwGippMSQUKeBDpK/84
	 m0Gp1V1qIKQCg5iT9nZZI4+1MRqomBKm8VKowD7ONt8VYPwAmstoCvakrRcgF2AjRE
	 Wm0K2oI/xj3JjWvRRlevvEAnqLWeDdTqaAcILTrop93+tyYsZ/cKdN8yfwMykml3Xp
	 i9k+T5DzMz+Q449ZMrTMOpzmhY+St3Z5Np7pBH2so3B7fxLfjCnjjWYZ0lymUz/Gv+
	 ULzX3vCqhcuVg==
Date: Fri, 7 Mar 2025 15:43:49 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org, paul.barker.ct@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/13] dt-bindings: clock: Add cpg for the Renesas
 RZ/T2H SoC
Message-ID: <20250307214349.GA655306-robh@kernel.org>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-3-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306152451.2356762-3-thierry.bultel.yh@bp.renesas.com>

On Thu, Mar 06, 2025 at 04:24:36PM +0100, Thierry Bultel wrote:
> Document RZ/T2H (a.k.a r9a09g077) cpg-mssr (Clock Pulse Generator) binding.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v3->v4:
>   - Handle maxItems and clocks names properly in schema. 
> ---
>  .../bindings/clock/renesas,cpg-mssr.yaml      | 56 +++++++++++++------
>  .../clock/renesas,r9a09g077-cpg-mssr.h        | 49 ++++++++++++++++
>  2 files changed, 89 insertions(+), 16 deletions(-)
>  create mode 100644 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> index 77ce3615c65a..acbb555a064e 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> @@ -52,9 +52,10 @@ properties:
>        - renesas,r8a779f0-cpg-mssr # R-Car S4-8
>        - renesas,r8a779g0-cpg-mssr # R-Car V4H
>        - renesas,r8a779h0-cpg-mssr # R-Car V4M
> +      - renesas,r9a09g077-cpg-mssr # RZ/T2H
>  
>    reg:
> -    maxItems: 1

Keep constraints at the top-level:

minItems: 1
maxItems: 2

> +    description: Registers base address

Don't need generic descriptions of common properties.

>  
>    clocks:
>      minItems: 1
> @@ -63,11 +64,6 @@ properties:
>    clock-names:
>      minItems: 1
>      maxItems: 2
> -    items:
> -      enum:
> -        - extal     # All
> -        - extalr    # Most R-Car Gen3 and RZ/G2
> -        - usb_extal # Most R-Car Gen2 and RZ/G1
>  
>    '#clock-cells':
>      description: |
> @@ -92,16 +88,6 @@ properties:
>        the datasheet.
>      const: 1
>  
> -if:
> -  not:
> -    properties:
> -      compatible:
> -        items:
> -          enum:
> -            - renesas,r7s9210-cpg-mssr
> -then:
> -  required:
> -    - '#reset-cells'
>  
>  required:
>    - compatible
> @@ -113,6 +99,44 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g077-cpg-mssr
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +          maxItems: 2

With the above, you only need minItems.

> +        clock-names:
> +          items:
> +            - const: extal
> +            - const: loco
> +    else:
> +      properties:
> +        reg:
> +          minItems: 1
> +          maxItems: 1

And only maxItems here.

> +        clock-names:
> +          items:
> +            enum:
> +              - extal     # All
> +              - extalr    # Most R-Car Gen3 and RZ/G2
> +              - usb_extal # Most R-Car Gen2 and RZ/G1
> +
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            items:
> +              enum:
> +                - renesas,r7s9210-cpg-mssr
> +    then:
> +      required:
> +        - '#reset-cells'
> +
>  examples:
>    - |
>      cpg: clock-controller@e6150000 {

