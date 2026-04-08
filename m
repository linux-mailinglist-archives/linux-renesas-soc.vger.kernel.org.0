Return-Path: <linux-renesas-soc+bounces-31025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKmeCbJt1mkQFQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:01:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0593BDEF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50F633008D20
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 15:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E79B3D47DE;
	Wed,  8 Apr 2026 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HNV7wQvr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D145F3AF65D;
	Wed,  8 Apr 2026 15:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775660458; cv=none; b=VoSOoYEYHfQ9jrT3lkOPor6L3IlRCcGTK5iRbdn2nMzoDlJKhT2LS7IuQZdu2Xrm7h+6O0MS4Vxv95gCSMzpPKeTT8BSUYarMnhVSf5858ANw4VWrXv4cGxul+Hi6uxfMuaaOKAlhHo6PILky+b9m6MitdeA2RqmvV3FKrXE+9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775660458; c=relaxed/simple;
	bh=1IOSoDmMWVezGUMwb6ZhSU426luQ7ncqebk5VgNQILY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFU8/kEM0spvORMixYuFz9K7TxlrXjxoHiaOgNsPsncSLH89o27sZDNwekziz8FB2lpM+0kBVFnl5LYujMIxfZKcVS55QN585vxLE/t2tzNh9yfSzVN5vMdb8wSRqz2qmY4Yl51XnhtO6L/NqAr59F1wVhbvcQIiRAH0+wEiAHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HNV7wQvr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 603A2802;
	Wed,  8 Apr 2026 16:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775660366;
	bh=1IOSoDmMWVezGUMwb6ZhSU426luQ7ncqebk5VgNQILY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HNV7wQvrkDQ8f1l1uCRZTwe9d4Z8Lr1W8ayqEhU6Y9yxLzYUTpfI6m5ayDDMRB1qG
	 y6c8t0aITwVptvNYJUhnVgoE2+rum08Lto45sZmBBsN5Qcu0VzXR5O0m75YnPG9DGa
	 47/1Rs2oqiwh1KzijjNp4uDW615zggyYWTFl/y8M=
Date: Wed, 8 Apr 2026 18:00:53 +0300
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
Message-ID: <20260408150053.GC1965119@killaraus.ideasonboard.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <8f814f22ff62dcde6153260e2c8c29a5415c9a89.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
 <20260408122436.GH1928916@killaraus.ideasonboard.com>
 <dafdbdcf-98db-473c-8122-296af1922e6c@bp.renesas.com>
 <20260408141638.GA1965119@killaraus.ideasonboard.com>
 <87a18664-d19e-4434-8f92-1c7ce4f3a131@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a18664-d19e-4434-8f92-1c7ce4f3a131@bp.renesas.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31025-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.3:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,0.0.0.0:email,0.0.0.1:email,killaraus.ideasonboard.com:mid,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA0593BDEF1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 04:44:48PM +0200, Tommaso Merciai wrote:
