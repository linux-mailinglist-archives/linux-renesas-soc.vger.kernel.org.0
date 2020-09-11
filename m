Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDA5265BAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 10:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbgIKIeT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 04:34:19 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42566 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgIKIeN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 04:34:13 -0400
Received: by mail-ot1-f68.google.com with SMTP id g10so7687166otq.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Sep 2020 01:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7dUykIj+V6wHUh7mGPlKWW2ILyIp4GTI0JWqH+gl59U=;
        b=VPTRaXbLHeSpEi84nMyvwbfRn2lYkKk+mj3KB9/daZhJfNHiK/tGkM/XlsQpVG/i6d
         P4RajkbdiDFARB2OF4zVo8pBvELmY0KZLSAjmaXh8bugcsGKN9+APhkXdUvHUtX9SKrI
         X65ttB85rp4JZnWfluo+EckKfnWHEgvWR5qJuRKRXgIuOBsZQ6hVn2bfSnzR6+kGHiXJ
         3slHgbmKchh6X6HyXwAvmsTl0UkoCEO4N63yGG68TCpE0qRQpkSbHcywdJ+lO/giwTpS
         dMfolAg5TQk2iLld6naxSSiixP4xbbc6ol6vPNXjGsgKjxthmwa+pChYLNzo/NcM2ZGA
         UzlA==
X-Gm-Message-State: AOAM531ep+tL18GVLZVy0kW/74qFin/Ri2xKxZtwJ58HXbm+zU+pxjDO
        1PFdkR34vTpfSVPrghe0jRwszauVbX5v/gpuGVbZaWA68ZY=
X-Google-Smtp-Source: ABdhPJxZJigCvdTTj7lPsy1DW1+oRcNmX1ufw0xZ49D4Nlh+0V3fyjMiZFAPlliygaADLycsnZL8AxkPIZI7L70mZWU=
X-Received: by 2002:a9d:5a92:: with SMTP id w18mr522176oth.145.1599813252615;
 Fri, 11 Sep 2020 01:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <1599810232-29035-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599810232-29035-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599810232-29035-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Sep 2020 10:34:01 +0200
Message-ID: <CAMuHMdU_3imn02G+r1NukaTP3_a8jn2pS5B5tA5akzyDe-8w4A@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clk: renesas: cpg-mssr: Add support for R-Car V3U
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Sep 11, 2020 at 9:44 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for R-Car V3U (r8a779a0), including core, module
> clocks and register access, because register specification differs
> from R-Car Gen2/3.
>
> Inspired by patches in the BSP by LUU HOAI.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for the update!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c

> @@ -85,6 +95,11 @@ static const u16 srcr[] = {
>         0x920, 0x924, 0x928, 0x92C,
>  };
>
> +static const u16 srcr_for_v3u[] = {
> +       0xC00, 0xC04, 0xC08, 0xC0C, 0xC10, 0xC14, 0xC18, 0xC1C,

0x2C00 etc.?

> +       0xC20, 0xC24, 0xC28, 0xC2C, 0xC30, 0xC34, 0xC38,
> +};
> +
>  /* Realtime Module Stop Control Register offsets */
>  #define RMSTPCR(i)     (smstpcr[i] - 0x20)
>
> @@ -98,6 +113,11 @@ static const u16 srstclr[] = {
>         0x960, 0x964, 0x968, 0x96C,
>  };
>
> +static const u16 srstclr_for_v3u[] = {
> +       0xC80, 0xC84, 0xC88, 0xC8C, 0xC90, 0xC94, 0xC98, 0xC9C,

0x2C80 etc.?

> +       0xCA0, 0xCA4, 0xCA8, 0xCAC, 0xCB0, 0xCB4, 0xCB8,
> +};

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.10.

No need to resend, will fix while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
