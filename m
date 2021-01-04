Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D502E9401
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Jan 2021 12:21:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhADLU4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Jan 2021 06:20:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbhADLUz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jan 2021 06:20:55 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF6EC061794
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Jan 2021 03:20:15 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id cw27so26957450edb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jan 2021 03:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zokJI9v7bqGjxuN6FEkYnPOsXyma07z3X0FpcfMT+d0=;
        b=iJJw9lxV9NGp+WOO5GbSZFd0sMseyIUhXbeRaJNjf4oysH5X1ARm/mxS0VyN4zT2af
         ATt70lKD+K5THDvmypY710wfigodOEtl4rDAe8UI5ZE8XFDkyWfSCrE+JQU4GRb5Iy6i
         ykioiwo+BDbuLLhj61m+8bpP4KZcPtR/pD+UvIF1MDgNnPLFDKme1kYRp66L9rNanqXa
         pTY4SSAzaJUFdRvrynU61pgqwAHAADgrOVflDMt4IqB+y5gQskCAHfdDTXfaXqnC8/1k
         gslesTrHrCRIKLu1VHlUSuuYEaEq6SlK0pfyBfcuaN97Xk0YnORy3y2dtCSWLJc2eQ5E
         0qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zokJI9v7bqGjxuN6FEkYnPOsXyma07z3X0FpcfMT+d0=;
        b=FidY/HF9RL2nHKRtSndSePaUJ/lBoq9R1ueXDT8izwSDG9ztRdK2FI/F4WOMs8KZrb
         5u5tJCx8cLskQoe2DgCvH4bJvFiVo6VJu67zbj89uI9sJQdYQVMpDQ0XxXavfuSex6am
         eEWLbsfvla3EUJeDRFzagzihzTiDQ5ClM1INAwKlGhKRq1mv7VLdecHlJVeMk5WTkz4q
         bQ8CCzXRpwPoNjyeLndEK02ZFnXMo6EhKvs5PVMHmltjJ400o6R7TkKxDlXdiSg/yb9T
         RKLuidyZs84Tiv6t6zV31K/asqg740IogV3oymRBJyErMj1+QudAAkd+LJ5ZE+klVWaJ
         WaTQ==
X-Gm-Message-State: AOAM532557EROXUWPZSGJqp/TOzCUTeWxXq+1svAWXSGBCfWTTIG3Tlf
        hjQfkP8xjXA7fjqEz3rDwUo75U9irTyRVB9x1IBqOQ==
X-Google-Smtp-Source: ABdhPJwnOtddilnv/GpQJf2I545mP0u4FrJ9Bj0LcUzUVpLO67OEv3/9lrJABwlJrTpaAQv0nK711kGjl5yrvcggYrI=
X-Received: by 2002:aa7:cc15:: with SMTP id q21mr70622702edt.213.1609759212168;
 Mon, 04 Jan 2021 03:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20201231153141.25525-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWs2sy9kwbyvw=Xe9rT9vynKb+hzzSSdniosfsiMEpFhA@mail.gmail.com>
In-Reply-To: <CAMuHMdWs2sy9kwbyvw=Xe9rT9vynKb+hzzSSdniosfsiMEpFhA@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 4 Jan 2021 12:20:01 +0100
Message-ID: <CAMpxmJV1-+7B_8PE+MX+a7vFRzjJ6Uukhw09E5YL1y+k6ozq6w@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Remove redundant compatible values
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 4, 2021 at 11:36 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Dec 31, 2020 at 4:31 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > The mandatory compatible values 'renesas,rcar-gen{1,2,3}-gpio' have been
> > already added to all the respective R-Car Gen{1,2,3} SoC DTSI files,
> > remove the redundant device specific values from the driver.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/gpio/gpio-rcar.c
> > +++ b/drivers/gpio/gpio-rcar.c
> > @@ -392,33 +392,6 @@ static const struct gpio_rcar_info gpio_rcar_info_gen2 = {
> >
> >  static const struct of_device_id gpio_rcar_of_table[] = {
> >         {
> > -               .compatible = "renesas,gpio-r8a7743",
> > -               /* RZ/G1 GPIO is identical to R-Car Gen2. */
> > -               .data = &gpio_rcar_info_gen2,
> > -       }, {
> > -               .compatible = "renesas,gpio-r8a7790",
> > -               .data = &gpio_rcar_info_gen2,
> > -       }, {
> > -               .compatible = "renesas,gpio-r8a7791",
> > -               .data = &gpio_rcar_info_gen2,
> > -       }, {
> > -               .compatible = "renesas,gpio-r8a7792",
> > -               .data = &gpio_rcar_info_gen2,
> > -       }, {
> > -               .compatible = "renesas,gpio-r8a7793",
> > -               .data = &gpio_rcar_info_gen2,
> > -       }, {
> > -               .compatible = "renesas,gpio-r8a7794",
> > -               .data = &gpio_rcar_info_gen2,
> > -       }, {
> > -               .compatible = "renesas,gpio-r8a7795",
> > -               /* Gen3 GPIO is identical to Gen2. */
> > -               .data = &gpio_rcar_info_gen2,
> > -       }, {
> > -               .compatible = "renesas,gpio-r8a7796",
> > -               /* Gen3 GPIO is identical to Gen2. */
> > -               .data = &gpio_rcar_info_gen2,
> > -       }, {
> >                 .compatible = "renesas,rcar-gen1-gpio",
> >                 .data = &gpio_rcar_info_gen1,
> >         }, {
>
> The reason the driver matches on these SoC-specific compatible values is
> that originally the family-specific compatible values did not exist, and
> the device nodes in the initial DTS files thus did not use them.  The
> family-specific compatible values were added to the DTS files in v4.15.
> However, as this was backported to all v4.14-based R-Car BSP releases
> (3.6.0 and later), I think it is safe to apply this.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Patch applied, thanks!

Bartosz
