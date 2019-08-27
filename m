Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3CEF9E80C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 14:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726972AbfH0Mfw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Aug 2019 08:35:52 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:45685 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbfH0Mfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Aug 2019 08:35:52 -0400
Received: by mail-ot1-f67.google.com with SMTP id m24so18457138otp.12;
        Tue, 27 Aug 2019 05:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eo4fMONif7arAZEEkxSd+kcDxhvWaqaRjvXjxw5IFgU=;
        b=IaLRDT4bNMxa7h7ReTKh4MDrQwYde7bwdW3S6vgX+khiKbWT7fx3DWj6EaRnIAFSfR
         KT6uPlLEQrZtkGpcq9r6l6mnj9u5gOzFQpiiF2kF5A9otVngGfhDO1QtoAwpx77EBWHL
         gGHuekhmKK53iKWsqKDXLahoTdUcibMDhThjloDKxSzNhtq7g1w4qO6m1evsDelbRnw+
         3UU28qo4fqcS9ODjzFMbd5ZGXWTyIXMgDxsPwqI0i1B8diVDU/h+5DhFBN6tia0VLKht
         S1GCGssTj+sgHHkbTxocUEJZ97kLsx40Y3IQiRzcSawS17Ugf2lxJdrfv37YZ7geZ1v3
         W6Ig==
X-Gm-Message-State: APjAAAV54mzhUMt4t6VIk/vZawRaxOoAQuiBihFUFidTBRcBK5gnYrfm
        NnJAhYiLFbYtH+JT2pU5WrTMWJu5KawqUzCnLcw=
X-Google-Smtp-Source: APXvYqx1P3GEvgWkYHuQdiUvOHWgXUCvxHPFzk+UV7vkJMo1YrfcbJhonKlhoPosOfDBvlmwUljoFU+ogAcXaPTFNMo=
X-Received: by 2002:a9d:68c5:: with SMTP id i5mr4600272oto.250.1566909351042;
 Tue, 27 Aug 2019 05:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <1566900127-11148-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1566900127-11148-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1566900127-11148-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 27 Aug 2019 14:35:39 +0200
Message-ID: <CAMuHMdW4xa=RFqUdCEs1v3MuqAFwpXoW=tvcdEocqe3eeCpd=Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: host: xhci-plat: add quirks member into struct xhci_plat_priv
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Aug 27, 2019 at 12:05 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> To simplify adding xhci->quirks instead of the .init_quirk()
> function, this patch adds a new parameter "quirks" into
> the struct xhci_plat_priv.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/usb/host/xhci-plat.h
> +++ b/drivers/usb/host/xhci-plat.h
> @@ -12,10 +12,12 @@
>
>  struct xhci_plat_priv {
>         const char *firmware_name;
> +       unsigned long long quirks;
>         void (*plat_start)(struct usb_hcd *);
>         int (*init_quirk)(struct usb_hcd *);
>         int (*resume_quirk)(struct usb_hcd *);
>  };
>
>  #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
> +#define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)

Just wondering: is x->priv guaranteed to be of type struct xhci_plat_priv *,
also in the future?

    struct xhci_hcd {
            ...
            unsigned long           priv[0] __aligned(sizeof(s64));


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
