Return-Path: <linux-renesas-soc+bounces-11491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC4B9F5AB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 00:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E376A18938FD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 23:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958261FA177;
	Tue, 17 Dec 2024 23:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fTA2+4YU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DC91E6DDD;
	Tue, 17 Dec 2024 23:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734479242; cv=none; b=OhV0GDeTlyvVAQjXUjNOy0nUFfNvRFGRfb6f9AHIy+x4RgFTQP4hEy0JNedbvTFE0p9Wql8uBNpbrR6tWh0FeNdycsMhYkQP1kiAuT84Rt1olcRUjsvWwgDvECpskyKF/hLWBxL9dHXRXVttgr0zfwH56RDEdFqQxhtfUHy5eKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734479242; c=relaxed/simple;
	bh=7TpKS455zysYaveedhuPcnr29VYKornztH5W+b+us2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6mJUYgI59yJ7WhhkaUum/1sYdTDcdWapVEWnkbfgTrSyLUz/bJP2JQW17j8kwVvzw8JJDlfjtgsGA1Hp56/4uuTdvB5pWhFhL8tqU1AFljqUw++xgxW6zI+2gGJeKB9OqsclU+02tTT6l1bhYXGSjdN9cHosJki8XOxynQg8dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fTA2+4YU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D29B4415;
	Wed, 18 Dec 2024 00:46:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734479200;
	bh=7TpKS455zysYaveedhuPcnr29VYKornztH5W+b+us2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTA2+4YUV3/33cK0zBQyJtmqmS0wALXEeTuNg+TYARE2v1mXai5jhRKr9niHjVf8D
	 FRAOz8Th10eO/IaSRqf3mjNL8Chh1FrneICrx5MDmcj9xYiqemNnbbL9/24eNtQ/tx
	 ggiRtEh7MrKPXke1XOFneumELshWxijcsfQ1M5o4=
Date: Wed, 18 Dec 2024 01:47:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: renesas: r8a779g0: Add VSPX clocks
Message-ID: <20241217234715.GS23470@pendragon.ideasonboard.com>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
 <20241217-rcar-v4h-vspx-v1-3-de04ea044ed4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-rcar-v4h-vspx-v1-3-de04ea044ed4@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Dec 17, 2024 at 06:53:16PM +0100, Jacopo Mondi wrote:
> Add the VSPX modules clock for Renesas R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> index dc9ac2839ad9bb6c222db015de72fe8d9e7fe208..4e88096f8c4583d60debc3989fb22a51b41762a6 100644
> --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> @@ -238,6 +238,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
>  	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CP),
>  	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CP),
>  	DEF_MOD("tsc",		919,	R8A779G0_CLK_CL16M),
> +	DEF_MOD("vspx0",	1028,	R8A779G0_CLK_S0D4_VIO),
> +	DEF_MOD("vspx1",	1029,	R8A779G0_CLK_S0D4_VIO),

Same comment about the parent as in 1/4.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D4_VIO),
>  	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D4_VIO),
>  	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),

-- 
Regards,

Laurent Pinchart

