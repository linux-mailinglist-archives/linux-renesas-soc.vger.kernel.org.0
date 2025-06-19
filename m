Return-Path: <linux-renesas-soc+bounces-18529-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E99AE052D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 14:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D1953A6875
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 12:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2B72222C7;
	Thu, 19 Jun 2025 12:09:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8AE7E9;
	Thu, 19 Jun 2025 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334993; cv=none; b=cd7Mc8IvLlE2SEeQkbaV8eC9DE7OBBBOTSrexM7uiT4X4eLfHZsvkj+PlSgO73fZCutg3D429pPGUT1qYZAQ56xCmyoj6Vw6/9+cUYasMFlBI069ae98ZDsxJfLUi//brA3NSbesvi49NSSYVHIAU4x00K/jDXe3470wWgQDj8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334993; c=relaxed/simple;
	bh=uqPdkceAupnzDxIVRjnFXeestpKjMkRH0iLLkxw1IS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzgIHDXQtv7aRjpdppoyDF5iJI8aNQbZYgpao9xTdyYQZcp9gaiHML0Do/DlFN/OgJtGARFZwSbxFhuergmw+fUs+EyVVa4PNX0UO+vlj2W0hlbF0kr1Gpl24u9O5HpPU62pqp5x1kMUwSSFAyl8ZU7qsxWJf2BWi/ewU6npztE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-528ce9730cfso194705e0c.3;
        Thu, 19 Jun 2025 05:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750334990; x=1750939790;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jk8vK05++E3DDKkUjCgHY71bZShR1DYBilB7X8cArY8=;
        b=HEj81HmpZ7Pxo6kSThO95cRB+dY0RjcqwGtN5PHFZ8E/eUd3NSEHlxk9gBJsP3rNQF
         e9DZ0LNhBoUSY/IGmvN7st/OK+SYxt4dN7a560tYt2cwxuOdNCOLIsyzjWku8pmfpumr
         9TcjWquN9V/+uzGF914PKOMsT8kv8P60WuSZwJlkE2a6ftBW+G5d3tpn1RXzCk+xmGOe
         pdrdWlDODm+3pie0CX55gV9AwHwbM3m4m/holCyJ+Jpxw5zWdQDsMT9y4aMNuG+mRrQH
         wWNuNzqvaUh0deRV5WLwNVcOiim54+cv/xmjQkbogufwzWht6UPyDsiSC0gvUnhYWwiY
         +ogw==
X-Forwarded-Encrypted: i=1; AJvYcCVUFCIC3lpBMU9Bnijd87rub0mfL9vHVBXjX7B7FDQJcav+U1eegPU+kMmobNigqlvkbGDjFmanMU8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6dyluCU6ehO1BTD9OwFgI2I4yYYVfMYYdUDLWnvJtw5C1G1K3
	unafwYMUKuBTi3YFwf8z7UFIkZmRRjsE3jg+qBX5woh2fHkSfHflpr9fqvYugOWX
X-Gm-Gg: ASbGncu1H3zDhAMfChnBNnq5h6vGDsr72CumtUzTEgoS2FQiKr/eJVICskCoRUXh4LT
	6qW7LgoBkMKNtb/MNA2t58vI43JhWFP2XPf67ucS8ZILkgHfbaazu2mTuw1DmxmxH5IlEZ3u8rf
	qwjIeH+8n+W6f31dvH4reXtLBmXvOWc4m07OLbdJRiIHgoYwPjCqEuQ30htVAyg7eY3xxWWgguW
	wYJliloRP4WpUvyUgftkYvNZoOZ2S4r5xkVZeiluN7Gbdr60rfXEJo9Mtk+ChRazvaXO8c9eEmO
	Eg0CwR4H7hiHAvlk6y9Xgy+ypbDcIS7rTYKRBsurOyvxe+iTOlMVtAv1sEPXUxfRBLd1syrnP+t
	gmRt2MlYEZ7n8hg6Suco9h/Ci1faB
X-Google-Smtp-Source: AGHT+IHRZXfluTbxlAP92fMDlNI8HCI0lYmcy9gQ1mis+cp4GRS5udscEnCDqg7EgUiE0f43ic+PMA==
X-Received: by 2002:a05:6122:3c81:b0:530:5996:63a2 with SMTP id 71dfb90a1353d-53149826254mr16058396e0c.7.1750334989618;
        Thu, 19 Jun 2025 05:09:49 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53153440a60sm1850552e0c.21.2025.06.19.05.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 05:09:49 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-525b44b7720so200726e0c.0;
        Thu, 19 Jun 2025 05:09:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUyAJsibIp04dR7FQ6pLgKKhIXFeLFWM+qJ4iFW3Q3ynNEHmij1LIsccIXEoUElwoVwC9esNYOwAWA=@vger.kernel.org
X-Received: by 2002:a05:6102:26c2:b0:4e5:8b76:44c5 with SMTP id
 ada2fe7eead31-4e7f64b0229mr14363711137.22.1750334988994; Thu, 19 Jun 2025
 05:09:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com> <20250611093934.4208-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250611093934.4208-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Jun 2025 14:09:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+sUuKGsyiZLnnAPxmE0U3oa5EFUOxWD45UTkNKA3Lbg@mail.gmail.com>
X-Gm-Features: Ac12FXz-Gi6Bx9lARS69KhxdWcYDuiOnpZYShuM1WgjxkwGPE_ty8Qu0cQup7jc
Message-ID: <CAMuHMdX+sUuKGsyiZLnnAPxmE0U3oa5EFUOxWD45UTkNKA3Lbg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/7] clk: renesas: r9a08g045: Add I3C clocks, resets
 and power domain
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 11 Jun 2025 at 11:39, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Clocks extracted from the BSP driver and rebased. Power domain handling
> added by Claudiu.
>
> Co-developed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c

> @@ -243,6 +244,8 @@ static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
>         DEF_MOD("adc_adclk",            R9A08G045_ADC_ADCLK, R9A08G045_CLK_TSU, 0x5a8, 0),
>         DEF_MOD("adc_pclk",             R9A08G045_ADC_PCLK, R9A08G045_CLK_TSU, 0x5a8, 1),
>         DEF_MOD("tsu_pclk",             R9A08G045_TSU_PCLK, R9A08G045_CLK_TSU, 0x5ac, 0),
> +       DEF_MOD("i3c_pclk",             R9A08G045_I3C_PCLK, R9A08G045_CLK_TSU, 0x610, 0),
> +       DEF_MOD("i3c_tclk",             R9A08G045_I3C_TCLK, R9A08G045_CLK_P5, 0x610, 1),
>         DEF_MOD("vbat_bclk",            R9A08G045_VBAT_BCLK, R9A08G045_OSCCLK, 0x614, 0),
>  };
>

> @@ -358,6 +363,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
>                                 DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(14)), 0),
>         DEF_PD("tsu",           R9A08G045_PD_TSU,
>                                 DEF_REG_CONF(CPG_BUS_MCPU2_MSTOP, BIT(15)), 0),
> +       DEF_PD("i3c",           R9A08G045_PD_I3C,
> +                               DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(10)), 0),
>         DEF_PD("vbat",          R9A08G045_PD_VBAT,
>                                 DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(8)),
>                                 GENPD_FLAG_ALWAYS_ON),

r9a08g045_pm_domains[] is gone.
Please add "MSTOP(BUS_MCPU3, BIT(10))" to the "DEF_MOD("i3c_pclk", ...)"
and "DEF_MOD("i3c_tclk", ...)" entries above instead.

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

