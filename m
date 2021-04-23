Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB074368EB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 10:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241383AbhDWIQw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 04:16:52 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:40916 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhDWIQn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 04:16:43 -0400
Received: by mail-ua1-f43.google.com with SMTP id 33so14992487uaa.7;
        Fri, 23 Apr 2021 01:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=em5cBkyIOctbiBIb5XOHeNIoZhZ0Au6He4zk5hvtim0=;
        b=ZE2+dqiahsK5K3oJo/94WYdBSojK6e8rIK4gA+DJBwQKYbLYVcdudeysRoosK3XJkh
         gdIMNCOIDGHDejRH4j+a3aFsNlledXSrWy2XYS/k5BJDkdRWKjgTNXMspvp9Y2X+4dh7
         IkNlRBbnxt0LEnnoUwQAfYXU+yCd+KHpxSmTT2/fICjweVAItq4DDC41AGukNWn5RXHr
         6SuLEg396d7g5IZfRk+4GWj95vZXgHdNVyj3z0eSmo42wl98a7RTXbBHXEreZ9MFc1G0
         BTCGySMaM5TVAKx/k24E4qNuE26952OxPGz1JPvH+uCrDBIw1FNzsiP+pjLN0bCtPRA/
         834g==
X-Gm-Message-State: AOAM5309TCYd7DNf09nz9pHb+ZgTAZ7I+3jUW2jnjdVnZrO8yO6xzjPx
        SxQyzIAsZHN/afVlEJb/dbG/MMaFKhRJLZA/+ng=
X-Google-Smtp-Source: ABdhPJzs7QQ9wDVIOqECoab5U4QfcaGoOvpaRh485U6lD/Rn12Wu8XQlF6Eq19fXg6cwpPDX0gyfdAuxSqblikx+7Ek=
X-Received: by 2002:ab0:2c16:: with SMTP id l22mr2051057uar.100.1619165766905;
 Fri, 23 Apr 2021 01:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210415073338.22287-1-dinghao.liu@zju.edu.cn>
 <CAMuHMdVgtZkO3FfLOph41cXXJbSuc16UX1Z+fD0_iNN7nM-GtA@mail.gmail.com> <2fd8490f.73bcd.178fdc55590.Coremail.dinghao.liu@zju.edu.cn>
In-Reply-To: <2fd8490f.73bcd.178fdc55590.Coremail.dinghao.liu@zju.edu.cn>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Apr 2021 10:15:55 +0200
Message-ID: <CAMuHMdUdDYo9CYWCgJvYLibBef-4NvM5aHHWbB2NP6ie22U=SA@mail.gmail.com>
Subject: Re: Re: [PATCH] [v3] clk: renesas: rcar-usb2-clock-sel: Fix error
 handling in rcar_usb2_clock_sel_probe
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dinghao,

On Fri, Apr 23, 2021 at 10:08 AM <dinghao.liu@zju.edu.cn> wrote:
> > On Thu, Apr 15, 2021 at 9:33 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:
> > > The error handling paths after pm_runtime_get_sync() has no
> > > refcount decrement, which leads to refcount leak.
> > >
> > > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > > ---
> > >
> > > Changelog:
> > >
> > > v2: - Move the position of pm_runtime_enable,_get_sync().
> > >       Use devm_clk_register() to simplify error handling.
> >
> > Thanks for the update!
> >
> > > --- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
> > > +++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
> > > @@ -131,7 +131,6 @@ static int rcar_usb2_clock_sel_remove(struct platform_device *pdev)
> > >         struct usb2_clock_sel_priv *priv = platform_get_drvdata(pdev);
> >
> >     warning: unused variable ‘priv’ [-Wunused-variable]
> >
> > Have you compiled this?
> >
>
> This is my carelessness, thanks for pointing out this. When we use
> devm_clk_hw_register(), we will not need to unregister priv->hw in
> rcar_usb2_clock_sel_remove(). So I think it's okay to remove
> platform_get_drvdata() in it to eliminate this warning.
>
> Do you need a new version of patch to fix this warning?

I'll remove that line while applying, so no need to fix and resend.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
