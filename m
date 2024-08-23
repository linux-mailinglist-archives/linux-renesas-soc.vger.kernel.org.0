Return-Path: <linux-renesas-soc+bounces-8159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4D095CD73
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 15:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2FF0B233AD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 13:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DFA1865EB;
	Fri, 23 Aug 2024 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jms3t7Ow"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67231865E9;
	Fri, 23 Aug 2024 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724418643; cv=none; b=D4+eAH1Bjvc6WBDWGqiABgr5j//AMfbRQG46I5HAGRWCOZEIHqF7NBpdVBIT4WRoX6WstIX6DNfUM8TTTh1tUGAKyHuO5LO/HgR72tJ676zJHZLYz/N/2pbsRDCSDZgLxbPsTfmG1sypQEdHfW6RKQhgtCURRF0EfZ05tRAc7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724418643; c=relaxed/simple;
	bh=wLrkvRsuEKzrSQq1bOLy5ckfDECd41lrUlMr2L8Ili8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERkL0D8lKDUIzEE3B9ZHC27MCc3UOmnAqc4YOmcjuHArNh+cmnvD/lbhcUhXC5p8hOMNu5KrzMfPF1kPBpU6ZPL7rCKpBE6615+hJrhcohcTn/qOoDQbSdSAp2SarsNIxfTEpflwtrAf+PoG6SWjgFieMHpegft8kzQBLf37nW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Jms3t7Ow; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 88532129;
	Fri, 23 Aug 2024 15:09:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724418575;
	bh=wLrkvRsuEKzrSQq1bOLy5ckfDECd41lrUlMr2L8Ili8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jms3t7Ow1Mi0MrAhU8o24cpXwm84UwVj0hBROeKishsvsgYvQgxEiFvzkTVuKA7v8
	 cVpKA9fFr3DLHvECIk1fzmtRtDIEauGfgJR7RtLPAyedzCV2RyK8DYMpH1493goz/8
	 Sez6GmLztu/GGcUcDNLHMu7BcDm5eC61BepAe3BA=
Date: Fri, 23 Aug 2024 16:10:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: Re: [PATCH v4 1/4] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240823131036.GB26098@pendragon.ideasonboard.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
 <20240822162320.5084-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240822162320.5084-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Thu, Aug 22, 2024 at 05:23:14PM +0100, Biju Das wrote:
> Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> SoC, but has only DPI interface.
> 
> While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
> SoCs. Currently there is no user for the DPI interface and hence there
> won't be any ABI breakage for adding port@1 as required property for
> RZ/G2L and RZ/V2L SoCs.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v3->v4:
>  * Restored the ports property for RZ/G2UL and described port@0 for the
>    DPI interface.
>  * Restored tags from Geert and Conor as the change is trivial
>    (Replaced port 1->0 from v2).
> v2->v3:
>  * Replaced ports->port property for RZ/G2UL as it supports only DPI.
>    and retained ports property for RZ/{G2L,V2L} as it supports both DSI
>    and DPI output interface.
>  * Added missing blank line before example.
>  * Dropped tags from Conor and Geert as there are new changes.
> v1->v2:
>  * Updated commit description related to non ABI breakage.
>  * Added Ack from Conor.
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 32 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 08e5b9478051..95e3d5e74b87 100644
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
> +            port@0:
> +              description: DPI
> +
> +          required:
> +            - port@0
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
> +
>  examples:
>    # RZ/G2L DU
>    - |

-- 
Regards,

Laurent Pinchart

