Return-Path: <linux-renesas-soc+bounces-11237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6002F9ED034
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 16:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10179288272
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 15:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142DE1D934C;
	Wed, 11 Dec 2024 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbLbG1Cy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9461D6DBE;
	Wed, 11 Dec 2024 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931911; cv=none; b=AaIoygG8jecAcby8CV/HaQVgttyjIKvBYSaxH1L6E14CnJLQfchIPIKXritLygaXoFd6XCb1wgdirFNRwaLTUqe4JBQ4P06RMWjdxODqD0jqStMkdEJJ8Qxt1mLDQ1yV0qGI6KABYV5ehYOEYshQJhYe3b+HsRSqkEGSEbbJFyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931911; c=relaxed/simple;
	bh=MBbRNgdop2g+7oHTiSpbX1PwiZ7XpUad/UNENbU5KRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HfNcAJ11uIMnMODKQWAdESh9cL5/xwRslDaFxy//U6rfbboEG9o4V7FA5DftH8kdHEcHWOwguIZc1/j2NLLppKn3caxtJUS3GkMlnmFAYIBmr1PYrkpscCano+0s3XSzAtgteFZ8rxasqeLhceYqO2oXy/XJh79ZBZdEWVdajMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbLbG1Cy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E3BC4CED2;
	Wed, 11 Dec 2024 15:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931910;
	bh=MBbRNgdop2g+7oHTiSpbX1PwiZ7XpUad/UNENbU5KRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qbLbG1CyrO+FxeF77MAmWKG+jumCQK39mbiCtU98j4Xp5Yix84b1ubTCJFT1uxgkD
	 XMYWYtm0LdDwhVGDBSQRwBQZHiI45PBJF74eQEmFaxxD4p+/omD71kMJQGS1TqUSP9
	 BYx+yRr0O6OaHkIosWeNaGcrb33ywbtGhfz+8W73phHRWKx0fBp+z7+O6KqogteCkD
	 weAzsmoJqcerU1E7qKeRMA2msE6k6U47NLIKCoFzFbNj3tE3ndBe/hssCA83fFMKRF
	 DjH+sevrK8eKUuQv0LMddIfBtd27bESZGDpwX8wjaqBzDw9nRtcSMiZywMh//EsBvT
	 gjopTpCU8nSBw==
Date: Wed, 11 Dec 2024 09:45:08 -0600
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas,du: Add r8a779h0
Message-ID: <20241211154508.GA3075383-robh@kernel.org>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-4-d74c2166fa15@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-rcar-gh-dsi-v3-4-d74c2166fa15@ideasonboard.com>

On Fri, Dec 06, 2024 at 11:32:37AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Extend the Renesas DU display bindings to support the r8a779h0 V4M.
> 
> Note that we remove the requirement for two ports from the global part
> of the bindings, as each conditional part defines the number of required
> ports already. This came up with r8a779h0 as it's the first one that has
> only one port.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/display/renesas,du.yaml    | 52 ++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index c5b9e6812bce..7dec47aea052 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -41,6 +41,7 @@ properties:
>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
> +      - renesas,du-r8a779h0 # for R-Car V4M compatible DU
>  
>    reg:
>      maxItems: 1
> @@ -69,10 +70,6 @@ properties:
>          $ref: /schemas/graph.yaml#/properties/port
>          unevaluatedProperties: false
>  
> -    required:
> -      - port@0
> -      - port@1
> -
>      unevaluatedProperties: false
>  
>    renesas,cmms:
> @@ -807,6 +804,53 @@ allOf:
>          - reset-names
>          - renesas,vsps
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a779h0
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Functional clock
> +
> +        clock-names:
> +          items:
> +            - const: du.0
> +
> +        interrupts:
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI 0
> +            port@1: false
> +            port@2: false
> +            port@3: false
> +
> +          required:
> +            - port@0
> +
> +        renesas,vsps:
> +          minItems: 1

maxItems? The min is already 1.

Note maxItems is missing in all the other cases too. Since the top-level 
definition has no constraints, all the constraints under if/then schemas 
need both minItems and maxItems. (Unless there's no max).

> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.43.0
> 

