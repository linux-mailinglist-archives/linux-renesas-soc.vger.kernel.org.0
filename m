Return-Path: <linux-renesas-soc+bounces-11460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F99F4A2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 12:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5DA3169433
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 11:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E811EF0A3;
	Tue, 17 Dec 2024 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D7tOTCAe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B676B442F;
	Tue, 17 Dec 2024 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734435888; cv=none; b=XwOEMu0afsPFqDWcdCeZqjIZaotF/Vob98iHfHEwndrzoBL0unu1smMrzdNX8ZEc1153JF3M5HL7NIWcHOIexUw0hdHZEtfLgjmJTht0vvFgHa/pKQs/eA4suqIkec3Caf4i5p5Mn6va86XcAyJOB8U4Ap2XgQ4IVETiLe6egHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734435888; c=relaxed/simple;
	bh=frszXIwNC27Drg/aFfoE6hHQ9Kenq+Ofhsp9YXnj7LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rg5Io2LHGgW3kF7BsdDP0GTlzc4umDjm+ekjeKFwat3NoiPU0biGARpq13iMNtqz712qNib1NrSIJ6qI2NpUgJYe2L2e2xSGWBbBbfAeSU4KC4o992R3+Dk5+IJeEz2BXdhVGwjXSJjTr7YvnMVaahSVyYBL6Bua1u4TbcboSX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D7tOTCAe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E1674C7;
	Tue, 17 Dec 2024 12:44:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734435846;
	bh=frszXIwNC27Drg/aFfoE6hHQ9Kenq+Ofhsp9YXnj7LI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7tOTCAejLMebYWePjmpXLJZDVazu6g0wLrEuDl7Clqz58qugAlnKy0tGLDcLZWct
	 rm36700r4ETAKgDSYIA22caeSA7OFc3yPnh+xU2/+dCHpLQFaT+YxKHYaYsdgYCZXk
	 t6LZ2BSGA5gmmT/bXDiMKIUWTLBMgbIzr2N7NnXg=
Date: Tue, 17 Dec 2024 13:44:41 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
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
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v5 3/7] dt-bindings: display: renesas,du: Add missing
 constraints
Message-ID: <20241217114441.GC32392@pendragon.ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
 <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-rcar-gh-dsi-v5-3-e77421093c05@ideasonboard.com>

On Tue, Dec 17, 2024 at 07:31:37AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> The binding is missing maxItems for all renesas,cmms and renesas,vsps
> properties. As the amount of cmms or vsps is always a fixed amount, set
> the maxItems to match the minItems.
> 
> Also add the minItems and maxItems to the top level properties.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index c5b9e6812bce..ef4568118e94 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -77,6 +77,8 @@ properties:
>  
>    renesas,cmms:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        maxItems: 1
>      description:
> @@ -85,6 +87,8 @@ properties:
>  
>    renesas,vsps:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 4
>      items:
>        items:
>          - description: phandle to VSP instance that serves the DU channel
> @@ -489,9 +493,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 4
> +          maxItems: 4
>  
>          renesas,vsps:
>            minItems: 4
> +          maxItems: 4
>  
>        required:
>          - clock-names
> @@ -558,9 +564,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 3
> +          maxItems: 3
>  
>          renesas,vsps:
>            minItems: 3
> +          maxItems: 3
>  
>        required:
>          - clock-names
> @@ -627,9 +635,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 3
> +          maxItems: 3
>  
>          renesas,vsps:
>            minItems: 3
> +          maxItems: 3
>  
>        required:
>          - clock-names
> @@ -683,7 +693,7 @@ allOf:
>              - port@1
>  
>          renesas,vsps:
> -          minItems: 1
> +          maxItems: 1
>  
>        required:
>          - clock-names
> @@ -746,9 +756,11 @@ allOf:
>  
>          renesas,cmms:
>            minItems: 2
> +          maxItems: 2
>  
>          renesas,vsps:
>            minItems: 2
> +          maxItems: 2
>  
>        required:
>          - clock-names
> @@ -799,6 +811,7 @@ allOf:
>  
>          renesas,vsps:
>            minItems: 2
> +          maxItems: 2
>  
>        required:
>          - clock-names

-- 
Regards,

Laurent Pinchart

