Return-Path: <linux-renesas-soc+bounces-17254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D22ABD9F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 15:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE9117A21F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 13:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFFE243378;
	Tue, 20 May 2025 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X0dJXIpk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82A622DA1A;
	Tue, 20 May 2025 13:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749137; cv=none; b=ZG+HgOBche/LC7rbHRtEHGS46cOwF6XHK6WpFXERdaAD8GG9ViGYXxoA56Ebg5us1j0DWvzMG4JDRIUwFIwd9tAgoPSlNzJbwHPp3SYaY3JQFbcDo4k56ooPMbCcJv06M+XyKCBAq/gtx8a6/RP6DX+kc5YbpAzTvH84iGCv9n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749137; c=relaxed/simple;
	bh=ZDjBBWFIQA5TZm7fBQOM+u77NmrDVlIPEV0NfNuXhVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvZB4kSmo7zXT5x/a0tt/NpkQMkjOcfczYbZxliJghvkkQ+U3ekuW/rJRRmbNfaSOt365bun96j59vs8mNoibYVUqXDsoBYQTzagMLC7Gq8WhNklfL2ZVd6pKODsvEyHCXT2kMCMyTSJRtBscGFPMIQtCq0weI12qb+jDQuAwMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X0dJXIpk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B09774C;
	Tue, 20 May 2025 15:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747749112;
	bh=ZDjBBWFIQA5TZm7fBQOM+u77NmrDVlIPEV0NfNuXhVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0dJXIpksjlZMPkvvk3a6hltmrXJXIaHgucfduWdCeBtOUPdv7HRJfdJCzfcC561y
	 fHgGsks5LQJfsve1YpejJhm/lc8hcPxXvVUNxWJKkO6UZnno8OJflJAiHbb8QUTzvh
	 3v+T+5s0jBmydcrScOAblH1sXeVTyvpMVKVMrR5A=
Date: Tue, 20 May 2025 15:52:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 01/12] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/V2H(P) SoC
Message-ID: <20250520135206.GA13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, May 12, 2025 at 07:23:19PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The DU block on the RZ/V2H(P) SoC is identical to the one found on the
> RZ/G2L SoC. However, it only supports the DSI interface, whereas the
> RZ/G2L supports both DSI and DPI interfaces.
> 
> Due to this difference, a SoC-specific compatible string
> 'renesas,r9a09g057-du' is added for the RZ/V2H(P) SoC.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v4->v5:
> - Added reviewed tag from Biju
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - Collected reviewed tag from Krzysztof
> 
> v1->v2:
> - Kept the sort order for schema validation
> - Added  `port@1: false` for RZ/V2H(P) SoC
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 95e3d5e74b87..1e32d14b6edb 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
> +          - renesas,r9a09g057-du # RZ/V2H(P)
>        - items:
>            - enum:
>                - renesas,r9a07g054-du    # RZ/V2L
> @@ -101,7 +102,12 @@ allOf:
>  
>            required:
>              - port@0
> -    else:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a07g044-du
> +    then:
>        properties:
>          ports:
>            properties:
> @@ -113,6 +119,21 @@ allOf:
>            required:
>              - port@0
>              - port@1
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g057-du
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1: false
> +
> +          required:
> +            - port@0
>  
>  examples:
>    # RZ/G2L DU

-- 
Regards,

Laurent Pinchart

