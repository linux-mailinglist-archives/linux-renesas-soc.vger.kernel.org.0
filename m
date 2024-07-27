Return-Path: <linux-renesas-soc+bounces-7572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD65693DCC2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Jul 2024 02:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 668C71F2323B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 27 Jul 2024 00:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD3415C3;
	Sat, 27 Jul 2024 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fcK7DcCv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CEE197;
	Sat, 27 Jul 2024 00:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722041420; cv=none; b=Q2dOU1eNq0Hr9xpOXwt91EX8k6CXy5LMcVIA7MaEK5yPT0RJK8Ro00swt6i2fxwS1VXMbhb0dbyEdnoktBBMO9+oEj/sPhNnTY4xxj327OdwYfhQGZ6Yq9P5NWGubyMlRKZxEp5OrKJDjBX497VCWLao3kcrWJTfntw/fF/P49g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722041420; c=relaxed/simple;
	bh=FMPvc1SZyn/90phKYCnQE41g0GmtXOgYC7qpx+Iema8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwqrcgzEo1l1aAt1kEl/OB3ece4S+46VlSTzyQNDH2XmJXP+VADOdwc0kO/GZ6Jh4DgdetOa2yaD/JhRPsh2rpCULPhQWV07eGhwvbet+GloaU/sG4fG2ksgEYUjr9qspwFPt78me+RBcb918evzHeUw9yQpSGyV6215V/ya4a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fcK7DcCv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADC54720;
	Sat, 27 Jul 2024 02:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722041372;
	bh=FMPvc1SZyn/90phKYCnQE41g0GmtXOgYC7qpx+Iema8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcK7DcCvl0O+twoZb5CN8BBIkni4ls6QM8+qFMmk75Mq3yd9mNAQ5hga5CCyAIFb5
	 /WXaqEVn5hkk+VRKmJo9Qx1EC3XakTB2xVApuEogltnL/SLns9reAQJGaRaTWx/r+o
	 koxdXPaErqkyP0LD8n+UrmD4pLA7REygDMpAT8Sg=
Date: Sat, 27 Jul 2024 03:49:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240727004958.GF300@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709135152.185042-4-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jul 09, 2024 at 02:51:41PM +0100, Biju Das wrote:
> Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> SoC, but has only DPI interface.
> 
> While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
> SoCs. Currently there is no user for the DPI interface and hence there
> won't be any ABI breakage for adding port@1 as required property for
> RZ/G2L and RZ/V2L SoCs.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v1->v2:
>  * Updated commit description related to non ABI breakage.
>  * Added Ack from Conor.
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 32 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
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
>  
> -    required:
> -      - port@0
> -
>      unevaluatedProperties: false
>  
>    renesas,vsps:
> @@ -88,6 +86,34 @@ required:
>  
>  additionalProperties: false
>  
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

Why do you use port@1 for the DPI output here, and not port@0 ?

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

You're missing a blank line here.

>  examples:
>    # RZ/G2L DU
>    - |

-- 
Regards,

Laurent Pinchart

