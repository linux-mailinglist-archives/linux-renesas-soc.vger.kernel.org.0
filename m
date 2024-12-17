Return-Path: <linux-renesas-soc+bounces-11490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28689F5AA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 00:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D019F16443E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 23:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192381FA851;
	Tue, 17 Dec 2024 23:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S07zDupt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE82A1FA8F9;
	Tue, 17 Dec 2024 23:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734479195; cv=none; b=iYfPfEjh0rLUfFXQzUH5NFbtWh86cYs4jmehWpQILQhswjC/yRgjlpbvCHWOU2LEhPpQeC6qKtPYwGuVwSx/veimspIdT/yLfVBHQXcuq/QEij4cWE3+sECvKGGlj1pqlGzydkGbNINRPa8b3zVBtHoZH6u6Zb5Iul+7NT54HRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734479195; c=relaxed/simple;
	bh=rprLvsqf6IAn/zxMSsQk0GbeIwdMWYTrKwankNkCg+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ea9nfwTXp9tarUa12qVa2IQVHTKK2KIl2H4tKo+z6SvLP6r3PS2UJ5ckcVCIPO3PlrvNm6iVWosDJnxiAxcwq94cv6r9J8wS5cw6BzeVl6fAv1NrZKA7OYtjxzoFp/cnSdEA05fLdLrfqhCyTUZ4uLRMut0/8NxdRrx9vjaWY/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S07zDupt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CB88415;
	Wed, 18 Dec 2024 00:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734479147;
	bh=rprLvsqf6IAn/zxMSsQk0GbeIwdMWYTrKwankNkCg+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S07zDupt6dvCqik09XSG7eIsDZ/VGRO8uWONjYf6EduCuFNP3BeYjtpszdyJ3mmb6
	 fHFKhCXAkNr9nr2be5RneM7OICFdJRuZEm4lGPglBegYRRyeilgNFoCntP2XrbVDed
	 RZSnXpTVPl8LEmljfjKwqVzfO6bU9IBLh+IcqCb8=
Date: Wed, 18 Dec 2024 01:46:22 +0200
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
Subject: Re: [PATCH 1/4] clk: renesas: r8a779g0: Add FCPVX clocks
Message-ID: <20241217234622.GR23470@pendragon.ideasonboard.com>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
 <20241217-rcar-v4h-vspx-v1-1-de04ea044ed4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-rcar-v4h-vspx-v1-1-de04ea044ed4@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Dec 17, 2024 at 06:53:14PM +0100, Jacopo Mondi wrote:
> Add the FCPVX modules clock for Renesas R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/clk/renesas/r8a779g0-cpg-mssr.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a779g0-cpg-mssr.c b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> index 55c8dd032fc325c63727f21dc4d38b8e08ce0ca0..dc9ac2839ad9bb6c222db015de72fe8d9e7fe208 100644
> --- a/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779g0-cpg-mssr.c
> @@ -238,6 +238,8 @@ static const struct mssr_mod_clk r8a779g0_mod_clks[] __initconst = {
>  	DEF_MOD("pfc2",		917,	R8A779G0_CLK_CP),
>  	DEF_MOD("pfc3",		918,	R8A779G0_CLK_CP),
>  	DEF_MOD("tsc",		919,	R8A779G0_CLK_CL16M),
> +	DEF_MOD("fcpvx0",	1100,	R8A779G0_CLK_S0D4_VIO),
> +	DEF_MOD("fcpvx1",	1101,	R8A779G0_CLK_S0D4_VIO),

I can't really validate the parent as the documentation lists multiple
S0 clocks that driver the FCP, but this is one of them, so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I expect that in reality the MSTP bit gates multiple clocks.

>  	DEF_MOD("tsn",		2723,	R8A779G0_CLK_S0D4_HSC),
>  	DEF_MOD("ssiu",		2926,	R8A779G0_CLK_S0D6_PER),
>  	DEF_MOD("ssi",		2927,	R8A779G0_CLK_S0D6_PER),

-- 
Regards,

Laurent Pinchart

