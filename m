Return-Path: <linux-renesas-soc+bounces-26305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1352DCF4DA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 17:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5287431582A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 16:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D7C2DE6FF;
	Mon,  5 Jan 2026 16:46:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1BA277C81
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jan 2026 16:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767631604; cv=none; b=YuXpQXmqCowa/jlrJLJiPDYAW8BcZQng8U3QmWUMhsIg07aVsiqSftvrAW+te1jg0Dhk5j6GpJjhMBAn02yjd864EMsZNvs3dMqi2yzUKYxlJl7wbtVA3eK7auZEftKr04WmG3JUMb4LdXUr9P5+d04EymDy4BpyfvS02KZok5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767631604; c=relaxed/simple;
	bh=gUcf3OPypvqyR8p7kxVygPod6+7BI4eTULMAGd6f7Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUCarsvZc2sUVjXVq+OzIwdF2aTLgK38YAv/O47uilglsJLtIxHhDKd7KieUAcBbtU4XMtYoCmZKU5GS/HvyAff8PjNTIxk94Kn3C81tXwrPy50IOAZvUlM59Oo87SUOM+s7PviPk3BlxmYQ2f/euIsgpuTbfWpQjC1J87tHE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f68.google.com with SMTP id 006d021491bc7-65cfb4beabcso32073eaf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jan 2026 08:46:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767631601; x=1768236401;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Y+GO4Aa0gc2QPJ7CBexGJmUMXVgfq3CdqOnY2xACHY=;
        b=Hu2mj27z4M/SxqtHc6MRlw807HR+Zz46tG5b/uivjHXL0+JPB5q/d9b6K9gg4PT5kN
         gQYDseIw6LXUm59l2c32/1Jg/K5oOd2UaRdvb3tatOBa1zUXFyJebginlerf3qJV5NFf
         rNn20mGfyHaTLuUn9B1L8Xk283ay5i7qg7k4qYHCoKlqKkUvKOIsNYiVyX/1q0gaomFr
         q+dgrFQtapZ1Mz4soH/viU9Vw10wMFybanVYzhh8XFcTN8/aXXb//fRByvsnPVXYXcu8
         36fLJssYWGM3kdPCUD2T1XloBZDm5m8QRzZawUiYmGUpwrTvpHkDoDDVOEBdfHY/kIvB
         VyLA==
X-Forwarded-Encrypted: i=1; AJvYcCXM2hzrud8ALBx7I+fasxUxrsibaxgpnA6jf3/mdSQn2DxhcwzjZ7co0EyftdcQCRWOiu8hPznjhyZ/SzK2+8PWLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVcteR8WHPO21y5SS42PUppWwNOXL6ynjpBvXtJMwrax5nSA3o
	GH4VlT2aWhxPSMWL9FY35QgLNYPWxQLFXj/G3v6qwhxuzymMU/Ju2CSX+JZWB8rL
X-Gm-Gg: AY/fxX6l8Sv/qNvaUjTVEi2nTYFA+QEt9lDH7TbwCvUSa5byYsWlRiywGoLNsLgH4N5
	0avwA17BMiWwPLCqGcsb10CXwiuqlAHzvf1uMZQx7l9Ph/ijynmNl38tO3sWpl4P7awVg/Zff1h
	G/0sv+e8WLkptKrDeVyf3a4PqPxgfIBAELMq1+Tkl9LurXFhJ72BNeE3b1mrfYyoOnc1QNb9nWb
	BLM1w9rSES5Z5LSQ62Z3C3H9mo1Be/BSEEV96qVpZM5p4l+Us/k1ckoYBlLz5W3tOpGf66t4BWs
	3O+JMafjzrH3bwsyXKLKjUpnOCj1nI5iV1yz5TprjCa3qMBrCKA6KIlyjW0kT8K1Tx4cnJQJaOQ
	xIxrAsex39oc3bOcBZjaci8eJFYKKXP0Fsi5SHrFD1RyZREAertsxugyokHoYWhd5gr37DeQF3l
	f+r5Noh8ck1crLyVb83XqjB6F9HbbqCccPdBGdYXNCpCSY57Bg3afL
X-Google-Smtp-Source: AGHT+IEbQEl4qQpoej6/ZowSTZxDDijB+Qdv4wWojARcUqdJR84h/JNQnI5FLqAL7nNUHWBBR0YbGQ==
X-Received: by 2002:a05:6820:2295:b0:65d:5e1:ed05 with SMTP id 006d021491bc7-65f479b3d17mr69353eaf.25.1767631601237;
        Mon, 05 Jan 2026 08:46:41 -0800 (PST)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com. [209.85.167.181])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f478c6693sm69901eaf.11.2026.01.05.08.46.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 08:46:41 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-459fa8b6044so94656b6e.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jan 2026 08:46:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9rldXWxmqAAK59h+thWuAVqD3nIXg/teP1IhQeIwLmmYF/LA5hj5W/aoSl52FYnfrzlo4Tw8O+I22OfrulBax0A==@vger.kernel.org
X-Received: by 2002:a05:6102:e11:b0:5db:dd12:3d16 with SMTP id
 ada2fe7eead31-5ec742e6215mr9355137.6.1767631131303; Mon, 05 Jan 2026 08:38:51
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Jan 2026 17:38:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxOa2zUP8d7F=dUPP+Lun=_KHeU2N-OqxxknGnn24X0A@mail.gmail.com>
X-Gm-Features: AQt7F2qVMJycMg8E3neruWziUPT3Uppf-0VX2kRzSJ5yJoTedPwJ-6TZ9u5HxsQ
Message-ID: <CAMuHMdUxOa2zUP8d7F=dUPP+Lun=_KHeU2N-OqxxknGnn24X0A@mail.gmail.com>
Subject: Re: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 31 Dec 2025 at 15:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Currently, in rcar_mipi_dsi_parameters_calc(), the VCLK divider is stored
> in setup_info structure as BIT(divider). The rcar_mipi_dsi_parameters_calc()
> is called at the early beginning of rcar_mipi_dsi_startup() function. Later,
> in the same rcar_mipi_dsi_startup() function, the stored BIT(divider) value
> is passed to __ffs() to calculate back the divider out of the value again.
>
> Factor out VCLK divider calculation into rcar_mipi_dsi_vclk_divider()
> function and call the function from both rcar_mipi_dsi_parameters_calc()
> and rcar_mipi_dsi_startup() to avoid this back and forth BIT() and _ffs()
> and avoid unnecessarily storing the divider value in setup_info at all.
>
> This rework has a slight side-effect, in that it should allow the compiler
> to better evaluate the code and avoid compiler warnings about variable
> value overflows, which can never happen.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202512222321.TeY4VbvK-lkp@intel.com/
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -412,18 +427,20 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
>
>         fin_rate = clk_get_rate(clk);
>
> +       div = rcar_mipi_dsi_vclk_divider(dsi, setup_info);
> +
>         switch (dsi->info->model) {
>         case RCAR_DSI_V3U:
>         default:
> -               setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
> +               vclk_divider = BIT_U32(div);

BIT_U16(), as vclk_divider is u16?

>                 break;
>
>         case RCAR_DSI_V4H:
> -               setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
> +               vclk_divider = BIT_U32(div + 1);

Likewise.

>                 break;
>         }
>
> -       rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
> +       rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, vclk_divider);
>
>         /* Find hsfreqrange */
>         setup_info->hsfreq = setup_info->fout * 2;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

