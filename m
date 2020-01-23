Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D176914692D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2020 14:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgAWNee (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Jan 2020 08:34:34 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37479 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgAWNed (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Jan 2020 08:34:33 -0500
Received: by mail-ot1-f65.google.com with SMTP id k14so2731419otn.4;
        Thu, 23 Jan 2020 05:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IvD3EADISUa2eGwJBUtZ/I7ursXXYtYy2ckThE1zKGo=;
        b=VX1Y653HPvaUtl9icAZlNnxpcaPy1uFnkk+nbh+PhNUZcg+oSgbXWxjMRSZ+hYQyWt
         8tlHRqMndaBdEaZoe7aQZT2K3IZvR4kX90gWx7Rd2yTOaOQOQsJwAEyGVQxR/0WIE1k/
         ciq1QjU6TCLSae0ugt98+9paDYReLJPttcb0Ev3d0IQPL/xA5xghDGtWcVDWVaLX6/sC
         7pe1Q0yDGNmtoclSYnfx+Khgq+dPfNafuqiq/q+btdDiVb5ik1iyKR1DYozKOf9Gt6CS
         AXF03XRqLFgwoW6QalNC14m2242Z3kYngvpotY4+yPzFZzHIovlRAWljPPyGufwNWCz6
         aZZQ==
X-Gm-Message-State: APjAAAVqizSnZGnytsaaYTDYvZBSMlF1pvwPLUWomhL0xXq6y6OS5uxs
        KACd412GtJkYjBq15tTGip0ho/Y60PagsGfpxYE=
X-Google-Smtp-Source: APXvYqyGiks2W7Ua9FASZMvIZ5v/PjZEyFbCIs2EYcuVZm9Y5Obz4ECDPZp8yMab/tnbp9NB+xQHXvRV8A8o3gj09BY=
X-Received: by 2002:a9d:dc1:: with SMTP id 59mr11319459ots.250.1579786472925;
 Thu, 23 Jan 2020 05:34:32 -0800 (PST)
MIME-Version: 1.0
References: <1579781234-2084-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1579781234-2084-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Jan 2020 14:34:21 +0100
Message-ID: <CAMuHMdXqVFOO=D6AgzBmfW3SPYfGa-sBdZ4a+4nJZD5tFNDcWA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: host: ehci-platform: add a quirk to avoid stuck
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Tony Prisk <linux@prisktech.co.nz>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Thu, Jan 23, 2020 at 1:08 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Since EHCI/OHCI controllers on R-Car Gen3 SoCs are possible to
> be getting stuck very rarely after a full/low usb device was
> disconnected. To detect/recover from such a situation, the controllers
> require a special way which poll the EHCI PORTSC register and changes
> the OHCI functional state.
>
> So, this patch adds a polling timer into the ehci-platform driver,
> and if the ehci driver detects the issue by the EHCI PORTSC register,
> the ehci driver removes a companion device (= the OHCI controller)
> to change the OHCI functional state to USB Reset once. And then,
> the ehci driver adds the companion device again.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/usb/host/ehci-platform.c
> +++ b/drivers/usb/host/ehci-platform.c

> +static const struct soc_device_attribute quirk_poll_match[] = {
> +       { .soc_id = "r8a7795" },
> +       { .soc_id = "r8a77951" },

As .soc_id is derived from the main compatible value, it is "r8a7795" for both
R-Car H3 ES1.x (R8A77950) and ES2.0+ (R8A77951).

> +       { .soc_id = "r8a7796" },
> +       { .soc_id = "r8a77961" },
> +       { .soc_id = "r8a77965" },
> +       { .soc_id = "r8a77990" },
> +       { .soc_id = "r8a77995" },

Instead of matching on .soc_id, you can also match on .family = "R-Car Gen3"
(until we discover a future family member that is not affected?).

I guess this affects RZ/G2, too? .family = "RZ/G2".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
