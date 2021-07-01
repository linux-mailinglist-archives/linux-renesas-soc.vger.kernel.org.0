Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3C53B8F7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jul 2021 11:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235732AbhGAJKH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 05:10:07 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:35600 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235088AbhGAJKH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 05:10:07 -0400
Received: by mail-ua1-f45.google.com with SMTP id n61so2196631uan.2;
        Thu, 01 Jul 2021 02:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sIqUpSy3WHJ9LFXbxhxyvcyP769k+GgXVkD4XIt1npQ=;
        b=fC8ODdPVYjPREdI8THrYL44SFYEIxCc4X0Kuk8IFNYjUeCsCXJ8+40YGdOEEXlOFWw
         v8fp1ZM4PwyOhOXYjI2AW4IZkf6EXZOrY/r/CsKGxG53ibDEiL8G18m7PfSSpPDLO0hK
         kMly2if8eHYqD+pYsTmLkp5JGyJQ6Sf6k5JGP9GHyPvvmzuu7HwRnnEFsoWEbCrKal0+
         QRHE/hKVL3Zpr13MJSSG3GTRoPwfHKfElyxN9Zv+vOOhyWHHtcbxyrDXaVHFRFvJYZtW
         kilK62qy9M0q8FOS3geWNVtPQF+W2oxbsyesLTDtLXxLj8GDu8j7huEGQ9nNvOUtvl4b
         1WdQ==
X-Gm-Message-State: AOAM533nzpXIjobhj3VRnrKO1iKPxBuShRPI2iM8AbTioY+fOkT3FH3t
        +fwqT0Y3a9VeVBCEKiWVimEufMwoXrNuicBSbybdeVMz0Z+IZg==
X-Google-Smtp-Source: ABdhPJwSnd+W/J0P9TXelJ4FicEnSI+QCWCk1Q85kOlLiIK0Xw+UCgAVpcQfY9FmPzhd6caL6KHABcksAAv39MCVf50=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr38743288uad.100.1625130456571;
 Thu, 01 Jul 2021 02:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210630173042.186394-1-aford173@gmail.com> <20210630173042.186394-2-aford173@gmail.com>
In-Reply-To: <20210630173042.186394-2-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Jul 2021 11:07:25 +0200
Message-ID: <CAMuHMdXoWZMj8+LhUPSpqa4t-G1WrW-wfOy3XzEDe0ihSKQkCw@mail.gmail.com>
Subject: Re: [PATCH 2/3] usb: renesas_usbhs: Enable support for more than two clks
To:     Adam Ford <aford173@gmail.com>
Cc:     USB list <linux-usb@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

Thanks for your patch!

On Wed, Jun 30, 2021 at 7:30 PM Adam Ford <aford173@gmail.com> wrote:
> The RZ/G2 boards expect there to be an external clock reference for
> USBHS controller, but this could be set by a programmable clock.
> For those devices using a programmable clock, there need to be two
> additional clocks beyond the internal reference clocks:
>
> rcar-usb2-clock-sel to specify we using an external clock, and
> the external reference clock itself.

Something is missing in the above sentence?

>
> Make this driver dynamically enable all the clocks assigned to it
> instead of only enabling the first one or two clocks.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index 3af91b2b8f76..255e4bd68ed3 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -297,6 +297,8 @@ static bool usbhsc_is_multi_clks(struct usbhs_priv *priv)
>
>  static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
>  {
> +       unsigned int i;
> +
>         if (!usbhsc_is_multi_clks(priv))
>                 return 0;
>
> @@ -309,11 +311,13 @@ static int usbhsc_clk_get(struct device *dev, struct usbhs_priv *priv)
>          * To backward compatibility with old DT, this driver checks the return
>          * value if it's -ENOENT or not.
>          */
> -       priv->clks[1] = of_clk_get(dev_of_node(dev), 1);
> -       if (PTR_ERR(priv->clks[1]) == -ENOENT)
> -               priv->clks[1] = NULL;
> -       else if (IS_ERR(priv->clks[1]))
> -               return PTR_ERR(priv->clks[1]);
> +       for (i = 1; i < ARRAY_SIZE(priv->clks); i++) {
> +               priv->clks[1] = of_clk_get(dev->of_node, i);
> +               if (PTR_ERR(priv->clks[i]) == -ENOENT)
> +                       priv->clks[i] = NULL;
> +               else if (IS_ERR(priv->clks[i]))
> +                       return PTR_ERR(priv->clks[i]);
> +       }

This is identical to the current code, as ARRAY_SIZE(priv->clks) == 2.
Probably you wanted to increase usbhs_priv.clks[], too?

Does it make sense to start using the clk_bulk*() API?

>
>         return 0;
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
