Return-Path: <linux-renesas-soc+bounces-12047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BBBA0946B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 15:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E62811883E36
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2025 14:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9620212B0B;
	Fri, 10 Jan 2025 14:55:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3844F211279;
	Fri, 10 Jan 2025 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736520902; cv=none; b=Ye3EeJVb/GVX4GeMS8fPF4qP4X5nEr16iQ6mvxfdqhhIeKq9HdT43ySe6kks6FRQY4Ieb+BxiMbnhEhqEROtRdWfgRvfLUzla6rIl4Ez+fcAzr0Ph5QKRujz8522U0tb9S41MihjBQDwJc0WTPOBwALGGPEtcPdZNztWC/nhbrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736520902; c=relaxed/simple;
	bh=10Y4wG1ZKAjJP8ByWqGlMvFDwfuDBoerYerKYedbFr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9t23J0aXqO7Z76B42Nv9PHH6kjsSUbLK05NRJQ/o9wxmBXMTzxr5kJdcYcTbYB2pPBqjoEfsQiVx9unq5LTu86X9fyZU1cAe0SLNvLDH+1LjV4PWLI6S7uMPHFCMQUG0DYGvBgjnKa0Rt2+UUkZOfYVgLMinihjN3y3tYmedr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-51bb020339fso828497e0c.0;
        Fri, 10 Jan 2025 06:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736520899; x=1737125699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/s1P0Pqg/3VfqqfM3ErTjLNZnNf2mIaTMc9cyRXFjY=;
        b=EexTNUVfdSZP5KVkA3EeYaQFNc4vU7jenR29329DmB3mW3NrB2Crg9KT3/UZRFbqPG
         C4hquTEtKdX103ooJJcP0I3uuPQoZ9Yg3CX8sJadFEYKVB/+gHqybhJwo5LNz/xJ/4nY
         Nm6Amf1Dqil3n8IvfjFbHkZDdf/FuKoo0POX7hMs7btGpIAP+apOR6vMXyo0Ol44kWuU
         InOyEyQuFOxwaQUXMFILHE88X8nR3w113vV/3buex1olgkof2XZusGvEEpT0fwURfiJR
         etKvyF7mfcAho2faBzcm87Jm784mpqvRUWfe3XFP0oaGg5FY959ssXV8waUiRWMZtOSm
         7d6A==
X-Forwarded-Encrypted: i=1; AJvYcCUjSF6DiFtpG6nheilL5XLSeoOphm1KgIADPJoArwYtJvdm6+5zDYzqydJYUBhcoVAZYx0v8YGvV8VseKlQXDIx7zg=@vger.kernel.org, AJvYcCWbtzBLAvu8MftvZXrarKc5l9mJWgW2p2Z8AVmNgDArfbY0iryGXMhY+zrjsvkISZzfL3/TU7FhcsM=@vger.kernel.org, AJvYcCWt/nHjVhe7N6jigkDHe8F8vWmaiED/CF7a/ld2szTnwoyMGUzzYtKcixdx0IfiALH1sJg6ZKgcZW08yoia@vger.kernel.org
X-Gm-Message-State: AOJu0YwTQUbySZjFzr4AXUcbV9w3jM2xEeH77eWknyFvgtH0+2mOXEQe
	41U/W7tfJnKxSjw/PvG3lQfzUz6oOeaiOdF9zAEd+RoVMhkzTRx/kRn+S2ty
X-Gm-Gg: ASbGncsA6rvvJgkRSHbj5q0UGvIuD8TFyk0smPkJmzbRDA5HOs5xzhAwMCg5nqtPYHX
	4q6yOfCqD+L54oBGnZ2noQ7H3HvHqug1cAzUCGjBiFHwgLt6o6q0gMfbBH3VcgCLJHzUvW+WAPp
	eiHPbyJrrSrDL0/DFRKFCRmDLj5Kx0aBJVbsJ19cR6F9QH41Y4t8rqfiUdZF7k1hyjGuOFW7yZ+
	lz0OONvRSBLCktgxvfoCCybXL1IiNE71oAb0D+xcMvBFtsOm9o2JGLV4Y6DWeuYgFbUnT2LmX66
	5jEpv1aIi/K9a7KnmGY=
