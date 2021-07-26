Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0665F3D54D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jul 2021 10:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhGZHXC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Jul 2021 03:23:02 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:38487 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbhGZHXC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jul 2021 03:23:02 -0400
Received: by mail-vs1-f53.google.com with SMTP id x21so4768195vsx.5;
        Mon, 26 Jul 2021 01:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/noyZVTkaQHv6vOLUtBghVzxTPdSaltUw4+X2m/ShNY=;
        b=celWk8qjEwrLbUP2WGsqMakjwfggMHGp8XXZun+4hgKfAFXPVIM7aDjwWDCirzecfz
         55KhmHyZAh8/GFNV7iiaD3TPy2xn3LTsvBaO4T1nsF2iveFq0osFJNZXNLyqxj6w18Cx
         /NGObxKW4GQkARMVLG1TeD001WGwNivWyBgl5lmiquRd1I9tThXm++IIPf3zCwe/J85B
         6E4h2/uyBZYTfXnBpgPj0V/7mMJjDi3MwjPU7C4Z2RzqDxiA0kIVoOxRMhVok0XJjQkC
         oeWRhQulDMgYI6RinUAotZXWqMGNbMj9exwE0aLKb+K63Ons9MugZHj7D5IBk74RYjLb
         yTnA==
X-Gm-Message-State: AOAM5309qKR53cWCXVWHiUQUt1ROw3bxkHGqvLf9Trm2leePORcEpS/5
        cachTVuampAYtkUhOVy6K3NUPJpvodpxVemMFz4=
X-Google-Smtp-Source: ABdhPJzf+Z6S4cuujdybUhVIxuK2plpAsbI4m9JBxyuIUXfPLjSJnu6lZhHstcUseJO/BJfLNFr8+CQuFiThWHDaX5M=
X-Received: by 2002:a67:7789:: with SMTP id s131mr8212743vsc.40.1627286609931;
 Mon, 26 Jul 2021 01:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210725151434.7122-1-len.baker@gmx.com>
In-Reply-To: <20210725151434.7122-1-len.baker@gmx.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Jul 2021 10:03:18 +0200
Message-ID: <CAMuHMdUdmv+YmdtjGJV2Lp_Rvar4kN4uSgSTYqXX9CtCJ+qoRw@mail.gmail.com>
Subject: Re: [PATCH] drivers/soc: Remove all strcpy() uses in favor of strscpy()
To:     Len Baker <len.baker@gmx.com>
Cc:     Kees Cook <keescook@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-hardening@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Len,

On Sun, Jul 25, 2021 at 5:15 PM Len Baker <len.baker@gmx.com> wrote:
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. The safe replacement is strscpy().
>
> Signed-off-by: Len Baker <len.baker@gmx.com>

Thanks for your patch!

> ---
> This is a task of the KSPP [1]
>
> [1] https://github.com/KSPP/linux/issues/88

Any chance the almost one year old question in that ticket can be
answered?

>  drivers/soc/renesas/rcar-sysc.c     |  6 ++++--

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

But please see my comments below...

> --- a/drivers/soc/renesas/r8a779a0-sysc.c
> +++ b/drivers/soc/renesas/r8a779a0-sysc.c
> @@ -404,19 +404,21 @@ static int __init r8a779a0_sysc_pd_init(void)
>         for (i = 0; i < info->num_areas; i++) {
>                 const struct r8a779a0_sysc_area *area = &info->areas[i];
>                 struct r8a779a0_sysc_pd *pd;
> +               size_t area_name_size;

I wouldn't mind a shorter name, like "n".

>
>                 if (!area->name) {
>                         /* Skip NULLified area */
>                         continue;
>                 }
>
> -               pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
> +               area_name_size = strlen(area->name) + 1;
> +               pd = kzalloc(sizeof(*pd) + area_name_size, GFP_KERNEL);
>                 if (!pd) {
>                         error = -ENOMEM;
>                         goto out_put;
>                 }
>
> -               strcpy(pd->name, area->name);
> +               strscpy(pd->name, area->name, area_name_size);
>                 pd->genpd.name = pd->name;
>                 pd->pdr = area->pdr;
>                 pd->flags = area->flags;
> diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
> index 53387a72ca00..0eae5ce0eeb0 100644
> --- a/drivers/soc/renesas/rcar-sysc.c
> +++ b/drivers/soc/renesas/rcar-sysc.c
> @@ -396,19 +396,21 @@ static int __init rcar_sysc_pd_init(void)
>         for (i = 0; i < info->num_areas; i++) {
>                 const struct rcar_sysc_area *area = &info->areas[i];
>                 struct rcar_sysc_pd *pd;
> +               size_t area_name_size;

Likewise.

>
>                 if (!area->name) {
>                         /* Skip NULLified area */
>                         continue;
>                 }
>
> -               pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
> +               area_name_size = strlen(area->name) + 1;
> +               pd = kzalloc(sizeof(*pd) + area_name_size, GFP_KERNEL);
>                 if (!pd) {
>                         error = -ENOMEM;
>                         goto out_put;
>                 }
>
> -               strcpy(pd->name, area->name);
> +               strscpy(pd->name, area->name, area_name_size);
>                 pd->genpd.name = pd->name;
>                 pd->ch.chan_offs = area->chan_offs;
>                 pd->ch.chan_bit = area->chan_bit;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
