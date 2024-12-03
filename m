Return-Path: <linux-renesas-soc+bounces-10806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3309E15EA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C088228113D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DB81D5AC0;
	Tue,  3 Dec 2024 08:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ThMdEicJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06201BDA99;
	Tue,  3 Dec 2024 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733215074; cv=none; b=qjaiIm+O1kNlDRfJTmBpzQEyGr9C0kKQ+BI1R095S1eoLdeyKDL2UlvLjZ/WuYFT3XNAz7GVJgBD1qOknZrKQ9zihcuSxP57sYcnCR7iedbNMeGqHu2nnrjOIoNt67xJLDlP03/lYQiVZ19DbJt0x8Mup8WXp49FotkPIvO8KtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733215074; c=relaxed/simple;
	bh=PYHQYJMAlXFNnWhLgpfhqxgPeimkafKhp9uGyvCwl2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1r3FdYJT7w61YQe1VI01kpTme50lniM1u/uw44dMl+8VpR9ggfcbotspWuUuqM1acrLBoMStzk9OE1BPtCMMLK9zkCfdvTqls444Q27Kl39izAPSMgOl5yxYNYlKKO7CryqQcb2I5Ht+x9NImBtIlt71m5Tk0GLrIsaGoWU6wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ThMdEicJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 080D68DB;
	Tue,  3 Dec 2024 09:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733215043;
	bh=PYHQYJMAlXFNnWhLgpfhqxgPeimkafKhp9uGyvCwl2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThMdEicJ+cJ2NLIxjymB3476Nrp2qS9QxLdkIAKUWOrvDQDF2q46vs1gH0wqX+72/
	 8wu9GOmfAxKfNJlWor95paWzw4sXdtafinEYF38QoKbzdHQYT2s1GI2590WZSTZbzd
	 A+osDw1FJhDaO9mcLvOYQc7rWOuXH++HmlTF96Hg=
Date: Tue, 3 Dec 2024 10:37:38 +0200
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
Subject: Re: [PATCH 3/9] clk: renesas: r8a779h0: Add display clocks
Message-ID: <20241203083738.GF10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-3-738ae1a95d2a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-3-738ae1a95d2a@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:01:37AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add display related clocks for DU, DSI, FCPVD, and VSPD.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> index e20c048bfa9b..dc37e987c0e6 100644
> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
>  	DEF_MOD("canfd0",	328,	R8A779H0_CLK_SASYNCPERD2),
>  	DEF_MOD("csi40",	331,	R8A779H0_CLK_CSI),
>  	DEF_MOD("csi41",	400,	R8A779H0_CLK_CSI),
> +	DEF_MOD("dis0",		411,	R8A779H0_CLK_S0D3),
> +	DEF_MOD("dsitxlink0",	415,	R8A779H0_CLK_DSIREF),
> +	DEF_MOD("fcpvd0",	508,	R8A779H0_CLK_S0D3),
>  	DEF_MOD("hscif0",	514,	R8A779H0_CLK_SASYNCPERD1),
>  	DEF_MOD("hscif1",	515,	R8A779H0_CLK_SASYNCPERD1),
>  	DEF_MOD("hscif2",	516,	R8A779H0_CLK_SASYNCPERD1),
> @@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
>  	DEF_MOD("vin15",	811,	R8A779H0_CLK_S0D4_VIO),
>  	DEF_MOD("vin16",	812,	R8A779H0_CLK_S0D4_VIO),
>  	DEF_MOD("vin17",	813,	R8A779H0_CLK_S0D4_VIO),
> +	DEF_MOD("vspd0",	830,	R8A779H0_CLK_S0D1_VIO),

The clock names and numbers are fine. The parents are not explicitly
listed in documentation, but the VIODBUSD1 clock description (table
8.1.4a) mentions FCPVD and VSPD as target modules. This is something
that should probably be double-checked. Quite interestingly, VIOBUSD2
also mentions the same target modules, hinting as a more complex clock
tree. A similar issue is perhaps present for "dis0" too, that's a DU
clock and the DU isn't listed as a target module of S0D3.

The way we model the "module stop" bits as clocks is clearly a limiting
factor as it can't represent real clock topologies. I don't however
don't expect it to cause any functional issue here, as the devices
related to the above clocks do not depend on the clock frequency.
There's no strict need to model the real hardware clock tree if it has
no impact on software, so

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I think it could be worth it check with Renesas what parent to use here,
and we can update the clock definitions later if needed.

>  	DEF_MOD("wdt1:wdt0",	907,	R8A779H0_CLK_R),
>  	DEF_MOD("cmt0",		910,	R8A779H0_CLK_R),
>  	DEF_MOD("cmt1",		911,	R8A779H0_CLK_R),
> 

-- 
Regards,

Laurent Pinchart

