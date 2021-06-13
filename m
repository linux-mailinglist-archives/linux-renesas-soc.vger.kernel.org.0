Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810983A55F1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 13 Jun 2021 03:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbhFMBPw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Jun 2021 21:15:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38506 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhFMBPw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Jun 2021 21:15:52 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE2EE436;
        Sun, 13 Jun 2021 03:13:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623546830;
        bh=E4Gc/QsUaHVbAbV+RVx7BikI//M8UMAmG7NKfGiSVII=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iacO8BE2s7wefwqrLKy6Cg31XiRAO/rm4eGvTcvQujm1aQyPekiyUWNg9JkwQjy0N
         L+EEvsb0eOPl7Q+6H70VCfEm6ry38Jb75AilAhit/ef2SBEmm/Ks3x1l2fXlYTqxCH
         1lI0LBLIWEuUEQ8gRFgslM07n2VLIOagSqNYLEmE=
Date:   Sun, 13 Jun 2021 04:13:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/14] dt-bindings: arm: renesas: Document R-Car H3e-2G
 and M3e-2G SoCs and boards
Message-ID: <YMVbupt4pqdl2FOc@pendragon.ideasonboard.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <f79841c1881f8b9a2c10fadb3d3ad6cb5fccc6a5.1623315732.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f79841c1881f8b9a2c10fadb3d3ad6cb5fccc6a5.1623315732.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Jun 10, 2021 at 11:37:14AM +0200, Geert Uytterhoeven wrote:
> Document the compatible values for the R-Car H3e-2G (R8A779M1) and
> M3e-2G (R8A779M3) SoCs.  These are different gradings of the R-Car H3
> ES3.0 (R8A77951) and M3-W+ (R8A77961) SoCs.
> 
> All R-Car Gen3e on-SoC devices are identical to the devices on the
> corresponding R-Car Gen3 SoCs, and thus just use the compatible values
> for the latter.  The root compatible properties do gain an additional
> value, to sort out integration issues if they ever arise.
> 
> Document the use of these SoCs on the Salvator-XS and ULCB (with and
> without Kingfisher) development boards.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(Copying a comment from another e-mail)

I however wonder if we haven't messed up the board compatible strings
somehow (unrelated to this patch). Aren't compatible strings supposed to
be ordered from most specific to most generic, with a more specific
compatible string being a strict subset of a more generic string ?
Looking at, for example,

        compatible = "renesas,salvator-xs", "renesas,r8a779m1", "renesas,r8a7795";

the rule is upheld by renesas,r8a779m1 being a subset of the more
generic renesas,r8a7795, but that's not the case for
renesas,salvator-xs.

> ---
>  .../devicetree/bindings/arm/renesas.yaml      | 50 +++++++++++++++----
>  1 file changed, 39 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index 5fd0696a9f91f383..a01dd064bf16632a 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -238,17 +238,29 @@ properties:
>            - const: renesas,r8a77961
>  
>        - description: Kingfisher (SBEV-RCAR-KF-M03)
> -        items:
> -          - const: shimafuji,kingfisher
> -          - enum:
> -              - renesas,h3ulcb
> -              - renesas,m3ulcb
> -              - renesas,m3nulcb
> -          - enum:
> -              - renesas,r8a7795
> -              - renesas,r8a7796
> -              - renesas,r8a77961
> -              - renesas,r8a77965
> +        oneOf:
> +          - items:
> +              - const: shimafuji,kingfisher
> +              - enum:
> +                  - renesas,h3ulcb
> +                  - renesas,m3ulcb
> +                  - renesas,m3nulcb
> +              - enum:
> +                  - renesas,r8a7795
> +                  - renesas,r8a7796
> +                  - renesas,r8a77961
> +                  - renesas,r8a77965
> +          - items:
> +              - const: shimafuji,kingfisher
> +              - enum:
> +                  - renesas,h3ulcb
> +                  - renesas,m3ulcb
> +              - enum:
> +                  - renesas,r8a779m1
> +                  - renesas,r8a779m3
> +              - enum:
> +                  - renesas,r8a7795
> +                  - renesas,r8a77961
>  
>        - description: R-Car M3-N (R8A77965)
>          items:
> @@ -296,6 +308,22 @@ properties:
>            - const: renesas,falcon-cpu
>            - const: renesas,r8a779a0
>  
> +      - description: R-Car H3e-2G (R8A779M1)
> +        items:
> +          - enum:
> +              - renesas,h3ulcb      # H3ULCB (R-Car Starter Kit Premier)
> +              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
> +          - const: renesas,r8a779m1
> +          - const: renesas,r8a7795
> +
> +      - description: R-Car M3e-2G (R8A779M3)
> +        items:
> +          - enum:
> +              - renesas,m3ulcb      # M3ULCB (R-Car Starter Kit Pro)
> +              - renesas,salvator-xs # Salvator-XS (Salvator-X 2nd version)
> +          - const: renesas,r8a779m3
> +          - const: renesas,r8a77961
> +
>        - description: RZ/N1D (R9A06G032)
>          items:
>            - enum:

-- 
Regards,

Laurent Pinchart