> On 4/8/26 16:16, Laurent Pinchart wrote:
> > On Wed, Apr 08, 2026 at 04:02:14PM +0200, Tommaso Merciai wrote:
> >> On 4/8/26 14:24, Laurent Pinchart wrote:
> >>> On Wed, Apr 08, 2026 at 12:36:55PM +0200, Tommaso Merciai wrote:
> >>>> The RZ/G3E SoC has 2 LCD controllers (LCDC), each containing a Frame
> >>>> Compression Processor (FCPVD), a Video Signal Processor (VSPD), and a
> >>>> Display Unit (DU).
> >>>>
> >>>>    - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> >>>>    - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> >>>>
> >>>> Add a new SoC-specific compatible string 'renesas,r9a09g047-du'.
> >>>>
> >>>> Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" to
> >>>> allow up to four output ports, and explicitly disable port@2 and port@3
> >>>> for existing SoCs that do not expose them.
> >>>>
> >>>> Describe the four output ports of the RZ/G3E DU:
> >>>>
> >>>>    - port@0: DSI (available on both LCDC instances)
> >>>>    - port@1: DPAD / parallel RGB (LCDC1 only)
> >>>>    - port@2: LVDS channel 0 (LCDC0 only)
> >>>>    - port@3: LVDS channel 1 (available on both LCDC instances)
> >>>>
> >>>> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >>>> ---
> >>>> v5->v6:
> >>>>    - Extend patternProperties from "^port@[0-1]$" to "^port@[0-3]$" and
> >>>>      explicitly disable port@2 and port@3 for existing SoCs that do not expose
> >>>>      them.
> >>>>    - Reworked ports numbering + improved/fixed ports descriptions in the
> >>>>      bindings documentation.
> >>>>    - Improved commit body.
> >>>>
> >>>> v4->v5:
> >>>>    - Dropped renesas,id property and updated bindings
> >>>>      accordingly.
> >>>>
> >>>> v2->v3:
> >>>>    - No changes.
> >>>>
> >>>> v2->v3:
> >>>>    - No changes.
> >>>>
> >>>> v1->v2:
> >>>>    - Use single compatible string instead of multiple compatible strings
> >>>>      for the two DU instances, leveraging a 'renesas,id' property to
> >>>>      differentiate between DU0 and DU1.
> >>>>    - Updated commit message accordingly.
> >>>>
> >>>>    .../bindings/display/renesas,rzg2l-du.yaml    | 30 ++++++++++++++++++-
> >>>>    1 file changed, 29 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> >>>> index 5add3b832eab..32da0b5ec88c 100644
> >>>> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> >>>> @@ -20,6 +20,7 @@ properties:
> >>>>          - enum:
> >>>>              - renesas,r9a07g043u-du # RZ/G2UL
> >>>>              - renesas,r9a07g044-du # RZ/G2{L,LC}
> >>>> +          - renesas,r9a09g047-du # RZ/G3E
> >>>>              - renesas,r9a09g057-du # RZ/V2H(P)
> >>>>          - items:
> >>>>              - enum:
> >>>> @@ -61,7 +62,7 @@ properties:
> >>>>          model-dependent. Each port shall have a single endpoint.
> >>>>    
> >>>>        patternProperties:
> >>>> -      "^port@[0-1]$":
> >>>> +      "^port@[0-3]$":
> >>>>            $ref: /schemas/graph.yaml#/properties/port
> >>>>            unevaluatedProperties: false
> >>>>    
> >>>> @@ -103,6 +104,8 @@ allOf:
> >>>>                port@0:
> >>>>                  description: DPI
> >>>>                port@1: false
> >>>> +            port@2: false
> >>>> +            port@3: false
> >>>>    
> >>>>              required:
> >>>>                - port@0
> >>>> @@ -119,6 +122,8 @@ allOf:
> >>>>                  description: DSI
> >>>>                port@1:
> >>>>                  description: DPI
> >>>> +            port@2: false
> >>>> +            port@3: false
> >>>>    
> >>>>              required:
> >>>>                - port@0
> >>>> @@ -135,9 +140,32 @@ allOf:
> >>>>                port@0:
> >>>>                  description: DSI
> >>>>                port@1: false
> >>>> +            port@2: false
> >>>> +            port@3: false
> >>>>    
> >>>>              required:
> >>>>                - port@0
> >>>> +  - if:
> >>>> +      properties:
> >>>> +        compatible:
> >>>> +          contains:
> >>>> +            const: renesas,r9a09g047-du
> >>>> +    then:
> >>>> +      properties:
> >>>> +        ports:
> >>>> +          properties:
> >>>> +            port@0:
> >>>> +              description: DSI
> >>>> +            port@1:
> >>>> +              description: DPAD
> >>>> +            port@2:
> >>>> +              description: LVDS, Channel 0
> >>>> +            port@3:
> >>>> +              description: LVDS, Channel 1
> >>>> +
> >>>> +          required:
> >>>> +            - port@0
> >>>> +            - port@3
> >>>
> >>> Why are ports 1 and 2 not required ?
> >>
> >> About this we had a similar discussion on v5[0]
> >> We are using the same compatible and:
> >>
> >> - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> >> |
> >> --> then has:
> >> 	port@0
> >> 	port@2
> >> 	port@3
> >> 	
> >>
> >>    - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> >> |
> >> --> then has:
> >> 	port@0
> >> 	port@1
> >> 	port@3
> > 
> > Ah yes, I forget there are two LCDC instances with different output
> > configurations.
> > 
> > Something still looks a bit weird to me though. For LCDC1, which
> > supports a single LVDS channel, you use the port described as the second
> > LVDS channel. Is there a reason not to use port@2 ?
> 
> 9.11 Low Voltage Differential Signaling (LVDS)
> 9.11.1.2 Block Diagram
> Figure 9.11-1 shows a block diagram of LVDS.
> 
> LCDC1 is connected to LVDS, Channel 1
> For this reason I'm using port@3.

Re-reading that, I think I've misinterpreted the hardware architecture.
Doesn't the DU have a single output, that is connected the multiple
encoders (LVDS and DSI for LCDC0 and LVDS, DSI and DPI for LCDC1) ? It
seems modelling it with a single port and multiple endpoints would
better match the device.

For LVDS in particular, I see a single LVDS encoder with two channels,
so there should not be two LVDS output ports in the DU. The two ports
should be on the output of the LVDS device.

> >> Then port@1 is required for DU1 but not for DU0.
> >> Same port@2 is required for DU0 but not for DU1.
> >>
> >> [0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/ca022fdbba5236c36e0cb3095db4c31e8e0cb1b8.1770996493.git.tommaso.merciai.xr@bp.renesas.com/
> >>
> >>>>
> >>>>    examples:
> >>>>      # RZ/G2L DU

-- 
Regards,

Laurent Pinchart

