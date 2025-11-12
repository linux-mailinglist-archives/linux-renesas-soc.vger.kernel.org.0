Return-Path: <linux-renesas-soc+bounces-24510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A647C5384C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 17:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E11A568025
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 16:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0787A33A026;
	Wed, 12 Nov 2025 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C49xMFRc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF02F2BF00B;
	Wed, 12 Nov 2025 16:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762965435; cv=none; b=Vmlu7KTNZQG+5p1i+rToREEl9WNquDzY7+VLXH0gJQHQiaW6FQk95I5QCeGRUX5zjHyKx5GKim/JXxS/039YKcAUN1ce0gDLeH7eUABEQ+VhR6qkk5PDlrZR/ZXnK+T5PHwmQScl/EXQOOWB5DeBu73mZeUBtcabHJczcdoaVGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762965435; c=relaxed/simple;
	bh=oowPZ540cX44zaHpABNfot6LitLXzhEHziYTiD86060=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3fH0jlhx/4DXiOccEnpCVZWhu3CIVOt9WV2JWl6Z0iM1VFxl3RttODLLqHlD9/e6k9ChEJtP6XuoacjT3ZKYG7Oe4dbgHZEmjT5urMPpJZ9LiZ4IulfViS28TrtHHHh8p9pIjjPCzW9YTPK1tDOR0qWKvv8MDxQ2CpXMSefdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C49xMFRc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496C3C4CEF5;
	Wed, 12 Nov 2025 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762965434;
	bh=oowPZ540cX44zaHpABNfot6LitLXzhEHziYTiD86060=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C49xMFRcBVwukuEBj8w7WVJkJdl2b6q7XKOX7iyjoj46RwGJVJdZjGt4jvbUyfvH+
	 pEho5CCRnuL3R712dZdjFptpRjKnPadSWo3NL2LuQ947HDE2J6L5IycFMYZm6N1N4I
	 yHDN7Olr6pMhU5D0IoH/EUNJLbgzmKfHQoJeN2dMYVWgQyztFgvsXFgUv9V5Q5dXcO
	 PSyJWnbufZdpOEJSo86sJgSCEr3dj8p2KaJ8i9ba6oDjKwphY8Hz7JH3EvmuLq7ISM
	 N4Ms1vr+nJYY8nJyP/j9+lPVNygBhaE+l4NAwkv0DAjAsD2kXiit3ZenoD0WhtKqXV
	 jCrsEHE2su+bA==
Date: Wed, 12 Nov 2025 10:37:12 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/21] dt-bindings: reset: renesas,rzv2h-usb2phy:
 Document VBUS_SEL mux
Message-ID: <20251112163712.GA1850277-robh@kernel.org>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <8fba0b7235bd398d41329fd087d68f7e98bbbaca.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
 <20251110-resonate-strict-c3d6c42f3e0d@spud>
 <aRJqfh7p9M3NHfCS@tom-desktop>
 <20251111-character-catnip-0832956a3fb1@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-character-catnip-0832956a3fb1@spud>

On Tue, Nov 11, 2025 at 05:49:24PM +0000, Conor Dooley wrote:
> Tommaso, Rob,
> 
> On Mon, Nov 10, 2025 at 11:43:37PM +0100, Tommaso Merciai wrote:
> > Hi Conor,
> > Thanks for your comment!
> > 
> > On Mon, Nov 10, 2025 at 06:56:31PM +0000, Conor Dooley wrote:
> > > On Mon, Nov 10, 2025 at 01:08:04PM +0100, Tommaso Merciai wrote:
> > > > Document the 'mux-controller' child node in the Renesas RZ/V2H(P)
> > > > USB2PHY reset binding to support describing the USB VBUS_SEL
> > > > multiplexer as a mux-controller.
> > > > 
> > > > This is required to properly configure the USB PHY VBUS source on
> > > > RZ/V2H(P), RZ/G3E SoCs.
> > > > 
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > > v2->v3:
> > > >  - Manipulate mux-controller as an internal node.
> > > 
> > > Why is it a child node, rather than just putting the cell in the parent
> > > reset node?
> > 
> > Getting "make dt_binding_check errors" [1] in v2
> > Adding #mux-state-cells = <1> into:
> > 
> > 	usb20phyrst: reset-controller@15830000
> > 	usb21phyrst: reset-controller@15840000
> > 
> > Nodes.
> > 
> > Please correct me if I'm wrong.
> 
> I think that that binding is not working as intended. Why require a
> node-name pattern, when it matches on other things too:
> select:
>   anyOf:
>     - properties:
>         $nodename:
>           pattern: '^mux-controller'
>     - required:
>         - '#mux-control-cells'
>     - required:
>         - '#mux-state-cells'
> if the node name always contained mux-controller, the second two here
> would not be needed. Looks to me like the intention was for it to allow
> putting these control/state-cells properties into mfd type nodes.
> 
> I'd delete the node name property tbh. Rob, you converted this to
> schema, what do you think?

Yeah, I'd probably just comment it out and drop the select.

I'm not sure what to do here in general. Matching on node names was 
useful early on, but that becomes less useful as we have schemas for 
everything. I'd still like to document standard node names in schemas 
somehow, but obviously we can't require a certain name when a node is 
multiple providers. Ideally, every node name in the list in the DT spec 
would be in schemas and we could generate that list.

Rob

