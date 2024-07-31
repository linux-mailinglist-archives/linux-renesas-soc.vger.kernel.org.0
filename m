Return-Path: <linux-renesas-soc+bounces-7661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E6943140
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 15:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C892C281430
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 13:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9981AE852;
	Wed, 31 Jul 2024 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ejJIiJJe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AF61607BA;
	Wed, 31 Jul 2024 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433651; cv=none; b=eXSaUNsS/OGh0/WfyPAz+iSSjy+g8Aop0k2y+ZHbBNXNVeXHKA7vKcl5bjo9pdqMkakEdZCogFzeEIrvQJ/4jd/YT5veC1pwnh7N+v6A7SEp8aHJiXYsmtzl8xiP2ptJQHX2avlgLjJEWNdmIqHdtUGyCu6m2P8R4MCI8Id1Q/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433651; c=relaxed/simple;
	bh=bWjUxuw/bFpPMmL/Vpdv20Re4oaTJut4VK2k8K8u2l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyn2no6K6pebxCGJC+jzuoMo2jmuryYpmgWDBU10Oc0r9GkSid7VnMBGlaJLGtOWdNLnBmofRy1D+V1bdrqggWai1u6SKV+Bomsa4Aje+KbHnx4qhl9tE1vMmO2bwLXq7Bjw9JJktrOcC2DaZIvy2qJrFAdDSMuZ4KTRrlN3cfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ejJIiJJe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23DD2F85;
	Wed, 31 Jul 2024 15:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722433598;
	bh=bWjUxuw/bFpPMmL/Vpdv20Re4oaTJut4VK2k8K8u2l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejJIiJJe54gJ8IfG8PT0fVVh91m8puR/joJoDEeDKuI9DlpvI4lc85KVHMLyyn2f9
	 90wfBNX6EKhB2JCjhNDaVtm5mEK+29RWLujoC3lPqBKX7QEmmGkcjvoGFDLmr1N2Aj
	 zbLjo6YXpzujDjwzgs3nPkj6UeNPTFlfSVXHibNM=
Date: Wed, 31 Jul 2024 16:47:05 +0300
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
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
Message-ID: <20240731134705.GD12477@pendragon.ideasonboard.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
 <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
 <20240727004958.GF300@pendragon.ideasonboard.com>
 <TY3PR01MB11346C37466562CBB2751F3CD86B72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346C37466562CBB2751F3CD86B72@TY3PR01MB11346.jpnprd01.prod.outlook.com>

Hi Biju,

On Mon, Jul 29, 2024 at 09:05:59AM +0000, Biju Das wrote:
> On Saturday, July 27, 2024 1:50 AM, Laurent Pinchart wrote:
> > On Tue, Jul 09, 2024 at 02:51:41PM +0100, Biju Das wrote:
> > > Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> > > SoC, but has only DPI interface.
> > >
> > > While at it, add missing required property port@1 for RZ/G2L and
> > > RZ/V2L SoCs. Currently there is no user for the DPI interface and
> > > hence there won't be any ABI breakage for adding port@1 as required
> > > property for RZ/G2L and RZ/V2L SoCs.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > v1->v2:
> > >  * Updated commit description related to non ABI breakage.
> > >  * Added Ack from Conor.
> > > ---
> > >  .../bindings/display/renesas,rzg2l-du.yaml    | 32 +++++++++++++++++--
> > >  1 file changed, 29 insertions(+), 3 deletions(-)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > index 08e5b9478051..c0fec282fa45 100644
> > > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >    compatible:
> > >      oneOf:
> > >        - enum:
> > > +          - renesas,r9a07g043u-du # RZ/G2UL
> > >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > >        - items:
> > >            - enum:
> > > @@ -60,9 +61,6 @@ properties:
> > >          $ref: /schemas/graph.yaml#/properties/port
> > >          unevaluatedProperties: false
> > >
> > > -    required:
> > > -      - port@0
> > > -
> > >      unevaluatedProperties: false
> > >
> > >    renesas,vsps:
> > > @@ -88,6 +86,34 @@ required:
> > >
> > >  additionalProperties: false
> > >
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,r9a07g043u-du
> > > +    then:
> > > +      properties:
> > > +        ports:
> > > +          properties:
> > > +            port@0: false
> > > +            port@1:
> > > +              description: DPI
> > > +
> > > +          required:
> > > +            - port@1
> > 
> > Why do you use port@1 for the DPI output here, and not port@0 ?
> 
> Currently the output is based on port number and port = 1 corresponds to DPI. See [1].
> 
> For consistency, I documented bindings for RZ/G2L family DU's similar to RZ/G2{H,M,N,E} DU [2].
> 
> So please let me know, are you ok with this?

I won't insist strongly, but I don't think that using the port number to
indicate the output type is the best idea. In the R-Car DU driver at
least, that wouldn't have scaled. We have multiple outputs of the same
type on some SoCs. Furthemore, the same DU hardware channel number (i.e.
the offset of the registers specific to that channel in the DU register
space) is not the same across SoCs for the same output type. I recommend
numbering the ports based on the hardware number of the output (the
exact meaning of this is specific to your device, I haven't checked what
it means for RZ/G2L), not on the output type.

> [1] https://elixir.bootlin.com/linux/v6.10.2/source/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c#L187
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/display/renesas,du.yaml?h=next-20240729#n546
> 
> > > +    else:
> > > +      properties:
> > > +        ports:
> > > +          properties:
> > > +            port@0:
> > > +              description: DSI
> > > +            port@1:
> > > +              description: DPI
> > > +
> > > +          required:
> > > +            - port@0
> > > +            - port@1
> > 
> > You're missing a blank line here.
> 
> OK, will fix this'

-- 
Regards,

Laurent Pinchart

