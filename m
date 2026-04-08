Return-Path: <linux-renesas-soc+bounces-31003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6+uLE8RK1ml8DQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:32:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC013BC1BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 14:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57B463087120
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 12:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75D93B6C0C;
	Wed,  8 Apr 2026 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OnLaZMZ1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3F534EEF7;
	Wed,  8 Apr 2026 12:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775651081; cv=none; b=uk7Ks3ZomxhEialtTkZX363Xjev+2INhpSa6QSLE/Pa86/8W8A97M0A/1Eg15gTsIr16WaE5LkBKnt5R/gIcA1v/Tn7iwaGNqxXyCOeWUtQJBylo5zpC1ZmPrOtMGriIzABEuPJHCdPUCwkkKkIcI/hfxp13E0/Ra6b7nFNvsMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775651081; c=relaxed/simple;
	bh=SlTk9pYhw8gQ7IZR2fT/XadwHciBiREZfYXDdO1UhJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E/L9oVd0Zyx/3zo2rhxcVbyD0zAMnvsO3mDgtuOgtr1Gk2EwNkNBWK6uRr8KoXktorbRaw4IXIYAHULDmSTj4lDaZwmgHc+sniURyCHK+yAbgLaJ+ZRDQONfVnNGkHTq0Fl603wYKC/eaGyetTcNefb/RnZjis8rhwPxlU41sfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OnLaZMZ1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 1C2701121;
	Wed,  8 Apr 2026 14:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775650990;
	bh=SlTk9pYhw8gQ7IZR2fT/XadwHciBiREZfYXDdO1UhJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnLaZMZ1pmD2g1tGdeeljmulCswG+u122ucyDAAGFxR8/P5USrhgyhM17hCTgE62r
	 1XAZONBqEi2kCLQ0lXSfe9Gh0pXCGbuxkvWXcyDOH68LgilFNnB8MrKVs/cz5+R2FZ
	 36NXD8osRqUJOOVDxAQfart6OQOMQp/WBxmH9GEw=
Date: Wed, 8 Apr 2026 15:24:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 10/21] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <20260408122436.GH1928916@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	URIBL_MULTI_FAIL(0.00)[0.0.0.1:server fail,0.0.0.3:server fail,tor.lore.kernel.org:server fail,renesas.com:server fail,ideasonboard.com:server fail,killaraus.ideasonboard.com:server fail,0.0.0.2:server fail];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-31003-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,0.0.0.2:email,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid,0.0.0.0:email]
X-Rspamd-Queue-Id: CFC013BC1BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 12:36:55PM +0200, Tommaso Merciai wrote:
> The RZ/G3E SoC has 2 LCD controllers (LCDC), each containing a Frame
> Compression Processor (FCPVD), a Video Signal Processor (VSPD), and a
> Display Unit (DU).
> 
>  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> 
> Add a new SoC-specific compatible string 'renesas,r9a09g047-du'.
> 
> Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" to
> allow up to four output ports, and explicitly disable port@2 and port@3
> for existing SoCs that do not expose them.
> 
> Describe the four output ports of the RZ/G3E DU:
> 
>  - port@0: DSI (available on both LCDC instances)
>  - port@1: DPAD / parallel RGB (LCDC1 only)
>  - port@2: LVDS channel 0 (LCDC0 only)
>  - port@3: LVDS channel 1 (available on both LCDC instances)
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v5->v6:
>  - Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" and
>    explicitly disable port@2 and port@3 for existing SoCs that do not expose
>    them.
>  - Reworked ports numbering + improved/fixed ports descriptions in the
>    bindings documentation.
>  - Improved commit body.
> 
> v4->v5:
>  - Dropped renesas,id property and updated bindings
>    accordingly.
> 
> v2->v3:
>  - No changes.
> 
> v2->v3:
>  - No changes.
> 
> v1->v2:
>  - Use single compatible string instead of multiple compatible strings
>    for the two DU instances, leveraging a 'renesas,id' property to
>    differentiate between DU0 and DU1.
>  - Updated commit message accordingly.
> 
>  .../bindings/display/renesas,rzg2l-du.yaml    | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 5add3b832eab..32da0b5ec88c 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -20,6 +20,7 @@ properties:
>        - enum:
>            - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
> +          - renesas,r9a09g047-du # RZ/G3E
>            - renesas,r9a09g057-du # RZ/V2H(P)
>        - items:
>            - enum:
> @@ -61,7 +62,7 @@ properties:
>        model-dependent. Each port shall have a single endpoint.
>  
>      patternProperties:
> -      "^port@[0-1]$":
> +      "^port@[0-3]$":
>          $ref: /schemas/graph.yaml#/properties/port
>          unevaluatedProperties: false
>  
> @@ -103,6 +104,8 @@ allOf:
>              port@0:
>                description: DPI
>              port@1: false
> +            port@2: false
> +            port@3: false
>  
>            required:
>              - port@0
> @@ -119,6 +122,8 @@ allOf:
>                description: DSI
>              port@1:
>                description: DPI
> +            port@2: false
> +            port@3: false
>  
>            required:
>              - port@0
> @@ -135,9 +140,32 @@ allOf:
>              port@0:
>                description: DSI
>              port@1: false
> +            port@2: false
> +            port@3: false
>  
>            required:
>              - port@0
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-du
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1:
> +              description: DPAD
> +            port@2:
> +              description: LVDS, Channel 0
> +            port@3:
> +              description: LVDS, Channel 1
> +
> +          required:
> +            - port@0
> +            - port@3

Why are ports 1 and 2 not required ?

>  
>  examples:
>    # RZ/G2L DU

-- 
Regards,

Laurent Pinchart

