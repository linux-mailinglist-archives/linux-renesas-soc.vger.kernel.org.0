Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B6F19C68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2019 13:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbfEJLU2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 May 2019 07:20:28 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41814 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfEJLU1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 May 2019 07:20:27 -0400
Received: by mail-vs1-f68.google.com with SMTP id g187so3393152vsc.8;
        Fri, 10 May 2019 04:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bpl+GABBJxA+Kr7oBEa/hdv666xDR+CyNVHhFPUzG40=;
        b=ocE4CWMNk49X/UxrjmwmztVJuSwP5OKjlJmxq16P8TRya2m+RJv5T2fOJdvu36+ilP
         dz8ojNlw+U4hBx6FDpDNG05ybiZwCIyTYXjjVCh4HVhSBfx2tK0DK6ZWaTULKgXSYFLF
         ONHltC7RtKDeJ6FWm0Y1g8DjsBegSWEKhW27lvKREPNGOtTq3zFO5dn3HDPhtAwJZU0j
         13wcTFH+PpPu23FocH7ug9XZCduy5RV3b283wp4uqPopoxg7zNrmQognoYXNrVPCmuhS
         5BvwgZz+E//OBYRV6zGtOchqimAyN25kFNp8QlAtgm32D9YSAYWVHOJjo3e3jxn+nt6O
         Kk6w==
X-Gm-Message-State: APjAAAXqf+KS6hNZ4f8k/XQThBrBo6WxfsIhHqSn/RtYwH0uI4nYeLMF
        bg8WOcWtXFweVkiAzfsc1cuu3e8B+nkFQHUa4AoBeKev
X-Google-Smtp-Source: APXvYqzJ28NMKZ604PjwMg3iTHnq092re2GHqDFc1mh204yXQsdqkTnUalJi+rKlo2b1KyAh43jqQOE6efKZ53jl+Ys=
X-Received: by 2002:a67:fdd4:: with SMTP id l20mr2326295vsq.63.1557487226847;
 Fri, 10 May 2019 04:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <1557485323-3349-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1557485323-3349-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 May 2019 13:20:14 +0200
Message-ID: <CAMuHMdVO3jLUP4HrAYJ8vxtSDfcK61G95ZzeQWQBEam+9_ycUA@mail.gmail.com>
Subject: Re: [PATCH] usb: renesas_usbhs: Use specific struct instead of
 USBHS_TYPE_* enums
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, May 10, 2019 at 12:53 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds a specific struct "usbhs_of_data" to add a new SoC
> data easily instead of code basis in the future.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

Looks correct to me, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
with a few suggestions/questions below...

> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c

> @@ -598,8 +638,15 @@ static struct renesas_usbhs_platform_info *usbhs_parse_dt(struct device *dev)
>         if (!info)
>                 return NULL;
>
> +       data = of_device_get_match_data(dev);
> +       if (!data)
> +               return NULL;
> +
>         dparam = &info->driver_param;
> -       dparam->type = (uintptr_t)of_device_get_match_data(dev);
> +       memcpy(dparam, &data->param, sizeof(struct renesas_usbhs_driver_param));

sizeof(data->param), for increased safety?

> +       memcpy(&info->platform_callback, data->platform_callback,
> +              sizeof(struct renesas_usbhs_platform_callback));

sizeof(data->platform_callback)?

I'm not really familiar with this driver and with the USB subsystem, but
why is this driver copying so many structs around, instead of just
keeping pointers to the originals?
Is all of that done just so .notify_hotplug() can be overridden, or am I
missing something?

Thanks again!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