X-Google-Smtp-Source: AGHT+IFjlHcrb/6uphjm/aya4s8sVBlChLpJUakRInx2CTqQ+m28GLpLXCmUklTZQCJTTUZ3WlJ+Kw==
X-Received: by 2002:a05:6122:4387:b0:518:a0ee:e8e7 with SMTP id 71dfb90a1353d-51c6c2b9391mr9375244e0c.0.1736520898694;
        Fri, 10 Jan 2025 06:54:58 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fd2dd88sm2205892e0c.47.2025.01.10.06.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 06:54:58 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4affab62589so785272137.1;
        Fri, 10 Jan 2025 06:54:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURCgJBLkd6xwRgUQrZM8/bA+KfEPvmzN/yxEWfbE5/MANAT6Wg+J601UIGKqP8fM9ZAARHqS2bo4abmxHC@vger.kernel.org, AJvYcCV8TacJjwF9Yp9llSexCqormkMUvQyCm7rfKRIngoIES0O9MJ0UMAvgdh2MPXL3RbtdA56ngq7i1hy2tP9D58gJNjY=@vger.kernel.org, AJvYcCVd1hsAbqpH1kKNrQrwZu4mG7mtMCeIsw2OUGfEhOQxZe3K7gzIb+6L/CqZKpSVOl+qyCX6AuTV0GY=@vger.kernel.org
X-Received: by 2002:a05:6102:2ac5:b0:4b5:b20d:5e16 with SMTP id
 ada2fe7eead31-4b5b20d95fcmr6464011137.21.1736520897984; Fri, 10 Jan 2025
 06:54:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103164834.1778090-1-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250103164834.1778090-1-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jan 2025 15:54:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHCBy+i+P=URcg1U=qHfgHAkAhPQgxWfJQ8AUiNQYqtA@mail.gmail.com>
X-Gm-Features: AbW1kvaSBPPHhzxMFa91U4Ec70xPz_NlcZcIMFMgN_uZxZRyiRm9HmByRSzvMDY
Message-ID: <CAMuHMdUHCBy+i+P=URcg1U=qHfgHAkAhPQgxWfJQ8AUiNQYqtA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a08g045: Check the source of the CPU PLL settings
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Jan 3, 2025 at 5:49=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On the RZ/G3S SoC, the CPU PLL settings can be set and retrieved through
> the CPG_PLL1_CLK1 and CPG_PLL1_CLK2 registers. However, these settings ar=
e
> applied only when CPG_PLL1_SETTING.SEL_PLL1 is set to 0. Otherwise, the
> CPU PLL operates at the default frequency of 1.1 GHz. This patch adds
> support to the PLL driver to return the 1.1 GHz frequency when the CPU PL=
L
> is configured with the default frequency.
>
> Fixes: 01eabef547e6 ("clk: renesas: rzg2l: Add support for RZ/G3S PLL")
> Fixes: de60a3ebe410 ("clk: renesas: Add minimal boot support for RZ/G3S S=
oC")
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g045-cpg.c
> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
> @@ -51,7 +51,7 @@
>  #define G3S_SEL_SDHI2          SEL_PLL_PACK(G3S_CPG_SDHI_DSEL, 8, 2)
>
>  /* PLL 1/4/6 configuration registers macro. */
> -#define G3S_PLL146_CONF(clk1, clk2)    ((clk1) << 22 | (clk2) << 12)
> +#define G3S_PLL146_CONF(clk1, clk2, settings)  ((clk1) << 22 | (clk2) <<=
 12 | (settings))

s/settings/setting/, to better match the actual register name.

>
>  #define DEF_G3S_MUX(_name, _id, _conf, _parent_names, _mux_flags, _clk_f=
lags) \
>         DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf =3D (_conf), \

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c

> @@ -60,6 +61,7 @@
>  #define GET_REG_OFFSET(val)            ((val >> 20) & 0xfff)
>  #define GET_REG_SAMPLL_CLK1(val)       ((val >> 22) & 0xfff)
>  #define GET_REG_SAMPLL_CLK2(val)       ((val >> 12) & 0xfff)
> +#define GET_REG_SAMPLL_SETTINGS(val)   ((val) & 0xfff)

Likewise, s/SETTINGS/SETTING/

>
>  #define CPG_WEN_BIT            BIT(16)
>

> @@ -986,6 +989,10 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(s=
truct clk_hw *hw,
>         if (pll_clk->type !=3D CLK_TYPE_G3S_PLL)
>                 return parent_rate;
>
> +       val =3D readl(priv->base + GET_REG_SAMPLL_SETTINGS(pll_clk->conf)=
);
> +       if (val & RZG3S_SEL_PLL)
> +               return pll_clk->default_rate;

This code and the G3S_PLL146_CONF() macro are intended for PLL1,
PLL4, and PLL6 (currently the driver instantiates only PLL1), but the
SETTING register exists only for PLL1.  Hence you should check first
if the register offset is valid, e.g. by checking for a non-zero value.

According to the documentation for the CPG_PLL1_SETTING.SEL_PLL1 bit,
the clock config also depends on the OTP_OTPPLL[0-2] pins.

> +
>         val =3D readl(priv->base + GET_REG_SAMPLL_CLK1(pll_clk->conf));
>
>         pr =3D 1 << FIELD_GET(RZG3S_DIV_P, val);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

