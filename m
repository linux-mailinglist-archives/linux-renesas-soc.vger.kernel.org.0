Return-Path: <linux-renesas-soc+bounces-26734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622BD1EFA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 14:08:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B88303040F1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 13:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98241349B0A;
	Wed, 14 Jan 2026 13:07:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1281487E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396044; cv=none; b=MuQLNmHM4Q/woCcEiKHiPiw3EZTtwduy85MPJW9C1R0RB1+qwBJxYDYTXlRCToQzhxJ0apAnGO4mreSvC2LkjslHkngU1DDX61iGd4wx4zF5HaKIfN3orvDMyepjF23PmQlhG2iX+P/m6Es0MMjvrrQ19VWcb/6aBP7q00tgkGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396044; c=relaxed/simple;
	bh=/5eWFDEf6KwzasaJ03bBW4Tg2xk5g+Pd7eH2QVdydoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUDb/1dp0EByZZe7hYs5uXfWbNYJjMGXEtVAQLH9hA8gTNJkalFO60Hizl25LAl/coqTRvsUP5zZngwoNKPiUTqBB1DcmF/d8RrbBS9alE7OOxmZftqiC3O8IUw/ELuFBjK/7AA1OzuzjL2EejG9HujspW058/zn51DX8IznQKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7ce229972f1so7557854a34.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 05:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768396042; x=1769000842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOi1xuIgOKeNmhtu/zXsVbi5AW8T0pSjiAWSdoOenWg=;
        b=vNjIA0LMBvDwzuoBhiA6LB/yLIfLev3vErNhkSx1Y0E9uvHa8Rfzj+Bea7NKqL+XWI
         NVVG/C91OtHFM7ebCb3589S9+kU4A8z7nnLkCmsar3lkDDqjXk7CZhKtOozG5no47FHV
         uIW3dDaVMvYySDtgfLv1EoSaT5OLJzRRENs2l+lOR5n5c1kh5K3hjuiGTeBPc0JY8LCW
         skDcTQBfkxrmSSqMJXl4pgdLvy6OAJygjwJGIjkkDZzQxODnuKKyWZ8wAfTV+sKsK+1X
         COocSl8wYOox3QxcFSQ7RhRhQRJH4jqxkaNWGbv7ArWWAgcXa1PWL0IjkZ/t6zYi4CAW
         XHIw==
X-Forwarded-Encrypted: i=1; AJvYcCWOztn6JGdmnrTPLSD3q9eKDYj9vjDGWwzS80CNS5v29mzsSX1RmmLuhrGpBr1mep8oNVDWxDnyjz4q0Ny8M6ZgtA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ORvfc1xF3t/8qAAKu7fWRdRbDViUNj2tpyYsGp/IXRap9wpj
	OpALDE7/XtvTm5nUTy2bUDIWKWWnQ6Vj8IDFyahjjcED5abTNWyztU0Db7DBZXKr
X-Gm-Gg: AY/fxX66LkMocnr2AW5F+Vuu1J0u7do6GvJ8MUaDAL4sXjhqoKIW01K5x+BMISes/Kz
	KIDqfRm3WYjVkP4NqRA4SSsm45lqLczfPVpfwsez0qcDcKFN8zaRDISBSn7HnqTNyo5s5QXYPY+
	emrRTUD8C4vor2BRGfNeZSFa/Y2QzLslbuSCA6ABtSeGVvJIRGGdsoHXPsQ6jsJwCay51Kf3XZW
	GgFdxn7knDbMX/cJaXY8KAUWXzlV2k01MpYSOtZrT8pGvWjS2Knp3Yvma13S0+5KFTWIUrx6Z9F
	EBcHcO/ioygEncg/vsapyF7adOXfCcBRDipaiPO4Rm2J38V3YQ9L2dTchmMVU49sM9DRAoO4Nvf
	5o1Zoxf44i/OJdgf6sJoD9JfYbCckgO5atfzJ6yUVRzOXOut4QQCBwM0wKz6W0KAQa9v9RWPUc2
	+aZzaCR+b6dYS9L8qFyW7JqtJJEZ6f/3Ipxw9q4RFExum9MBkM
X-Received: by 2002:a05:6830:2701:b0:7c9:5a1d:335b with SMTP id 46e09a7af769-7cfcb5d7bb6mr1409156a34.9.1768396041954;
        Wed, 14 Jan 2026 05:07:21 -0800 (PST)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af63bsm17528826a34.16.2026.01.14.05.07.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 05:07:21 -0800 (PST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3e8f418e051so6589434fac.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 05:07:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXh/d1hKNtMZvgsWoXx0SeXaUgsuDTuDiO1wLfIESIhdHp/HYWAytRhmrd+1kEfVVkr+pEqHfBabMp6dOOvK0+iiA==@vger.kernel.org
X-Received: by 2002:a05:6102:38c9:b0:5f1:555e:a0b4 with SMTP id
 ada2fe7eead31-5f183bdce22mr616871137.32.1768395587922; Wed, 14 Jan 2026
 04:59:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 13:59:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBN0OKOOTw+j3XuWi+hVYBVRyzp=J-+0yMfem2BfT+Eg@mail.gmail.com>
X-Gm-Features: AZwV_QjCdG9CLFFvTy17z_yoeEbQmRYHkFE3zh-jRCvSjUp5PEJNAk_rO0NIbA8
Message-ID: <CAMuHMdUBN0OKOOTw+j3XuWi+hVYBVRyzp=J-+0yMfem2BfT+Eg@mail.gmail.com>
Subject: Re: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add PLLDSI clk mux support to select PLLDSI clock from different clock
> sources.
>
> Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> them in the clock driver.
>
> Extend the determine_rate callback to calculate and propagate PLL
> parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +
> +static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
> +                                                    struct pll_clk *pll_clk,
> +                                                    struct clk_rate_request *req)
> +{
> +       struct rzv2h_pll_div_pars *dsi_params;
> +       struct rzv2h_pll_dsi_info *dsi_info;
> +       u8 lvds_table[] = { 7 };
> +       u64 rate_millihz;
> +
> +       dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +       dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
> +                                    lvds_table, 1, rate_millihz)) {

s/1/ARRAY_SIZE(lvds_table)/

> +               dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +       req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
> +       req->best_parent_rate = req->rate;
> +       dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

