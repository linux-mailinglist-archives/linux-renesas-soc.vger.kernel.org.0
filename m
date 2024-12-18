Return-Path: <linux-renesas-soc+bounces-11518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BED3E9F6084
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D9CD188275B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 08:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2897F191F75;
	Wed, 18 Dec 2024 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V00j+/MK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40D18A956;
	Wed, 18 Dec 2024 08:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512015; cv=none; b=D7KpvTkGD7f5/3PFwT77z7+0ImXofs/0+p741Uf87/O/rKDtd9XAs+tzVDeRQ9Ms9h9uZtkAkEoXR737cv06BGFwC7EiD5C3nzl/zhI+zuEgAjE6mq5pWTlgUp60UudHxOvz/BA/19NvaaaMXJLUi+5V/E2lIn/36GKrIQNGhAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512015; c=relaxed/simple;
	bh=AeZKAty4wAS+EIXQVQVnlnJTlUQCNOKCpfx3Vjia0HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwS/ddQi08Xg/XedJSHCofWEhWJbJkpMbdVUgHPxezUxG1R6cQQDa7pOL0vdMNe0YegFTfEC/Qz2hmUka0kIRNMCE9GmZmwclSlU9EQtk2J7+WeaOYTiprxBxdAG1nfj2+ivouLhlzpD8pFaPUPENp/aKAiOkAO175UbdLCiVVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V00j+/MK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E054A59D;
	Wed, 18 Dec 2024 09:52:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734511974;
	bh=AeZKAty4wAS+EIXQVQVnlnJTlUQCNOKCpfx3Vjia0HM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V00j+/MK012CplQ8btXJWnLvNQIqj52Zx95E+UDhw+mnz/HWH4ZzXE4qsSZGJ0xMj
	 GSPkWXNQQ2ApC1jDoegiVB7a+3NAUogzUShddKUO7bySnwURoUO2WDS+c1QfRx1TEX
	 FiN7Z0IwomnoiIS3QuGpA9V3ZXrr92ongeaESll4=
Date: Wed, 18 Dec 2024 09:53:28 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: renesas: r8a779g0: Add FCPVX clocks
Message-ID: <edllhe7jhpggfylricwhzgvr4xmjc7wcb32d3c43u4b4ntdryn@t4dln4dfjj5k>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
 <20241217-rcar-v4h-vspx-v1-1-de04ea044ed4@ideasonboard.com>
 <20241217234622.GR23470@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217234622.GR23470@pendragon.ideasonboard.com>

Hi Laurent

On Wed, Dec 18, 2024 at 01:46:22AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Tue, Dec 17, 2024 at 06:53:14PM +0100, Jacopo Mondi wrote:
> > Add the FCPVX modules clock for Renesas R-Car V4H (R8A779G0) SoC.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > ---
> >  drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> > index 55c8dd032fc325c63727f21dc4d38b8e08ce0ca0..dc9ac2839ad9bb6c222db015de72fe8d9e7fe208 100644
> > --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> > @@ -238,6 +238,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
> >  	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CP),
> >  	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CP),
> >  	DEF_MOD("tsc",		919,	R8A779G0_CLK_CL16M),
> > +	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D4_VIO),
> > +	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D4_VIO),
>
> I can't really validate the parent as the documentation lists multiple
> S0 clocks that driver the FCP, but this is one of them, so

Here I decided to use the same clock as the VINs (200MHz)

However the ISPs clock parent is set to R8A779G0_CLK_S0D2_VIO (400MHz)
but that does not support the VSPX.

The only clock parent that can feed  [FCPVX, VSPX and ISP] is the
800MHz R8A779G0_CLK_S0D1_VIO parent.

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> I expect that in reality the MSTP bit gates multiple clocks.
>
> >  	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),
> >  	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
> >  	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),
>
> --
> Regards,
>
> Laurent Pinchart

