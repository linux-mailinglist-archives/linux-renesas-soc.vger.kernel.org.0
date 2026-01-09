Return-Path: <linux-renesas-soc+bounces-26556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B87D0BE9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 19:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A012A3009FA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 18:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621552C3256;
	Fri,  9 Jan 2026 18:45:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CE42C3259
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 18:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767984327; cv=none; b=JZ8++E7lIMKy7+DjzqQOdsF2EcdAbwStMLVVOqqpUVGUzKMQuUrjIjdnj0kYmKWdY7VLw6aDBSgayV3w6r8uHDIC3kqS7KQ6AIPmxtiljITh0YyATUq9eL06+vDc8uQUOmR8Zq61EGfxZ2uAHEc3Ll1FFI9BMYCdVmgSxbFb+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767984327; c=relaxed/simple;
	bh=Kd7pnWcr1R/4wNYYYEHmfzxHiMMS+c6SRBDRjLB+8IQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M37kdtbOxf7/OsrUucr6VVLtNa8jP6lndUW1j8DYBjrgFDhNrbRfRTHmb+AV9He4u+HmpC+mzmDmVLAu4n6dDhEXOzqxfOx9XG/AaV+yv8yoleQkHk9J3eaiecwf0teGYqpzo2qoVmL3LCilZpklwERW3sqCkq5w3JJpcjGBVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-55b219b2242so1929249e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767984323; x=1768589123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmILYhqvOyXlRgf5EHBu2pb/ojQMIlgBjR7Z/UbB1kA=;
        b=nPkFpdDs3zjY7xX3RMm4YNUA498IPz2pbdqvUJEA0mH6s6tUVM0iEjAps9BXNDkcsJ
         AMcRNjMEQCM/E83uZ+ucLpsaq1ePvae1sehyOEKzEZEJ5lD0ZOU/GQu6O+J8TWbg7lL0
         4/ILwB37TR4S8sboHvIUdDDVUWQmEj8mHsbaTk+fg4a2yZoS0ugDya65JKd+3ZvQ6qfK
         ORlbcWfIUV6pciRGVXmNFkwyfCTr9ZbfUBysWfRKtM904PllcKMEWr2r8c4knWeUgBod
         P9zP3+qq4/qgei95y9QgMuXD1Poi7/AgtzJI4E322rH+RL7Ak3zIH8iqg6NVF+kHJonZ
         CJkg==
X-Forwarded-Encrypted: i=1; AJvYcCV74GmOZSV0vEsdloorKLOjOAl3vmsHu5UF/hQxKP55+sEVTfFxhWR3XqgijRlRiTn1QDU4yw401eQiUBVW1W7yXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzklWYOUabCTpP03hijU59iqNs7H+sNGrXoVHEZ3gY1hZQWvRuI
	BuffVoV1RXuiapAUxPt1nMxV+h32EZoxCTPt350luv2Fgt9xAQquJWrGUdhAzEu/
X-Gm-Gg: AY/fxX7esQWj1k5LoIpWN+3nXwtfv/Ur6yr0klM2lOb9Fluogm+BYiUc8kBK3Ia/JMD
	bqXkY74ApBOfaJNO7G4Qb1v98dSGcoc93fRBGDRQAKX04bukFdUYoM0UpNIl0LyKstuz5hpNqPL
	1sLW3OugcXQZKVn0Bkt6qfw+/E26YFDzCIhx6CUuZarca+COc20KcSpF9F5CFZ3QzDtjZI+hUOu
	lDwby2RIMh8Mpcd9PXOERlwao7D52+SnXW812ZN6JesFWcgwKyKovfk3Vd8/RpiHv2am/ndTeQs
	7kxPu6sEYWtp/S/2NJjESUnzExWJtQCl+yjmrU0I8BmeckK1b8Ebr/yf+mIVoIOt9e0P7lcbnDN
	CPFqbNr6fWTAn3IRqipedJKvv3BcY3chhnHS1ZCsaFKvWY2FHSSX6+9lUfI+4citx10L2XS1HDR
	zJwmSRnrOQa7Zwrz1UnnMOZ2sLgdVYScOV3N3K4K6eKtOs10CYMMEVSInjrlw=
X-Google-Smtp-Source: AGHT+IHBeT/w+uewjeMy1L4g7rHos/rmYZAskr3HOBYUSdCleQmXDzZh7m49nDt2LxYXgbXPhr1+UQ==
X-Received: by 2002:a05:6122:68e:b0:563:62ce:b28a with SMTP id 71dfb90a1353d-56362cec8a5mr1513277e0c.5.1767984323003;
        Fri, 09 Jan 2026 10:45:23 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a3f78d8sm10187694e0c.10.2026.01.09.10.45.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 10:45:22 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ef31a77afbso670370137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 10:45:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVl/C9bqyPWpH1kMHDm1KkIQiEaaz7V8SuXBsgLdncPqtj9e8hzW9iekbwWRQ0G4NtVWGZHkQaJWQ5fDxL/gjbCkg==@vger.kernel.org
X-Received: by 2002:a05:6102:3909:b0:5ef:a1ea:bd33 with SMTP id
 ada2fe7eead31-5efa1eabdebmr1058605137.9.1767983958883; Fri, 09 Jan 2026
 10:39:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com> <a7ed87270fd084f2b3f1ad6ee9238b2fb5bcc426.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <a7ed87270fd084f2b3f1ad6ee9238b2fb5bcc426.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 19:39:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUvh2mCj_8tuk7CMEWkktPvXAEaz5kKrgy8p-bgGETepA@mail.gmail.com>
X-Gm-Features: AZwV_Qioy5rAVOHURSXprxm6XZTivhCttyw7ug7KaU5R8GoCdbMVCMnDP5LwuYc
Message-ID: <CAMuHMdUvh2mCj_8tuk7CMEWkktPvXAEaz5kKrgy8p-bgGETepA@mail.gmail.com>
Subject: Re: [PATCH 07/22] clk: renesas: r9a09g047: Add support for DSI clocks
 and resets
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

On Wed, 26 Nov 2025 at 15:09, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add definitions for DSI clocks and resets on the R9A09G047 cpg driver
> to enable proper initialization and control of the DSI hardware.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -486,6 +486,18 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(9, BIT(4))),
>         DEF_MOD("cru_0_pclk",                   CLK_PLLDTY_DIV16, 13, 4, 6, 20,
>                                                 BUS_MSTOP(9, BIT(4))),
> +       DEF_MOD("dsi_0_pclk",                   CLK_PLLDTY_DIV16, 14, 8, 7, 8,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_vclk1",                  CLK_SMUX2_DSI0_CLK, 14, 10, 7, 10,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_vclk2",                  CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),

Please move this below, to preserve sort order (by _onindex/_onbit)

> +       DEF_MOD("dsi_0_lpclk",                  CLK_PLLETH_LPCLK, 14, 11, 7, 11,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
> +       DEF_MOD("dsi_0_pllref_clk",             CLK_QEXTAL, 14, 12, 7, 12,
> +                                               BUS_MSTOP(9, BIT(15) | BIT(14))),
>         DEF_MOD("ge3d_clk",                     CLK_PLLVDO_GPU, 15, 0, 7, 16,
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("ge3d_axi_clk",                 CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

