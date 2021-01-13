Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80792F4C40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 14:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbhAMNdA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 08:33:00 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:37992 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbhAMNdA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 08:33:00 -0500
Received: by mail-ot1-f49.google.com with SMTP id j20so1869981otq.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 05:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=56I0EIa/TRypo6d1bteEppgUB/j0aqsbFh+YVVgF50o=;
        b=GeuirGpwmRvMxGp+qYn/3ItvFX/WEys4PKZEtpKiLHOTV1YjWisctFDWzYBqQPZGKD
         0f2m1A5Yz3IRtZGOUdEjFGrefdADSTTguxymWqLudIcn+hu3Jl+4pz0O8RFx528LCK19
         Eg6MudQUVYMP+WpQ2iroRvKZZMSfRrMaQYKX6RnfG6EODkLivud/NXgLUKEXAbj6U88O
         fYUXRY9VXp1Eqh1avlzDWYKYLzBjZ4eNS8eEaMGqqx0BvWSx/ogeB9CoDiGqEaXHeYFc
         ywFcYazapUBkkr3QeU9OYh0OfHyd0/5Iyv+U515r9Poq9Lnpm+Qr9B8Bvkjq0vmyk6fH
         zI1g==
X-Gm-Message-State: AOAM530jrR1EigIHas0FdAZGd78KNemaTKcVSBDWt6RYVxP8e4pokaXm
        PXdP4qGVX7WPtLybauPA0AocuTG1Uyckb2ZLJ3A=
X-Google-Smtp-Source: ABdhPJyg5Qa0EqXg8pqBcUSZAjw13CvoSxc9XnNDSSRn9MkmOTdQcFaxPTnXySoIYNCXumcuGX1suNiR5GQhUGQ5PAU=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr1232384oth.250.1610544739432;
 Wed, 13 Jan 2021 05:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20210112165912.30876-1-uli+renesas@fpond.eu> <20210112165912.30876-4-uli+renesas@fpond.eu>
In-Reply-To: <20210112165912.30876-4-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 14:32:08 +0100
Message-ID: <CAMuHMdWG0rrmrQf3E63L-HRjdBs1Ski4e9MwAm6yD+b0Kh1ziQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] pinctrl: renesas: add PORT_GP_CFG_{2,31} macros
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Tue, Jan 12, 2021 at 5:59 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/sh_pfc.h
> +++ b/drivers/pinctrl/renesas/sh_pfc.h
> @@ -460,9 +460,13 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
>         fn(bank, pin, GP_##bank##_##pin, sfx, cfg)
>  #define PORT_GP_1(bank, pin, fn, sfx)  PORT_GP_CFG_1(bank, pin, fn, sfx, 0)
>
> -#define PORT_GP_CFG_4(bank, fn, sfx, cfg)                              \
> +#define PORT_GP_CFG_2(bank, fn, sfx, cfg)                              \
>         PORT_GP_CFG_1(bank, 0,  fn, sfx, cfg),                          \
> -       PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg),                          \
> +       PORT_GP_CFG_1(bank, 1,  fn, sfx, cfg)
> +#define PORT_GP_2(bank, fn, sfx)       PORT_GP_CFG_2(bank, fn, sfx, 0)
> +
> +#define PORT_GP_CFG_4(bank, fn, sfx, cfg)                              \
> +       PORT_GP_CFG_2(bank, fn, sfx, cfg)                               \

Missing comma, breaking the build.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.12, with the comma added.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
